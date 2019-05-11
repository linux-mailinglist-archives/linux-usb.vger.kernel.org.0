Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC5C1A77C
	for <lists+linux-usb@lfdr.de>; Sat, 11 May 2019 12:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbfEKKL7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 May 2019 06:11:59 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:33155 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfEKKL7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 May 2019 06:11:59 -0400
Date:   Sat, 11 May 2019 10:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1557569514;
        bh=kAF4OhwgdH6IXKS4WeyUSib6EMVyoqvOoRwfjFP6nwE=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=AgJij8N2vWStX1KhQwD+dPgDn0kGHFszVtPFkzHlZB8pKBl1mVEeKluZDvN8Xv89x
         MNm5c8Ro99jEp8AtzGVtATYAI7lZIl/L6xsK543adBNGavl81Bsyc/dQgL4ynpbHlL
         0+ur1kYRf0VhZb9bCM6n5iRfxju5pufhjLhdEGtc=
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   howaboutsynergy@protonmail.com
Reply-To: howaboutsynergy@protonmail.com
Subject: Eaton 5E UPS (aka MGE UPS) auto-disconnecting after `usb_submit_urb(ctrl) failed: -1` and `timeout initializing reports`
Message-ID: <43W7RqIKYXiPgdTYUdZnO_ZvCI7FCgsahPEdc5p4haN6EOynzDbGKswDeRGGPfNajHNVT_eOIWZMzOvvf5lvs4BjfeMwi9IM9wLnJlcZpDE=@protonmail.com>
Feedback-ID: cNV1IIhYZ3vPN2m1zihrGlihbXC6JOgZ5ekTcEurWYhfLPyLhpq0qxICavacolSJ7w0W_XBloqfdO_txKTblOQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: multipart/mixed;
        boundary="b1_8d0f43ad4d19dfce8d8a6fb9fb525c1b"
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.

--b1_8d0f43ad4d19dfce8d8a6fb9fb525c1b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Without the attached patch, upowerd (via upower.service) will cause repeate=
d disconnect&reconnect of the USB device for Eaton 5E UPS (known in kernel =
headers as MGE UPS)
and just spam things like this every 10 seconds (I thought it was 20, oh we=
ll):

[ 1156.492171] hid-generic 0003:0463:FFFF.003F: usb_submit_urb(ctrl) failed=
: -1
[ 1156.492215] hid-generic 0003:0463:FFFF.003F: timeout initializing report=
s
[ 1161.918674] usb 1-14: USB disconnect, device number 63
[ 1162.659694] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 started
[ 1162.711817] gpg-agent[1068]: handler 0x752b0f137700 for fd 10 terminated
[ 1162.806042] usb 1-14: new low-speed USB device number 64 using xhci_hcd
[ 1163.569330] usb 1-14: New USB device found, idVendor=3D0463, idProduct=
=3Dffff, bcdDevice=3D 0.01
[ 1163.569339] usb 1-14: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[ 1163.569344] usb 1-14: Product: 5E
[ 1163.569347] usb 1-14: Manufacturer: EATON
[ 1165.529902] hid-generic 0003:0463:FFFF.0040: hiddev97,hidraw4: USB HID v=
1.10 Device [EATON 5E] on usb-0000:00:14.0-14/input0
[ 1165.540017] mtp-probe[5586]: checking bus 1, device 64: "/sys/devices/pc=
i0000:00/0000:00:14.0/usb1/1-14"
[ 1165.540180] mtp-probe[5586]: bus: 1, device: 64 was not an MTP device
[ 1166.081247] mtp-probe[5608]: checking bus 1, device 64: "/sys/devices/pc=
i0000:00/0000:00:14.0/usb1/1-14"
[ 1166.081500] mtp-probe[5608]: bus: 1, device: 64 was not an MTP device
[ 1172.042315] usb 1-14: USB disconnect, device number 64

originally reported here: https://bugzilla.kernel.org/show_bug.cgi?id=3D203=
569

Here's more info via `sudo lsusb -vvvv`:
Bus 001 Device 005: ID 0463:ffff MGE UPS Systems UPS
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x0463 MGE UPS Systems
  idProduct          0xffff UPS
  bcdDevice            0.01
  iManufacturer           1 (error)
  iProduct                2 (error)
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0022
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower               20mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.10
          bCountryCode           33 US
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     549
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0008  1x 8 bytes
        bInterval              20

