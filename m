Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610D010D6A5
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 15:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbfK2OJK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 09:09:10 -0500
Received: from mail-lj1-f173.google.com ([209.85.208.173]:36180 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfK2OJK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 09:09:10 -0500
Received: by mail-lj1-f173.google.com with SMTP id k15so32179263lja.3
        for <linux-usb@vger.kernel.org>; Fri, 29 Nov 2019 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:subject:date:message-id;
        bh=EyUBzG1tni3Z4Fu2C/ZIk6nfssll+i2FBVRB/NfbYGk=;
        b=ZAzjNsrv2vmAi45W34NOIBIkmFGinBOXAn9BegYHEenPJJ8mBtNGYWhJxMWQSZtmfL
         pD0y/74h+UxC0DQ51y7aqCOQr0BLDc6Ww8M2lAY9IDkezD85YDEqdr8/aUu95RZe6oKj
         Irw8nTPbIgqHOB75PBJ9cF+bjE5DzNc/xzFdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EyUBzG1tni3Z4Fu2C/ZIk6nfssll+i2FBVRB/NfbYGk=;
        b=HVIBAxkgLyVLIAQfRMuT+2WVTDgRjwxRlgq3A7hJFiJn9OGRIrBwtirS8ePJI64F0I
         PhRvhmJVKvEtqOfkBLLpSilP4QNBOsPhhMPDuiDIbvft7jzGiR3h36ei58t+5kk4Co85
         GkdcbTGfDwdkZdb25baQm+YXE7CQoZZAQTiauL8FgKUnqbh25TAbrcnQV3yN3DuzOu2U
         73bQLS65iFm3QSPJX7E2XienbTnvRI/rzSKR/ieGYWzpTQmrjuRR3Js/xLbs76ICAmyJ
         8sb4iDymQM1/UMKTPKeeSJWH+MEpIr3iWeo9+DMdkKOKf1cZZ+WdYU24QHSUVhsbnL95
         9nzw==
X-Gm-Message-State: APjAAAVG/CoBCuDpKDsooS88ffKCa2o14KcMWSp17gQt4u/Mp5A6a/7+
        LNRtbsrgjlcW+rr6QFbBRjPzNA==
X-Google-Smtp-Source: APXvYqyeL7E7azwaNWX9TR4Nxx2dsNM/AQo9O7y3HcnEuIbndEhZFBMrXcOgeJwS1wAkgN2wAmz0aA==
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr30805451ljj.229.1575036544938;
        Fri, 29 Nov 2019 06:09:04 -0800 (PST)
Received: from erkkata-VirtualBox.clients.hermia.vincit.fi ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id d22sm2913499lfm.22.2019.11.29.06.09.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 29 Nov 2019 06:09:04 -0800 (PST)
From:   Erkka Talvitie <erkka.talvitie@vincit.fi>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, claus.baumgartner@med.ge.com,
        Erkka Talvitie <erkka.talvitie@vincit.fi>
Subject: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Fri, 29 Nov 2019 16:08:42 +0200
Message-Id: <1046f0c10876628227b7c9f303b0582a20406b14.1575030959.git.erkka.talvitie@vincit.fi>
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

In this situation there will be error bit for MMF active yet the
CERR equals EHCI_TUNE_CERR + halt. Existing implementation
interprets this as a stall [1] (chapter 8.4.5).

Fix for the issue is at first to check for a stall that comes after
an error (the CERR has been decreased).

Then after that, check for other errors.

And at last check for stall without other errors (the CERR equals
EHCI_TUNE_CERR as stall does not decrease the CERR [2] (table 3-16)).

What happens after the fix is that when disconnecting a hub with
attached device(s) the situation is not interpret as a stall.

The specification [2] is not clear about error priorities, but
since there is no explicit error bit for the stall, it is
assumed to be lower priority than other errors.

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
kernel: [  101.229751] usb 2-1.2: new low-speed USB device number 16 using ci_hdrc
kernel: [  101.496424] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:046D:C05F.0006/input/input7
kernel: [  101.497252] hid-generic 0003:046D:C05F.0006: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2/input0
weston[486]: [11:34:50.974] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[486]: [11:34:50.975] event6  - Logitech USB Optical Mouse: device is a pointer
weston[486]: [11:34:50.975] libinput: configuring device "Logitech USB Optical Mouse".
weston[486]: [11:34:50.975] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  104.418306] usb 2-1.2: USB disconnect, device number 16
weston[486]: [11:34:53.604] event6  - Logitech USB Optical Mouse: device removed
--> Attach a keyboard into host port and then disconnect it.
kernel: [  126.829750] usb 2-1.2: new low-speed USB device number 17 using ci_hdrc
kernel: [  127.096213] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2:1.0/0003:413C:2106.0007/input/input8
kernel: [  127.160286] hid-generic 0003:413C:2106.0007: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2/input0
systemd-logind[418]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[486]: [11:35:16.511] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[486]: [11:35:16.511] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[486]: [11:35:16.513] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[486]: [11:35:16.513] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  129.506479] usb 2-1.2: USB disconnect, device number 17
weston[486]: [11:35:18.775] event6  - Dell Dell QuietKey Keyboard: device removed
--> Attach a KVM switch into host port and then disconnect it.
kernel: [  160.369756] usb 2-1.2: new high-speed USB device number 18 using ci_hdrc
kernel: [  160.622949] hub 2-1.2:1.0: USB hub found
kernel: [  160.623495] hub 2-1.2:1.0: 4 ports detected
kernel: [  163.298449] usb 2-1.2: USB disconnect, device number 18
--> Attach a KVM switch into host port, attach a mouse into the KVM and then disconnect it.
kernel: [  184.939760] usb 2-1.2: new high-speed USB device number 19 using ci_hdrc
kernel: [  185.195174] hub 2-1.2:1.0: USB hub found
kernel: [  185.195706] hub 2-1.2:1.0: 4 ports detected
kernel: [  190.249755] usb 2-1.2.2: new low-speed USB device number 20 using ci_hdrc
kernel: [  190.416307] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0008/input/input9
kernel: [  190.417250] hid-generic 0003:046D:C05F.0008: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[486]: [11:36:19.907] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[486]: [11:36:19.907] event6  - Logitech USB Optical Mouse: device is a pointer
weston[486]: [11:36:19.908] libinput: configuring device "Logitech USB Optical Mouse".
weston[486]: [11:36:19.908] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  193.531312] usb 2-1.2.2: USB disconnect, device number 20
weston[486]: [11:36:22.721] event6  - Logitech USB Optical Mouse: device removed
--> Re-attach the mouse into the KVM and then disconnect the KVM switch.
kernel: [  208.169755] usb 2-1.2.2: new low-speed USB device number 21 using ci_hdrc
kernel: [  208.333289] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.0009/input/input10
kernel: [  208.335566] hid-generic 0003:046D:C05F.0009: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[486]: [11:36:37.805] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[486]: [11:36:37.806] event6  - Logitech USB Optical Mouse: device is a pointer
weston[486]: [11:36:37.806] libinput: configuring device "Logitech USB Optical Mouse".
weston[486]: [11:36:37.806] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  211.426306] usb 2-1.2: USB disconnect, device number 19
kernel: [  211.426317] usb 2-1.2.2: USB disconnect, device number 21
weston[486]: [11:36:40.616] event6  - Logitech USB Optical Mouse: device removed
--> Attach a KVM switch into host port, attach a keyboard into the KVM and then disconnect it.
kernel: [  230.249761] usb 2-1.2: new high-speed USB device number 22 using ci_hdrc
kernel: [  230.502823] hub 2-1.2:1.0: USB hub found
kernel: [  230.503332] hub 2-1.2:1.0: 4 ports detected
kernel: [  237.349770] usb 2-1.2.2: new low-speed USB device number 23 using ci_hdrc
kernel: [  237.516824] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000A/input/input11
kernel: [  237.580297] hid-generic 0003:413C:2106.000A: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[418]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[486]: [11:37:06.967] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[486]: [11:37:06.969] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[486]: [11:37:06.971] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[486]: [11:37:06.972] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  240.637437] usb 2-1.2.2: USB disconnect, device number 23
weston[486]: [11:37:09.897] event6  - Dell Dell QuietKey Keyboard: device removed
--> Re-attach the keyboard into the KVM and then disconnect the KVM switch.
kernel: [  257.319980] usb 2-1.2.2: new low-speed USB device number 24 using ci_hdrc
kernel: [  257.483579] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:413C:2106.000B/input/input12
kernel: [  257.560285] hid-generic 0003:413C:2106.000B: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.2/input0
systemd-logind[418]: Watching system buttons on /dev/input/event6 (Dell Dell QuietKey Keyboard)
weston[486]: [11:37:26.926] event6  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[486]: [11:37:26.928] event6  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[486]: [11:37:26.930] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[486]: [11:37:26.931] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  260.323187] usb 2-1.2: USB disconnect, device number 22
kernel: [  260.323199] usb 2-1.2.2: USB disconnect, device number 24
weston[486]: [11:37:29.585] event6  - Dell Dell QuietKey Keyboard: device removed
--> Attach a KVM switch into host port, attach a mouse and a keyboard into the KVM and then disconnect the KVM switch.
kernel: [  282.479747] usb 2-1.2: new high-speed USB device number 25 using ci_hdrc
kernel: [  282.732817] hub 2-1.2:1.0: USB hub found
kernel: [  282.733327] hub 2-1.2:1.0: 4 ports detected
kernel: [  288.299751] usb 2-1.2.2: new low-speed USB device number 26 using ci_hdrc
kernel: [  288.476005] input: Logitech USB Optical Mouse as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.2/2-1.2.2:1.0/0003:046D:C05F.000C/input/input13
kernel: [  288.476222] hid-generic 0003:046D:C05F.000C: input: USB HID v1.11 Mouse [Logitech USB Optical Mouse] on usb-ci_hdrc.1-1.2.2/input0
weston[486]: [11:37:57.956] event6  - Logitech USB Optical Mouse: is tagged by udev as: Mouse
weston[486]: [11:37:57.956] event6  - Logitech USB Optical Mouse: device is a pointer
weston[486]: [11:37:57.957] libinput: configuring device "Logitech USB Optical Mouse".
weston[486]: [11:37:57.957] associating input device event6 with output HDMI-A-1 (none by udev)
kernel: [  291.629751] usb 2-1.2.4: new low-speed USB device number 27 using ci_hdrc
kernel: [  291.793640] input: Dell Dell QuietKey Keyboard as /devices/soc0/soc/2100000.aips-bus/2184200.usb/ci_hdrc.1/usb2/2-1/2-1.2/2-1.2.4/2-1.2.4:1.0/0003:413C:2106.000D/input/input14
kernel: [  291.860657] hid-generic 0003:413C:2106.000D: input: USB HID v1.10 Keyboard [Dell Dell QuietKey Keyboard] on usb-ci_hdrc.1-1.2.4/input0
systemd-logind[418]: Watching system buttons on /dev/input/event7 (Dell Dell QuietKey Keyboard)
weston[486]: [11:38:01.238] event7  - Dell Dell QuietKey Keyboard: is tagged by udev as: Keyboard
weston[486]: [11:38:01.242] event7  - Dell Dell QuietKey Keyboard: device is a keyboard
weston[486]: [11:38:01.243] libinput: configuring device "Dell Dell QuietKey Keyboard".
weston[486]: [11:38:01.243] associating input device event7 with output HDMI-A-1 (none by udev)
kernel: [  295.394440] usb 2-1.2: USB disconnect, device number 25
kernel: [  295.394450] usb 2-1.2.2: USB disconnect, device number 26
weston[486]: [11:38:04.580] event6  - Logitech USB Optical Mouse: device removed
kernel: [  295.431931] usb 2-1.2.4: USB disconnect, device number 27
weston[486]: [11:38:04.725] event7  - Dell Dell QuietKey Keyboard: device removed
--> End test.
---
 drivers/usb/host/ehci-q.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index 3276304..da7fd12 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -206,8 +206,9 @@ static int qtd_copy_status (
 		if (token & QTD_STS_BABBLE) {
 			/* FIXME "must" disable babbling device's port too */
 			status = -EOVERFLOW;
-		/* CERR nonzero + halt --> stall */
-		} else if (QTD_CERR(token)) {
+		/* CERR nonzero and less than EHCI_TUNE_CERR + halt --> stall.
+		   This handles situation where stall comes after an error. */
+		} else if (QTD_CERR(token) && QTD_CERR(token) < EHCI_TUNE_CERR) {
 			status = -EPIPE;
 
 		/* In theory, more than one of the following bits can be set
@@ -228,6 +229,10 @@ static int qtd_copy_status (
 				usb_pipeendpoint(urb->pipe),
 				usb_pipein(urb->pipe) ? "in" : "out");
 			status = -EPROTO;
+		/* CERR equals EHCI_TUNE_CERR, no other errors + halt --> stall.
+		   This handles situation where stall comes without error bits set. */
+		} else if (QTD_CERR(token)) {
+			status = -EPIPE;
 		} else {	/* unknown */
 			status = -EPROTO;
 		}
-- 
2.7.4

