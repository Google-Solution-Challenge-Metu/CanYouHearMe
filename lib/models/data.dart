class DataModel {
  final String title;
  final String imageName;
  final String author;
  final String date;
  final String context;

  DataModel(this.title, this.imageName, this.author, this.date, this.context);
}

List<DataModel> dataList = [
  DataModel(
    "What Should You Do Before, During, and After an Earthquake?",
    "assets/images/todo.jpg",
    "Pamela Bjorkman",
    "11.08.2022",
    'It is impossible to predict when and where an earthquake will strike. Nonetheless, you can take steps before, during, and after a quake to help yourself stay safe and recover quickly.\n' +
        '\n' +
        'Before an earthquake\n' +
        '\n' +
        'Make sure you and your household are earthquake-ready:\n' +
        '\n' +
        '    Secure heavy furniture and appliances – More than half of the injuries associated with the 1994 Northridge earthquake were caused by toppling objects. One way to protect yourself is to look around your home or workplace and make sure heavy furniture, such as bookcases and beds, as well as appliances, such as water heaters and televisions, are safely secured to the wall using straps, closed hooks, or wall studs. Large, heavy, or unstable items should be placed on low shelves, close to the floor, and away from doors and escape routes.\n' +
        '\n' +
        '    Identify safe spots – Know where you can take cover in every room, for example under a sturdy table or desk. Conduct regular drills on how to drop, cover, and hold on.\n' +
        '\n' +
        '    Have a plan – Make sure everyone in your household knows how to access disaster supplies, and whom to call and where to meet if an earthquake strikes when you are apart.\n' +
        '    Gather supplies – Have ample water and an emergency kit ready in your home, as well as smaller go-bags in your car, workplace, and any other places you might be when an earthquake hits. Your emergency supplies should be tailored for your specific needs, but common items include water, a first-aid kit, sturdy shoes, a portable radio, snacks, and emergency cash. FEMA and The Earthquake Country Alliance provide detailed checklists of items to include in an emergency kit.\n' +
        '\n' +
        '\n' +
        'During an earthquake\n' +
        '\n' +
        'The safest steps to take in the middle of an earthquake depend on where you are:\n' +
        '\n' +
        '    Indoors – Get under a desk or table, cover your head and neck with one arm or hand, and use your other arm or hand to hang on (drop, cover, and hold on). If no shelter is available, move into a hallway or against an inside wall. If you use a wheelchair or walker with a seat, make sure your wheels are locked and remain seated until the shaking subsides. Stay away from windows, fireplaces, and heavy furniture or appliances, and do not use elevators. If you are in bed when an earthquake starts, do not get out of bed. Instead, lie face down to protect vital organs, and cover your head and neck with a pillow.\n' +
        '    Outdoors – Quickly find an open space away from buildings, power lines, and anything else that can topple on you. If you are driving, safely pull over and stop, and stay in your car until the shaking stops. Do not stop under bridges, overpasses, trees, or anything else that can strike your vehicle. If you are in a mountainous area, watch out for falling rocks and landslides, and if you are near the ocean during a severe earthquake, be mindful of tsunamis.\n' +
        '\n' +
        '\n' +
        'After an earthquake\n' +
        '\n' +
        'After the shaking subsides, assess your wellbeing and that of those around you. Stay alert to new or continuing hazards.\n' +
        '\n' +
        '    Conduct a safety check – Once you are in a safe place, check yourself and others for injuries, and call for help if needed. Look around to make sure you are not in danger from other hazards caused by the quake, such as gas leaks or fire. Wear boots or sturdy shoes to protect your feet from broken glass and debris.\n' +
        '\n' +
        '    Get help, if needed – If you are trapped, cover your mouth, nose, and eyes against dust. Send a text and make noise to alert rescuers to your location.\n' +
        '\n' +
        '    Be prepared for aftershocks – Aftershocks can be as strong as the original quake.\n' +
        '\n' +
        '    Stay connected – If you have access to a battery-operated radio (perhaps in your car) or television, update yourself on the latest emergency information. Let friends and family know you are safe, but, if possible, minimize calls to help protect internet and telephone connectivity. You can also register on the American Red Cross "Safe and Well" website to let people know you are safe.\n' +
        '\n' +
        '\n' +
        'What not to do\n' +
        '\n' +
        '\n' +
        '    Avoid running to other rooms while the ground is still shaking.\n' +
        '\n' +
        '    Do not seek shelter in doorways. They offer no protection against falling or flying objects.\n' +
        '\n' +
        '    After a quake, do not use matches or lighters near stoves or barbecues until you are sure there are no gas leaks. If the gas is turned off, do not turn it back on by yourself; let the gas company do it.\n' +
        '\n' +
        '    Do not call 911 or 155 unless you are experiencing a true emergency.\n'
  ),
  DataModel(
      "Can Seismologists Predict Earthquakes?",
      "assets/images/predict.jpg",
      "Simona Bordoni",
      "21.10.2021",
      'Can Seismologists Predict Earthquakes?\n' +
          '\n' +
          'It is not currently possible to predict exactly when and where an earthquake will occur, nor how large it will be. However, seismologists can estimate where earthquakes may be likely to strike by calculating probabilities and forecasts.\n' +
          '\n' +
          '\n' +
          'What is an earthquake probability and how is it calculated?\n' +
          '\n' +
          'Earthquake probabilities describe the chances of an earthquake of a certain magnitude occurring within a region over a span of years.\n' +
          '\n' +
          'Probabilities can be calculated based on the average rate of past seismic activity in a region. This technique is particularly useful in regions where earthquakes have been recorded by seismographs, which first came into wide use in the early 1900s.\n' +
          '\n' +
          'Scientists can obtain additional, though less precise, information by digging trenches to examine the geological record for earthquake ruptures that occurred in ancient history.\n' +
          '\n' +
          'Probabilities also can be derived mathematically. For example, seismologists estimate the number of years it could take to experience an earthquake of a certain magnitude by accounting for two processes:\n' +
          '\n' +
          '    1. the buildup of strain onto faults as a result of the continual motion of tectonic plates, and\n' +
          '\n' +
          '    2.the relieving of strain as a result of fault slip, which can occur as an earthquake or as slow creep along a fault line without an earthquake.\n' +
          '\n' +
          'What is an earthquake forecast?\n' +
          '\n' +
          'Earthquake forecasts provide information on the likelihood of earthquakes over a shorter time window of time. Forecasts are used typically to describe aftershocks, which tend to follow a pattern of decreasing frequency and magnitude over time after an earthquake.\n' +
          '\n'),
          
  DataModel(
      "What Happens During an Earthquake?",
      "assets/images/happens.jpg",
      "Jed Buchwald",
      "27.07.2021",
      'What causes earthquakes, and what types of earthquakes are there? To answer these questions, it is first helpful to have an understanding of Earth’s composition.\n' +
          '\n' +
          '\n' +
          'Earth basics\n' +
          '\n' +
          'Earth is made up of\n' +
          '\n' +
          '    *a solid inner core\n' +
          '\n' +
          '    *a molten outer core\n' +
          '\n' +
          "    *the thick and mostly solid mantle, which occupies approximately 84 percent of the earth's total volume\n" +
          '\n' +
          '    *the comparatively thin crust, which varies between 5 to 50 km in thickness.\n' +
          '\n' +
          "Earth's outer skin is not a continuous surface. Instead, it is composed of massive segments called tectonic plates. Earthquakes occur along the boundaries between tectonic plates or at the site of cracks within the plates, which are called faults.\n" +
          '\n' +
          '\n' +
          'What causes earthquakes?\n' +
          '\n' +
          "The tectonic plates that make up the earth's crust are moving constantly. As the edges of these plates slide against each other in fault zones, friction can slow them down, leading to the buildup of pressure over long periods of time. When the force of movement finally overcomes the friction, sections of the crust suddenly break or become displaced, releasing the pent-up pressure in the form of seismic waves. This is a naturally occurring earthquake, sometimes referred to as a tectonic earthquake.\n" +
          '\n' +
          'While tectonic earthquakes can occur at any location around the world, the majority of large earthquakes—about 80 percent—occur at the circum-Pacific seismic belt found along the rim of the Pacific Ocean. Two other regions regularly exhibiting earthquakes include the Alpide belt, extending along the southern margin of Eurasia through the Himalayan Mountains, Sumatra, and Java; and the Mid-Atlantic Ridge running along the floor of the Atlantic Ocean.\n' +
          '\n' +
          'When an earthquake occurs, different types of energy waves are generated.\n' +
          '\n' +
          '     "P waves" or "primary waves" are the first waves to be detected. These are compressional waves that push and pull as they move through rock and fluids.\n' +
          '\n' +
          '     "S waves" or "secondary waves" are the next waves to be detected. These waves move only through rock. They move up and down or side to side, perpendicular to the direction in which the wave is moving.\n' +
          '\n' +
          '     Surface waves follow P and S waves. They travel along the surface of the earth and thus cause the most damage. Surface waves can be characterized as Love waves, which are faster and move the ground from side to side, and Rayleigh waves, which roll like waves on the surface of oceans and lakes.\n' +
          '\n' +
          'What other types of earthquakes exist?\n' +
          '\n' +
          'In addition to tectonic earthquakes, seismologists have classified three more earthquake types:\n' +
          '\n' +
          '     Volcanic: Earthquakes that occur in conjunction with volcanic activity\n' +
          '\n' +
          '     Collapse: Smaller-scale earthquakes that result from the subterranean collapse of caverns or mines\n' +
          '\n' +
          '     Explosion: Earthquakes caused by underground explosions of nuclear or chemical devices.\n' +
          '\n' +
          'Does fracking cause earthquakes?\n' +
          '\n' +
          '"Fracking" is an informal term for hydraulic fracturing, a process used to increase the flow of oil or gas to a production well. It involves the injection of large volumes of water, sand, and chemicals under high pressure into a bedrock formation to create new fractures in the rock or increase the size, extent, and connectivity of existing fractures, leading to more permeability.\n' +
          '\n' +
          'On rare occasions, fracking can lead directly to earthquakes. More frequently, earthquakes are induced by the disposal of waste water associated with the oil production into underground wells. Seismic events associated with fracking and waste fluid disposal tend to be low-level and dependent on conditions such as the injection rate and total volume injected, the proximity of faults near the injection site and the pathways permitting pressure to travel from the injection site to the fault, and the presence of stresses on faults that are large enough to produce earthquakes.\n' +
          '\n' ),

  DataModel(
      "How Do Earthquake Early Warning Systems Work?",
      "assets/images/warnsystem.jpg",
      "Andrew Howard",
      "06.04.2020",
      'Earthquake early warning systems don’t predict earthquakes. Instead, they detect ground motion as soon as an earthquake begins and quickly send alerts that a tremor is on its way, giving people crucial seconds to prepare.\n' +
          '\n' +
          'In 1985, Caltech seismologist Tom Heaton published the first paper on the concept of earthquake early warning systems, networks of ground-based sensors that send alerts to users when the earth begins to tremble.\n' +
          '\n' +
          'Such systems, including ShakeAlert on the West Coast of the United States, operate on the principle that while seismic waves travel at just a few miles per second, electronic alerts from the region of the epicenter can be sent almost instantly. Here is how it works:\n' +
          '\n' +
          "     1) During an earthquake, several types of seismic waves radiate out from the quake's epicenter. First, weaker but faster-moving P-waves trigger sensors that, in turn, transmit signals to data processing centers.\n" +
          '\n' +
          "     2) Algorithms quickly estimate the earthquake's location, magnitude, and intensity: Where is it? How big is it? Who is going to feel it?\n" +
          '\n' +
          '     3) The system then sends an alert before slower, but more destructive S-waves and surface waves arrive.\n' +
          '\n' +
          'Although people who are near the epicenter will have little, if any advance warning, those farther away may have critical seconds to brace for shaking. Paired with automated responses that can slow trains or shut off gas lines, early warning systems may help prevent some of the injuries and damage typically associated with major quakes.\n' +
          '\n' +
          '\n' +
          'An earthquake just happened. Why did not I receive an alert on my smartphone?\n' +
          '\n' +
          "You might be too close to the epicenter. Early-warning alerts are typically delivered three to five seconds after an earthquake starts. That's the time it takes for seismic waves to travel to the closest stations, and for computers to analyze the data. If you are less than 10 miles from the epicenter, it is unlikely you will get a warning.\n" +
          '\n' +
          "The shaking might not have been strong enough. It is important to remember that most people experience weak shaking during an earthquake. This is because large earthquakes are rare, and because individuals are often too far from the epicenter to experience significant shaking. Currently, apps, such as MyShake, are designed to send alerts only for stronger shaking. This could change as scientists and public officials continue to tune the system's parameters.\n" +
          '\n' +
          '\n' ),
];
