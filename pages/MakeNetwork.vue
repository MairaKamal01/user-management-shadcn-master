<template>
    <div class="flex flex-col justify-center items-center">
        <div class=" py-8">
            <h1 class=" text-center text-4xl font-bold">Make Your Own Network</h1>
        </div>
        <Card class=" w-4/12">
            <CardContent>
                <form vi class="space-y-8 py-5" @submit="onSubmit">

                    <!-- Input -->
                    <FormField v-slot="{ componentField }" name="input">
                        <FormItem>
                            <FormLabel>Input</FormLabel>
                            <FormControl>
                                <Input type="text" placeholder="Input" v-bind="componentField" />
                            </FormControl>
                            <FormDescription>
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Switch -->
                    <FormField v-slot="{ value, handleChange }" name="marketing_emails">
                        <FormItem class="flex flex-row items-center justify-between rounded-lg border p-4">
                            <div class="space-y-0.5">
                                <FormLabel class="text-base">
                                    Marketing emails
                                </FormLabel>
                                <FormDescription>
                                    Receive emails about new products, features, and more.
                                </FormDescription>
                            </div>
                            <FormControl>
                                <Switch :checked="value" @update:checked="handleChange" />
                            </FormControl>
                        </FormItem>
                    </FormField>

                    <!-- Slider -->
                    <FormField v-slot="{ componentField, value, setValue }" name="duration" >
                        <FormItem>
                            <FormLabel>Duration</FormLabel>
                            <FormControl>
                                <Slider
                                    v-bind="componentField"
                                    :default-value="[30]"
                                    :max="100"
                                    :min="0"
                                    :step="5"
                                    :value="value && value.length > 0 ? value[0] : 0"
                                    @input="(event: Event)  => {
                                        const target = event.target as HTMLInputElement | null;
                                        if (target) setValue([parseInt(target.value)]);
                                    }"
                                />
                                <FormDescription class="flex justify-between">
                                    <span>How many minutes are you available?</span>
                                    <span>{{ value && value.length > 0 ? value[0] : 0 }} min</span>
                                </FormDescription>
                                <input
                                    type="number"
                                    :min="0"
                                    :max="100"
                                    :value="value && value.length > 0 ? value[0] : 0"
                                    @input="event => {
                                        const target = event.target as HTMLInputElement | null;
                                        if (target) setValue([parseInt(target.value)]);
                                    }"
                                    class="ml-2 border rounded p-1 w-16 text-center text-gray-500"
                                />
                            </FormControl>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Checkbox -->
                    <FormField v-slot="{ value, handleChange }" type="checkbox" name="mobile">
                        <FormItem class="flex flex-row items-start gap-x-3 space-y-0 rounded-md border p-4">
                            <FormControl>
                            <Checkbox :checked="value" @update:checked="handleChange" />
                            </FormControl>
                            <div class="space-y-1 leading-none">
                            <FormLabel>Use different settings for my mobile devices</FormLabel>
                            <FormDescription>
                                You can manage your mobile notifications in the
                                <a href="/examples/forms">mobile settings</a> page.
                            </FormDescription>
                            <FormMessage />
                            </div>
                        </FormItem>
                    </FormField>
                    
                    <!-- Select -->
                    <FormField v-slot="{ componentField }" name="email">
                        <FormItem>
                            <FormLabel>Email</FormLabel>

                            <Select v-bind="componentField">
                            <FormControl>
                                <SelectTrigger>
                                <SelectValue placeholder="Select a verified email to display" />
                                </SelectTrigger>
                            </FormControl>
                            <SelectContent>
                                <SelectGroup>
                                <SelectItem value="m@example.com">
                                    m@example.com
                                </SelectItem>
                                <SelectItem value="m@google.com">
                                    m@google.com
                                </SelectItem>
                                <SelectItem value="m@support.com">
                                    m@support.com
                                </SelectItem>
                                </SelectGroup>
                            </SelectContent>
                            </Select>
                            <FormDescription>
                                You can manage email addresses in your
                                <a href="/examples/forms">email settings</a>.
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Number Field -->
                    <FormField v-slot="{ value }" name="payment">
                        <FormItem>
                            <FormLabel>Payment</FormLabel>
                            <NumberField class="gap-2" :min="0" :format-options="{style: 'currency', currency: 'EUR',currencyDisplay: 'code',currencySign: 'accounting',}"
                            :model-value="value"
                            @update:model-value="(v) => {
                                if (v) {
                                    setFieldValue('payment', v)
                                }
                                else {
                                    setFieldValue('payment', undefined)
                                }
                            }"
                            >
                            <NumberFieldContent>
                                <NumberFieldDecrement />
                                <FormControl>
                                <NumberFieldInput />
                                </FormControl>
                                <NumberFieldIncrement />
                            </NumberFieldContent>
                            </NumberField>
                                <FormDescription>
                                    Enter value between 10 and 5000.
                                </FormDescription>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Radio Group -->
                    <FormField v-slot="{ componentField }" type="radio" name="type">
                        <FormItem class="space-y-3">
                            <FormLabel>Notify me about...</FormLabel>

                            <FormControl>
                            <RadioGroup
                                class="flex flex-col space-y-1"
                                v-bind="componentField"
                            >
                                <FormItem class="flex items-center space-y-0 gap-x-3">
                                <FormControl>
                                    <RadioGroupItem value="all" />
                                </FormControl>
                                <FormLabel class="font-normal">
                                    All new messages
                                </FormLabel>
                                </FormItem>
                                <FormItem class="flex items-center space-y-0 gap-x-3">
                                <FormControl>
                                    <RadioGroupItem value="mentions" />
                                </FormControl>
                                <FormLabel class="font-normal">
                                    Direct messages and mentions
                                </FormLabel>
                                </FormItem>
                                <FormItem class="flex items-center space-y-0 gap-x-3">
                                <FormControl>
                                    <RadioGroupItem value="none" />
                                </FormControl>
                                <FormLabel class="font-normal">
                                    Nothing
                                </FormLabel>
                                </FormItem>
                            </RadioGroup>
                            </FormControl>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Checkbox with multiple options  -->
                    <FormField name="items">
                        <FormItem>
                            <div class="mb-4">
                            <FormLabel class="text-base">
                                Sidebar
                            </FormLabel>
                            <FormDescription>
                                Select the items you want to display in the sidebar.
                            </FormDescription>
                            </div>

                            <FormField v-for="item in items" v-slot="{ value, handleChange }" :key="item.id" type="checkbox" :value="item.id" :unchecked-value="false" name="items">
                            <FormItem class="flex flex-row items-start space-x-3 space-y-0">
                                <FormControl>
                                <Checkbox
                                    :checked="Array.isArray(value) && value.includes(item.id)"
                                    @update:checked="handleChange"
                                />
                                </FormControl>
                                <FormLabel class="font-normal">
                                {{ item.label }}
                                </FormLabel>
                            </FormItem>
                            </FormField>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Combobox -->
                    <FormField name="language">
                        <FormItem class="flex flex-col">
                            <FormLabel>Language</FormLabel>
                            <Popover>
                            <PopoverTrigger as-child>
                                <FormControl>
                                <Button
                                    variant="outline"
                                    role="combobox"
                                    :class="cn('w-[200px] justify-between', !values.language && 'text-muted-foreground')"
                                >
                                    {{ values.language ? languages.find(
                                    (language) => language.value === values.language,
                                    )?.label : 'Select language...' }}
                                    <ChevronsUpDown class="ml-2 h-4 w-4 shrink-0 opacity-50" />
                                </Button>
                                </FormControl>
                            </PopoverTrigger>
                            <PopoverContent class="w-[200px] p-0">
                                <Command>
                                <CommandInput placeholder="Search language..." />
                                <CommandEmpty>Nothing found.</CommandEmpty>
                                <CommandList>
                                    <CommandGroup>
                                    <CommandItem
                                        v-for="language in languages"
                                        :key="language.value"
                                        :value="language.label"
                                        @select="() => {
                                        setFieldValue('language', language.value)
                                        }"
                                    >
                                        <Check
                                        :class="cn('mr-2 h-4 w-4', language.value === values.language ? 'opacity-100' : 'opacity-0')"
                                        />
                                        {{ language.label }}
                                    </CommandItem>
                                    </CommandGroup>
                                </CommandList>
                                </Command>
                            </PopoverContent>
                            </Popover>
                            <FormDescription>
                            This is the language that will be used in the dashboard.
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    <!-- Tags Input -->
                    <FormField v-slot="{ value }" name="fruits">
                        <FormItem>
                            <FormLabel>Fruits</FormLabel>
                            <FormControl>
                            <TagsInput :model-value="value">
                                <TagsInputItem v-for="item in value" :key="item" :value="item">
                                <TagsInputItemText />
                                <TagsInputItemDelete />
                                </TagsInputItem>

                                <TagsInputInput placeholder="Fruits..." />
                            </TagsInput>
                            </FormControl>
                            <FormDescription>
                                Select your favorite fruits.
                            </FormDescription>
                            <FormMessage />
                        </FormItem>
                    </FormField>

                    
                    <Button type="submit">
                        Submit
                    </Button>
                </form>
                <div v-if="submittedValues" class="mt-6 p-4 border rounded bg-gray-100">
                    <h2 class="text-2xl font-bold mb-4">Submitted Values:</h2>
                    <pre>{{ submittedValues }}</pre>
                </div>
            </CardContent>
        </Card>
    </div>
  </template>
  
