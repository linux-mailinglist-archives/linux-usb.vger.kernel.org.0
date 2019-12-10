Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C30911806F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 07:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLJG3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 01:29:38 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34415 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfLJG3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 01:29:38 -0500
Received: by mail-lf1-f67.google.com with SMTP id l18so12751466lfc.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Dec 2019 22:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:subject:date:message-id;
        bh=ruJi3e5W9zvSlJifYLEfRxy2zPKyYSFNfbFQe0a+IlQ=;
        b=NkYbWD3z/93jktcED4DsmIY8BLvs8MLuHRpqiCcmgOcTSaeOpWmxVBjXHoQ+hidJ2U
         ye0ryWCm2sWaPgsr/A8E8ix2URlVVWrUKVyUge1FvmSFtclOmI9ADaIwqbzOa62O0hI6
         tCvZKcIMIg8Wu55fhZcRwJO3yF4wXSebankrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ruJi3e5W9zvSlJifYLEfRxy2zPKyYSFNfbFQe0a+IlQ=;
        b=K5EfGyqPpaCbKk3nWETr6Tue0LTGzfLwYXgSrpQamqNJyKBv/hzdltB2AnZoK1SybJ
         UUSJjrluhazORN3rwfQu4ojc40M1pJX73YvjUoq/TxXhjPOpAxtCqG6I8zi7ZknGwugZ
         74wUyadJXgXbuur3OHK6rD/Ma8AC1qoOEGj4SxyVP1w2Lj66ePwYK5IY/2nkEvwBLNxO
         lohGqWKu5/Sg5pUMx1sjxEgqwhAXEus4+vh3tqIFyCiR8c1mecqnMBgZFIZ7iMgi/WWv
         s3jpTX3dqhZAVxoxUL+NBXWreFzdYhyiyqEB4xbML5ic7BZUl3Bw7Rx1aP1xcw58Vfmu
         Dkbg==
X-Gm-Message-State: APjAAAWZ/GzWzFs/neMm3tyRsTcVjiI/gszRXIQujSKUR0raKZm6VLyg
        +T0DefY09bWGyBe49XO6GJqTew==
X-Google-Smtp-Source: APXvYqzVidqxbJDHQ2PIZYwaN/6d519o5vviK49Kc+fU7xMGK4u6m0KWMTqZmNFkmF4VXCpDVus/fw==
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr13654814lfg.34.1575959372834;
        Mon, 09 Dec 2019 22:29:32 -0800 (PST)
Received: from erkkata-VirtualBox.clients.hermia.vincit.fi ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id p26sm871443lfh.64.2019.12.09.22.29.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 09 Dec 2019 22:29:32 -0800 (PST)
From:   Erkka Talvitie <erkka.talvitie@vincit.fi>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, claus.baumgartner@med.ge.com,
        Erkka Talvitie <erkka.talvitie@vincit.fi>
Subject: [PATCH] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Tue, 10 Dec 2019 08:29:18 +0200
Message-Id: <1ec66c398699e95ca2b5755f6cbb8c5d2453dd71.1575893227.git.erkka.talvitie@vincit.fi>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When disconnecting a USB hub that has some child device(s) connected to it
(such as a USB mouse), then the stack tries to clear halt and
reset device(s) which are _already_ physically disconnected.

The issue has been reproduced with:

CPU: IMX6D5EYM10AD or MCIMX6D5EYM10AE.
SW: U-Boot 2019.07 and kernel 4.19.40.

CPU: HP Proliant Microserver Gen8.
SW: Linux version 4.2.3-300.fc23.x86_64

In this situation there will be error bit for MMF active yet the
CERR equals EHCI_TUNE_CERR + halt. Existing implementation
interprets this as a stall [1] (chapter 8.4.5).

The possible conditions when the MMF will be active + halt
can be found from [2] (Table 4-13).

Fix for the issue is to check whether MMF is active and PID Code is
IN before checking for the stall. If these conditions are true then
it is not a stall.

What happens after the fix is that when disconnecting a hub with
attached device(s) the situation is not interpret as a stall.

