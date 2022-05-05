Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF9551BE02
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 13:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355271AbiEELd3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 07:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355252AbiEELd2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 07:33:28 -0400
Received: from louie.mork.no (louie.mork.no [IPv6:2001:41c8:51:8a:feff:ff:fe00:e5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD194B413
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 04:29:48 -0700 (PDT)
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9d:7e00:0:0:0:1])
        (authenticated bits=0)
        by louie.mork.no (8.15.2/8.15.2) with ESMTPSA id 245BTS9S084854
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Thu, 5 May 2022 12:29:29 +0100
Received: from miraculix.mork.no ([IPv6:2a02:2121:6c2:7b61:44e4:f7ff:fee2:7225])
        (authenticated bits=0)
        by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 245BTLCn736709
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Thu, 5 May 2022 13:29:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1651750162; bh=w7A1WNOkowKMSCQUQ0H5cRDWxKX/TrJxOp3JXeNALzE=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=FTUQjpl3dw7uCEr5tPip0FBr5hTYvZ9sexA1+24pcTw3xE9iYFbzIv68kjS3Rw6di
         j6rvoS6PKBbnQTNMcC2w/zAlU5iT+kEa9ZEuOrsfUA1wJSGJWonFBjpzRnyOIHADc3
         MQ5WqGHfkWnZUZuVYn8uUob+LNhJ0gZVJxHzO2OI=
Received: (nullmailer pid 57575 invoked by uid 1000);
        Thu, 05 May 2022 11:29:21 -0000
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Organization: m
References: <20220504083612.143463-1-jtornosm@redhat.com>
        <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
        <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
Date:   Thu, 05 May 2022 13:29:21 +0200
In-Reply-To: <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com> (Oliver Neukum's
        message of "Thu, 5 May 2022 12:19:21 +0200")
Message-ID: <87levgkyjy.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.5 at canardo
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum <oneukum@suse.com> writes:
> On 04.05.22 14:23, Marcel Holtmann wrote:
>>
>>> @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[] =
=3D {
>>> 	/* ELMO L-12F document camera */
>>> 	{ USB_DEVICE(0x09a1, 0x0028), .driver_info =3D USB_QUIRK_DELAY_CTRL_MS=
G },
>>>
>>> +	/* CSR Bluetooth */
>>> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNCONFI=
GURE },
>>> +
>> NAK. I said this before.
>>
>> The VID:PID 0a12:0001 is used in millions of products that work
>> correctly. Only because some counterfeit products get things wrong
>> doesn=E2=80=99t mean all get marked as broken.
>>
>
> Hi,
>
> if I may ask, how certain is that?

100%.  Just get a real CSR device and try it.


canardo:/tmp# sed -ne '/ Port=3D07 /,/^$/p' /sys/kernel/debug/usb/devices=20
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D07 Cnt=3D05 Dev#=3D  6 Spd=3D12   Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D0a12 ProdID=3D0001 Rev=3D88.91
C:* #Ifs=3D 2 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D  0mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D1ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms

canardo:/tmp# hciconfig hci0
hci0:   Type: Primary  Bus: USB
        BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
        UP RUNNING=20
        RX bytes:660 acl:0 sco:0 events:43 errors:0
        TX bytes:2178 acl:0 sco:0 commands:43 errors:0

canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
total 0
lrwxrwxrwx 1 root root    0 May  5 13:23 1-8:1.0 -> ../../../../devices/pci=
0000:00/0000:00:14.0/usb1/1-8/1-8:1.0
lrwxrwxrwx 1 root root    0 May  5 13:23 1-8:1.1 -> ../../../../devices/pci=
0000:00/0000:00:14.0/usb1/1-8/1-8:1.1
--w------- 1 root root 4096 May  5 13:23 bind
lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
-rw-r--r-- 1 root root 4096 May  5 13:22 new_id
-rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
--w------- 1 root root 4096 May  5 13:22 uevent
--w------- 1 root root 4096 May  5 13:23 unbind


canardo:/tmp# echo 1-8:1.0 > /sys/bus/usb/drivers/btusb/unbind
canardo:/tmp# sed -ne '/ Port=3D07 /,/^$/p' /sys/kernel/debug/usb/devices=20
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D07 Cnt=3D05 Dev#=3D  6 Spd=3D12   Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D0a12 ProdID=3D0001 Rev=3D88.91
C:* #Ifs=3D 2 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D  0mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D1ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3D(none)
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms

canardo:/tmp# hciconfig hci0
Can't get device info: No such device
canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
total 0
--w------- 1 root root 4096 May  5 13:23 bind
lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
-rw-r--r-- 1 root root 4096 May  5 13:22 new_id
-rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
--w------- 1 root root 4096 May  5 13:22 uevent
--w------- 1 root root 4096 May  5 13:26 unbind


canardo:/tmp# echo 1-8:1.0 > /sys/bus/usb/drivers/btusb/bind
canardo:/tmp# sed -ne '/ Port=3D07 /,/^$/p' /sys/kernel/debug/usb/devices=20
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D07 Cnt=3D05 Dev#=3D  6 Spd=3D12   Mx=
Ch=3D 0
D:  Ver=3D 2.00 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D0a12 ProdID=3D0001 Rev=3D88.91
C:* #Ifs=3D 2 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D  0mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D1ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 Driver=
=3Dbtusb
E:  Ad=3D03(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms

canardo:/tmp# hciconfig hci0
hci0:   Type: Primary  Bus: USB
        BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
        UP RUNNING=20
        RX bytes:660 acl:0 sco:0 events:43 errors:0
        TX bytes:2178 acl:0 sco:0 commands:43 errors:0

canardo:/tmp# ls -l /sys/bus/usb/drivers/btusb/
total 0
lrwxrwxrwx 1 root root    0 May  5 13:27 1-8:1.0 -> ../../../../devices/pci=
0000:00/0000:00:14.0/usb1/1-8/1-8:1.0
lrwxrwxrwx 1 root root    0 May  5 13:27 1-8:1.1 -> ../../../../devices/pci=
0000:00/0000:00:14.0/usb1/1-8/1-8:1.1
--w------- 1 root root 4096 May  5 13:27 bind
lrwxrwxrwx 1 root root    0 May  5 13:22 module -> ../../../../module/btusb
-rw-r--r-- 1 root root 4096 May  5 13:22 new_id
-rw-r--r-- 1 root root 4096 May  5 13:22 remove_id
--w------- 1 root root 4096 May  5 13:22 uevent
--w------- 1 root root 4096 May  5 13:26 unbind


I do have a couple of fake ones too.  They are mostly interesting from a
"why the h... would anyone do that?" perspective



Bj=C3=B8rn
