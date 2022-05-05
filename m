Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD65751C218
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 16:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380489AbiEEOSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 10:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379732AbiEEOSY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 10:18:24 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 194D95A0BF
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 07:14:43 -0700 (PDT)
Received: (qmail 1158708 invoked by uid 1000); 5 May 2022 10:14:43 -0400
Date:   Thu, 5 May 2022 10:14:43 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <YnPb04ynkSTlhg4H@rowland.harvard.edu>
References: <20220504083612.143463-1-jtornosm@redhat.com>
 <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
 <87levgkyjy.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87levgkyjy.fsf@miraculix.mork.no>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 05, 2022 at 01:29:21PM +0200, Bjørn Mork wrote:
> Oliver Neukum <oneukum@suse.com> writes:
> > On 04.05.22 14:23, Marcel Holtmann wrote:
> >>
> >>> @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> >>> 	/* ELMO L-12F document camera */
> >>> 	{ USB_DEVICE(0x09a1, 0x0028), .driver_info = USB_QUIRK_DELAY_CTRL_MSG },
> >>>
> >>> +	/* CSR Bluetooth */
> >>> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },
> >>> +
> >> NAK. I said this before.
> >>
> >> The VID:PID 0a12:0001 is used in millions of products that work
> >> correctly. Only because some counterfeit products get things wrong
> >> doesn’t mean all get marked as broken.
> >>
> >
> > Hi,
> >
> > if I may ask, how certain is that?
> 
> 100%.  Just get a real CSR device and try it.

Please pardon me for butting in, but I don't see how this tests the 
condition that Jose is worried about.

You start with the device being configured and working:

> canardo:/tmp# sed -ne '/ Port=07 /,/^$/p' /sys/kernel/debug/usb/devices 
> T:  Bus=01 Lev=01 Prnt=01 Port=07 Cnt=05 Dev#=  6 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0a12 ProdID=0001 Rev=88.91
> C:* #Ifs= 2 Cfg#= 1 Atr=c0 MxPwr=  0mA
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> 
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING 
>         RX bytes:660 acl:0 sco:0 events:43 errors:0
>         TX bytes:2178 acl:0 sco:0 commands:43 errors:0
> 
> canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
> total 0
> lrwxrwxrwx 1 root root    0 May  5 13:23 1-8:1.0 -> ../../../../devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0
> lrwxrwxrwx 1 root root    0 May  5 13:23 1-8:1.1 -> ../../../../devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1
> --w------- 1 root root 4096 May  5 13:23 bind
> lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
> -rw-r--r-- 1 root root 4096 May  5 13:22 new_id
> -rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
> --w------- 1 root root 4096 May  5 13:22 uevent
> --w------- 1 root root 4096 May  5 13:23 unbind

Then you unbind the Bluetooth driver:

> canardo:/tmp# echo 1-8:1.0 > /sys/bus/usb/drivers/btusb/unbind

But the device is still configured, as proved by the fact that there is 
a '*' following the "C:" below:

> canardo:/tmp# sed -ne '/ Port=07 /,/^$/p' /sys/kernel/debug/usb/devices 
> T:  Bus=01 Lev=01 Prnt=01 Port=07 Cnt=05 Dev#=  6 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0a12 ProdID=0001 Rev=88.91
> C:* #Ifs= 2 Cfg#= 1 Atr=c0 MxPwr=  0mA
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms

Of course, since the btusb driver isn't bound, there is no corresponding 
Bluetooth interface in the kernel:

> canardo:/tmp# hciconfig hci0
> Can't get device info: No such device
> canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
> total 0
> --w------- 1 root root 4096 May  5 13:23 bind
> lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
> -rw-r--r-- 1 root root 4096 May  5 13:22 new_id
> -rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
> --w------- 1 root root 4096 May  5 13:22 uevent
> --w------- 1 root root 4096 May  5 13:26 unbind

Then you rebind the driver:

> canardo:/tmp# echo 1-8:1.0 > /sys/bus/usb/drivers/btusb/bind
> canardo:/tmp# sed -ne '/ Port=07 /,/^$/p' /sys/kernel/debug/usb/devices 
> T:  Bus=01 Lev=01 Prnt=01 Port=07 Cnt=05 Dev#=  6 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=0a12 ProdID=0001 Rev=88.91
> C:* #Ifs= 2 Cfg#= 1 Atr=c0 MxPwr=  0mA
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
> I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
> I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
> I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
> I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
> 
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING 
>         RX bytes:660 acl:0 sco:0 events:43 errors:0
>         TX bytes:2178 acl:0 sco:0 commands:43 errors:0
> 
> canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
> total 0
> lrwxrwxrwx 1 root root    0 May  5 13:27 1-8:1.0 -> ../../../../devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.0
> lrwxrwxrwx 1 root root    0 May  5 13:27 1-8:1.1 -> ../../../../devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.1
> --w------- 1 root root 4096 May  5 13:27 bind
> lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
> -rw-r--r-- 1 root root 4096 May  5 13:22 new_id
> -rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
> --w------- 1 root root 4096 May  5 13:22 uevent
> --w------- 1 root root 4096 May  5 13:26 unbind

And presumably the device is working again.  However, none of this shows 
what happens when the device is unconfigured.  To test that, you would 
have to do:

	echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
	echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue

and then see if the device continues to work.

Alan Stern

> I do have a couple of fake ones too.  They are mostly interesting from a
> "why the h... would anyone do that?" perspective
> 
> 
> 
> Bjørn
