import { LightningElement } from 'lwc';
export default class HelloWorld extends LightningElement {
        greeting = 'Hello Universe';
        changeHandler(event) {
        this.greeting = event.target.value;
        }
}