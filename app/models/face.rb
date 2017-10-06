class Face < ActiveRecord::Base
  belongs_to :user

  def self.connect_aws_recognition
    Aws::Rekognition::Client.new(region: Aws.config[:region], credentials: Aws.config[:credentials])
  end

  def self.detect_face(image)
    recognition = Face.connect_aws_recognition
    recognition.detect_faces({
      image: {
        s3_object: {
          bucket: "face-matcher-bucket",
          name: "face-17.jpg"
        }
      },
      attributes: ['ALL']
    })
  end

  def self.compare_faces(image1, image2)
    recognition = Face.connect_aws_recognition
    recognition.compare_faces({
      source_image:{
        s3_object: {
          bucket: "face-matcher-bucket",
          name: image1
        }
      },
      target_image:{
        s3_object: {
          bucket: "face-matcher-bucket",
          name: image2
        }
      },
      similarity_threshold: 1.0
    })
  end

  def self.upload_to_s3(image)
    s3 = Aws::S3::Resource.new(region:'us-east-1')
    obj = s3.bucket('face-matcher-bucket').object(File.basename(image))
    obj.upload_file(image)
    p "*" * 100
    p obj.public_url.split("amazonaws.com/")[1]
  end
end
