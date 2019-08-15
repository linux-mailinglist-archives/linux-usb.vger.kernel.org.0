Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F98C8E71B
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 10:41:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbfHOIlZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 04:41:25 -0400
Received: from vie01a-dmta-de01-2.mx.upcmail.net ([84.116.36.116]:46043 "EHLO
        vie01a-dmta-de01-2.mx.upcmail.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725875AbfHOIlZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Aug 2019 04:41:25 -0400
Received: from [172.31.216.234] (helo=vie01a-pemc-psmtp-pe11.mail.upcmail.net)
        by vie01a-dmta-de01.mx.upcmail.net with esmtp (Exim 4.92)
        (envelope-from <lkml@call-home.ch>)
        id 1hyBJy-0000TM-LY
        for linux-usb@vger.kernel.org; Thu, 15 Aug 2019 10:41:22 +0200
Received: from call-home.ch ([46.5.196.59])
        by vie01a-pemc-psmtp-pe11.mail.upcmail.net with ESMTPA
        id yBJxh9ObvbokryBJxhXp3H; Thu, 15 Aug 2019 10:41:22 +0200
X-Env-Mailfrom: lkml@call-home.ch
X-Env-Rcptto: linux-usb@vger.kernel.org
X-SourceIP: 46.5.196.59
X-CNFS-Analysis: v=2.3 cv=F4MpiZpN c=1 sm=1 tr=0
 a=Uwt/lGD3UYGA02ugBtVbUw==:117 a=Uwt/lGD3UYGA02ugBtVbUw==:17
 a=IkcTkHD0fZMA:10 a=FmdZ9Uzk2mMA:10 a=PNaVK2RZ6_ykVo5Jjy4A:9
 a=vHAEagvE0qsFg4c3:21 a=7YXLm7ObI9kfYrxh:21 a=QEXdDO2ut3YA:10
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-Authenticated-Sender: bjoern.christoph@kabelbw.de
Received: from [10.137.0.25] (hsi-kbw-046-005-196-059.hsi8.kabel-badenwuerttemberg.de [46.5.196.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by call-home.ch (Postfix) with ESMTPSA id 22E94743C25
        for <linux-usb@vger.kernel.org>; Thu, 15 Aug 2019 10:41:16 +0200 (CEST)
To:     linux-usb@vger.kernel.org
From:   Bjoern <lkml@call-home.ch>
Subject: USB disconnect due to error from flowcontrol urb
Message-ID: <b2eb7947-7b13-ab50-1f89-79268a2da063@call-home.ch>
Date:   Thu, 15 Aug 2019 10:41:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CMAE-Envelope: MS4wfB6RyaunpKGdQJOwuX68Dp8xaUhP4SAMSZg+BXSAMKmGDFV+agagAg+SUW7xBks9NtxvKmuZGaasW5O/9Qq1QyaS75Ej/i/bNXkurvcrVlgRL67WjnF+
 aVfr9uS+Rl13IJJSNZCqMguPBodEWAhkRS4UBbWNKRD1r849uROUE+it
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


I'm running on Ubuntu Bionic 4.14.94-155 on an odroid-x4 (armhf).


I have a FT230X Basic UART (0403:6015) plugged into the exynos-ohci USB. 
The device is linked via a udev rule to a "symbolic/virtual" device so 
that the software FHEM can address it independent of the real ttyUSB* name.


I constantly see disconnects for the device in the kernel log, see log 
excerpts below. I've found similar issues online going back till 2012 
but there seems to be no solution so far. I'd like to help find the 
cause if possible.

Regards,
Bjoern


Aug  4 11:25:11 fhem2 kernel: [2476586.963898] usb 2-1: USB disconnect, 
device number 66
Aug  4 11:25:11 fhem2 kernel: [2476586.965833] ftdi_sio ttyUSB0: error 
from flowcontrol urb
Aug  4 11:25:11 fhem2 kernel: [2476586.976811] ftdi_sio ttyUSB0: FTDI 
USB Serial Device converter now disconnected from ttyUSB0
Aug  4 11:25:11 fhem2 kernel: [2476586.977232] ftdi_sio 2-1:1.0: device 
disconnected
Aug  4 11:25:12 fhem2 kernel: [2476587.453089] usb 2-1: new full-speed 
USB device number 67 using exynos-ohci
Aug  4 11:25:12 fhem2 kernel: [2476587.690677] usb 2-1: New USB device 
found, idVendor=0403, idProduct=6015
Aug  4 11:25:12 fhem2 kernel: [2476587.690701] usb 2-1: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
Aug  4 11:25:12 fhem2 kernel: [2476587.690718] usb 2-1: Product: FT230X 
Basic UART
Aug  4 11:25:12 fhem2 kernel: [2476587.690733] usb 2-1: Manufacturer: FTDI
Aug  4 11:25:12 fhem2 kernel: [2476587.690748] usb 2-1: SerialNumber: 
DN03L5HK
Aug  4 11:25:12 fhem2 kernel: [2476587.697068] ftdi_sio 2-1:1.0: FTDI 
USB Serial Device converter detected
Aug  4 11:25:12 fhem2 kernel: [2476587.697388] usb 2-1: Detected FT-X
Aug  4 11:25:12 fhem2 kernel: [2476587.701288] usb 2-1: FTDI USB Serial 
Device converter now attached to ttyUSB0

Aug  4 19:43:11 fhem2 kernel: [2506466.787738] usb usb2-port1: disabled 
by hub (EMI?), re-enabling...
Aug  4 19:43:11 fhem2 kernel: [2506466.792968] usb 2-1: USB disconnect, 
device number 67
Aug  4 19:43:11 fhem2 kernel: [2506466.794825] ftdi_sio ttyUSB0: error 
from flowcontrol urb
Aug  4 19:43:11 fhem2 kernel: [2506466.803026] ftdi_sio ttyUSB0: FTDI 
USB Serial Device converter now disconnected from ttyUSB0
Aug  4 19:43:11 fhem2 kernel: [2506466.803630] ftdi_sio 2-1:1.0: device 
disconnected
Aug  4 19:43:11 fhem2 kernel: [2506467.139384] usb 2-1: new full-speed 
USB device number 68 using exynos-ohci
Aug  4 19:43:12 fhem2 kernel: [2506467.377550] usb 2-1: New USB device 
found, idVendor=0403, idProduct=6015
Aug  4 19:43:12 fhem2 kernel: [2506467.377574] usb 2-1: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
Aug  4 19:43:12 fhem2 kernel: [2506467.377590] usb 2-1: Product: FT230X 
Basic UART
Aug  4 19:43:12 fhem2 kernel: [2506467.377606] usb 2-1: Manufacturer: FTDI
Aug  4 19:43:12 fhem2 kernel: [2506467.377620] usb 2-1: SerialNumber: 
DN03L5HK
Aug  4 19:43:12 fhem2 kernel: [2506467.383884] ftdi_sio 2-1:1.0: FTDI 
USB Serial Device converter detected
Aug  4 19:43:12 fhem2 kernel: [2506467.384291] usb 2-1: Detected FT-X
Aug  4 19:43:12 fhem2 kernel: [2506467.388093] usb 2-1: FTDI USB Serial 
Device converter now attached to ttyUSB0

Aug  6 07:46:23 fhem2 kernel: [2636259.004563] usb 2-1: USB disconnect, 
device number 68
Aug  6 07:46:23 fhem2 kernel: [2636259.005393] ftdi_sio ttyUSB0: error 
from flowcontrol urb
Aug  6 07:46:23 fhem2 kernel: [2636259.011179] ftdi_sio ttyUSB0: FTDI 
USB Serial Device converter now disconnected from ttyUSB0
Aug  6 07:46:23 fhem2 kernel: [2636259.011347] ftdi_sio 2-1:1.0: device 
disconnected
Aug  6 07:46:24 fhem2 kernel: [2636259.491782] usb 2-1: new full-speed 
USB device number 69 using exynos-ohci
Aug  6 07:46:24 fhem2 kernel: [2636259.730054] usb 2-1: New USB device 
found, idVendor=0403, idProduct=6015
Aug  6 07:46:24 fhem2 kernel: [2636259.730079] usb 2-1: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
Aug  6 07:46:24 fhem2 kernel: [2636259.730095] usb 2-1: Product: FT230X 
Basic UART
Aug  6 07:46:24 fhem2 kernel: [2636259.730110] usb 2-1: Manufacturer: FTDI
Aug  6 07:46:24 fhem2 kernel: [2636259.730125] usb 2-1: SerialNumber: 
DN03L5HK
Aug  6 07:46:24 fhem2 kernel: [2636259.736360] ftdi_sio 2-1:1.0: FTDI 
USB Serial Device converter detected
Aug  6 07:46:24 fhem2 kernel: [2636259.736715] usb 2-1: Detected FT-X
Aug  6 07:46:24 fhem2 kernel: [2636259.740832] usb 2-1: FTDI USB Serial 
Device converter now attached to ttyUSB2

Aug  6 12:08:56 fhem2 kernel: [2652012.201328] usb 2-1: USB disconnect, 
device number 69
Aug  6 12:08:56 fhem2 kernel: [2652012.202561] ftdi_sio ttyUSB2: error 
from flowcontrol urb
Aug  6 12:08:56 fhem2 kernel: [2652012.209322] ftdi_sio ttyUSB2: FTDI 
USB Serial Device converter now disconnected from ttyUSB2
Aug  6 12:08:56 fhem2 kernel: [2652012.209579] ftdi_sio 2-1:1.0: device 
disconnected
Aug  6 12:08:57 fhem2 kernel: [2652012.684908] usb 2-1: new full-speed 
USB device number 70 using exynos-ohci
Aug  6 12:08:57 fhem2 kernel: [2652012.922996] usb 2-1: New USB device 
found, idVendor=0403, idProduct=6015
Aug  6 12:08:57 fhem2 kernel: [2652012.923021] usb 2-1: New USB device 
strings: Mfr=1, Product=2, SerialNumber=3
Aug  6 12:08:57 fhem2 kernel: [2652012.923037] usb 2-1: Product: FT230X 
Basic UART
Aug  6 12:08:57 fhem2 kernel: [2652012.923053] usb 2-1: Manufacturer: FTDI
Aug  6 12:08:57 fhem2 kernel: [2652012.923067] usb 2-1: SerialNumber: 
DN03L5HK
Aug  6 12:08:57 fhem2 kernel: [2652012.929686] ftdi_sio 2-1:1.0: FTDI 
USB Serial Device converter detected
Aug  6 12:08:57 fhem2 kernel: [2652012.930094] usb 2-1: Detected FT-X
Aug  6 12:08:57 fhem2 kernel: [2652012.933614] usb 2-1: FTDI USB Serial 
Device converter now attached to ttyUSB0