<script lang="ts" setup>

import { Button } from '@/components/ui/button'
import {
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '@/components/ui/form'

import {
  NumberField,
  NumberFieldContent,
  NumberFieldDecrement,
  NumberFieldIncrement,
  NumberFieldInput,
} from '@/components/ui/number-field'

import { Input } from '@/components/ui/input'
import { toast } from '@/components/ui/toast'
import { Switch } from '@/components/ui/switch'
import { TagsInput, TagsInputInput, TagsInputItem, TagsInputItemDelete, TagsInputItemText } from '@/components/ui/tags-input'
import { h } from 'vue'
import cn from 'classnames';
import { Check, ChevronsUpDown } from 'lucide-vue-next'
import { toTypedSchema } from '@vee-validate/zod'
import { useForm } from 'vee-validate'
import * as z from 'zod'

const items = [
  {
    id: 'recents',
    label: 'Recents',
  },
  {
    id: 'home',
    label: 'Home',
  },
  {
    id: 'applications',
    label: 'Applications',
  },
  {
    id: 'desktop',
    label: 'Desktop',
  },
  {
    id: 'downloads',
    label: 'Downloads',
  },
  {
    id: 'documents',
    label: 'Documents',
  },
] as const

const languages = [
  { label: 'English', value: 'en' },
  { label: 'French', value: 'fr' },
  { label: 'German', value: 'de' },
  { label: 'Spanish', value: 'es' },
  { label: 'Portuguese', value: 'pt' },
]

const formSchema = toTypedSchema(z.object({
    input: z.string().min(2).max(50),
    marketing_emails: z.boolean().default(false).optional(),
    duration: z.array(z.number().min(0).max(60)),
    mobile: z.boolean().default(false).optional(),
    email: z.string({required_error: 'Please select an email to display.',}).email(),
    payment: z.number().min(10, 'Min 10 euros to send payment').max(5000, 'Max 5000 euros to send payment'),
    type: z.enum(['all', 'mentions', 'none'], {required_error: 'You need to select a notification type.',}),
    items: z.array(z.string()).refine(value => value.some(item => item), {message: 'You have to select at least one item.',}),
    language: z.string({required_error: 'Please select a language.',}),
    fruits: z.array(z.string()).min(1).max(10),
}))

const sliderValue = ref([30])

const { handleSubmit, setFieldValue, values } = useForm({
    validationSchema: formSchema,
    initialValues: {
        items: [],
        payment: 10, 
        input: "",
        fruits: [],
        duration: [30],
    },
})

type FormValues = {
  input: string
  marketing_emails?: boolean
}



const submittedValues: Ref<FormValues | null> = ref(null)

const onSubmit = handleSubmit((values) => {
    if (Object.values(values).some(value => value === null)) 
    {
        toast({
        title: 'Form Submission Error',
        description: 'Please ensure all values are non-null and non-zero.',
        })
        return
  }

  // Set the submitted values to display below the form
  submittedValues.value = values

  toast({
    title: 'Form Submitted Successfully',
    description: 'Your selections have been saved!',
  })
})

</script>

<style scoped>



</style>