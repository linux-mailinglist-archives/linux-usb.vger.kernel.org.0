Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F53F3325D7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 13:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhCIMwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 07:52:41 -0500
Received: from mx2.suse.de ([195.135.220.15]:41548 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231402AbhCIMw0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 07:52:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615294345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3e7zEs/QQMUc5tW9t1Wbe0GFyZ6tye9OfoKMfJIyfyY=;
        b=plMOsnwQu2lV4G9w5qN4L9D2AX+KzcU39mDYqH2D1Rc0aR8zKEhdGb6nJ69d21lVJ1d7px
        Ji/vN0fQzny3tJt3vePgnKbNogDzc3XiRcSPcJ5b0NTnLHfwIjLzJMAcO0U9kKzcLmvS1e
        SyFFcXWtrXqG9lzKt0Fkgyd/x5K7+44=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E684DAB8C;
        Tue,  9 Mar 2021 12:52:24 +0000 (UTC)
Message-ID: <395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
Subject: Re: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
From:   Oliver Neukum <oneukum@suse.com>
To:     "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 09 Mar 2021 13:52:23 +0100
In-Reply-To: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
References: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 04.03.2021, 22:59 +0000 schrieb Ramsay, Lincoln:
> Hi folks,
> 
> Opengear makes a device (OM2200) that you're supposed to plug into consoles in order to access them remotely but the Cisco 2960-X is causing us grief. We can trivially break our device in just 3 steps.
> 
> 1. Connect the Cisco 2960-X console.
> 2. (Re)boot our device.
> 3. Open the Cisco's console device (/dev/ttyACM0) and write to it.

What exactly happens after that?

> When we were using Linux 5.2.32 this wasn't fatal. It was possible to disconnect and reconnect the Cisco and it would work as expected. The same was observed on our older devices that run Linux 3.10 on ARM and on a laptop running macOS 10.13. But we upgraded to Linux 5.4.61 and it got much worse. I did some digging and it seems that the cdc-acm cooldown commit (f4d1cf2ef83caeab212e842fd238cb8353f59fa2) is the cause.
> 
> Before I continue, I need to acknowledge that the Cisco 2960-X is really broken. Unlike every other Cisco console I could find to test with, it shows up as USB 2 rather than USB 1, causes warnings to be printed and sends corrupt identity strings.
> 
>     usb 2-1.1: new high-speed USB device number 6 using ehci-pci
>     usb 2-1.1: config 1 interface 0 altsetting 0 endpoint 0x82 has an invalid bInterval 255, changing to 11
>     usb 2-1.1: config 1 interface 1 altsetting 0 bulk endpoint 0x1 has invalid maxpacket 64
>     usb 2-1.1: config 1 interface 1 altsetting 0 bulk endpoint 0x81 has invalid maxpacket 64
>     usb 2-1.1: New USB device found, idVendor=05a6, idProduct=0009, bcdDevice= 0.00
>     usb 2-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>     usb 2-1.1: Product: C�~B�~@~@ल^D
>     usb 2-1.1: Manufacturer: C�~B�~@~@ल^D
>     usb 2-1.1: SerialNumber: C�~B�~@~@ल^D�~@�~B
>     cdc_acm 2-1.1:1.0: ttyACM0: USB ACM device
> 
> Despite this though, it does seem to work, except when it is connected during boot. In that case, we get this kernel warning:

Did your test kernel contain 38203b8385bf6283537162bde7d499f83096471 ?

	Regards
		Oliver


