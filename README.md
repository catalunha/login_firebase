# login_firebase

A new Flutter project.

## SHA
https://www.youtube.com/watch?v=mMetl1-V6DA
 keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android


# leonardo maia
## bind
class AddTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskController>(() => AddTaskController());
  }
}
## controller
 //controller

  DateTime selectedDate = DateTime.now();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    selectedDate;
  }

  getDataFromUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (_pickerDate != null) {
      selectedDate = _pickerDate;
    } else {
      print("BURASI BOŞ");
    }
  }

  void showLoading() => isLoading.toggle();

  void hideLoading() => isLoading.toggle();
}

## page
//PAGE

class AddTaskPage extends GetView<AddTaskController> {
  final _controller = Get.find<AddTaskController>();

  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.addTaskTitle,
                  style: headingStyle,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const InputField(
                    title: AppString.inputField_Title,
                    hint: AppString.inputField_Title_Hint,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const InputField(
                    title: AppString.inputField_Note,
                    hint: AppString.inputField_Note_Hint,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: InputField(
                      title: AppString.inputField_Date,
                      hint: DateFormat.yMd().format(_controller.selectedDate),
                      widget: IconButton(
                        onPressed: () {
                          _controller.getDataFromUser(context);
                        },
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundColor: Colors.amberAccent,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}