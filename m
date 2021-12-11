Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5771A47133B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Dec 2021 10:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhLKJ7l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Dec 2021 04:59:41 -0500
Received: from cable.insite.cz ([84.242.75.189]:45263 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229841AbhLKJ7k (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Dec 2021 04:59:40 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 4F8B8A1A3D402;
        Sat, 11 Dec 2021 10:59:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639216779; bh=QxPpt+Gkd6WRZkvb7aRmc9kCJ32hQ5yn007mhusRCN8=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=RhwP5txHWFrwj5f4/MghHe6oJiC0eNPQtXw1808bkbLuFnC+GKt5IwLycl19St9/6
         lTGP3i8D3uMPsxW3V1M5Obs6CvohicyYkOWFqTKVIrLH7QJeKIgr1C1ZBCB4JyBoXY
         3Cmf/IPJlWY1Ai3WR3EUkHVwePZoABJNOyHsM4p0=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fR4ggtxD0qbW; Sat, 11 Dec 2021 10:59:33 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1FD64A1A3D400;
        Sat, 11 Dec 2021 10:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639216773; bh=QxPpt+Gkd6WRZkvb7aRmc9kCJ32hQ5yn007mhusRCN8=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=I6SEKYaG7nP1gRSi9ZsDWjopku73NcyaA5SB1E7Gl4o/WM3jphkreZkSkMJ2L+6q6
         8ek7iwnhBotC2yyeZxDd52kxMFq/bHy1UExhaZgPeSMxgOMa5YzeMrt15vkGz7TnNA
         NwrVHbZ2d2TjMzTAlnNmC0x8SidSKzNu7hru/e3w=
Subject: Re: usb: dwc2: Detecting cable disconnection in OTG mode?
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
Message-ID: <ace0e7e0-bf55-e2e4-a17f-c411de8a5266@ivitera.com>
Date:   Sat, 11 Dec 2021 10:59:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 11. 12. 21 v 10:55 Pavel Hofman napsal(a):
> Hi Minas,
> 
> I am trying to find if dwc2 in OTG mode can pass information to gadget 
> functions that the host has been disconnected. I am testing on RPi4. In 
> a datasheet for a different dwc2 implementation 
> https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf 
> - chapter "16.8.3 Device Disconnection" I found:
> 
> 
> ===========
> The device session ends when the USB cable is disconnected or if the 
> VBUS is switched off by the host.
> The device disconnect flow is as follows:
> 
> 1. When the USB cable is unplugged or when the VBUS is switched off by 
> the host, the device core triggers GINTSTS.OTGInt [bit 2] interrupt bit
> ============
> 
> I put a printk to core_intr.c:dwc2_handle_otg_intr() which is called 
> only from handling the OTGInt interrupt 
> https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/core_intr.c#L803 
> . But this method is not called at all when disconnecting the USB cable 
> on RPi4 in gadget mode.
> 

To add, the method dwc2_hsotg_disconnect is called, but after 
reconnecting the cable, as part of the gadget reset  when handling 
reset interrupts (gintsts & (GINTSTS_USBRST | GINTSTS_RESETDET)) here 
https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/gadget.c#L3653

Thanks a lot,

Pavel.
