Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A156AE109
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 14:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCGNqq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Mar 2023 08:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjCGNqS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Mar 2023 08:46:18 -0500
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FDA3645D
        for <linux-usb@vger.kernel.org>; Tue,  7 Mar 2023 05:45:56 -0800 (PST)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pZXFo-002OTI-30;
        Tue, 07 Mar 2023 13:21:21 +0000
Date:   Tue, 7 Mar 2023 13:21:20 +0000
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org
Subject: USB regression in kernel 6.2.2
Message-ID: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.1git47 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/JF=n7g+Wu1jRX3H1qtQI4CN"
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--MP_/JF=n7g+Wu1jRX3H1qtQI4CN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Mathias (sorry you're getting this twice).

Re-send after linux-usb list rejection (too big).

Hans de Goede replied to my Fedora kernel bug here:

https://bugzilla.redhat.com/show_bug.cgi?id=2175534

suggesting that I contact you about it and Cc: the linux-usb list.

Starting with kernel-6.2.2-300 on Fedora x86_64 (the first 6.2 kernel on
Fedora 37) I am seeing problems with USB devices on a Renesas
ROM-based USB PCI card which works normally with kernel-6.1.15-200 and
earlier 6.x kernels, essentially the USB 2.0 device tree on this card's
bus is not being enumerated with the result that my /dev/ttyUSB*
devices are no longer present (these are Silicon Labs CP210x UARTS with
TI PCM290x devices behind them).

I have attached the lsusb -t output for the working and broken cases, I
don't know where the problem lies but I suspect it's not udev because
the configuration is unchanged, it seems to be in the kernel usb code.

There are further attachments in the bug referred to above, I don't
know if they help but you can look there if the lsusb output is
insufficient, I can point out that lsmod does show the cp210x module is
loaded which may provide a clue about where things are failing.

Thanks for reading this, I look forward to hearing your suggestions.

-- 

Brian Morrison


--MP_/JF=n7g+Wu1jRX3H1qtQI4CN
Content-Type: application/octet-stream; name=lsusb_t_6.1.15
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=lsusb_t_6.1.15

LzogIEJ1cyAwNC5Qb3J0IDE6IERldiAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2lfaGNk
LzRwLCA1MDAwTQovOiAgQnVzIDAzLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2
ZXI9eGhjaV9oY2QvNHAsIDQ4ME0KICAgIHxfXyBQb3J0IDE6IERldiAyLCBJZiAwLCBDbGFzcz1I
dWIsIERyaXZlcj1odWIvNHAsIDEyTQogICAgICAgIHxfXyBQb3J0IDE6IERldiA0LCBJZiAwLCBD
bGFzcz1WZW5kb3IgU3BlY2lmaWMgQ2xhc3MsIERyaXZlcj1jcDIxMHgsIDEyTQogICAgICAgIHxf
XyBQb3J0IDQ6IERldiA2LCBJZiAwLCBDbGFzcz1BdWRpbywgRHJpdmVyPXNuZC11c2ItYXVkaW8s
IDEyTQogICAgICAgIHxfXyBQb3J0IDQ6IERldiA2LCBJZiAxLCBDbGFzcz1BdWRpbywgRHJpdmVy
PXNuZC11c2ItYXVkaW8sIDEyTQogICAgICAgIHxfXyBQb3J0IDQ6IERldiA2LCBJZiAyLCBDbGFz
cz1BdWRpbywgRHJpdmVyPXNuZC11c2ItYXVkaW8sIDEyTQogICAgICAgIHxfXyBQb3J0IDQ6IERl
diA2LCBJZiAzLCBDbGFzcz1IdW1hbiBJbnRlcmZhY2UgRGV2aWNlLCBEcml2ZXI9dXNiaGlkLCAx
Mk0KICAgIHxfXyBQb3J0IDI6IERldiAzLCBJZiAwLCBDbGFzcz1BdWRpbywgRHJpdmVyPXNuZC11
c2ItYXVkaW8sIDEyTQogICAgfF9fIFBvcnQgMjogRGV2IDMsIElmIDEsIENsYXNzPUF1ZGlvLCBE
cml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICB8X18gUG9ydCAyOiBEZXYgMywgSWYgMiwgQ2xh
c3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVyPXVzYmhpZCwgMTJNCiAgICB8X18gUG9y
dCAzOiBEZXYgNSwgSWYgMCwgQ2xhc3M9VmlkZW8sIERyaXZlcj11dmN2aWRlbywgNDgwTQogICAg
fF9fIFBvcnQgMzogRGV2IDUsIElmIDEsIENsYXNzPVZpZGVvLCBEcml2ZXI9dXZjdmlkZW8sIDQ4
ME0KICAgIHxfXyBQb3J0IDM6IERldiA1LCBJZiAyLCBDbGFzcz1BdWRpbywgRHJpdmVyPXNuZC11
c2ItYXVkaW8sIDQ4ME0KICAgIHxfXyBQb3J0IDM6IERldiA1LCBJZiAzLCBDbGFzcz1BdWRpbywg
RHJpdmVyPXNuZC11c2ItYXVkaW8sIDQ4ME0KICAgIHxfXyBQb3J0IDQ6IERldiA3LCBJZiAwLCBD
bGFzcz1IdWIsIERyaXZlcj1odWIvNHAsIDQ4ME0KICAgICAgICB8X18gUG9ydCAxOiBEZXYgOCwg
SWYgMCwgQ2xhc3M9VmVuZG9yIFNwZWNpZmljIENsYXNzLCBEcml2ZXI9Y3AyMTB4LCAxMk0KICAg
ICAgICB8X18gUG9ydCAyOiBEZXYgOSwgSWYgMCwgQ2xhc3M9VmVuZG9yIFNwZWNpZmljIENsYXNz
LCBEcml2ZXI9Y3AyMTB4LCAxMk0KICAgICAgICB8X18gUG9ydCA0OiBEZXYgMTAsIElmIDAsIENs
YXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICAgICAgfF9fIFBvcnQgNDog
RGV2IDEwLCBJZiAxLCBDbGFzcz1BdWRpbywgRHJpdmVyPXNuZC11c2ItYXVkaW8sIDEyTQogICAg
ICAgIHxfXyBQb3J0IDQ6IERldiAxMCwgSWYgMiwgQ2xhc3M9QXVkaW8sIERyaXZlcj1zbmQtdXNi
LWF1ZGlvLCAxMk0KICAgICAgICB8X18gUG9ydCA0OiBEZXYgMTAsIElmIDMsIENsYXNzPUh1bWFu
IEludGVyZmFjZSBEZXZpY2UsIERyaXZlcj11c2JoaWQsIDEyTQovOiAgQnVzIDAyLlBvcnQgMTog
RGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaV9oY2QvOHAsIDEwMDAwTQovOiAgQnVz
IDAxLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2ZXI9eGhjaV9oY2QvMTZwLCA0
ODBNCiAgICB8X18gUG9ydCA1OiBEZXYgMiwgSWYgMCwgQ2xhc3M9QXVkaW8sIERyaXZlcj1zbmQt
dXNiLWF1ZGlvLCAxMk0KICAgIHxfXyBQb3J0IDU6IERldiAyLCBJZiAxLCBDbGFzcz1BdWRpbywg
RHJpdmVyPXNuZC11c2ItYXVkaW8sIDEyTQogICAgfF9fIFBvcnQgNTogRGV2IDIsIElmIDIsIENs
YXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICB8X18gUG9ydCA1OiBEZXYg
MiwgSWYgMywgQ2xhc3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVyPXVzYmhpZCwgMTJN
CiAgICB8X18gUG9ydCA2OiBEZXYgMywgSWYgMCwgQ2xhc3M9QXVkaW8sIERyaXZlcj1zbmQtdXNi
LWF1ZGlvLCA0ODBNCiAgICB8X18gUG9ydCA2OiBEZXYgMywgSWYgMSwgQ2xhc3M9QXVkaW8sIERy
aXZlcj1zbmQtdXNiLWF1ZGlvLCA0ODBNCiAgICB8X18gUG9ydCA2OiBEZXYgMywgSWYgMiwgQ2xh
c3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVyPXVzYmhpZCwgNDgwTQogICAgfF9fIFBv
cnQgOTogRGV2IDQsIElmIDAsIENsYXNzPUh1bWFuIEludGVyZmFjZSBEZXZpY2UsIERyaXZlcj11
c2JoaWQsIDEuNU0KICAgIHxfXyBQb3J0IDEwOiBEZXYgNSwgSWYgMCwgQ2xhc3M9SHVtYW4gSW50
ZXJmYWNlIERldmljZSwgRHJpdmVyPXVzYmhpZCwgMS41TQogICAgfF9fIFBvcnQgMTA6IERldiA1
LCBJZiAxLCBDbGFzcz1IdW1hbiBJbnRlcmZhY2UgRGV2aWNlLCBEcml2ZXI9dXNiaGlkLCAxLjVN
CiAgICB8X18gUG9ydCAxMjogRGV2IDYsIElmIDAsIENsYXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVz
Yi1hdWRpbywgMTJNCiAgICB8X18gUG9ydCAxMjogRGV2IDYsIElmIDEsIENsYXNzPUF1ZGlvLCBE
cml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICB8X18gUG9ydCAxMjogRGV2IDYsIElmIDIsIENs
YXNzPUh1bWFuIEludGVyZmFjZSBEZXZpY2UsIERyaXZlcj11c2JoaWQsIDEyTQo=

--MP_/JF=n7g+Wu1jRX3H1qtQI4CN
Content-Type: application/octet-stream; name=lsusb_t_6.2.2
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=lsusb_t_6.2.2

LzogIEJ1cyAwNC5Qb3J0IDE6IERldiAxLCBDbGFzcz1yb290X2h1YiwgRHJpdmVyPXhoY2lfaGNk
LzRwLCA1MDAwTQovOiAgQnVzIDAzLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBEcml2
ZXI9eGhjaV9oY2QvOHAsIDEwMDAwTQovOiAgQnVzIDAyLlBvcnQgMTogRGV2IDEsIENsYXNzPXJv
b3RfaHViLCBEcml2ZXI9eGhjaV9oY2QvNHAsIDQ4ME0KICAgIHxfXyBQb3J0IDM6IERldiA1LCBJ
ZiAwLCBDbGFzcz1WaWRlbywgRHJpdmVyPXV2Y3ZpZGVvLCA0ODBNCiAgICB8X18gUG9ydCAzOiBE
ZXYgNSwgSWYgMSwgQ2xhc3M9VmlkZW8sIERyaXZlcj11dmN2aWRlbywgNDgwTQogICAgfF9fIFBv
cnQgMzogRGV2IDUsIElmIDIsIENsYXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgNDgw
TQogICAgfF9fIFBvcnQgMzogRGV2IDUsIElmIDMsIENsYXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVz
Yi1hdWRpbywgNDgwTQovOiAgQnVzIDAxLlBvcnQgMTogRGV2IDEsIENsYXNzPXJvb3RfaHViLCBE
cml2ZXI9eGhjaV9oY2QvMTZwLCA0ODBNCiAgICB8X18gUG9ydCA1OiBEZXYgMiwgSWYgMCwgQ2xh
c3M9QXVkaW8sIERyaXZlcj1zbmQtdXNiLWF1ZGlvLCAxMk0KICAgIHxfXyBQb3J0IDU6IERldiAy
LCBJZiAxLCBDbGFzcz1BdWRpbywgRHJpdmVyPXNuZC11c2ItYXVkaW8sIDEyTQogICAgfF9fIFBv
cnQgNTogRGV2IDIsIElmIDIsIENsYXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgMTJN
CiAgICB8X18gUG9ydCA1OiBEZXYgMiwgSWYgMywgQ2xhc3M9SHVtYW4gSW50ZXJmYWNlIERldmlj
ZSwgRHJpdmVyPXVzYmhpZCwgMTJNCiAgICB8X18gUG9ydCA2OiBEZXYgMywgSWYgMCwgQ2xhc3M9
QXVkaW8sIERyaXZlcj1zbmQtdXNiLWF1ZGlvLCA0ODBNCiAgICB8X18gUG9ydCA2OiBEZXYgMywg
SWYgMSwgQ2xhc3M9QXVkaW8sIERyaXZlcj1zbmQtdXNiLWF1ZGlvLCA0ODBNCiAgICB8X18gUG9y
dCA2OiBEZXYgMywgSWYgMiwgQ2xhc3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVyPXVz
YmhpZCwgNDgwTQogICAgfF9fIFBvcnQgOTogRGV2IDQsIElmIDAsIENsYXNzPUh1bWFuIEludGVy
ZmFjZSBEZXZpY2UsIERyaXZlcj11c2JoaWQsIDEuNU0KICAgIHxfXyBQb3J0IDEwOiBEZXYgNSwg
SWYgMCwgQ2xhc3M9SHVtYW4gSW50ZXJmYWNlIERldmljZSwgRHJpdmVyPXVzYmhpZCwgMS41TQog
ICAgfF9fIFBvcnQgMTA6IERldiA1LCBJZiAxLCBDbGFzcz1IdW1hbiBJbnRlcmZhY2UgRGV2aWNl
LCBEcml2ZXI9dXNiaGlkLCAxLjVNCiAgICB8X18gUG9ydCAxMjogRGV2IDYsIElmIDAsIENsYXNz
PUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICB8X18gUG9ydCAxMjogRGV2IDYs
IElmIDEsIENsYXNzPUF1ZGlvLCBEcml2ZXI9c25kLXVzYi1hdWRpbywgMTJNCiAgICB8X18gUG9y
dCAxMjogRGV2IDYsIElmIDIsIENsYXNzPUh1bWFuIEludGVyZmFjZSBEZXZpY2UsIERyaXZlcj11
c2JoaWQsIDEyTQo=

--MP_/JF=n7g+Wu1jRX3H1qtQI4CN--
