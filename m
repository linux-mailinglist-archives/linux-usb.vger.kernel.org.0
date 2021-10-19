Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2050C433C7B
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 18:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbhJSQkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 12:40:12 -0400
Received: from mout.gmx.com ([74.208.4.200]:38481 "EHLO mout.gmx.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234351AbhJSQkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 12:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
        s=dbd5af2cbaf7; t=1634661477;
        bh=fXWu3rveKH06uqaxh4+4opC9piNS4W+FPFbPIyF1Iyk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=gb72azes/njbsRobxjyzcIw8gO2k3g0Djp67Cu9ILIYRtWbXETItbZnJkBRGIGr1D
         xNfvwcXkffhLwX/YH0YLuPn+afSnWfU3XR3EeQguxFTRgJm2jc8Hox6zo9I+EuEuXu
         QGusRe5h+kBon6/gX6XyadDYaIqGh+KewsnrhKNI=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [2.124.36.225] ([2.124.36.225]) by web-mail.mail.com
 (3c-app-mailcom-lxa06.server.lan [10.76.45.7]) (via HTTP); Tue, 19 Oct 2021
 18:37:57 +0200
MIME-Version: 1.0
Message-ID: <trinity-5eaf7ea7-ff39-498d-b5cc-844177c47b48-1634661477272@3c-app-mailcom-lxa06>
From:   mark_k@iname.com
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB2 Link USB-SCSI converter and LUNs
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 19 Oct 2021 18:37:57 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YW7BtIHwVH3n13yH@kroah.com>
References: <trinity-d3be8a5b-2b1c-45f8-8767-cf9cf758a0c0-1634638509008@3c-app-mailcom-lxa12>
 <YW6pjieI5UwOM9LW@kroah.com>
 <trinity-7db5ef0c-99a3-4fa0-a1d7-1e57c80cc4ff-1634648008985@3c-app-mailcom-lxa13>
 <YW7BtIHwVH3n13yH@kroah.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:rEhiQbwVIRObWWK/PtlC5FdfnkTdhVYUXrgd9wRknl9qbksYY+QUipCYWuBhzx3fiDU2k
 h5KfZ2mGbA9yjJpxnJXWWufJe3Ffw3Hivkh7ngO3IRCZAN6LLIoRgH3EKSd6sL3y0G8lRqm2lC01
 vsFIM23wY5iug5duPzXVd/3ST58Vqm+T05JshuhnCY8OySIllHtVblX4m2lEK6O2AexYqgKKhX8V
 0QHYT2K0S3VUW30na2LCOykFeEDoVVYG3joDRpkmXtJcoHUBtN4NTHFyQVzZh+iWNGFjlLD//d8n
 dw=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WG1RRZ+TilE=:DpngMLnYkBmSjUZaqQtcvw
 qLnUS3G3uwwB//b/Lnbz8FKx0u1mFCvRfyJm6+imPeOvS9y2cJxx5xpGqpA4DOgNxNOBkfjb3
 XPTr1VlSLmrVkRK6JXmKc5yv5uFMLKkpS0yQhsuk8bOAVUgiQhLBM7KUoX7wJM/53Yf49vfoZ
 PuPU/DSWI5bwlhWIrOATDE5NbyKTFgOK81ZJAURmAg1Se6sNtjYF5zU1jLuzHMmVxzzsmghX2
 n7EGHUiqFv12rEJUjDvIR4XMYmiwOO/Gv6dru1HnywXqJDFiIOgYcT4BZJ0FjY6zlVS54ma9j
 Msu5KxIdowagATtMV6a6vKL5rCSOfD2fl01S0mQM+xEcoXV0ibDHJZAYxCeluSfo1mEJVSifN
 AlZ8Hb5Iklp3Hjbl1dbu0mFxlm8v3cUwCEHeqW5L3F8XDl/ZRCp5TsjNA4a2rwnqL0Etl1ry7
 nzuWA+ESeM4zKI6J0128n5QkQ75zlQJrpuYWwFamQBtz0VkklOsy17IzCDnjlabaJPi420WQh
 pgv8V2v/6zhiOmAmjumroBiEyacQgGh4KCxdN85SsKFt8+q8QTBcHI5BZY5YLNqLhV1i1kSzY
 eLaWVmvH31tFWxxxN+ivnsLt9IAnoQhNyvpVaOs6mPE7dBZlYa5UTLocYi7raRqDpK2Yl96SJ
 E2wzNepN0oURBnaBwKwSEZ0gQNPk+XQIVmAAxPen6OEpj5QVQAimXEDa5vFx+ogSaWsfOq4vK
 BUuqvO5eXU8Qbc1Gtqvuk5We6qlvMFYJDjXZASSII35/YrkIU4Q39flOrXfiYC2K/sHgEyZCT
 2Jug02C
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tuesday, October 19, 2021 at 2:01 PM "Greg KH" <gregkh@linuxfoundation.=
org> wrote:
> On Tue, Oct 19, 2021 at 02:53:29PM +0200, mark_k@iname.com wrote:
> > On Tuesday, October 19, 2021 at 12:18 PM "Greg KH" <gregkh@linuxfounda=
tion.org> wrote:
> > > On Tue, Oct 19, 2021 at 12:15:09PM +0200, mark_k@iname.com wrote:
> > > > I have a Core Micro Systems USB2 Link USB-SCSI converter (07B4:038=
0).
> > > >
> > > > Adding an entry to unusual_devs.h should get it to work, just need=
ing
> > > > USB_PR_BULK. That should at least allow the connected device with =
SCSI ID 0
> > > > to be accessed.
> > >
> > > Why do you need any quirk at all for this?
> >
> > My mistake, sorry. Its interface descriptor has
> >   bInterfaceClass 0xFF
> >   bInterfaceSubClass 0x06
> >   bInterfaceProtocol 0x50
> > so an entry with USB_SC_DEVICE, USB_PR_DEVICE would work.
>
> Again, why is a quirk needed at all?

bInterfaceClass =3D 0xFF (not 0x08 which is the mass storage class number)
so usb-storage does not bind to it automatically.


> > > That should all be up to the scsi layer in the kernel.  If this devi=
ce
> > > is not following the standard, how is it supposed to work at all?
> > >
> > > Does it require custom drivers for other operating systems?
> >
> > My guess is that (with quirk entry) it will work when there is a SCSI
> > device with ID 0. If all other devices in the chain have contiguous ID=
s
> > they could be accessible too.
> >
> > I can tell Windows to use its built-in mass storage driver and that wo=
rks
> > to access the device with ID 0 only. I haven't yet checked with more t=
han
> > one SCSI device in the chain.
>
> Does this work properly with Linux in this way with no quirk as well?
>
> And how do you know that the device will work with additional scsi
> devices?

I rebuilt the usb-storage module after adding an entry for the USB2 Link t=
o
unusual_devs.h.

With one SCSI device set to ID 0, the kernel detected the drive and I coul=
d
access it:

[ 2219.761126] usb-storage 2-1:1.0: USB Mass Storage device detected
[ 2219.762033] scsi host5: usb-storage 2-1:1.0
[ 2219.762163] usbcore: registered new interface driver usb-storage
[ 2220.769695] scsi 5:0:0:0: Optical Device    HP       C1113M           1=
.19 PQ: 0 ANSI: 2
[ 2221.156254] usb 2-1: reset high-speed USB device number 5 using ehci-pc=
i
[ 2221.712223] usb 2-1: reset high-speed USB device number 5 using ehci-pc=
i
[ 2222.268262] usb 2-1: reset high-speed USB device number 5 using ehci-pc=
i
[ 2222.824239] usb 2-1: reset high-speed USB device number 5 using ehci-pc=
i
[ 2222.981475] sd 5:0:0:0: Attached scsi generic sg2 type 7
[ 2222.987240] sd 5:0:0:0: [sdb] Attached SCSI removable disk


Note the extra "reset high-speed..." lines, probably due to the kernel
trying to access LUNs 1 to 5 (which the USB2 Link maps to accesses to non-
existent SCSI targets 1-5). Is that harmless?
[As mentioned before, the USB2 Link reports its Max LUN as 6.]


> > It could/should be possible to properly support multiple targets and L=
UNs
> > by using a similar method to the SCM USB-SCSI converters. (Those, afte=
r a
> > special intitialisation request, take the target ID from the *upper* 4=
 bits
> > of CBW byte 13.)
>
> Are you sure this device actually supports this?  If so, what operating
> system does it work on?

It does definitely support that. I installed the manufacturer driver on
(32-bit) Windows and looked at USBpcap captures. I also disassembled the
driver.

Do you think it would be worthwhile submitting a patch adding the USB2
Link to unusual-devs.h? If those reset... lines aren't acceptable I could
add US_FL_SINGLE_LUN, but that would only allow it to work with a single
SCSI device (set to ID 0).

Or should I try and get proper/full support (multiple targets and LUNs)
working first?

