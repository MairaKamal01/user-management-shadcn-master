<template>
    <div class="h-screen">
      
      <!-- Main Background -->
       <!-- Example 1 -->
       <div class="relative h-4/5">
          <div class=" video-container absolute inset-0">
            <video src="/Images/bg_video.mp4" autoplay loop muted playsinline class=" w-full h-full object-cover"></video>
          </div>
          <div class="absolute inset-0 bg-black opacity-50"></div> <!-- Optional overlay for better text visibility -->
          <div class="relative z-10 flex justify-between items-center h-full px-32">
            <div class="text-left">
              <h1 class="text-8xl font-bold text-white mb-4">Welcome to <br> ANC Pipeline</h1>
              <p class="text-2xl text-white">fsmnffnmsnf,msnfddms,fnsmfdnm</p>
            </div>
            <div class=" text-right px-32">
              <a href="MakeNetwork">
                <button class="font-semibold bg-teal-500 text-white hover:bg-teal-300 px-14 py-8 text-2xl rounded">
                  Make Your Network
                </button>
              </a>
            </div>
          </div>
        </div>
    
      
      <!-- Example 1 -->
      <div class="h-3/5 border py-8 flex flex-col items-center ">
        <h1 class="text-4xl text-center font-bold mb-12">Our Pipeline</h1>
        <div class="flex flex-col md:flex-row items-center justify-around w-full max-w-6xl px-4 space-y-12 md:space-y-0">
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg max-w-xs">
            <div class="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-green-500">1</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Acquisition of Nodes</h2>
            <p class="text-lg">Acquisition of nodes from GDC and subsequent DEGs analysis</p>
          </div>
    
          <div class="hidden md:block w-10 h-0.5 "></div>
    
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg  max-w-xs">
            <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-blue-500">2a</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Acquisition of Drugs</h2>
            <p class="text-lg">Acquisition of drugs from multiple sources</p>
          </div>
    
          <div class="hidden md:block w-10 h-0.5 "></div>
    
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg  max-w-xs">
            <div class="w-16 h-16 bg-purple-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-purple-500">2b</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Acquire Targetable Nodes</h2>
            <p class="text-lg">Acquire targetable nodes</p>
          </div>
    
          <div class="hidden md:block w-10 h-0.5 "></div>
    
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg  max-w-xs">
            <div class="w-16 h-16 bg-orange-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-orange-500">3</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Nodes Enrichment</h2>
            <p class="text-lg">Nodes Enrichment</p>
          </div>
    
          <div class="hidden md:block w-10 h-0.5 "></div>
    
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg  max-w-xs">
            <div class="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-red-500">4</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Connecting Edges</h2>
            <p class="text-lg">Connecting Edges</p>
          </div>
    
          <div class="hidden md:block w-10 h-0.5 "></div>
    
          <div class="flex flex-col items-center text-center border p-6 rounded-lg shadow-lg  max-w-xs">
            <div class="w-16 h-16 bg-yellow-100 rounded-full flex items-center justify-center mb-4">
              <span class="text-3xl text-yellow-500">5</span>
            </div>
            <h2 class="text-2xl font-bold mb-2">Modeling in TISON</h2>
            <p class="text-lg">Boolean Rules Modeling in TISON</p>
          </div>
        </div>
      
      </div>
    
    
      <!-- Example 2 -->
      <div id="Pipeline-section" class=" border py-8 px-96">
        <h1 class="text-4xl text-center font-bold mb-12">Our Pipeline</h1>
        <div class="grid gap-10 lg:grid-cols-2 mb-8">
          <div class=" flex flex-col justify-center items-center text-center ">
            <h1 class="text-2xl font-bold text-center">Step 1</h1>
            <p class="text-xl text-center">Acquisition of nodes from GDC <br>and subsequent DEGs analysis </p>
          </div>
          
          <div class=" justify-items-center text-center ">
            <h1 class="text-2xl font-bold text-center">Step 2</h1>
            <p class="text-xl mb-4">Acquisition of drugs from <br> multiple sources</p>
          </div>
    
        </div>
        <div class=" justify-items-center mb-8">
          <h1 class="text-2xl font-bold">Step 3</h1>
          <p class="text-xl mb-4">Nodes Enrichment</p>
        </div>
        <div class=" justify-items-center mb-8">
          <h1 class="text-2xl font-bold">Step 4</h1>
          <p class="text-xl mb-4">Connecting Edges</p>
        </div>
        <div class=" justify-items-center mb-8">
          <h1 class="text-2xl font-bold">Step 5</h1>
        <p class="text-xl mb-4">Boolean Rules Modeling in TISON</p>
        </div>
      </div>
    
      <!-- Meet the Team -->
      <div class=" flex flex-col justify-center items-center p-8 ">
        <h2 class="text-4xl font-bold text-center mb-8">Meet the Team</h2>
        <p class="text-center text-xl text-gray-600 mb-8">Our talented and passionate team members who make everything possible.</p>
        
        <div class="grid gap-10 lg:grid-cols-4 mb-8">
          <div v-for="(member, index) in teamMembers" :key="index" class=" border flex flex-col justify-between items-center team-member py-9 shadow-md size-80">
            <!-- Use the team member's image here -->
            <img :src="member.image" alt="Profile image" class="w-32 h-32 rounded-full object-cover" />
            
            <!-- Display the name and role -->
            <h3 class="text-2xl font-semibold  text-center">{{ member.name }}</h3>
            <p class="text-center ">{{ member.role }}</p>
    
            <!-- Social Media Icons (Placeholder) -->
            <div class="flex justify-center space-x-4 mt-4">
              <Icon name="bx:bxl-twitter" class="text-xl" />
              <Icon name="bi:linkedin" class="text-xl" />
              <Icon name="mdi:github" class="text-xl" />
            </div>
          </div>
    
        </div>
        <Button class=" text-xl w-60"> See All</Button>
      </div>
    
      <!-- Integrations -->
      <div class=" border py-10">
        <div class="container mx-auto text-center">
          <h2 class=" text-4xl font-bold mb-12">Integrations</h2>
          <div class="flex justify-center items-center space-x-14">
            <img src="@/assets/Images/Picture2.PNG" alt="Profile image" class="" />
            <img src="@/assets/Images/Picture1.PNG" alt="Profile image" class="" />
            <img src="@/assets/Images/Picture3.PNG" alt="Profile image" class="" />
            <img src="@/assets/Images/Picture5.PNG" alt="Profile image" class="" />
          </div>
        </div>
      </div>
      
      
    
      <!-- Contact us -->
      <div class=" border py-10 px-4">
        <h2 class="text-4xl font-bold  text-center mb-8">Contact Us</h2>
        <div class="max-w-7xl mx-auto grid grid-cols-1 lg:grid-cols-2 gap-8">
          
          <!-- Contact Info -->
          <div class="contact-info flex flex-col items-center lg:items-start text-center lg:text-left">
            <!-- Logo and Description -->
            <Icon name="material-symbols:account-circle-full" class=" text-8xl mb-5" />
            <p class=" mb-10 text-lg">Biomedical Informatics and Engineering Research Laboratory (BIRL), Lahore University of Management Sciences (LUMS), Lahore</p>
            
            <!-- Social Media Icons -->
            <div class="flex space-x-4 mb-10 ">
              <Icon name="bx:bxl-twitter" class="text-5xl" />
              <Icon name="bi:linkedin" class="text-5xl" />
              <Icon name="mdi:github" class="text-5xl" />
            </div>
    
            <!-- Address, Email, and Phone -->
            <div class=" space-y-3 text-lg">
              <div class="flex items-center space-x-2">
                <Icon name="icomoon-free:location" class=" text-3xl" />
                <span>LUMS, Lahore, Pakistan</span>
              </div>
              <div class="flex items-center space-x-2 py-5">
                <Icon name="icomoon-free:mail4" class=" text-3xl" />
                <a href="mailto:safee.ullah.chaudhary@gmail.com" class="text-blue-600 hover:underline">safee.ullah.chaudhary@gmail.com</a>
              </div>
              <div class="flex items-center space-x-2">
                <Icon name="icomoon-free:phone" class=" text-3xl"/>
                <span>+92 (42) 3560 8352</span>
              </div>
            </div>
          </div>
    
          <!-- Contact Form -->
          <div class="contact-form border p-8">
            
            <form>
              <div class="mb-4">
                <label class="block  mb-2">Your Name</label>
                <input type="text" placeholder="Your Name" class="w-full border border-gray-300 p-2 rounded">
              </div>
              
              <div class="mb-4">
                <label class="block mb-2">Your Email</label>
                <input type="email" placeholder="Your Email" class="w-full border border-gray-300 p-2 rounded">
              </div>
              
              <div class="mb-4">
                <label class="block  mb-2">Subject</label>
                <input type="text" placeholder="Subject" class="w-full border border-gray-300 p-2 rounded">
              </div>
              
              <div class="mb-4">
                <label class="block t mb-2">Message</label>
                <textarea placeholder="Message" class="w-full border border-gray-300 p-2 rounded h-24"></textarea>
              </div>
              
              <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded hover:bg-blue-600">
                Send Message
              </button>
            </form>
          </div>
    
        </div>
      </div>
    
    </div>
    </template>
    
    <script lang="ts" setup>
    import type { currentUserType } from "~/types";
    const currentUser = useState<currentUserType | null>("currentUser");
    
    const teamMembers = [
      {
        name: "Dr Safee Ullah Chaudhary",
        role: "Group Lead",
        image: "Images/DrSafee.jpg",
        socials: {
          twitter: "https://twitter.com/alicesmith",
          linkedin: "https://linkedin.com/in/alicesmith",
          github: "https://github.com/alicesmith"
        }
      },
      {
        name: "Umer Sultan",
        role: "Development Team Lead",
        image: "Images/omer.png",
        socials: {
          twitter: "https://twitter.com/bobjohnson",
          linkedin: "https://linkedin.com/in/bobjohnson",
          github: "https://github.com/bobjohnson"
        }
      },
      {
        name: "Zainab Nasir",
        role: "Case Study Team Lead",
        image: "Images/ZainabNasir.jpeg",
        socials: {
          twitter: "https://twitter.com/carolwilliams",
          linkedin: "https://linkedin.com/in/carolwilliams",
          github: "https://github.com/carolwilliams"
        }
      },
      {
        name: "Maira Kamal",
        role: "Development Team",
        image: "Images/Maira.jpeg",
        socials: {
          twitter: "https://twitter.com/bobjohnson",
          linkedin: "https://linkedin.com/in/bobjohnson",
          github: "https://github.com/bobjohnson"
        }
      },
    ];
    
    </script>
    
    <style>
    
    </style>
    