^ that's with the patch, no idea why those two now show `error` instead of =
`Eaton` and `5E`:
iManufacturer           1 (error)
iProduct                2 (error)
...maybe it's the patch or the fact that the patch now allows upowerd or xf=
ce4-power-manager (?) to communicate or something with the UPS and confused=
 it? no idea, just guessing.

Without the patch xfce4-power-manager-settings segfaults as seen here: http=
s://bugzilla.xfce.org/show_bug.cgi?id=3D15387#c5

Note: vger.kernel.org is http-only so I wasn't able to read/load it(can do =
https-only) thus I don't know if sending to this email works.

PS: if any devs want me to test any patches(even if unrelated to this issue=
), please let me know for I'll be happy to.

--b1_8d0f43ad4d19dfce8d8a6fb9fb525c1b
Content-Type: text/x-patch; name="eaton5e_usb_ups.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=eaton5e_usb_ups.patch

d2lsbCBwcmV2ZW50IGF1dG8tZGlzY29ubmVjdGlvbiBkbWVzZyBzcGFtIGZvciBFYXRvbiA1RSBV
UFMgY29ubmVjdGlvbiB2aWEgVVNCIGNhYmxlCnRoYW5rcyB0byBSZXlhZCBBdHRpeWF0IGZvciBo
dHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTczMzIxI2MxMSBhbmQg
I2MxMgoKWyAxMTU2LjQ5MjE3MV0gaGlkLWdlbmVyaWMgMDAwMzowNDYzOkZGRkYuMDAzRjogdXNi
X3N1Ym1pdF91cmIoY3RybCkgZmFpbGVkOiAtMQpbIDExNTYuNDkyMjE1XSBoaWQtZ2VuZXJpYyAw
MDAzOjA0NjM6RkZGRi4wMDNGOiB0aW1lb3V0IGluaXRpYWxpemluZyByZXBvcnRzClsgMTE2MS45
MTg2NzRdIHVzYiAxLTE0OiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciA2MwpbIDExNjIu
NjU5Njk0XSBncGctYWdlbnRbMTA2OF06IGhhbmRsZXIgMHg3NTJiMGYxMzc3MDAgZm9yIGZkIDEw
IHN0YXJ0ZWQKWyAxMTYyLjcxMTgxN10gZ3BnLWFnZW50WzEwNjhdOiBoYW5kbGVyIDB4NzUyYjBm
MTM3NzAwIGZvciBmZCAxMCB0ZXJtaW5hdGVkClsgMTE2Mi44MDYwNDJdIHVzYiAxLTE0OiBuZXcg
bG93LXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDY0IHVzaW5nIHhoY2lfaGNkClsgMTE2My41Njkz
MzBdIHVzYiAxLTE0OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MDQ2MywgaWRQcm9k
dWN0PWZmZmYsIGJjZERldmljZT0gMC4wMQpbIDExNjMuNTY5MzM5XSB1c2IgMS0xNDogTmV3IFVT
QiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTAKWyAxMTYz
LjU2OTM0NF0gdXNiIDEtMTQ6IFByb2R1Y3Q6IDVFClsgMTE2My41NjkzNDddIHVzYiAxLTE0OiBN
YW51ZmFjdHVyZXI6IEVBVE9OClsgMTE2NS41Mjk5MDJdIGhpZC1nZW5lcmljIDAwMDM6MDQ2MzpG
RkZGLjAwNDA6IGhpZGRldjk3LGhpZHJhdzQ6IFVTQiBISUQgdjEuMTAgRGV2aWNlIFtFQVRPTiA1
RV0gb24gdXNiLTAwMDA6MDA6MTQuMC0xNC9pbnB1dDAKWyAxMTY1LjU0MDAxN10gbXRwLXByb2Jl
WzU1ODZdOiBjaGVja2luZyBidXMgMSwgZGV2aWNlIDY0OiAiL3N5cy9kZXZpY2VzL3BjaTAwMDA6
MDAvMDAwMDowMDoxNC4wL3VzYjEvMS0xNCIKWyAxMTY1LjU0MDE4MF0gbXRwLXByb2JlWzU1ODZd
OiBidXM6IDEsIGRldmljZTogNjQgd2FzIG5vdCBhbiBNVFAgZGV2aWNlClsgMTE2Ni4wODEyNDdd
IG10cC1wcm9iZVs1NjA4XTogY2hlY2tpbmcgYnVzIDEsIGRldmljZSA2NDogIi9zeXMvZGV2aWNl
cy9wY2kwMDAwOjAwLzAwMDA6MDA6MTQuMC91c2IxLzEtMTQiClsgMTE2Ni4wODE1MDBdIG10cC1w
cm9iZVs1NjA4XTogYnVzOiAxLCBkZXZpY2U6IDY0IHdhcyBub3QgYW4gTVRQIGRldmljZQpbIDEx
NzIuMDQyMzE1XSB1c2IgMS0xNDogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgNjQKWyAx
MTcyLjA0Mjk0OF0gaGlkLWdlbmVyaWMgMDAwMzowNDYzOkZGRkYuMDA0MDogdXNiX3N1Ym1pdF91
cmIoY3RybCkgZmFpbGVkOiAtMTkKWyAxMTcyLjkzMTAzN10gdXNiIDEtMTQ6IG5ldyBsb3ctc3Bl
ZWQgVVNCIGRldmljZSBudW1iZXIgNjUgdXNpbmcgeGhjaV9oY2QKWyAxMTczLjY5Mjg5NV0gdXNi
IDEtMTQ6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wNDYzLCBpZFByb2R1Y3Q9ZmZm
ZiwgYmNkRGV2aWNlPSAwLjAxClsgMTE3My42OTI5MDNdIHVzYiAxLTE0OiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MApbIDExNzMuNjkyOTA3
XSB1c2IgMS0xNDogUHJvZHVjdDogNUUKWyAxMTczLjY5MjkxMl0gdXNiIDEtMTQ6IE1hbnVmYWN0
dXJlcjogRUFUT04KWyAxMTc1LjY1MzU2OV0gaGlkLWdlbmVyaWMgMDAwMzowNDYzOkZGRkYuMDA0
MTogaGlkZGV2OTcsaGlkcmF3NDogVVNCIEhJRCB2MS4xMCBEZXZpY2UgW0VBVE9OIDVFXSBvbiB1
c2ItMDAwMDowMDoxNC4wLTE0L2lucHV0MApbIDExNzUuNjYzOTczXSBtdHAtcHJvYmVbNTY3MV06
IGNoZWNraW5nIGJ1cyAxLCBkZXZpY2UgNjU6ICIvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAw
OjAwOjE0LjAvdXNiMS8xLTE0IgpbIDExNzUuNjY0NzAwXSBtdHAtcHJvYmVbNTY3MV06IGJ1czog
MSwgZGV2aWNlOiA2NSB3YXMgbm90IGFuIE1UUCBkZXZpY2UKWyAxMTc2LjE5MjIxNF0gbXRwLXBy
b2JlWzU2OTNdOiBjaGVja2luZyBidXMgMSwgZGV2aWNlIDY1OiAiL3N5cy9kZXZpY2VzL3BjaTAw
MDA6MDAvMDAwMDowMDoxNC4wL3VzYjEvMS0xNCIKWyAxMTc2LjE5MjQxNV0gbXRwLXByb2JlWzU2
OTNdOiBidXM6IDEsIGRldmljZTogNjUgd2FzIG5vdCBhbiBNVFAgZGV2aWNlClsgMTE4Mi4xNTYy
MThdIHVzYiAxLTE0OiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciA2NQpbIDExODIuMTU2
MzAxXSBoaWQtZ2VuZXJpYyAwMDAzOjA0NjM6RkZGRi4wMDQxOiB1c2Jfc3VibWl0X3VyYihjdHJs
KSBmYWlsZWQ6IC0xOQpbIDExODMuMDQ0MDM3XSB1c2IgMS0xNDogbmV3IGxvdy1zcGVlZCBVU0Ig
ZGV2aWNlIG51bWJlciA2NiB1c2luZyB4aGNpX2hjZApbIDExODMuODA4MDYyXSB1c2IgMS0xNDog
TmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTA0NjMsIGlkUHJvZHVjdD1mZmZmLCBiY2RE
ZXZpY2U9IDAuMDEKWyAxMTgzLjgwODA3MF0gdXNiIDEtMTQ6IE5ldyBVU0IgZGV2aWNlIHN0cmlu
Z3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgMTE4My44MDgwNzVdIHVzYiAx
LTE0OiBQcm9kdWN0OiA1RQpbIDExODMuODA4MDc4XSB1c2IgMS0xNDogTWFudWZhY3R1cmVyOiBF
QVRPTgpbIDExODUuNzY3Mjg5XSBoaWQtZ2VuZXJpYyAwMDAzOjA0NjM6RkZGRi4wMDQyOiBoaWRk
ZXY5NyxoaWRyYXc0OiBVU0IgSElEIHYxLjEwIERldmljZSBbRUFUT04gNUVdIG9uIHVzYi0wMDAw
OjAwOjE0LjAtMTQvaW5wdXQwClsgMTE4NS43NzcyNTRdIG10cC1wcm9iZVs1NzU3XTogY2hlY2tp
bmcgYnVzIDEsIGRldmljZSA2NjogIi9zeXMvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTQu
MC91c2IxLzEtMTQiClsgMTE4NS43NzczNzhdIG10cC1wcm9iZVs1NzU3XTogYnVzOiAxLCBkZXZp
Y2U6IDY2IHdhcyBub3QgYW4gTVRQIGRldmljZQpbIDExODYuMzE4ODI4XSBtdHAtcHJvYmVbNTc3
OF06IGNoZWNraW5nIGJ1cyAxLCBkZXZpY2UgNjY6ICIvc3lzL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjE0LjAvdXNiMS8xLTE0IgpbIDExODYuMzE4OTQ2XSBtdHAtcHJvYmVbNTc3OF06IGJ1
czogMSwgZGV2aWNlOiA2NiB3YXMgbm90IGFuIE1UUCBkZXZpY2UKWyAxMTk2LjQyODEyMV0gaGlk
LWdlbmVyaWMgMDAwMzowNDYzOkZGRkYuMDA0MjogdXNiX3N1Ym1pdF91cmIoY3RybCkgZmFpbGVk
OiAtMQpbIDExOTYuNDI4MTYxXSBoaWQtZ2VuZXJpYyAwMDAzOjA0NjM6RkZGRi4wMDQyOiB0aW1l
b3V0IGluaXRpYWxpemluZyByZXBvcnRzCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLXF1
aXJrcy5jIGIvZHJpdmVycy9oaWQvaGlkLXF1aXJrcy5jCmluZGV4IDc3ZmZiYTQ4Y2M3My4uMWFm
YzM4NTE1NzE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2hpZC9oaWQtcXVpcmtzLmMKKysrIGIvZHJp
dmVycy9oaWQvaGlkLXF1aXJrcy5jCkBAIC0xMTIsNiArMTEyLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBoaWRfZGV2aWNlX2lkIGhpZF9xdWlya3NbXSA9IHsKIAl7IEhJRF9VU0JfREVWSUNFKFVT
Ql9WRU5ET1JfSURfTUlDUk9TT0ZULCBVU0JfREVWSUNFX0lEX01TX1BPV0VSX0NPVkVSKSwgSElE
X1FVSVJLX05PX0lOSVRfUkVQT1JUUyB9LAogCXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRPUl9J
RF9NSUNST1NPRlQsIFVTQl9ERVZJQ0VfSURfTVNfU1VSRkFDRV9QUk9fMiksIEhJRF9RVUlSS19O
T19JTklUX1JFUE9SVFMgfSwKIAl7IEhJRF9VU0JfREVWSUNFKFVTQl9WRU5ET1JfSURfTUlDUk9T
T0ZULCBVU0JfREVWSUNFX0lEX01TX1RPVUNIX0NPVkVSXzIpLCBISURfUVVJUktfTk9fSU5JVF9S
RVBPUlRTIH0sCisJeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lEX01HRSwgVVNCX0RFVklD
RV9JRF9NR0VfVVBTKSwgSElEX1FVSVJLX05PX0lOSVRfUkVQT1JUUyB9LCAvL2FkZGVkIGJ5IGpl
CiAJeyBISURfVVNCX0RFVklDRShVU0JfVkVORE9SX0lEX01JQ1JPU09GVCwgVVNCX0RFVklDRV9J
RF9NU19UWVBFX0NPVkVSXzIpLCBISURfUVVJUktfTk9fSU5JVF9SRVBPUlRTIH0sCiAJeyBISURf
VVNCX0RFVklDRShVU0JfVkVORE9SX0lEX01PSk8sIFVTQl9ERVZJQ0VfSURfUkVUUk9fQURBUFRF
UiksIEhJRF9RVUlSS19NVUxUSV9JTlBVVCB9LAogCXsgSElEX1VTQl9ERVZJQ0UoVVNCX1ZFTkRP
Ul9JRF9NU0ksIFVTQl9ERVZJQ0VfSURfTVNJX0dUNjgzUl9MRURfUEFORUwpLCBISURfUVVJUktf
Tk9fSU5JVF9SRVBPUlRTIH0sCg==


--b1_8d0f43ad4d19dfce8d8a6fb9fb525c1b--

