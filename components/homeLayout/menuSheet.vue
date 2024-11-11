<script setup lang="ts">
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Sheet,
  SheetClose,
  SheetContent,
  SheetDescription,
  SheetFooter,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";
import { navigationMenuTriggerStyle } from "@/components/ui/navigation-menu";
import { DialogClose } from "radix-vue";

//const sheetOpen = ref(false);

// const route = useRoute();

// watch(route, (newRoute, oldRoute) => {
//   sheetOpen.value = false;
//});
</script>

<template>
  <div class="block md:hidden m-0">
    <Sheet>
      <SheetTrigger>
        <Button variant="outline" class="block md:hidden">
          <Icon name="fa6-solid:bars" />
        </Button>
      </SheetTrigger>
      <SheetContent>
        <SheetHeader>
          <SheetTitle>Edit profile</SheetTitle>
          <SheetDescription>
            Make changes to your profile here. Click save when you're done.
          </SheetDescription>
        </SheetHeader>
        <DailogRoot>
          <DialogClose>
            <div class="mt-5 flex flex-col gap-2">
              <RouterLink to="/"> Home </RouterLink>
              <RouterLink to="/about"> About </RouterLink>
            </div>
          </DialogClose>
        </DailogRoot>
        <Separator />
        <div class="flex justify-start">
          <HomeLayoutDarkModeToggle />
          <HomeLayoutGithubLinkBtn />
        </div>
        <Separator />
        <DialogClose>
          <div class="w-full mt-5 flex gap-2">
            <Button class="flex-grow" as-child>
              <RouterLink to="/auth/login"> Login </RouterLink>
            </Button>
            <Button class="flex-grow" as-child>
              <RouterLink to="/auth/signUp"> Sign Up </RouterLink>
            </Button>
          </div>
        </DialogClose>
      </SheetContent>
    </Sheet>
  </div>
</template>
