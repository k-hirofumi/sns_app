#ifndef FLUTTER_sns_appLICATION_H_
#define FLUTTER_sns_appLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, sns_application, MY, APPLICATION,
                     GtkApplication)

/**
 * sns_application_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* sns_application_new();

#endif  // FLUTTER_sns_appLICATION_H_
