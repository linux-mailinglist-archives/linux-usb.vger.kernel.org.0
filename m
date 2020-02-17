Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2561A16141C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgBQOFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:05:09 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:47543 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726945AbgBQOFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 09:05:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A7DoHQzMcjstRT4VIaWX5MCnTC30F+k0NRTtXi92u1I=; b=VW3uCl3wq9QgGlam23qVN8I+9+
        SmA/CuXUhWBypAmjgnhxKxt7UkbuEBPCxHY7PCzFHnff7c4NqIHjzmf93OU1B+/QlpLczdp9Wlih+
        T4jpfEBBDwxNCdn6aL65MXFIK4kniY5j9EiGlfMoShjqXyZLGWfB/TMCPQnGPQv6HcDtvMS+LEqVv
        u7Jkd5CSJDtcF4jIl5UUW4o8H0KRh6uzpXF6gwIjI/tQjs5Ncf5KVZjelD9TFDfgBJDc/dmWzivhP
        /8UIT0evjXtary/ejsZQ9V89Qso+x/qqixyfNlEh8DIU6OJSmYTcKp6tsxFYJprzd0ZOVpQmLkjF7
        OUWLlBiA==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53127 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1j3h1G-00059d-4g; Mon, 17 Feb 2020 15:05:06 +0100
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
To:     Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
        balbi@kernel.org, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20200216172117.49832-1-noralf@tronnes.org>
 <62e6e9b1-f44a-42ae-a971-8b947763284b@baylibre.com>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0ae9eda9-3e1a-d231-2a03-1877f5a3a0bb@tronnes.org>
Date:   Mon, 17 Feb 2020 15:05:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <62e6e9b1-f44a-42ae-a971-8b947763284b@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 17.02.2020 11.32, skrev Neil Armstrong:
> Hi,
> 
> On 16/02/2020 18:21, Noralf Trønnes wrote:
>> Hi,
>>
>> A while back I had the idea to turn a Raspberry Pi Zero into a $5
>> USB to HDMI/SDTV/DSI/DPI display adapter.
>>
>> Thinking about how to represent the display to the driver I realised
>> that hardware use registers as API. And Linux does have a generic
>> register abstraction: regmap. Furthermore this means that if I can do a
>> regmap over USB implementation, it will be easy to do other functions
>> like gpio, adc and others. After a few iterations trying to understand
>> the USB subsystem and satisfying driver requirements, I now have
>> something that looks promising.
>>
>> I'm sending out an early version hoping to get feedback especially on
>> the core parts that handles regmap and interrupts.
>>
>> Overview:
>>
>>           USB Host          :         USB Device
>>                             :
>>             --------------  :  ------------------
>> ----------  | mfd: mud   |  :  | f_mud          |  ----------
>> | Driver |  --------------  :  |                |  | Driver |
>> ----------  | regmap-usb |  :  | (mud_regmap)   |  ----------
>>             --------------  :  ------------------
>>
> 
> The idea is really like ARA's greybus, but much simpler !
> Anyway nice idea, do you have good performance over USB2 and
> RPi's awful DWC2 gagdet controller ?
> 

Not as good as I was hoping for. If I disable compression I'm getting 5
fps for a 1.5MB framebuffer (7800 kB/s):

$ modetest -M mud_drm -s 35:1024x768@RG16 -v
setting mode 1024x768-60.00Hz@RG16 on connectors 35, crtc 33
freq: 5.07Hz

When I tried reading I discovered that it was almost 3 times faster than
writing.

The zero gadget (loop testing) confirmed my findings:

Device:
$ sudo modprobe g_zero
[   44.221890] zero gadget: Gadget Zero, version: Cinco de Mayo 2008
[   44.221906] zero gadget: zero ready
[   60.751451] zero gadget: high-speed config #3: source/sink

Host:

$ sudo ~/testusb -a -t <n> -g 64 -s 16384
/dev/bus/usb/001/010 test 27,  107.230669 secs	-> 1000 / 107 =  9MB/s
/dev/bus/usb/001/010 test 28,   37.791292 secs	-> 1000 / 37  = 27MB/s
[73983.796552] usbtest 1-1.3:3.0: TEST 27: bulk write 1000Mbytes
[74205.060204] usbtest 1-1.3:3.0: TEST 28: bulk read 1000Mbytes

$ sudo ~/testusb -a -t <n> -g 64 -s 16384
/dev/bus/usb/001/010 test 5,  107.421535 secs
/dev/bus/usb/001/010 test 6,   38.189712 secs
[74893.204170] usbtest 1-1.3:3.0: TEST 5:  write 1000 sglists 64 entries
of 16384 bytes
[75012.592222] usbtest 1-1.3:3.0: TEST 6:  read 1000 sglists 64 entries
of 16384 bytes


I have tried Raspberry Pi1 and Pi4 as host (2 different controllers)
and Pi Zero and Beaglebone Black as device, getting similar result.

I found this post having the same issue:

Re: Asymmetric speed results with testusb/usbtest/g_zero
https://www.spinics.net/lists/linux-usb/msg100588.html

I haven't got a usb analyzer, but adding printk to
dwc2_assign_and_init_hc() showed that IN interrupts were 2-3 ms apart
but OUT interrupts were ~8 ms apart.

Noralf.
