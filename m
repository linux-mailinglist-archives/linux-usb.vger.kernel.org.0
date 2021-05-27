Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0B8392F51
	for <lists+linux-usb@lfdr.de>; Thu, 27 May 2021 15:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236370AbhE0NTP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 May 2021 09:19:15 -0400
Received: from cable.insite.cz ([84.242.75.189]:56056 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236373AbhE0NTO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 May 2021 09:19:14 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id F3EDDA1A3D403;
        Thu, 27 May 2021 15:17:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1622121458; bh=r9xuut7SWjfIRlaeWE/HouvA98YUMcTiEyJQXHqHHGg=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=fMb7bZzBvEaI0dEVLsq0fRF9XpyeW7RFeaYWxtADbxyDp1fYP01tEPJTvrzWvKKlB
         zJLOQ2XQgzOKVXCIjxQSxKP6ce3JGXxcDYyMh5ztDge1EOIvQYT7h22+YMt5IJ+lPn
         t4Rabbbe6NAAZ0vHVYk1bjw1fwlsQRT68tZDiANg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8zz1Wg9huGKc; Thu, 27 May 2021 15:17:32 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id B7185A1A3D402;
        Thu, 27 May 2021 15:17:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1622121451; bh=r9xuut7SWjfIRlaeWE/HouvA98YUMcTiEyJQXHqHHGg=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=ICocMIJR/hG5MOm9uWU1lg7G+BCOVh7iHs4zMYjCO626S6rs6BfwD3Epsg2iKifMf
         wd/6/PlNC9uvzliir9te/310G0rc1qL6B6ifFvNI7x3qmE3Ab7M88ov1Y923fFyt8k
         hJ0V9d1Mn9rFBh4uVNvigK73gx86v0Fe18mByZlk=
Subject: Re: [PATCH] ARM: dts: bcm283x: increase dwc2's RX FIFO size
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
References: <e9e7d070-593c-122f-3a5c-2435bb147ab2@ivitera.com>
 <44d8f7e0-b2d0-8547-7367-7a35af68efe6@i2se.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <7c2e3e1f-db10-b376-9b87-ef93c8d8289c@ivitera.com>
Date:   Thu, 27 May 2021 15:17:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <44d8f7e0-b2d0-8547-7367-7a35af68efe6@i2se.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Stefan,

Dne 26. 05. 21 v 19:12 Stefan Wahren napsal(a):
> 
> Am 13.11.20 um 08:18 schrieb Pavel Hofman:
>> The previous version of the dwc2 overlay set the RX FIFO size to
>> 256 4-byte words. This is not enough for 1024 bytes of the largest
>> isochronous high speed packet allowed, because it doesn't take into
>> account extra space needed by dwc2.
>>
>> RX FIFO's size is calculated based on the following (in 4byte words):
>> - 13 locations for SETUP packets
>>   5*n + 8 for Slave and Buffer DMA mode where n is number of control
>>   endpoints which is 1 on the bcm283x core
>>
>> - 1 location for Global OUT NAK
>>
>> - 2 * 257 locations for status information and the received packet.
>>   Typically two spaces are recommended so that when the previous packet
>>   is being transferred to AHB, the USB can receive the subsequent
>>   packet.
>>
>> - 10 * 1 location for transfer complete status for last packet of each
>>   endpoint. The bcm283x core has 5 IN and 5 OUT EPs
>>
>> - 10 * 1 additional location for EPDisable status for each endpoint
>>
>> - 5 * 2 additional locations are recommended for each OUT endpoint
>>
>> Total is 558 locations.
>>
>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>  arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi        | 2 +-
>>  arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
>> b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
>> index e2fd961..20322de 100644
>> --- a/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x-rpi-usb-otg.dtsi
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  &usb {
>>  	dr_mode = "otg";
>> -	g-rx-fifo-size = <256>;
>> +	g-rx-fifo-size = <558>;
>>  	g-np-tx-fifo-size = <32>;
>>  	/*
>>  	 * According to dwc2 the sum of all device EP
>> diff --git a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
>> b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
>> index 0ff0e9e..1409d1b 100644
>> --- a/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x-rpi-usb-peripheral.dtsi
>> @@ -1,7 +1,7 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  &usb {
>>  	dr_mode = "peripheral";
>> -	g-rx-fifo-size = <256>;
>> +	g-rx-fifo-size = <558>;
> 
> sorry for being late at the party, but this change introduce a
> regression on Raspberry Pi 4 B:
> 
> dwc2 fe980000.usb: dwc2_check_param_tx_fifo_sizes: Invalid parameter
> g-tx-fifo-size, setting to default average
> 
> I known you didn't change the tx fifo size, but there are complex
> constrains regarding the total fifo size.
> 
> Are you able to test this with a mainline kernel (not Raspberry Pi
> kernel) and send a fix for this?
> 
>>  	g-np-tx-fifo-size = <32>;
>>  	g-tx-fifo-size = <256 256 512 512 512 768 768>;
>>  };
> 

I think I see the problem.

IIUC the calculations and checks, all g-tx-fifo-size values +
g-rx-fifo-size + g-np-tx-fifo-size must not exceed total_fifo_size. My
RPi4 reports the total_fifo_size as 4080 (in
/sys/kernel/debug/usb/fe980000.usb/hw_params).

Linux mainline
https://github.com/torvalds/linux/search?p=3&q=g-tx-fifo-size :

The increase in value of g-rx-fifo-size exceeds the limit for the DTSI
files we patched:

Both bcm283x-rpi-usb-peripheral.dtsi and bcm283x-rpi-usb-otg.dtsi:
558 + 32 + 256 + 256 + 512 + 512 + 512 + 768 + 768 = 4174 > 4080

while the sum with the previous value of 256 reached just 3872 < 4080.


The raspberrypi repo
https://github.com/raspberrypi/linux/search?q=g-tx-fifo-size :

It has a different mix of the DTSI files
dwc2-overlay.dts
upstream-overlay.dts
upstream-pi4-overlay.dts

all of which define
g-tx-fifo-size = <512 512 512 512 512 256 256>;

Here the calculation holds:
558 + 32 + 512 + 512 + 512 + 512 + 512 + 256 + 256 = 3662 < 4080

My RPi4 uses one of these DTSIs, because my
/sys/kernel/debug/usb/fe980000.usb/params says:

g_rx_fifo_size                : 558
g_np_tx_fifo_size             : 32
g_tx_fifo_size[0]             : 0
g_tx_fifo_size[1]             : 512
g_tx_fifo_size[2]             : 512
g_tx_fifo_size[3]             : 512
g_tx_fifo_size[4]             : 512
g_tx_fifo_size[5]             : 512
g_tx_fifo_size[6]             : 256
g_tx_fifo_size[7]             : 256


IIUC the tx_fifo values in bcm283x-rpi-usb-peripheral.dtsi and
bcm283x-rpi-usb-otg.dtsi files can be lowered to the values used and
tested (at least by me) in the RPi repo. But this is outside of my
knowledge, honestly I do not know what is the most appropriate
distribution of the remaining fifo space among the g_tx_fifo buffers.
Please can the RPi developers (Phil?) suggest a fix?

Thanks a lot to Stefan and to everyone involved.

Pavel.
