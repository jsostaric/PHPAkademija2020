# PHPAcademyHomework6

<h3>Mandatory</h3>

<ol>
    <li>
        <p>
            Create class which has two private properties. Property values should be set at object creation and should be changeable later with __get() and __set() magic methods.
        </p>
    </li>
    <p><b>Extra points:</b></p>
    <ul>
        <li>
            Make setting of the property values optional at object creation.
        </li>
        <li>
            Don't set property value if property doesn't exist in the class.
        </li>
    </ul>
    <p>
        <b>Note::</b>Don't use class or property names from the lecture.
    </p>
    <li>
        Create class with __call() magic method that handles missing getters and setters.
    </li>
    <p>
        <b>For example:</b>
    </p>
    <ul>
        <li>
            If someone calls $obj->getFirstName(), __call() should return firstname value from the $data property.
        </li>
        <li>
            If someone calls $obj->setLastName('Perić'), __call() should set value of lastname in the $data property.
        </li>
        <li>
            If someone calls method with a different prefix than: get, set, has, uns, __call() should throw an Exception.
        </li>
    </ul>
    <p><b>Extra points:</b></p>
    <ul>
        <li>
            If someone calls $obj->hasAge(), __call() should return true if age value exist in the $data property and false otherwise.
        </li>
        <li>
            If someone calls $obj->unsAddress(), __call() should remove address value from the $data property.
        </li>
    </ul>
    <p><b>Note:</b></p>
    <ul>
        <li>
            $data property should be an associative array.
        </li>
        <li>
            firstname, lastname, age, and address are just examples, someone should be able to call any getter or setter on that class.
        </li>
    </ul>
</ol>