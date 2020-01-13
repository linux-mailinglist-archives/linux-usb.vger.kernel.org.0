Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD8D13916C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 13:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgAMMwB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 07:52:01 -0500
Received: from mail-wm1-f51.google.com ([209.85.128.51]:54430 "EHLO
        mail-wm1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgAMMwB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jan 2020 07:52:01 -0500
Received: by mail-wm1-f51.google.com with SMTP id b19so9499773wmj.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2020 04:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language;
        bh=5yprQXtTviZHsW+H3bcPpF5Ud+M1Uv36OdkvM6s1R7U=;
        b=tTgM4d4f3zDoPKDnujn2O3kPdEhdGpnaD594r6uuDezPiS8P/rXdi2jvA6AYFmWsSE
         sJqEZt3lx1n62bdnNtcFG09f/QXpMqZqh3PKuwWovDaESy3stwLXBDJ8SVVL0t2E/UjT
         cdOiG+ZxtTZpR465tqioQe2d1YEotTtOMUrzxXELcWdIKEpONxrmwD0mXVd0II6Vbh2X
         hw/vvGA0N0PhNadY4tlmDgVe8slfcTyjwyO+QJxbPgoFhASr+VtKKHLLPAEiMSJmc42r
         QesutLcGlLKkLPkquE5DhQpSk4p8OhD5gIW778hl88wvtzX6U7DU+sKQru2Ro3auu8hJ
         /meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language;
        bh=5yprQXtTviZHsW+H3bcPpF5Ud+M1Uv36OdkvM6s1R7U=;
        b=e5X+t12UrW8vZwZ6AfaQLKD7JcL2OByS0DdnQMNseklkAJ27oRZASmx/rsthxcwMhz
         YdnNUqhKCG0Qiqid+/0Vpu5RvgAOgC43cfoIsiIGS4J9hm6ps4PhEyWqy8PWt8PoTy+k
         J+tOccCw2NxJRZb6XqClktHbnsoGkZtFMFfNXDcTeLZ1X9fEKgL1HFp9ECGO+5vr38dq
         Kt1vsao2XHJ7v3az8o6pKcsJRUWvYK07MCUO2fhEpw7m2PY/5/1VNGufsj3FSoJTf4xZ
         05T+eVuoqUpTbIIOkeFAFBbZx86sDpr5n9aBHhe+htdT7S3YFQPPKEF6hBXfr4X6hTpf
         cDsg==
X-Gm-Message-State: APjAAAX3YsqOuhiaNllHl6+Qluhjx5rTulm7wU/d/NjCHAnKDDC9q0lS
        CIBx8DbNsvotHdX2loKKetaXzEF1
X-Google-Smtp-Source: APXvYqytqOCvlctr4BuUZdz5pOeYVU67CObMCQX5JOnB+gaxyTSaw/8/VPhfBFMAMS2P6WKik7AAcQ==
X-Received: by 2002:a1c:8095:: with SMTP id b143mr20623617wmd.7.1578919917277;
        Mon, 13 Jan 2020 04:51:57 -0800 (PST)
Received: from [127.0.0.1] (clanjadewolf.net. [2a01:4f8:172:2b9e::2])
        by smtp.googlemail.com with ESMTPSA id v83sm14444517wmg.16.2020.01.13.04.51.56
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 04:51:56 -0800 (PST)
From:   Mike Murdoch <main.haarp@gmail.com>
Subject: Very frequent disconnects over USB type-C when using power delivery
To:     linux-usb@vger.kernel.org
Message-ID: <f77ca3a9-e026-90cc-0667-1384f2db7fed@gmail.com>
Date:   Mon, 13 Jan 2020 13:51:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------86B2F3473F3CC504E4A20E1D"
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------86B2F3473F3CC504E4A20E1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Good day,

I am running kernel 5.4.7 on a recently acquired Lenovo Thinkpad X1 
Extreme Gen 2. It has two USB-C ports which support USB-PD source and 
sink, DisplayPort and USB. They also support Thunderbolt 3 which I do 
not use. All ports are controlled by an Intel Corporation Cannon Lake 
PCH USB 3.1 xHCI Host Controller (rev 10).

My sole USB-C device is a Dell Ultrasharp U3818DW monitor. When hooked 
up over its USB-C port, it supports USB-PD source, DisplayPort and USB 
hub functionality. It exposes two TI USB devices: 0451:8442 (hub) and 
0451:82ff (a HID device?) along with the devices attached to its hub. 
Sometimes 82ff is replaced by 82ee.

Connecting the monitor to the laptop is problematic. *Reliably*, every 
3±1 minutes, the monitor disconnects and reconnects a few seconds later, 
along with all devices attached to the monitor's USB hub, the monitor's 
DisplayPort, and power-delivery. It doesn't matter if the DisplayPort 
link is idle at the time. The kernel log shows no suspicious entries, 
apart from USB disconnect/new device chatter. Curiously, I occasionally 
see a new device announcement being logged before the disconnect message is.

Now when a dedicated charger is plugged into the system, it appears to 
be preferred over USB-PD (the power LED blinks, indicating an attached 
charger). At this point the disconnects stop. To me, this indicates a 
problem with USB-PD.

Any ideas? I'd be happy to help out in making USB-PD work reliably. I 
can test patches or provide additional logs. Find attached lsusb -v of 
the relevant devices.

Thanks a lot!

Best regards,
- Mike

--------------86B2F3473F3CC504E4A20E1D
Content-Type: text/plain; charset=UTF-8;
 name="usbdev.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="usbdev.txt"

QnVzIDAwMiBEZXZpY2UgMDAxOiBJRCAxZDZiOjAwMDMgTGludXggRm91bmRhdGlvbiAzLjAg
cm9vdCBodWIKRGV2aWNlIERlc2NyaXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAx
OAogIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDEKICBiY2RVU0IgICAgICAgICAgICAgICAz
LjEwCiAgYkRldmljZUNsYXNzICAgICAgICAgICAgOSBIdWIKICBiRGV2aWNlU3ViQ2xhc3Mg
ICAgICAgICAwCiAgYkRldmljZVByb3RvY29sICAgICAgICAgMwogIGJNYXhQYWNrZXRTaXpl
MCAgICAgICAgIDkKICBpZFZlbmRvciAgICAgICAgICAgMHgxZDZiIExpbnV4IEZvdW5kYXRp
b24KICBpZFByb2R1Y3QgICAgICAgICAgMHgwMDAzIDMuMCByb290IGh1YgogIGJjZERldmlj
ZSAgICAgICAgICAgIDUuMDQKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAzIExpbnV4IDUu
NC43LUhIIHhoY2ktaGNkCiAgaVByb2R1Y3QgICAgICAgICAgICAgICAgMiB4SENJIEhvc3Qg
Q29udHJvbGxlcgogIGlTZXJpYWwgICAgICAgICAgICAgICAgIDEgMDAwMDowMDoxNC4wCiAg
Yk51bUNvbmZpZ3VyYXRpb25zICAgICAgMQogIENvbmZpZ3VyYXRpb24gRGVzY3JpcHRvcjoK
ICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgIDIKICAgIHdUb3RhbExlbmd0aCAgICAgICAweDAwMWYKICAgIGJOdW1JbnRlcmZhY2Vz
ICAgICAgICAgIDEKICAgIGJDb25maWd1cmF0aW9uVmFsdWUgICAgIDEKICAgIGlDb25maWd1
cmF0aW9uICAgICAgICAgIDAKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4ZTAKICAgICAg
U2VsZiBQb3dlcmVkCiAgICAgIFJlbW90ZSBXYWtldXAKICAgIE1heFBvd2VyICAgICAgICAg
ICAgICAgIDBtQQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAg
ICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBi
SW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAg
IDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xh
c3MgICAgICAgICA5IEh1YgogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAwCiAgICAg
IGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDAgRnVsbCBzcGVlZCAob3Igcm9vdCkgaHViCiAg
ICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRv
cjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0
b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEgIEVQ
IDEgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzCiAgICAgICAgICBUcmFu
c2ZlciBUeXBlICAgICAgICAgICAgSW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBUeXBlICAg
ICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERh
dGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDA0ICAxeCA0IGJ5dGVzCiAgICAg
ICAgYkludGVydmFsICAgICAgICAgICAgICAxMgogICAgICAgIGJNYXhCdXJzdCAgICAgICAg
ICAgICAgIDAKSHViIERlc2NyaXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgMTIKICBi
RGVzY3JpcHRvclR5cGUgICAgICA0MgogIG5OYnJQb3J0cyAgICAgICAgICAgIDEwCiAgd0h1
YkNoYXJhY3RlcmlzdGljIDB4MDAwYQogICAgTm8gcG93ZXIgc3dpdGNoaW5nICh1c2IgMS4w
KQogICAgUGVyLXBvcnQgb3ZlcmN1cnJlbnQgcHJvdGVjdGlvbgogIGJQd3JPbjJQd3JHb29k
ICAgICAgIDEwICogMiBtaWxsaSBzZWNvbmRzCiAgYkh1YkNvbnRyQ3VycmVudCAgICAgIDAg
bWlsbGkgQW1wZXJlCiAgYkh1YkRlY0xhdCAgICAgICAgICAwLjAgbWljcm8gc2Vjb25kcwog
IHdIdWJEZWxheSAgICAgICAgICAgICAwIG5hbm8gc2Vjb25kcwogIERldmljZVJlbW92YWJs
ZSAgICAweDAwIDB4MDAKIEh1YiBQb3J0IFN0YXR1czoKICAgUG9ydCAxOiAwMDAwLjAyYTAg
bG93c3BlZWQgTDEKICAgUG9ydCAyOiAwMDAwLjAyYTAgbG93c3BlZWQgTDEKICAgUG9ydCAz
OiAwMDAwLjAyYTAgbG93c3BlZWQgTDEKICAgUG9ydCA0OiAwMDAwLjAyYTAgbG93c3BlZWQg
TDEKICAgUG9ydCA1OiAwMDAwLjAyYTAgbG93c3BlZWQgTDEKICAgUG9ydCA2OiAwMDAwLjAy
YTAgbG93c3BlZWQgTDEKICAgUG9ydCA3OiAwMDAwLjAyYTAgbG93c3BlZWQgTDEKICAgUG9y
dCA4OiAwMDAwLjAyYTAgbG93c3BlZWQgTDEKICAgUG9ydCA5OiAwMDAwLjAyYTAgbG93c3Bl
ZWQgTDEKICAgUG9ydCAxMDogMDAwMC4wMmEwIGxvd3NwZWVkIEwxCkJpbmFyeSBPYmplY3Qg
U3RvcmUgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgICA1CiAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAxNQogIHdUb3RhbExlbmd0aCAgICAgICAweDAwNWIKICBiTnVt
RGV2aWNlQ2FwcyAgICAgICAgICAyCiAgU3VwZXJTcGVlZCBVU0IgRGV2aWNlIENhcGFiaWxp
dHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDEwCiAgICBiRGVzY3JpcHRvclR5cGUg
ICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5cGUgICAgICAzCiAgICBibUF0dHJpYnV0
ZXMgICAgICAgICAweDAyCiAgICAgIExhdGVuY3kgVG9sZXJhbmNlIE1lc3NhZ2VzIChMVE0p
IFN1cHBvcnRlZAogICAgd1NwZWVkc1N1cHBvcnRlZCAgIDB4MDAwOAogICAgICBEZXZpY2Ug
Y2FuIG9wZXJhdGUgYXQgU3VwZXJTcGVlZCAoNUdicHMpCiAgICBiRnVuY3Rpb25hbGl0eVN1
cHBvcnQgICAzCiAgICAgIExvd2VzdCBmdWxseS1mdW5jdGlvbmFsIGRldmljZSBzcGVlZCBp
cyBTdXBlclNwZWVkICg1R2JwcykKICAgIGJVMURldkV4aXRMYXQgICAgICAgICAgMTAgbWlj
cm8gc2Vjb25kcwogICAgYlUyRGV2RXhpdExhdCAgICAgICAgIDkxOCBtaWNybyBzZWNvbmRz
CiAgU3VwZXJTcGVlZFBsdXMgVVNCIERldmljZSBDYXBhYmlsaXR5OgogICAgYkxlbmd0aCAg
ICAgICAgICAgICAgICA3NgogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAxNgogICAgYkRl
dkNhcGFiaWxpdHlUeXBlICAgICAxMAogICAgYm1BdHRyaWJ1dGVzICAgICAgICAgMHgwMDAw
MDBlZgogICAgICBTdWJsaW5rIFNwZWVkIEF0dHJpYnV0ZSBjb3VudCAxNQogICAgICBTdWJs
aW5rIFNwZWVkIElEIGNvdW50IDcKICAgIHdGdW5jdGlvbmFsaXR5U3VwcG9ydCAgIDB4MDAw
MQogICAgYm1TdWJsaW5rU3BlZWRBdHRyWzBdICAgMHgwMDA1MDAzNAogICAgICBTcGVlZCBB
dHRyaWJ1dGUgSUQ6IDQgNUdiL3MgU3ltbWV0cmljIFJYIFN1cGVyU3BlZWQKICAgIGJtU3Vi
bGlua1NwZWVkQXR0clsxXSAgIDB4MDAwNTAwYjQKICAgICAgU3BlZWQgQXR0cmlidXRlIElE
OiA0IDVHYi9zIFN5bW1ldHJpYyBUWCBTdXBlclNwZWVkCiAgICBibVN1YmxpbmtTcGVlZEF0
dHJbMl0gICAweDAwMGE0MDM1CiAgICAgIFNwZWVkIEF0dHJpYnV0ZSBJRDogNSAxMEdiL3Mg
U3ltbWV0cmljIFJYIFN1cGVyU3BlZWRQbHVzCiAgICBibVN1YmxpbmtTcGVlZEF0dHJbM10g
ICAweDAwMGE0MGI1CiAgICAgIFNwZWVkIEF0dHJpYnV0ZSBJRDogNSAxMEdiL3MgU3ltbWV0
cmljIFRYIFN1cGVyU3BlZWRQbHVzCiAgICBibVN1YmxpbmtTcGVlZEF0dHJbNF0gICAweDA0
ZTAwMDI2CiAgICAgIFNwZWVkIEF0dHJpYnV0ZSBJRDogNiAxMjQ4TWIvcyBTeW1tZXRyaWMg
UlggU3VwZXJTcGVlZAogICAgYm1TdWJsaW5rU3BlZWRBdHRyWzVdICAgMHgwNGUwMDBhNgog
ICAgICBTcGVlZCBBdHRyaWJ1dGUgSUQ6IDYgMTI0OE1iL3MgU3ltbWV0cmljIFRYIFN1cGVy
U3BlZWQKICAgIGJtU3VibGlua1NwZWVkQXR0cls2XSAgIDB4MDljMDAwMjcKICAgICAgU3Bl
ZWQgQXR0cmlidXRlIElEOiA3IDI0OTZNYi9zIFN5bW1ldHJpYyBSWCBTdXBlclNwZWVkCiAg
ICBibVN1YmxpbmtTcGVlZEF0dHJbN10gICAweDA5YzAwMGE3CiAgICAgIFNwZWVkIEF0dHJp
YnV0ZSBJRDogNyAyNDk2TWIvcyBTeW1tZXRyaWMgVFggU3VwZXJTcGVlZAogICAgYm1TdWJs
aW5rU3BlZWRBdHRyWzhdICAgMHgxMzgwMDAyOAogICAgICBTcGVlZCBBdHRyaWJ1dGUgSUQ6
IDggNDk5Mk1iL3MgU3ltbWV0cmljIFJYIFN1cGVyU3BlZWQKICAgIGJtU3VibGlua1NwZWVk
QXR0cls5XSAgIDB4MTM4MDAwYTgKICAgICAgU3BlZWQgQXR0cmlidXRlIElEOiA4IDQ5OTJN
Yi9zIFN5bW1ldHJpYyBUWCBTdXBlclNwZWVkCiAgICBibVN1YmxpbmtTcGVlZEF0dHJbMTBd
ICAgMHgwNWIxMDAyOQogICAgICBTcGVlZCBBdHRyaWJ1dGUgSUQ6IDkgMTQ1N01iL3MgU3lt
bWV0cmljIFJYIFN1cGVyU3BlZWQKICAgIGJtU3VibGlua1NwZWVkQXR0clsxMV0gICAweDA1
YjEwMGE5CiAgICAgIFNwZWVkIEF0dHJpYnV0ZSBJRDogOSAxNDU3TWIvcyBTeW1tZXRyaWMg
VFggU3VwZXJTcGVlZAogICAgYm1TdWJsaW5rU3BlZWRBdHRyWzEyXSAgIDB4MGI2MzAwMmEK
ICAgICAgU3BlZWQgQXR0cmlidXRlIElEOiAxMCAyOTE1TWIvcyBTeW1tZXRyaWMgUlggU3Vw
ZXJTcGVlZAogICAgYm1TdWJsaW5rU3BlZWRBdHRyWzEzXSAgIDB4MGI2MzAwYWEKICAgICAg
U3BlZWQgQXR0cmlidXRlIElEOiAxMCAyOTE1TWIvcyBTeW1tZXRyaWMgVFggU3VwZXJTcGVl
ZAogICAgYm1TdWJsaW5rU3BlZWRBdHRyWzE0XSAgIDB4MTZjNjAwMmIKICAgICAgU3BlZWQg
QXR0cmlidXRlIElEOiAxMSA1ODMwTWIvcyBTeW1tZXRyaWMgUlggU3VwZXJTcGVlZAogICAg
Ym1TdWJsaW5rU3BlZWRBdHRyWzE1XSAgIDB4MTZjNjAwYWIKICAgICAgU3BlZWQgQXR0cmli
dXRlIElEOiAxMSA1ODMwTWIvcyBTeW1tZXRyaWMgVFggU3VwZXJTcGVlZApjYW4ndCBnZXQg
ZGVidWcgZGVzY3JpcHRvcjogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUKRGV2
aWNlIFN0YXR1czogICAgIDB4MDAwMQogIFNlbGYgUG93ZXJlZAoKQnVzIDAwMSBEZXZpY2Ug
MDk3OiBJRCAwNDUxOjgyZmYgVGV4YXMgSW5zdHJ1bWVudHMsIEluYy4KRGV2aWNlIERlc2Ny
aXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAxOAogIGJEZXNjcmlwdG9yVHlwZSAg
ICAgICAgIDEKICBiY2RVU0IgICAgICAgICAgICAgICAyLjAxCiAgYkRldmljZUNsYXNzICAg
ICAgICAgICAgMAogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDAKICBiRGV2aWNlUHJvdG9j
b2wgICAgICAgICAwCiAgYk1heFBhY2tldFNpemUwICAgICAgICA2NAogIGlkVmVuZG9yICAg
ICAgICAgICAweDA0NTEgVGV4YXMgSW5zdHJ1bWVudHMsIEluYy4KICBpZFByb2R1Y3QgICAg
ICAgICAgMHg4MmZmCiAgYmNkRGV2aWNlICAgICAgICAgICAgMS4wMAogIGlNYW51ZmFjdHVy
ZXIgICAgICAgICAgIDAKICBpUHJvZHVjdCAgICAgICAgICAgICAgICAwCiAgaVNlcmlhbCAg
ICAgICAgICAgICAgICAgMSBGNzBDMDA1MUNDOUQKICBiTnVtQ29uZmlndXJhdGlvbnMgICAg
ICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVuZ3Ro
ICAgICAgIDB4MDAyMgogICAgYk51bUludGVyZmFjZXMgICAgICAgICAgMQogICAgYkNvbmZp
Z3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAgMAogICAg
Ym1BdHRyaWJ1dGVzICAgICAgICAgMHhjMAogICAgICBTZWxmIFBvd2VyZWQKICAgIE1heFBv
d2VyICAgICAgICAgICAgICAgIDBtQQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVT
ZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBi
SW50ZXJmYWNlQ2xhc3MgICAgICAgICAzIEh1bWFuIEludGVyZmFjZSBEZXZpY2UKICAgICAg
YkludGVyZmFjZVN1YkNsYXNzICAgICAgMAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAg
ICAwCiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAKICAgICAgICBISUQgRGV2aWNl
IERlc2NyaXB0b3I6CiAgICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDMzCiAgICAgICAgICBiY2RISUQgICAgICAg
ICAgICAgICAxLjExCiAgICAgICAgICBiQ291bnRyeUNvZGUgICAgICAgICAgICAwIE5vdCBz
dXBwb3J0ZWQKICAgICAgICAgIGJOdW1EZXNjcmlwdG9ycyAgICAgICAgIDEKICAgICAgICAg
IGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMzQgUmVwb3J0CiAgICAgICAgICB3RGVzY3JpcHRv
ckxlbmd0aCAgICAgIDQ5CiAgICAgICAgIFJlcG9ydCBEZXNjcmlwdG9yczoKICAgICAgICAg
ICAqKiBVTkFWQUlMQUJMRSAqKgogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAg
ICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MSAgRVAgMSBJTgogICAg
ICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRyYW5zZmVyIFR5cGUg
ICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAg
ICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAg
IHdNYXhQYWNrZXRTaXplICAgICAweDAwNDAgIDF4IDY0IGJ5dGVzCiAgICAgICAgYkludGVy
dmFsICAgICAgICAgICAgICAgNApCaW5hcnkgT2JqZWN0IFN0b3JlIERlc2NyaXB0b3I6CiAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgNQogIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMTUK
ICB3VG90YWxMZW5ndGggICAgICAgMHgwMDIwCiAgYk51bURldmljZUNhcHMgICAgICAgICAg
MgogIFVTQiAyLjAgRXh0ZW5zaW9uIERldmljZSBDYXBhYmlsaXR5OgogICAgYkxlbmd0aCAg
ICAgICAgICAgICAgICAgNwogICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAxNgogICAgYkRl
dkNhcGFiaWxpdHlUeXBlICAgICAgMgogICAgYm1BdHRyaWJ1dGVzICAgMHgwMDAwMDAwNgog
ICAgICBCRVNMIExpbmsgUG93ZXIgTWFuYWdlbWVudCAoTFBNKSBTdXBwb3J0ZWQKICBDb250
YWluZXIgSUQgRGV2aWNlIENhcGFiaWxpdHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAg
IDIwCiAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5
cGUgICAgICA0CiAgICBiUmVzZXJ2ZWQgICAgICAgICAgICAgICAwCiAgICBDb250YWluZXJJ
RCAgICAgICAgICAgICB7MWE0MTAwMDAtOGEwNC00Yzc0LWQyMTYtMjdjMmI2YzlkMDAwfQpj
YW4ndCBnZXQgZGVidWcgZGVzY3JpcHRvcjogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFp
bGFibGUKRGV2aWNlIFN0YXR1czogICAgIDB4MDAwMQogIFNlbGYgUG93ZXJlZAoKCkJ1cyAw
MDEgRGV2aWNlIDA5NDogSUQgMDQ1MTo4NDQyIFRleGFzIEluc3RydW1lbnRzLCBJbmMuCkRl
dmljZSBEZXNjcmlwdG9yOgogIGJMZW5ndGggICAgICAgICAgICAgICAgMTgKICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICAxCiAgYmNkVVNCICAgICAgICAgICAgICAgMi4xMAogIGJEZXZp
Y2VDbGFzcyAgICAgICAgICAgIDkgSHViCiAgYkRldmljZVN1YkNsYXNzICAgICAgICAgMAog
IGJEZXZpY2VQcm90b2NvbCAgICAgICAgIDIgVFQgcGVyIHBvcnQKICBiTWF4UGFja2V0U2l6
ZTAgICAgICAgIDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MDQ1MSBUZXhhcyBJbnN0cnVt
ZW50cywgSW5jLgogIGlkUHJvZHVjdCAgICAgICAgICAweDg0NDIKICBiY2REZXZpY2UgICAg
ICAgICAgICAxLjAwCiAgaU1hbnVmYWN0dXJlciAgICAgICAgICAgMAogIGlQcm9kdWN0ICAg
ICAgICAgICAgICAgIDAKICBpU2VyaWFsICAgICAgICAgICAgICAgICAxIEY3MEMwMDUxQ0M5
RAogIGJOdW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBDb25maWd1cmF0aW9uIERlc2NyaXB0
b3I6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICBiRGVzY3JpcHRvclR5cGUg
ICAgICAgICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMDI5CiAgICBiTnVtSW50ZXJm
YWNlcyAgICAgICAgICAxCiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAgICAxCiAgICBpQ29u
ZmlndXJhdGlvbiAgICAgICAgICAwCiAgICBibUF0dHJpYnV0ZXMgICAgICAgICAweGUwCiAg
ICAgIFNlbGYgUG93ZXJlZAogICAgICBSZW1vdGUgV2FrZXVwCiAgICBNYXhQb3dlciAgICAg
ICAgICAgICAgICAwbUEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3Ro
ICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAg
ICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAg
ICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVyZmFj
ZUNsYXNzICAgICAgICAgOSBIdWIKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMAog
ICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAxIFNpbmdsZSBUVAogICAgICBpSW50ZXJm
YWNlICAgICAgICAgICAgICAwCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAg
Ykxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDgxICBFUCAxIElOCiAgICAg
ICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMwogICAgICAgICAgVHJhbnNmZXIgVHlwZSAg
ICAgICAgICAgIEludGVycnVwdAogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAg
IE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAg
d01heFBhY2tldFNpemUgICAgIDB4MDAwMSAgMXggMSBieXRlcwogICAgICAgIGJJbnRlcnZh
bCAgICAgICAgICAgICAgMTIKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVu
Z3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQK
ICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGlu
ZyAgICAgICAxCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVy
ZmFjZUNsYXNzICAgICAgICAgOSBIdWIKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAg
MAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAyIFRUIHBlciBwb3J0CiAgICAgIGlJ
bnRlcmZhY2UgICAgICAgICAgICAgIDAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAg
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBl
ICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEgIEVQIDEgSU4K
ICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzCiAgICAgICAgICBUcmFuc2ZlciBU
eXBlICAgICAgICAgICAgSW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAg
ICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAg
ICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDAxICAxeCAxIGJ5dGVzCiAgICAgICAgYklu
dGVydmFsICAgICAgICAgICAgICAxMgpIdWIgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAg
ICAgICAgICAgOQogIGJEZXNjcmlwdG9yVHlwZSAgICAgIDQxCiAgbk5iclBvcnRzICAgICAg
ICAgICAgIDYKICB3SHViQ2hhcmFjdGVyaXN0aWMgMHgwMDBkCiAgICBQZXItcG9ydCBwb3dl
ciBzd2l0Y2hpbmcKICAgIENvbXBvdW5kIGRldmljZQogICAgUGVyLXBvcnQgb3ZlcmN1cnJl
bnQgcHJvdGVjdGlvbgogICAgVFQgdGhpbmsgdGltZSA4IEZTIGJpdHMKICBiUHdyT24yUHdy
R29vZCAgICAgICA1MCAqIDIgbWlsbGkgc2Vjb25kcwogIGJIdWJDb250ckN1cnJlbnQgICAg
ICAwIG1pbGxpIEFtcGVyZQogIERldmljZVJlbW92YWJsZSAgICAweDYwCiAgUG9ydFB3ckN0
cmxNYXNrICAgIDB4ZmYKIEh1YiBQb3J0IFN0YXR1czoKICAgUG9ydCAxOiAwMDAwLjAzMDMg
bG93c3BlZWQgcG93ZXIgZW5hYmxlIGNvbm5lY3QKICAgUG9ydCAyOiAwMDAwLjAxMDMgcG93
ZXIgZW5hYmxlIGNvbm5lY3QKICAgUG9ydCAzOiAwMDAwLjAxMDAgcG93ZXIKICAgUG9ydCA0
OiAwMDAwLjAxMDAgcG93ZXIKICAgUG9ydCA1OiAwMDAwLjA1MDMgaGlnaHNwZWVkIHBvd2Vy
IGVuYWJsZSBjb25uZWN0CiAgIFBvcnQgNjogMDAwMC4wMTAwIHBvd2VyCkJpbmFyeSBPYmpl
Y3QgU3RvcmUgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgICA1CiAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAxNQogIHdUb3RhbExlbmd0aCAgICAgICAweDAwMmEKICBi
TnVtRGV2aWNlQ2FwcyAgICAgICAgICAzCiAgVVNCIDIuMCBFeHRlbnNpb24gRGV2aWNlIENh
cGFiaWxpdHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICBiRGVzY3JpcHRv
clR5cGUgICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5cGUgICAgICAyCiAgICBibUF0
dHJpYnV0ZXMgICAweDAwMDAwMDA2CiAgICAgIEJFU0wgTGluayBQb3dlciBNYW5hZ2VtZW50
IChMUE0pIFN1cHBvcnRlZAogIFN1cGVyU3BlZWQgVVNCIERldmljZSBDYXBhYmlsaXR5Ogog
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAxMAogICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAxNgogICAgYkRldkNhcGFiaWxpdHlUeXBlICAgICAgMwogICAgYm1BdHRyaWJ1dGVzICAg
ICAgICAgMHgwMAogICAgd1NwZWVkc1N1cHBvcnRlZCAgIDB4MDAwZQogICAgICBEZXZpY2Ug
Y2FuIG9wZXJhdGUgYXQgRnVsbCBTcGVlZCAoMTJNYnBzKQogICAgICBEZXZpY2UgY2FuIG9w
ZXJhdGUgYXQgSGlnaCBTcGVlZCAoNDgwTWJwcykKICAgICAgRGV2aWNlIGNhbiBvcGVyYXRl
IGF0IFN1cGVyU3BlZWQgKDVHYnBzKQogICAgYkZ1bmN0aW9uYWxpdHlTdXBwb3J0ICAgMQog
ICAgICBMb3dlc3QgZnVsbHktZnVuY3Rpb25hbCBkZXZpY2Ugc3BlZWQgaXMgRnVsbCBTcGVl
ZCAoMTJNYnBzKQogICAgYlUxRGV2RXhpdExhdCAgICAgICAgICAxMCBtaWNybyBzZWNvbmRz
CiAgICBiVTJEZXZFeGl0TGF0ICAgICAgICAgIDEwIG1pY3JvIHNlY29uZHMKICBDb250YWlu
ZXIgSUQgRGV2aWNlIENhcGFiaWxpdHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDIw
CiAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5cGUg
ICAgICA0CiAgICBiUmVzZXJ2ZWQgICAgICAgICAgICAgICAwCiAgICBDb250YWluZXJJRCAg
ICAgICAgICAgICB7MWE0MTAwMDAtOGEwNC00Yzc0LWQyMTYtMjdjMmI2YzlkMDAwfQpjYW4n
dCBnZXQgZGVidWcgZGVzY3JpcHRvcjogUmVzb3VyY2UgdGVtcG9yYXJpbHkgdW5hdmFpbGFi
bGUKRGV2aWNlIFN0YXR1czogICAgIDB4MDAwMQogIFNlbGYgUG93ZXJlZAo=
--------------86B2F3473F3CC504E4A20E1D--
