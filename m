Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B13471339
	for <lists+linux-usb@lfdr.de>; Sat, 11 Dec 2021 10:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhLKJzt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Dec 2021 04:55:49 -0500
Received: from cable.insite.cz ([84.242.75.189]:48657 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229841AbhLKJzs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 11 Dec 2021 04:55:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id AE044A1A3D402;
        Sat, 11 Dec 2021 10:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639216546; bh=cj0W8FXa2gdEr92aBHpKiMOXscU6tkSUnrpsDPA8rfA=;
        h=To:Cc:From:Subject:Date:From;
        b=cqnEGqjLKgtmrWXHciy5GcPvD1QarF5Zmi0hsXRj44j0zwOcF4oPY8KCAAbNy2jF9
         HY3cFMKN0HWRQdhMuVdzd20Q3DMKwLqbPwncvD9j38k9lTCL2zcy8N/ZVlqPUm4twb
         bVOS8XItFtAd+1yECXxgdrKGJ93k2+HFtxEBOMXc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MPiwQK22IYK6; Sat, 11 Dec 2021 10:55:39 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id CF7C4A1A3D400;
        Sat, 11 Dec 2021 10:55:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639216539; bh=cj0W8FXa2gdEr92aBHpKiMOXscU6tkSUnrpsDPA8rfA=;
        h=To:Cc:From:Subject:Date:From;
        b=T8ixCLEatbMN16Yl/NcceD7bF+5PRduw8x6hxUjzPRt6jfRzZlw+0cn6MCyXO3Ox7
         77CYjuEB6JLXk9hVdVvcB/aSdXVXdsOqI5ZgfK0NwDh9XgtUoaz7KZRx0DZSoGxUzL
         trWY5vAJsHDzAv50K07SOqIjiqRtj3Jb9utuXvvU=
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb: dwc2: Detecting cable disconnection in OTG mode?
Message-ID: <7cce9f05-d659-1fe8-2862-aeca75693808@ivitera.com>
Date:   Sat, 11 Dec 2021 10:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

I am trying to find if dwc2 in OTG mode can pass information to gadget 
functions that the host has been disconnected. I am testing on RPi4. In 
a datasheet for a different dwc2 implementation 
https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf 
- chapter "16.8.3 Device Disconnection" I found:


===========
The device session ends when the USB cable is disconnected or if the 
VBUS is switched off by the host.
The device disconnect flow is as follows:

1. When the USB cable is unplugged or when the VBUS is switched off by 
the host, the device core triggers GINTSTS.OTGInt [bit 2] interrupt bit
============

I put a printk to core_intr.c:dwc2_handle_otg_intr() which is called 
only from handling the OTGInt interrupt 
https://elixir.bootlin.com/linux/v5.1.9/source/drivers/usb/dwc2/core_intr.c#L803 
. But this method is not called at all when disconnecting the USB cable 
on RPi4 in gadget mode.

The reason I need to identigy the disconnection is my work on signalling 
that host has started/stopped audio playback/capture. Everything more or 
less works, but disconnecting the cable (which means stopped 
playback/capture on the gadget) is not identified in any way.

Thanks a lot,

Pavel.