[1] https://www.usb.org/document-library/usb-20-specification, usb_20.pdf
[2] https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/ehci-specification-for-usb.pdf

Signed-off-by: Erkka Talvitie <erkka.talvitie@vincit.fi>
---
Following test steps were executed to first demonstrate the issue and then
to verify the fix:

--> Attach a mouse into host port and then disconnect it.
--> Attach a keyboard into host port and then disconnect it.
--> Attach a KVM switch into host port and then disconnect it.
--> Attach a KVM switch into host port, attach a mouse into the KVM and then disconnect it.
--> Re-attach the mouse into the KVM and then disconnect the KVM switch.
--> Attach a KVM switch into host port, attach a keyboard into the KVM and then disconnect it.
--> Re-attach the keyboard into the KVM and then disconnect the KVM switch.
--> Attach a KVM switch into host port, attach a mouse and a keyboard into the KVM and then disconnect the KVM switch.
--> End test.

Output without the fix:

--> Attach a mouse into host port and then disconnect it.
kernel: [  374.409837] usb 2-1.2: new low-speed USB device number 16 using ci_hdrc
kernel: [  374.673010] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:046D:C05F.0006/input/input7
kernel: [  374.674044] hid-generic 0003:046D:C05F.0006: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2/input0
weston[464]: [11:14:07.717] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[464]: [11:14:07.717] event6  - Logitech USB Optical Mouse: device is a pointer
weston[464]: [11:14:07.718] libinput: configuring device "Logitech USB Optical Mouse".
weston[464]: [11:14:07.718] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  378.931298] usb 2-1.2: USB disconnect, device number 16
weston[464]: [11:14:11.668] event6  - Logitech USB Optical Mouse: device removed
--> Attach a keyboard into host port and then disconnect it.
kernel: [  400.759884] usb 2-1.2: new low-speed USB device number 17 using ci_hdrc
kernel: [  401.025695] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:413C:2106.0007/input/input8
kernel: [  401.090413] hid-generic 0003:413C:2106.0007: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2/input0
systemd-logind[392]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[464]: [11:14:33.992] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[464]: [11:14:33.994] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[464]: [11:14:33.995] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[464]: [11:14:33.996] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  404.230882] usb 2-1.2: USB disconnect, device number 17
weston[464]: [11:14:37.047] event6  - Dell Dell QuietKey Keyboard: device removed
--> Attach a KVM switch into host port and then disconnect it.
kernel: [  424.059844] usb 2-1.2: new high-speed USB device number 18 using ci_hdrc
kernel: [  424.315581] hub 2-1.2:1.0: USB hub found
kernel: [  424.316179] hub 2-1.2:1.0: 4 ports detected
kernel: [  428.268438] usb 2-1.2: USB disconnect, device number 18
--> Attach a KVM switch into host port, attach a mouse into the KVM and then disconnect it.
kernel: [  443.509853] usb 2-1.2: new high-speed USB device number 19 using ci_hdrc
kernel: [  443.763137] hub 2-1.2:1.0: USB hub found
kernel: [  443.763860] hub 2-1.2:1.0: 4 ports detected
kernel: [  448.299911] usb 2-1.2.2: new low-speed USB device number 20 using ci_hdrc
kernel: [  448.463160] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0008/input/input9
kernel: [  448.463380] hid-generic 0003:046D:C05F.0008: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[464]: [11:15:21.508] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[464]: [11:15:21.508] event6  - Logitech USB Optical Mouse: device is a pointer
weston[464]: [11:15:21.509] libinput: configuring device "Logitech USB Optical Mouse".
weston[464]: [11:15:21.509] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  453.915419] usb 2-1.2.2: USB disconnect, device number 20
weston[464]: [11:15:26.655] event6  - Logitech USB Optical Mouse: device removed
--> Re-attach the mouse into the KVM and then disconnect the KVM switch.
kernel: [  468.519841] usb 2-1.2.2: new low-speed USB device number 21 using ci_hdrc
kernel: [  468.683002] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0009/input/input10
kernel: [  468.683202] hid-generic 0003:046D:C05F.0009: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[464]: [11:15:41.727] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[464]: [11:15:41.728] event6  - Logitech USB Optical Mouse: device is a pointer
weston[464]: [11:15:41.728] libinput: configuring device "Logitech USB Optical Mouse".
weston[464]: [11:15:41.728] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  471.118091] usb 2-1.2: clear tt 1 (0150) error -71
kernel: [  471.134041] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.138266] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.142515] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.146773] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.151013] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.151020] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  471.155259] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  471.159542] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.163765] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.168007] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.172267] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.176507] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.176512] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  471.180763] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  471.185022] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.189261] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.194198] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.198273] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.202514] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.202521] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  471.206757] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  471.211024] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.215257] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.219524] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.223767] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.228007] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  471.228013] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  471.232261] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  471.236514] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  471.240801] hub 2-1.2:1.0: hub_ext_port_status failed (err = -71)
weston[464]: [11:15:43.974] event6  - Logitech USB Optical Mouse: device removed
kernel: [  471.276392] usb 2-1.2: USB disconnect, device number 19
kernel: [  471.276404] usb 2-1.2.2: USB disconnect, device number 21
--> Attach a KVM switch into host port, attach a keyboard into the KVM and then disconnect it.
kernel: [  489.339839] usb 2-1.2: new high-speed USB device number 22 using ci_hdrc
kernel: [  489.602886] hub 2-1.2:1.0: USB hub found
kernel: [  489.603397] hub 2-1.2:1.0: 4 ports detected
kernel: [  493.869845] usb 2-1.2.2: new low-speed USB device number 23 using ci_hdrc
kernel: [  494.046950] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000A/input/input11
kernel: [  494.112909] hid-generic 0003:413C:2106.000A: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[392]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[464]: [11:16:07.033] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[464]: [11:16:07.038] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[464]: [11:16:07.040] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[464]: [11:16:07.040] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  498.303010] usb 2-1.2.2: USB disconnect, device number 23
weston[464]: [11:16:11.135] event6  - Dell Dell QuietKey Keyboard: device removed
--> Re-attach the keyboard into the KVM and then disconnect the KVM switch.
kernel: [  510.509858] usb 2-1.2.2: new low-speed USB device number 24 using ci_hdrc
kernel: [  510.673159] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000B/input/input12
kernel: [  510.740488] hid-generic 0003:413C:2106.000B: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[392]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[464]: [11:16:23.669] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[464]: [11:16:23.670] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[464]: [11:16:23.672] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[464]: [11:16:23.673] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  513.808762] usb 2-1.2: clear tt 1 (0180) error -71
kernel: [  513.824014] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.828254] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.832510] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.837034] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.841135] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.841141] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  513.845391] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  513.849575] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.853760] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.858009] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.862264] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.866514] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.866521] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  513.870812] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  513.875012] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.879253] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.883511] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.887763] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.892012] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.892019] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  513.896267] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  513.900572] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.904776] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.909004] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.913290] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.917512] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  513.917517] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  513.921769] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  513.926009] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  513.930372] hub 2-1.2:1.0: hub_ext_port_status failed (err = -71)
weston[464]: [11:16:26.752] event6  - Dell Dell QuietKey Keyboard: device removed
kernel: [  514.028708] usb 2-1.2: USB disconnect, device number 22
kernel: [  514.028721] usb 2-1.2.2: USB disconnect, device number 24
--> Attach a KVM switch into host port, attach a mouse and a keyboard into the KVM and then disconnect the KVM switch.
kernel: [  530.299896] usb 2-1.2: new high-speed USB device number 25 using ci_hdrc
kernel: [  530.553126] hub 2-1.2:1.0: USB hub found
kernel: [  530.553656] hub 2-1.2:1.0: 4 ports detected
kernel: [  534.580137] usb 2-1.2.2: new low-speed USB device number 26 using ci_hdrc
kernel: [  534.743092] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.000C/input/input13
kernel: [  534.744022] hid-generic 0003:046D:C05F.000C: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[464]: [11:16:47.778] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[464]: [11:16:47.778] event6  - Logitech USB Optical Mouse: device is a pointer
weston[464]: [11:16:47.779] libinput: configuring device "Logitech USB Optical Mouse".
weston[464]: [11:16:47.779] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  536.889928] usb 2-1.2.4: new low-speed USB device number 27 using ci_hdrc
kernel: [  537.054252] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.4/2-1.2.4:1.0/0003:413C:2106.000D/input/input14
kernel: [  537.120711] hid-generic 0003:413C:2106.000D: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.4/input0
systemd-logind[392]: Watching system buttons on /dev/input/event7 (Dell Dell QuietKey Keyboard)
weston[464]: [11:16:50.022] event7  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[464]: [11:16:50.024] event7  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[464]: [11:16:50.025] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[464]: [11:16:50.026] associating input device event7 with output HDMI-A-1 (none by udev)
kernel: [  540.962649] usb 2-1.2: clear tt 1 (01a0) error -71
kernel: [  540.966889] usb 2-1.2: clear tt 1 (01b0) error -71
kernel: [  540.974144] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  540.978389] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  540.982519] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  540.986762] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  540.991019] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  540.991025] usb 2-1.2-port4: Cannot enable. Maybe the USB cable is bad?
kernel: [  540.995254] usb 2-1.2-port4: cannot disable (err = -71)
kernel: [  540.999529] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.003785] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.008015] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.012276] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.016511] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.016517] usb 2-1.2-port4: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.020910] usb 2-1.2-port4: cannot disable (err = -71)
kernel: [  541.025107] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.029286] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.033522] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.037793] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.042021] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.042028] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.046269] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  541.050543] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.054753] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.059005] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.063266] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.067513] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.067518] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.071769] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  541.076005] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.080324] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.084543] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.088762] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.093018] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.093024] usb 2-1.2-port4: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.097261] usb 2-1.2-port4: cannot disable (err = -71)
kernel: [  541.101515] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.105751] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.110169] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.114265] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.118507] usb 2-1.2-port4: cannot reset (err = -71)
kernel: [  541.118512] usb 2-1.2-port4: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.122763] usb 2-1.2-port4: cannot disable (err = -71)
kernel: [  541.127006] usb 2-1.2-port4: cannot disable (err = -71)
kernel: [  541.131266] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.135547] hub 2-1.2:1.0: hub_ext_port_status failed (err = -71)
kernel: [  541.139763] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.144017] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.148262] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.152513] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.152519] usb 2-1.2-port2: Cannot enable. Maybe the USB cable is bad?
kernel: [  541.156752] usb 2-1.2-port2: cannot disable (err = -71)
kernel: [  541.161031] usb 2-1.2-port2: cannot reset (err = -71)
kernel: [  541.164659] usb 2-1.2: USB disconnect, device number 25
kernel: [  541.164670] usb 2-1.2.2: USB disconnect, device number 26
kernel: [  541.165358] usb 2-1.2-port2: cannot reset (err = -71)
weston[464]: [11:16:53.936] event7  - Dell Dell QuietKey Keyboard: device removed
weston[464]: [11:16:53.976] event6  - Logitech USB Optical Mouse: device removed
kernel: [  541.271277] usb 2-1.2.4: USB disconnect, device number 27
--> End test.

