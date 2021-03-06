# Copyright 2016 CyberTech Labs Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This file was modified by Yurii Litvinov and Mikhail Wall to make it comply with the requirements of trikRuntime
# project. See git revision history for detailed changes.

# Requesting more warnings
QMAKE_CXXFLAGS += -Wall -Wextra -Wpedantic -Wold-style-cast -Wconversion
QMAKE_CXXFLAGS += -Winit-self -Wunreachable-code
QMAKE_CXXFLAGS += -Werror -Wno-conversion

# Suppressing warnings in Qt's files
# QMAKE_CXXFLAGS += -isystem "$(QTDIR)/include"
# QMAKE_CXXFLAGS += -isystem "$(QTDIR)/include/QtMultimediaWidgets"

QT += core gui network widgets multimedia multimediawidgets

CONFIG += c++11

TARGET = gamepad
TEMPLATE = app  

macx {
	QMAKE_LFLAGS += -rpath . -rpath @executable_path/../Lib -rpath @executable_path/../Frameworks -rpath @executable_path/../../../
}

SOURCES += main.cpp \
	gamepadForm.cpp \
	connectForm.cpp \
	connectionManager.cpp \
	standardStrategy.cpp \
	accelerateStrategy.cpp \
	strategy.cpp

TRANSLATIONS += languages/trikDesktopGamepad_ru.ts \
	languages/trikDesktopGamepad_en.ts \
	languages/trikDesktopGamepad_fr.ts \
	languages/trikDesktopGamepad_de.ts

target.path =
HEADERS += \
	gamepadForm.h \
	connectForm.h \
	connectionManager.h \
	standardStrategy.h \
	accelerateStrategy.h \
	strategy.h

FORMS += \
	gamepadForm.ui \
	connectForm.ui

RESOURCES += \
	images.qrc \
	fonts.qrc

# Single Application implementation
include(thirdparty/singleApplication.pro)
