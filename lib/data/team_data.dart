import '../models/member.dart';

const member1 = Member(
  lastName: 'Delos Santos',
  firstName: 'Kian',
  middleInitial: 'S.',
  role: 'Project Lead / Home Screen',
  bio: 'Set up the repository, theme, and named routes.',
  email: 'kiki@gmail.com',
);

const member2 = Member(
  lastName: 'Manalo',
  firstName: 'Ian Israel',
  middleInitial: 'C.',
  role: 'About Us Developer',
  bio: 'Built the About Us page and the reusable member card.',
  email: 'arabBuster@gmail.com',
);

const member3 = Member(
  lastName: 'Punongbayan',
  firstName: 'Mark James',
  middleInitial: 'C.',
  role: 'Gallery Developer',
  bio: 'Built the gallery grid and the Photo Details screen.',
  email: 'tagaBaclaran@gmail.com',
);

const List<Member> teamMembers = [member1, member2, member3];

// 8 photos total: every member contributes 2 (minimum required is 6).
const List<Photo> galleryPhotos = [
  Photo(
      path: 'assets/images/m1_photo1.jpg',
      title: 'Campus Gate',
      description: 'The main gate of the University of Cabuyao.',
      contributor: member1),
  Photo(
      path: 'assets/images/m1_photo2.jpg',
      title: 'Group Meeting',
      description: 'Planning the app layout together.',
      contributor: member1),
  Photo(
      path: 'assets/images/m2_photo1.jpg',
      title: 'Coding Session',
      description: 'Working on the About Us page.',
      contributor: member2),
  Photo(
      path: 'assets/images/m2_photo2.jpg',
      title: 'Lab Room',
      description: 'Our computer laboratory.',
      contributor: member2),
  Photo(
      path: 'assets/images/m3_photo1.jpg',
      title: 'Design Sketch',
      description: 'Early wireframe of the gallery.',
      contributor: member3),
  Photo(
      path: 'assets/images/m3_photo2.jpg',
      title: 'Testing Day',
      description: 'Running the app on an emulator.',
      contributor: member3),
  Photo(
      path: 'assets/images/m4_photo1.jpg',
      title: 'Team Lunch',
      description: 'Celebrating after the first build.',
      contributor: member2),
  Photo(
      path: 'assets/images/m4_photo2.jpg',
      title: 'Final Demo',
      description: 'Presenting the finished app.',
      contributor: member2),
];
