/* Copyright 2016 Mikhail Wall.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * This file was modified by Mikhail Wall to make it comply with the requirements of trikRuntime
 * project. See git revision history for detailed changes. */

#pragma once
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"

#include <QtWidgets/QDialog>
#include <QtNetwork/QTcpSocket>

#pragma GCC diagnostic pop

#include "connectionManager.h"

namespace Ui {
class ConnectForm;
}

/// Dialog for creating connection between robot and application
class ConnectForm : public QDialog
{
	Q_OBJECT

public:
	/// Constructor.
	ConnectForm(ConnectionManager *connectionManager
				, QWidget *parent = 0);
	~ConnectForm();

private slots:

	/// Slot for button for connecting to robot
	void onConnectButtonClicked();

	void onAdvancedButtonClicked();

signals:
	void dataReceived();

private:
	void setVisibilityToAdditionalButtons(bool mode);

	/// Field with GUI automatically generated by connectForm.ui.
	QScopedPointer<Ui::ConnectForm> mUi;

	/// ConnectionManager for saving state of internet connection
	ConnectionManager *connectionManager; /// Does not have ownership
};