Output with the fix:

--> Attach a mouse into host port and then disconnect it.
kernel: [  136.809387] usb 2-1.2: new low-speed USB device number 16 using ci_hdrc
kernel: [  137.072938] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:046D:C05F.0006/input/input7
kernel: [  137.073202] hid-generic 0003:046D:C05F.0006: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2/input0
weston[477]: [07:15:39.286] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[477]: [07:15:39.287] event6  - Logitech USB Optical Mouse: device is a pointer
weston[477]: [07:15:39.288] libinput: configuring device "Logitech USB Optical Mouse".
weston[477]: [07:15:39.289] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  140.514049] usb 2-1.2: USB disconnect, device number 16
weston[477]: [07:15:42.432] event6  - Logitech USB Optical Mouse: device removed
--> Attach a keyboard into host port and then disconnect it.
kernel: [  166.259388] usb 2-1.2: new low-speed USB device number 17 using ci_hdrc
kernel: [  166.523217] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:413C:2106.0007/input/input8
kernel: [  166.589920] hid-generic 0003:413C:2106.0007: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2/input0
systemd-logind[385]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[477]: [07:16:08.700] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[477]: [07:16:08.703] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[477]: [07:16:08.705] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[477]: [07:16:08.705] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  168.930046] usb 2-1.2: USB disconnect, device number 17
weston[477]: [07:16:10.936] event6  - Dell Dell QuietKey Keyboard: device removed
--> Attach a KVM switch into host port and then disconnect it.
kernel: [  191.089474] usb 2-1.2: new high-speed USB device number 18 using ci_hdrc
kernel: [  191.348073] hub 2-1.2:1.0: USB hub found
kernel: [  191.348559] hub 2-1.2:1.0: 4 ports detected
kernel: [  195.298049] usb 2-1.2: USB disconnect, device number 18
--> Attach a KVM switch into host port, attach a mouse into the KVM and then disconnect it.
kernel: [  213.619428] usb 2-1.2: new high-speed USB device number 19 using ci_hdrc
kernel: [  213.872669] hub 2-1.2:1.0: USB hub found
kernel: [  213.873228] hub 2-1.2:1.0: 4 ports detected
kernel: [  218.909389] usb 2-1.2.2: new low-speed USB device number 20 using ci_hdrc
kernel: [  219.072991] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0008/input/input9
kernel: [  219.073223] hid-generic 0003:046D:C05F.0008: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[477]: [07:17:01.358] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[477]: [07:17:01.359] event6  - Logitech USB Optical Mouse: device is a pointer
weston[477]: [07:17:01.360] libinput: configuring device "Logitech USB Optical Mouse".
weston[477]: [07:17:01.360] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  222.202177] usb 2-1.2.2: USB disconnect, device number 20
weston[477]: [07:17:04.122] event6  - Logitech USB Optical Mouse: device removed
--> Re-attach the mouse into the KVM and then disconnect the KVM switch.
kernel: [  237.349402] usb 2-1.2.2: new low-speed USB device number 21 using ci_hdrc
kernel: [  237.513044] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0009/input/input10
kernel: [  237.513351] hid-generic 0003:046D:C05F.0009: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[477]: [07:17:19.742] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[477]: [07:17:19.743] event6  - Logitech USB Optical Mouse: device is a pointer
weston[477]: [07:17:19.743] libinput: configuring device "Logitech USB Optical Mouse".
weston[477]: [07:17:19.743] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  242.146050] usb 2-1.2: USB disconnect, device number 19
kernel: [  242.146061] usb 2-1.2.2: USB disconnect, device number 21
weston[477]: [07:17:24.065] event6  - Logitech USB Optical Mouse: device removed
--> Attach a KVM switch into host port, attach a keyboard into the KVM and then disconnect it.
kernel: [  266.859512] usb 2-1.2: new high-speed USB device number 22 using ci_hdrc
kernel: [  267.122710] hub 2-1.2:1.0: USB hub found
kernel: [  267.123223] hub 2-1.2:1.0: 4 ports detected
kernel: [  274.739406] usb 2-1.2.2: new low-speed USB device number 23 using ci_hdrc
kernel: [  274.903212] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000A/input/input11
kernel: [  274.970199] hid-generic 0003:413C:2106.000A: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[385]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[477]: [07:17:57.067] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[477]: [07:17:57.069] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[477]: [07:17:57.070] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[477]: [07:17:57.071] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  277.501423] usb 2-1.2.2: USB disconnect, device number 23
weston[477]: [07:17:59.508] event6  - Dell Dell QuietKey Keyboard: device removed
--> Re-attach the keyboard into the KVM and then disconnect the KVM switch.
kernel: [  293.669407] usb 2-1.2.2: new low-speed USB device number 24 using ci_hdrc
kernel: [  293.833561] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000B/input/input12
kernel: [  293.900016] hid-generic 0003:413C:2106.000B: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[385]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[477]: [07:18:16.014] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[477]: [07:18:16.014] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[477]: [07:18:16.016] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[477]: [07:18:16.016] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  297.442150] usb 2-1.2: USB disconnect, device number 22
kernel: [  297.442161] usb 2-1.2.2: USB disconnect, device number 24
weston[477]: [07:18:19.458] event6  - Dell Dell QuietKey Keyboard: device removed
--> Attach a KVM switch into host port, attach a mouse and a keyboard into the KVM and then disconnect the KVM switch.
kernel: [  322.669394] usb 2-1.2: new high-speed USB device number 25 using ci_hdrc
kernel: [  322.922648] hub 2-1.2:1.0: USB hub found
kernel: [  322.923216] hub 2-1.2:1.0: 4 ports detected
kernel: [  326.179389] usb 2-1.2.2: new low-speed USB device number 26 using ci_hdrc
kernel: [  326.344885] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.000C/input/input13
kernel: [  326.346365] hid-generic 0003:046D:C05F.000C: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[477]: [07:18:48.588] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[477]: [07:18:48.590] event6  - Logitech USB Optical Mouse: device is a pointer
weston[477]: [07:18:48.591] libinput: configuring device "Logitech USB Optical Mouse".
weston[477]: [07:18:48.591] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  332.839450] usb 2-1.2.4: new low-speed USB device number 27 using ci_hdrc
kernel: [  333.004250] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.4/2-1.2.4:1.0/0003:413C:2106.000D/input/input14
kernel: [  333.070549] hid-generic 0003:413C:2106.000D: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.4/input0
systemd-logind[385]: Watching system buttons on /dev/input/event7 (Dell Dell QuietKey Keyboard)
weston[477]: [07:18:55.192] event7  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[477]: [07:18:55.194] event7  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[477]: [07:18:55.197] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[477]: [07:18:55.198] associating input device event7 with output HDMI-A-1 (none by udev)
kernel: [  337.378196] usb 2-1.2: USB disconnect, device number 25
kernel: [  337.378208] usb 2-1.2.2: USB disconnect, device number 26
weston[477]: [07:18:59.300] event6  - Logitech USB Optical Mouse: device removed
kernel: [  337.410452] usb 2-1.2.4: USB disconnect, device number 27
weston[477]: [07:18:59.418] event7  - Dell Dell QuietKey Keyboard: device removed
--> End test.
---
 drivers/usb/host/ehci-q.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index 3276304..285622d 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -27,6 +27,10 @@
 
 /*-------------------------------------------------------------------------*/
 
