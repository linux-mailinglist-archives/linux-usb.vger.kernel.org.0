Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B5C38DC6B
	for <lists+linux-usb@lfdr.de>; Sun, 23 May 2021 20:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhEWSb4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 May 2021 14:31:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbhEWSbz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 May 2021 14:31:55 -0400
X-Greylist: delayed 551 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 23 May 2021 11:30:28 PDT
Received: from epost.ufisa.no (epost.ufisa.no [IPv6:2001:700:1:2::152:65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F66C061574
        for <linux-usb@vger.kernel.org>; Sun, 23 May 2021 11:30:28 -0700 (PDT)
Received: from [158.38.12.21] (unknown [158.38.12.21])
        by epost.ufisa.no (Postfix) with ESMTPSA id 337E2D20333
        for <linux-usb@vger.kernel.org>; Sun, 23 May 2021 20:21:13 +0200 (CEST)
To:     linux-usb@vger.kernel.org
From:   Olav Kvittem <olav@kvittem.no>
Subject: arduino deepsleep takes down usb system
Message-ID: <4c3f36a1-8884-1b07-ef7e-03b3a6ffe942@kvittem.no>
Date:   Sun, 23 May 2021 20:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------EB6592DD4F17A49ACD1248FB"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------EB6592DD4F17A49ACD1248FB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am running usb serial access to an arduino that goes into deepsleep,

so the device of course=C2=A0 appears dead and is disabled by xhci.

The device wakes up=C2=A0 after a while, but does not get connected.

The usb serial mouse also stops working when the arduino powers down.


Removing and setting in the devices does not help and neither oes :

=C2=A0=C2=A0=C2=A0 systemctl restart systemd-udevd.service

A reboot of course helps.


Let me know if this is a configuration problem allowing a device to
poweroff and come back

and if you need more debugging info.

Regards

=C2=A0 Olav


This 5.4.0-72-generic on ubuntu 20.04.

[fr. mai 14 07:36:51 2021] cdc_acm 1-2:1.0: failed to set dtr/rts
[fr. mai 14 07:36:52 2021] cdc_acm 1-2:1.0: failed to set dtr/rts
[fr. mai 14 07:36:52 2021] cdc_acm 1-2:1.0: failed to set dtr/rts
[fr. mai 14 07:41:13 2021] usb usb1-port2: disabled by hub (EMI?),
re-enabling...
[fr. mai 14 07:41:13 2021] usb 1-2: USB disconnect, device number 2
[fr. mai 14 07:41:13 2021] cdc_acm 1-2:1.0: failed to set dtr/rts
[fr. mai 14 07:41:14 2021] usb 1-2: new low-speed USB device number 4
using xhci_hcd
[fr. mai 14 07:41:24 2021] xhci_hcd 0000:05:00.3: xHCI host not
responding to stop endpoint command.
[fr. mai 14 07:41:24 2021] xhci_hcd 0000:05:00.3: xHCI host controller
not responding, assume dead
[fr. mai 14 07:41:24 2021] xhci_hcd 0000:05:00.3: HC died; cleaning up
[fr. mai 14 07:41:24 2021] usb usb1-port2: couldn't allocate usb_device
[fr. mai 14 07:41:24 2021] usb 1-3: USB disconnect, device number 127
[fr. mai 14 07:41:24 2021] usb 1-4: USB disconnect, device number 3
[fr. mai 14 07:47:43 2021] ata2: SATA link up 6.0 Gbps (SStatus 133
SControl 300)
[fr. mai 14 07:47:43 2021] ata2.00: configured for UDMA/133
[fr. mai 14 14:58:37 2021] ata2: SATA link up 6.0 Gbps (SStatus 133
SControl 300)
[fr. mai 14 14:58:37 2021] ata2.00: configured for UDMA/133
[fr. mai 14 15:12:48 2021] usb 3-2: new high-speed USB device number 17
using xhci_hcd
[fr. mai 14 15:12:48 2021] usb 3-2: New USB device found, idVendor=3D0bda=
,
idProduct=3D0177, bcdDevice=3D77.11
[fr. mai 14 15:12:48 2021] usb 3-2: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D3
[fr. mai 14 15:12:48 2021] usb 3-2: Product: USB2.0-CRW
[fr. mai 14 15:12:48 2021] usb 3-2: Manufacturer: Generic
[fr. mai 14 15:12:48 2021] usb 3-2: SerialNumber: 20121112761000000

lsusb is attached produces some error messages :

ghia:/home/oak# lsusb -v > /tmp/lsusb.txt
can't get debug descriptor: Resource temporarily unavailable
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Couldn't open device, some information will be missing
Couldn't open device, some information will be missing



--------------EB6592DD4F17A49ACD1248FB
Content-Type: text/plain; charset=UTF-8;
 name="lsusb.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lsusb.txt"

CkJ1cyAwMDQgRGV2aWNlIDAwMTogSUQgMWQ2YjowMDAzIExpbnV4IEZvdW5kYXRpb24gMy4w
IHJvb3QgaHViCkRldmljZSBEZXNjcmlwdG9yOgogIGJMZW5ndGggICAgICAgICAgICAgICAg
MTgKICBiRGVzY3JpcHRvclR5cGUgICAgICAgICAxCiAgYmNkVVNCICAgICAgICAgICAgICAg
My4xMAogIGJEZXZpY2VDbGFzcyAgICAgICAgICAgIDkgSHViCiAgYkRldmljZVN1YkNsYXNz
ICAgICAgICAgMCAKICBiRGV2aWNlUHJvdG9jb2wgICAgICAgICAzIAogIGJNYXhQYWNrZXRT
aXplMCAgICAgICAgIDkKICBpZFZlbmRvciAgICAgICAgICAgMHgxZDZiIExpbnV4IEZvdW5k
YXRpb24KICBpZFByb2R1Y3QgICAgICAgICAgMHgwMDAzIDMuMCByb290IGh1YgogIGJjZERl
dmljZSAgICAgICAgICAgIDUuMDQKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAzIExpbnV4
IDUuNC4wLTcyLWdlbmVyaWMgeGhjaS1oY2QKICBpUHJvZHVjdCAgICAgICAgICAgICAgICAy
IHhIQ0kgSG9zdCBDb250cm9sbGVyCiAgaVNlcmlhbCAgICAgICAgICAgICAgICAgMSAwMDAw
OjA1OjAwLjQKICBiTnVtQ29uZmlndXJhdGlvbnMgICAgICAxCiAgQ29uZmlndXJhdGlvbiBE
ZXNjcmlwdG9yOgogICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgYkRlc2NyaXB0
b3JUeXBlICAgICAgICAgMgogICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDAxZgogICAgYk51
bUludGVyZmFjZXMgICAgICAgICAgMQogICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAgICAgMQog
ICAgaUNvbmZpZ3VyYXRpb24gICAgICAgICAgMCAKICAgIGJtQXR0cmlidXRlcyAgICAgICAg
IDB4ZTAKICAgICAgU2VsZiBQb3dlcmVkCiAgICAgIFJlbW90ZSBXYWtldXAKICAgIE1heFBv
d2VyICAgICAgICAgICAgICAgIDBtQQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAg
IGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgNAogICAgICBiSW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVT
ZXR0aW5nICAgICAgIDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBi
SW50ZXJmYWNlQ2xhc3MgICAgICAgICA5IEh1YgogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3Mg
ICAgICAwIAogICAgICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIEZ1bGwgc3BlZWQgKG9y
IHJvb3QpIGh1YgogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICBFbmRw
b2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAg
ICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVz
cyAgICAgMHg4MSAgRVAgMSBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMK
ICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAg
IFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAg
ICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMDQgIDF4
IDQgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgIDEyCiAgICAgICAgYk1h
eEJ1cnN0ICAgICAgICAgICAgICAgMApIdWIgRGVzY3JpcHRvcjoKICBiTGVuZ3RoICAgICAg
ICAgICAgICAxMgogIGJEZXNjcmlwdG9yVHlwZSAgICAgIDQyCiAgbk5iclBvcnRzICAgICAg
ICAgICAgIDEKICB3SHViQ2hhcmFjdGVyaXN0aWMgMHgwMDBhCiAgICBObyBwb3dlciBzd2l0
Y2hpbmcgKHVzYiAxLjApCiAgICBQZXItcG9ydCBvdmVyY3VycmVudCBwcm90ZWN0aW9uCiAg
YlB3ck9uMlB3ckdvb2QgICAgICAgMTAgKiAyIG1pbGxpIHNlY29uZHMKICBiSHViQ29udHJD
dXJyZW50ICAgICAgMCBtaWxsaSBBbXBlcmUKICBiSHViRGVjTGF0ICAgICAgICAgIDAuMCBt
aWNybyBzZWNvbmRzCiAgd0h1YkRlbGF5ICAgICAgICAgICAgIDAgbmFubyBzZWNvbmRzCiAg
RGV2aWNlUmVtb3ZhYmxlICAgIDB4MDAKIEh1YiBQb3J0IFN0YXR1czoKICAgUG9ydCAxOiAw
MDAwLjAyYTAgbG93c3BlZWQgTDEKQmluYXJ5IE9iamVjdCBTdG9yZSBEZXNjcmlwdG9yOgog
IGJMZW5ndGggICAgICAgICAgICAgICAgIDUKICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDE1
CiAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDAyMwogIGJOdW1EZXZpY2VDYXBzICAgICAgICAg
IDIKICBTdXBlclNwZWVkIFVTQiBEZXZpY2UgQ2FwYWJpbGl0eToKICAgIGJMZW5ndGggICAg
ICAgICAgICAgICAgMTAKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgMTYKICAgIGJEZXZD
YXBhYmlsaXR5VHlwZSAgICAgIDMKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4MDIKICAg
ICAgTGF0ZW5jeSBUb2xlcmFuY2UgTWVzc2FnZXMgKExUTSkgU3VwcG9ydGVkCiAgICB3U3Bl
ZWRzU3VwcG9ydGVkICAgMHgwMDA4CiAgICAgIERldmljZSBjYW4gb3BlcmF0ZSBhdCBTdXBl
clNwZWVkICg1R2JwcykKICAgIGJGdW5jdGlvbmFsaXR5U3VwcG9ydCAgIDMKICAgICAgTG93
ZXN0IGZ1bGx5LWZ1bmN0aW9uYWwgZGV2aWNlIHNwZWVkIGlzIFN1cGVyU3BlZWQgKDVHYnBz
KQogICAgYlUxRGV2RXhpdExhdCAgICAgICAgICAgMCBtaWNybyBzZWNvbmRzCiAgICBiVTJE
ZXZFeGl0TGF0ICAgICAgICAgICAwIG1pY3JvIHNlY29uZHMKICBTdXBlclNwZWVkUGx1cyBV
U0IgRGV2aWNlIENhcGFiaWxpdHk6CiAgICBiTGVuZ3RoICAgICAgICAgICAgICAgIDIwCiAg
ICBiRGVzY3JpcHRvclR5cGUgICAgICAgIDE2CiAgICBiRGV2Q2FwYWJpbGl0eVR5cGUgICAg
IDEwCiAgICBibUF0dHJpYnV0ZXMgICAgICAgICAweDAwMDAwMDAxCiAgICAgIFN1Ymxpbmsg
U3BlZWQgQXR0cmlidXRlIGNvdW50IDEKICAgICAgU3VibGluayBTcGVlZCBJRCBjb3VudCAw
CiAgICB3RnVuY3Rpb25hbGl0eVN1cHBvcnQgICAweDAwMDEKICAgIGJtU3VibGlua1NwZWVk
QXR0clswXSAgIDB4MDAwNTAwMzQKICAgICAgU3BlZWQgQXR0cmlidXRlIElEOiA0IDVHYi9z
IFN5bW1ldHJpYyBSWCBTdXBlclNwZWVkCiAgICBibVN1YmxpbmtTcGVlZEF0dHJbMV0gICAw
eDAwMDUwMGI0CiAgICAgIFNwZWVkIEF0dHJpYnV0ZSBJRDogNCA1R2IvcyBTeW1tZXRyaWMg
VFggU3VwZXJTcGVlZApEZXZpY2UgU3RhdHVzOiAgICAgMHgwMDAxCiAgU2VsZiBQb3dlcmVk
CgpCdXMgMDAzIERldmljZSAwMDI6IElEIDgwODc6MGFhNyBJbnRlbCBDb3JwLiAKRGV2aWNl
IERlc2NyaXB0b3I6CiAgYkxlbmd0aCAgICAgICAgICAgICAgICAxOAogIGJEZXNjcmlwdG9y
VHlwZSAgICAgICAgIDEKICBiY2RVU0IgICAgICAgICAgICAgICAyLjAwCiAgYkRldmljZUNs
YXNzICAgICAgICAgIDIyNCBXaXJlbGVzcwogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDEg
UmFkaW8gRnJlcXVlbmN5CiAgYkRldmljZVByb3RvY29sICAgICAgICAgMSBCbHVldG9vdGgK
ICBiTWF4UGFja2V0U2l6ZTAgICAgICAgIDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4ODA4
NyBJbnRlbCBDb3JwLgogIGlkUHJvZHVjdCAgICAgICAgICAweDBhYTcgCiAgYmNkRGV2aWNl
ICAgICAgICAgICAgMC4wMQogIGlNYW51ZmFjdHVyZXIgICAgICAgICAgIDAgCiAgaVByb2R1
Y3QgICAgICAgICAgICAgICAgMCAKICBpU2VyaWFsICAgICAgICAgICAgICAgICAwIAogIGJO
dW1Db25maWd1cmF0aW9ucyAgICAgIDEKICBDb25maWd1cmF0aW9uIERlc2NyaXB0b3I6CiAg
ICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICBiRGVzY3JpcHRvclR5cGUgICAgICAg
ICAyCiAgICB3VG90YWxMZW5ndGggICAgICAgMHgwMGIxCiAgICBiTnVtSW50ZXJmYWNlcyAg
ICAgICAgICAyCiAgICBiQ29uZmlndXJhdGlvblZhbHVlICAgICAxCiAgICBpQ29uZmlndXJh
dGlvbiAgICAgICAgICAwIAogICAgYm1BdHRyaWJ1dGVzICAgICAgICAgMHhlMAogICAgICBT
ZWxmIFBvd2VyZWQKICAgICAgUmVtb3RlIFdha2V1cAogICAgTWF4UG93ZXIgICAgICAgICAg
ICAgIDEwMG1BCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0aCAgICAg
ICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAgICAgIGJJ
bnRlcmZhY2VOdW1iZXIgICAgICAgIDAKICAgICAgYkFsdGVybmF0ZVNldHRpbmcgICAgICAg
MAogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAzCiAgICAgIGJJbnRlcmZhY2VDbGFz
cyAgICAgICAyMjQgV2lyZWxlc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMSBS
YWRpbyBGcmVxdWVuY3kKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMSBCbHVldG9v
dGgKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgRW5kcG9pbnQgRGVz
Y3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4
ODEgIEVQIDEgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzCiAgICAgICAg
ICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBU
eXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAg
ICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDQwICAxeCA2NCBieXRl
cwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAgRW5kcG9pbnQgRGVz
Y3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRl
c2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4
MDIgIEVQIDIgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMgogICAgICAg
ICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIEJ1bGsKICAgICAgICAgIFN5bmNoIFR5cGUg
ICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAg
RGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwNDAgIDF4IDY0IGJ5dGVzCiAg
ICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQogICAgICBFbmRwb2ludCBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MiAg
RVAgMiBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDIKICAgICAgICAgIFRy
YW5zZmVyIFR5cGUgICAgICAgICAgICBCdWxrCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAg
ICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEK
ICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDQwICAxeCA2NCBieXRlcwogICAgICAg
IGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgog
ICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAg
ICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMQogICAgICBiQWx0ZXJu
YXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDIKICAg
ICAgYkludGVyZmFjZUNsYXNzICAgICAgIDIyNCBXaXJlbGVzcwogICAgICBiSW50ZXJmYWNl
U3ViQ2xhc3MgICAgICAxIFJhZGlvIEZyZXF1ZW5jeQogICAgICBiSW50ZXJmYWNlUHJvdG9j
b2wgICAgICAxIEJsdWV0b290aAogICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAog
ICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBv
aW50QWRkcmVzcyAgICAgMHgwMyAgRVAgMyBPVVQKICAgICAgICBibUF0dHJpYnV0ZXMgICAg
ICAgICAgICAxCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25v
dXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBV
c2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAg
ICAweDAwMDAgIDF4IDAgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAx
CiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAg
ICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5k
cG9pbnRBZGRyZXNzICAgICAweDgzICBFUCAzIElOCiAgICAgICAgYm1BdHRyaWJ1dGVzICAg
ICAgICAgICAgMQogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9u
b3VzCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAg
VXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAg
ICAgMHgwMDAwICAxeCAwIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAg
MQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50ZXJmYWNl
TnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDEKICAgICAg
Yk51bUVuZHBvaW50cyAgICAgICAgICAgMgogICAgICBiSW50ZXJmYWNlQ2xhc3MgICAgICAg
MjI0IFdpcmVsZXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDEgUmFkaW8gRnJl
cXVlbmN5CiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgQmx1ZXRvb3RoCiAgICAg
IGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEVuZHBvaW50IERlc2NyaXB0b3I6
CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNjcmlwdG9y
VHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAzICBFUCAz
IE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDEKICAgICAgICAgIFRyYW5z
ZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAg
ICAgICAgICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBE
YXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDAwOSAgMXggOSBieXRlcwogICAg
ICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRv
cjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0
b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODMgIEVQ
IDMgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAxCiAgICAgICAgICBUcmFu
c2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUg
ICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAg
RGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMDkgIDF4IDkgYnl0ZXMKICAg
ICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRv
cjoKICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5
cGUgICAgICAgICA0CiAgICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFs
dGVybmF0ZVNldHRpbmcgICAgICAgMgogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAy
CiAgICAgIGJJbnRlcmZhY2VDbGFzcyAgICAgICAyMjQgV2lyZWxlc3MKICAgICAgYkludGVy
ZmFjZVN1YkNsYXNzICAgICAgMSBSYWRpbyBGcmVxdWVuY3kKICAgICAgYkludGVyZmFjZVBy
b3RvY29sICAgICAgMSBCbHVldG9vdGgKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAg
MCAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAg
ICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJF
bmRwb2ludEFkZHJlc3MgICAgIDB4MDMgIEVQIDMgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVz
ICAgICAgICAgICAgMQogICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2No
cm9ub3VzCiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAg
ICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6
ZSAgICAgMHgwMDExICAxeCAxNyBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAg
ICAgIDEKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAg
ICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAg
IGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODMgIEVQIDMgSU4KICAgICAgICBibUF0dHJpYnV0
ZXMgICAgICAgICAgICAxCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNv
Y2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAg
ICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRT
aXplICAgICAweDAwMTEgIDF4IDE3IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAg
ICAgICAgMQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAgICAg
ICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBiSW50
ZXJmYWNlTnVtYmVyICAgICAgICAxCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAgIDMK
ICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMgogICAgICBiSW50ZXJmYWNlQ2xhc3Mg
ICAgICAgMjI0IFdpcmVsZXNzCiAgICAgIGJJbnRlcmZhY2VTdWJDbGFzcyAgICAgIDEgUmFk
aW8gRnJlcXVlbmN5CiAgICAgIGJJbnRlcmZhY2VQcm90b2NvbCAgICAgIDEgQmx1ZXRvb3Ro
CiAgICAgIGlJbnRlcmZhY2UgICAgICAgICAgICAgIDAgCiAgICAgIEVuZHBvaW50IERlc2Ny
aXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJEZXNj
cmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAweDAz
ICBFUCAzIE9VVAogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDEKICAgICAgICAg
IFRyYW5zZmVyIFR5cGUgICAgICAgICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2gg
VHlwZSAgICAgICAgICAgICAgIE5vbmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAg
ICAgICBEYXRhCiAgICAgICAgd01heFBhY2tldFNpemUgICAgIDB4MDAxOSAgMXggMjUgYnl0
ZXMKICAgICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgICAxCiAgICAgIEVuZHBvaW50IERl
c2NyaXB0b3I6CiAgICAgICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgNwogICAgICAgIGJE
ZXNjcmlwdG9yVHlwZSAgICAgICAgIDUKICAgICAgICBiRW5kcG9pbnRBZGRyZXNzICAgICAw
eDgzICBFUCAzIElOCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMQogICAgICAg
ICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAgICAgICBTeW5j
aCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAg
ICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDE5ICAxeCAyNSBi
eXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgIEludGVyZmFjZSBE
ZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJEZXNj
cmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAgMQog
ICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICA0CiAgICAgIGJOdW1FbmRwb2ludHMgICAg
ICAgICAgIDIKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgIDIyNCBXaXJlbGVzcwogICAg
ICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAxIFJhZGlvIEZyZXF1ZW5jeQogICAgICBiSW50
ZXJmYWNlUHJvdG9jb2wgICAgICAxIEJsdWV0b290aAogICAgICBpSW50ZXJmYWNlICAgICAg
ICAgICAgICAwIAogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5ndGgg
ICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1CiAg
ICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHgwMyAgRVAgMyBPVVQKICAgICAgICBibUF0
dHJpYnV0ZXMgICAgICAgICAgICAxCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAg
ICAgSXNvY2hyb25vdXMKICAgICAgICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25l
CiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQ
YWNrZXRTaXplICAgICAweDAwMjEgIDF4IDMzIGJ5dGVzCiAgICAgICAgYkludGVydmFsICAg
ICAgICAgICAgICAgMQogICAgICBFbmRwb2ludCBEZXNjcmlwdG9yOgogICAgICAgIGJMZW5n
dGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA1
CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MyAgRVAgMyBJTgogICAgICAgIGJt
QXR0cmlidXRlcyAgICAgICAgICAgIDEKICAgICAgICAgIFRyYW5zZmVyIFR5cGUgICAgICAg
ICAgICBJc29jaHJvbm91cwogICAgICAgICAgU3luY2ggVHlwZSAgICAgICAgICAgICAgIE5v
bmUKICAgICAgICAgIFVzYWdlIFR5cGUgICAgICAgICAgICAgICBEYXRhCiAgICAgICAgd01h
eFBhY2tldFNpemUgICAgIDB4MDAyMSAgMXggMzMgYnl0ZXMKICAgICAgICBiSW50ZXJ2YWwg
ICAgICAgICAgICAgICAxCiAgICBJbnRlcmZhY2UgRGVzY3JpcHRvcjoKICAgICAgYkxlbmd0
aCAgICAgICAgICAgICAgICAgOQogICAgICBiRGVzY3JpcHRvclR5cGUgICAgICAgICA0CiAg
ICAgIGJJbnRlcmZhY2VOdW1iZXIgICAgICAgIDEKICAgICAgYkFsdGVybmF0ZVNldHRpbmcg
ICAgICAgNQogICAgICBiTnVtRW5kcG9pbnRzICAgICAgICAgICAyCiAgICAgIGJJbnRlcmZh
Y2VDbGFzcyAgICAgICAyMjQgV2lyZWxlc3MKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAg
ICAgMSBSYWRpbyBGcmVxdWVuY3kKICAgICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMSBC
bHVldG9vdGgKICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgRW5kcG9p
bnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAg
ICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3Mg
ICAgIDB4MDMgIEVQIDMgT1VUCiAgICAgICAgYm1BdHRyaWJ1dGVzICAgICAgICAgICAgMQog
ICAgICAgICAgVHJhbnNmZXIgVHlwZSAgICAgICAgICAgIElzb2Nocm9ub3VzCiAgICAgICAg
ICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAg
ICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDMxICAx
eCA0OSBieXRlcwogICAgICAgIGJJbnRlcnZhbCAgICAgICAgICAgICAgIDEKICAgICAgRW5k
cG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAg
ICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJl
c3MgICAgIDB4ODMgIEVQIDMgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAx
CiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAgSXNvY2hyb25vdXMKICAgICAg
ICAgIFN5bmNoIFR5cGUgICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBl
ICAgICAgICAgICAgICAgRGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMzEg
IDF4IDQ5IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAgICAgICAgMQpEZXZpY2Ug
U3RhdHVzOiAgICAgMHgwMDAxCiAgU2VsZiBQb3dlcmVkCgpCdXMgMDAzIERldmljZSAwMDE6
IElEIDFkNmI6MDAwMiBMaW51eCBGb3VuZGF0aW9uIDIuMCByb290IGh1YgpEZXZpY2UgRGVz
Y3JpcHRvcjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAgYkRlc2NyaXB0b3JUeXBl
ICAgICAgICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDIuMDAKICBiRGV2aWNlQ2xhc3Mg
ICAgICAgICAgICA5IEh1YgogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmlj
ZVByb3RvY29sICAgICAgICAgMSBTaW5nbGUgVFQKICBiTWF4UGFja2V0U2l6ZTAgICAgICAg
IDY0CiAgaWRWZW5kb3IgICAgICAgICAgIDB4MWQ2YiBMaW51eCBGb3VuZGF0aW9uCiAgaWRQ
cm9kdWN0ICAgICAgICAgIDB4MDAwMiAyLjAgcm9vdCBodWIKICBiY2REZXZpY2UgICAgICAg
ICAgICA1LjA0CiAgaU1hbnVmYWN0dXJlciAgICAgICAgICAgMyBMaW51eCA1LjQuMC03Mi1n
ZW5lcmljIHhoY2ktaGNkCiAgaVByb2R1Y3QgICAgICAgICAgICAgICAgMiB4SENJIEhvc3Qg
Q29udHJvbGxlcgogIGlTZXJpYWwgICAgICAgICAgICAgICAgIDEgMDAwMDowNTowMC40CiAg
Yk51bUNvbmZpZ3VyYXRpb25zICAgICAgMQogIENvbmZpZ3VyYXRpb24gRGVzY3JpcHRvcjoK
ICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDkKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAg
ICAgIDIKICAgIHdUb3RhbExlbmd0aCAgICAgICAweDAwMTkKICAgIGJOdW1JbnRlcmZhY2Vz
ICAgICAgICAgIDEKICAgIGJDb25maWd1cmF0aW9uVmFsdWUgICAgIDEKICAgIGlDb25maWd1
cmF0aW9uICAgICAgICAgIDAgCiAgICBibUF0dHJpYnV0ZXMgICAgICAgICAweGUwCiAgICAg
IFNlbGYgUG93ZXJlZAogICAgICBSZW1vdGUgV2FrZXVwCiAgICBNYXhQb3dlciAgICAgICAg
ICAgICAgICAwbUEKICAgIEludGVyZmFjZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA5CiAgICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAg
YkludGVyZmFjZU51bWJlciAgICAgICAgMAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAg
ICAwCiAgICAgIGJOdW1FbmRwb2ludHMgICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNs
YXNzICAgICAgICAgOSBIdWIKICAgICAgYkludGVyZmFjZVN1YkNsYXNzICAgICAgMCAKICAg
ICAgYkludGVyZmFjZVByb3RvY29sICAgICAgMCBGdWxsIHNwZWVkIChvciByb290KSBodWIK
ICAgICAgaUludGVyZmFjZSAgICAgICAgICAgICAgMCAKICAgICAgRW5kcG9pbnQgRGVzY3Jp
cHRvcjoKICAgICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2Ny
aXB0b3JUeXBlICAgICAgICAgNQogICAgICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEg
IEVQIDEgSU4KICAgICAgICBibUF0dHJpYnV0ZXMgICAgICAgICAgICAzCiAgICAgICAgICBU
cmFuc2ZlciBUeXBlICAgICAgICAgICAgSW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBUeXBl
ICAgICAgICAgICAgICAgTm9uZQogICAgICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAg
IERhdGEKICAgICAgICB3TWF4UGFja2V0U2l6ZSAgICAgMHgwMDA0ICAxeCA0IGJ5dGVzCiAg
ICAgICAgYkludGVydmFsICAgICAgICAgICAgICAxMgpIdWIgRGVzY3JpcHRvcjoKICBiTGVu
Z3RoICAgICAgICAgICAgICAgOQogIGJEZXNjcmlwdG9yVHlwZSAgICAgIDQxCiAgbk5iclBv
cnRzICAgICAgICAgICAgIDIKICB3SHViQ2hhcmFjdGVyaXN0aWMgMHgwMDBhCiAgICBObyBw
b3dlciBzd2l0Y2hpbmcgKHVzYiAxLjApCiAgICBQZXItcG9ydCBvdmVyY3VycmVudCBwcm90
ZWN0aW9uCiAgICBUVCB0aGluayB0aW1lIDggRlMgYml0cwogIGJQd3JPbjJQd3JHb29kICAg
ICAgIDEwICogMiBtaWxsaSBzZWNvbmRzCiAgYkh1YkNvbnRyQ3VycmVudCAgICAgIDAgbWls
bGkgQW1wZXJlCiAgRGV2aWNlUmVtb3ZhYmxlICAgIDB4MDIKICBQb3J0UHdyQ3RybE1hc2sg
ICAgMHhmZgogSHViIFBvcnQgU3RhdHVzOgogICBQb3J0IDE6IDAwMDAuMDEwMyBwb3dlciBl
bmFibGUgY29ubmVjdAogICBQb3J0IDI6IDAwMDAuMDEwMCBwb3dlcgpEZXZpY2UgU3RhdHVz
OiAgICAgMHgwMDAxCiAgU2VsZiBQb3dlcmVkCgpCdXMgMDAyIERldmljZSAwMDE6IElEIDFk
NmI6MDAwMyBMaW51eCBGb3VuZGF0aW9uIDMuMCByb290IGh1YgpEZXZpY2UgRGVzY3JpcHRv
cjoKICBiTGVuZ3RoICAgICAgICAgICAgICAgIDE4CiAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgMQogIGJjZFVTQiAgICAgICAgICAgICAgIDMuMTAKICBiRGV2aWNlQ2xhc3MgICAgICAg
ICAgICA5IEh1YgogIGJEZXZpY2VTdWJDbGFzcyAgICAgICAgIDAgCiAgYkRldmljZVByb3Rv
Y29sICAgICAgICAgMyAKICBiTWF4UGFja2V0U2l6ZTAgICAgICAgICA5CiAgaWRWZW5kb3Ig
ICAgICAgICAgIDB4MWQ2YiBMaW51eCBGb3VuZGF0aW9uCiAgaWRQcm9kdWN0ICAgICAgICAg
IDB4MDAwMyAzLjAgcm9vdCBodWIKICBiY2REZXZpY2UgICAgICAgICAgICA1LjA0CiAgaU1h
bnVmYWN0dXJlciAgICAgICAgICAgMyAKICBpUHJvZHVjdCAgICAgICAgICAgICAgICAyIAog
IGlTZXJpYWwgICAgICAgICAgICAgICAgIDEgCiAgYk51bUNvbmZpZ3VyYXRpb25zICAgICAg
MQogIENvbmZpZ3VyYXRpb24gRGVzY3JpcHRvcjoKICAgIGJMZW5ndGggICAgICAgICAgICAg
ICAgIDkKICAgIGJEZXNjcmlwdG9yVHlwZSAgICAgICAgIDIKICAgIHdUb3RhbExlbmd0aCAg
ICAgICAweDAwMWYKICAgIGJOdW1JbnRlcmZhY2VzICAgICAgICAgIDEKICAgIGJDb25maWd1
cmF0aW9uVmFsdWUgICAgIDEKICAgIGlDb25maWd1cmF0aW9uICAgICAgICAgIDAgCiAgICBi
bUF0dHJpYnV0ZXMgICAgICAgICAweGUwCiAgICAgIFNlbGYgUG93ZXJlZAogICAgICBSZW1v
dGUgV2FrZXVwCiAgICBNYXhQb3dlciAgICAgICAgICAgICAgICAwbUEKICAgIEludGVyZmFj
ZSBEZXNjcmlwdG9yOgogICAgICBiTGVuZ3RoICAgICAgICAgICAgICAgICA5CiAgICAgIGJE
ZXNjcmlwdG9yVHlwZSAgICAgICAgIDQKICAgICAgYkludGVyZmFjZU51bWJlciAgICAgICAg
MAogICAgICBiQWx0ZXJuYXRlU2V0dGluZyAgICAgICAwCiAgICAgIGJOdW1FbmRwb2ludHMg
ICAgICAgICAgIDEKICAgICAgYkludGVyZmFjZUNsYXNzICAgICAgICAgOSBIdWIKICAgICAg
YkludGVyZmFjZVN1YkNsYXNzICAgICAgMCAKICAgICAgYkludGVyZmFjZVByb3RvY29sICAg
ICAgMCBGdWxsIHNwZWVkIChvciByb290KSBodWIKICAgICAgaUludGVyZmFjZSAgICAgICAg
ICAgICAgMCAKICAgICAgRW5kcG9pbnQgRGVzY3JpcHRvcjoKICAgICAgICBiTGVuZ3RoICAg
ICAgICAgICAgICAgICA3CiAgICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNQogICAg
ICAgIGJFbmRwb2ludEFkZHJlc3MgICAgIDB4ODEgIEVQIDEgSU4KICAgICAgICBibUF0dHJp
YnV0ZXMgICAgICAgICAgICAzCiAgICAgICAgICBUcmFuc2ZlciBUeXBlICAgICAgICAgICAg
SW50ZXJydXB0CiAgICAgICAgICBTeW5jaCBUeXBlICAgICAgICAgICAgICAgTm9uZQogICAg
ICAgICAgVXNhZ2UgVHlwZSAgICAgICAgICAgICAgIERhdGEKICAgICAgICB3TWF4UGFja2V0
U2l6ZSAgICAgMHgwMDA0ICAxeCA0IGJ5dGVzCiAgICAgICAgYkludGVydmFsICAgICAgICAg
ICAgICAxMgogICAgICAgIGJNYXhCdXJzdCAgICAgICAgICAgICAgIDAKCkJ1cyAwMDEgRGV2
aWNlIDAwMTogSUQgMWQ2YjowMDAyIExpbnV4IEZvdW5kYXRpb24gMi4wIHJvb3QgaHViCkRl
dmljZSBEZXNjcmlwdG9yOgogIGJMZW5ndGggICAgICAgICAgICAgICAgMTgKICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICAxCiAgYmNkVVNCICAgICAgICAgICAgICAgMi4wMAogIGJEZXZp
Y2VDbGFzcyAgICAgICAgICAgIDkgSHViCiAgYkRldmljZVN1YkNsYXNzICAgICAgICAgMCAK
ICBiRGV2aWNlUHJvdG9jb2wgICAgICAgICAxIFNpbmdsZSBUVAogIGJNYXhQYWNrZXRTaXpl
MCAgICAgICAgNjQKICBpZFZlbmRvciAgICAgICAgICAgMHgxZDZiIExpbnV4IEZvdW5kYXRp
b24KICBpZFByb2R1Y3QgICAgICAgICAgMHgwMDAyIDIuMCByb290IGh1YgogIGJjZERldmlj
ZSAgICAgICAgICAgIDUuMDQKICBpTWFudWZhY3R1cmVyICAgICAgICAgICAzIAogIGlQcm9k
dWN0ICAgICAgICAgICAgICAgIDIgCiAgaVNlcmlhbCAgICAgICAgICAgICAgICAgMSAKICBi
TnVtQ29uZmlndXJhdGlvbnMgICAgICAxCiAgQ29uZmlndXJhdGlvbiBEZXNjcmlwdG9yOgog
ICAgYkxlbmd0aCAgICAgICAgICAgICAgICAgOQogICAgYkRlc2NyaXB0b3JUeXBlICAgICAg
ICAgMgogICAgd1RvdGFsTGVuZ3RoICAgICAgIDB4MDAxOQogICAgYk51bUludGVyZmFjZXMg
ICAgICAgICAgMQogICAgYkNvbmZpZ3VyYXRpb25WYWx1ZSAgICAgMQogICAgaUNvbmZpZ3Vy
YXRpb24gICAgICAgICAgMCAKICAgIGJtQXR0cmlidXRlcyAgICAgICAgIDB4ZTAKICAgICAg
U2VsZiBQb3dlcmVkCiAgICAgIFJlbW90ZSBXYWtldXAKICAgIE1heFBvd2VyICAgICAgICAg
ICAgICAgIDBtQQogICAgSW50ZXJmYWNlIERlc2NyaXB0b3I6CiAgICAgIGJMZW5ndGggICAg
ICAgICAgICAgICAgIDkKICAgICAgYkRlc2NyaXB0b3JUeXBlICAgICAgICAgNAogICAgICBi
SW50ZXJmYWNlTnVtYmVyICAgICAgICAwCiAgICAgIGJBbHRlcm5hdGVTZXR0aW5nICAgICAg
IDAKICAgICAgYk51bUVuZHBvaW50cyAgICAgICAgICAgMQogICAgICBiSW50ZXJmYWNlQ2xh
c3MgICAgICAgICA5IEh1YgogICAgICBiSW50ZXJmYWNlU3ViQ2xhc3MgICAgICAwIAogICAg
ICBiSW50ZXJmYWNlUHJvdG9jb2wgICAgICAwIEZ1bGwgc3BlZWQgKG9yIHJvb3QpIGh1Ygog
ICAgICBpSW50ZXJmYWNlICAgICAgICAgICAgICAwIAogICAgICBFbmRwb2ludCBEZXNjcmlw
dG9yOgogICAgICAgIGJMZW5ndGggICAgICAgICAgICAgICAgIDcKICAgICAgICBiRGVzY3Jp
cHRvclR5cGUgICAgICAgICA1CiAgICAgICAgYkVuZHBvaW50QWRkcmVzcyAgICAgMHg4MSAg
RVAgMSBJTgogICAgICAgIGJtQXR0cmlidXRlcyAgICAgICAgICAgIDMKICAgICAgICAgIFRy
YW5zZmVyIFR5cGUgICAgICAgICAgICBJbnRlcnJ1cHQKICAgICAgICAgIFN5bmNoIFR5cGUg
ICAgICAgICAgICAgICBOb25lCiAgICAgICAgICBVc2FnZSBUeXBlICAgICAgICAgICAgICAg
RGF0YQogICAgICAgIHdNYXhQYWNrZXRTaXplICAgICAweDAwMDQgIDF4IDQgYnl0ZXMKICAg
ICAgICBiSW50ZXJ2YWwgICAgICAgICAgICAgIDEyCg==
--------------EB6592DD4F17A49ACD1248FB--