+/* PID Codes that are used here, from EHCI specification, Table 3-16. */
+#define PID_CODE_IN    1
+#define PID_CODE_SETUP 2
+
 /* fill a qtd, returning how much of the buffer we were able to queue up */
 
 static int
@@ -190,7 +194,7 @@ static int qtd_copy_status (
 	int	status = -EINPROGRESS;
 
 	/* count IN/OUT bytes, not SETUP (even short packets) */
-	if (likely (QTD_PID (token) != 2))
+	if (likely (QTD_PID (token) != PID_CODE_SETUP))
 		urb->actual_length += length - QTD_LENGTH (token);
 
 	/* don't modify error codes */
@@ -206,6 +210,11 @@ static int qtd_copy_status (
 		if (token & QTD_STS_BABBLE) {
 			/* FIXME "must" disable babbling device's port too */
 			status = -EOVERFLOW;
+		/* When MMF is active and PID Code is IN, queue is halted.
+		 * EHCI Specification, Table 4-13.
+		 */
+		} else if((token & QTD_STS_MMF) && (QTD_PID(token) == PID_CODE_IN)) {
+			status = -EPROTO;
 		/* CERR nonzero + halt --> stall */
 		} else if (QTD_CERR(token)) {
 			status = -EPIPE;
-- 
2.7.4

