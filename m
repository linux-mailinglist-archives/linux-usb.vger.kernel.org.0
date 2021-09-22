Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46EAC4147CA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 13:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235701AbhIVLaE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 07:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235699AbhIVLaD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Sep 2021 07:30:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0192B6112F;
        Wed, 22 Sep 2021 11:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632310114;
        bh=Wne4TnzNwCea4iyChQ94L2nuquoRNKhCUrYLwaaEZ5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jSsbWthGeiq9Yi8mYUDLhODAc9DF8/WIg5nUZoaU6I0RYtqoBlPMo6/yJvZD3p8QD
         Y5w0ErehI90/Eoh6XmMqDY07V4BljLJ9ttLgezufgElCfKXAw3YeX6vTJ8jjl2jd9U
         TEIWLfrReWYaOC29cut8/N64GPODNRe9J+Kq5rQLpPH7pSAgYWZ+e+BGxFedrErW5k
         gEMq1tJsW4EHIkK6aTxBPMywO+uTDb2Gc7PIA9HEWWhg7R5iJ7/SIITe9TfHdiPSuC
         vVeoRNbQRvUuspjHjoh9iijAGmZSPAI1mqm6X/a6PaYYfKkywm/RjZTCT4cSXtXb4S
         R86gv4urf0+ww==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mT0QS-0005Ok-R7; Wed, 22 Sep 2021 13:28:33 +0200
Date:   Wed, 22 Sep 2021 13:28:32 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Malte Di Donato <malte@neo-soft.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Possible bug in the cp210x kernel driver?
Message-ID: <YUsTYFOdMH/kQEyE@hovoldconsulting.com>
References: <zarafa.614a0e7a.4925.15cc733978d29bb6@neosoft.neo-soft.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zarafa.614a0e7a.4925.15cc733978d29bb6@neosoft.neo-soft.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 21, 2021 at 06:55:21PM +0200, Malte Di Donato wrote:
> Hi Johan,
> 
> Sorry about the html crap.
> (and double excuse that I've totally forgotten to change my webmail
> account surname since wedding ;)

Heh, good that you noticed in time so I can give you proper credit in
the commit message. ;)

Unfortunately your mails won't be seen by anyone else one the list
unless you can disable that html.

> Placed the patch code into my running debian kernel version
> 5.10.0-8-amd64 and put the two invocations to the
> cp210x_init_max_speed function (cp210x_get_fw_version not existent in
> my kernel source file).

Sounds good, we need to do the same when backporting the fix.

> Here's the dmesg with the patched driver:
> 
> [19089.502913] usbcore: registered new interface driver cp210x
> [19089.502951] usbserial: USB Serial support registered for cp210x
> [19096.084910] usb 3-1.2: new full-speed USB device number 9 using ehci-pci
> [19096.224973] usb 3-1.2: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
> [19096.225034] usb 3-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [19096.225037] usb 3-1.2: Product: CP2102 USB to UART Bridge Controller
> [19096.225040] usb 3-1.2: Manufacturer: Silicon Labs
> [19096.225043] usb 3-1.2: SerialNumber: 0001
> [19096.233460] cp210x 3-1.2:1.0: cp210x converter detected
> [19096.233939] cp210x 3-1.2:1.0: cp210x_init_max_speed - type = 0x02
> [19096.234458] cp210x 3-1.2:1.0: failed to get vendor val 0x370b size 8: 1

So the device returns one byte (instead of eight) as I suspected. Then
we can use this to detect these devices.

> [19096.236568] usb 3-1.2: cp210x converter now attached to ttyUSB0
> 
> I also compiled the cp2102-det and run it against the chip:
> 09: Got 128 bytes:  FF F0 FF FA 01 00 60 E3 16 00 FF F0 FF FA 01 00 60 E3 16 00 FF EC FF F8 01 00 80 4F 12 00 FF E6 FF F6 01 00 00 10 0E 00 FF D6 FF F0 01 00 00 CA 08 00 FF D0 FF EE 01 00 20 A1 07 00 FF CC FF EC 01 00 00 08 07 00 FF A2 FF DC 01 00 00 E8 03 00 FF A0 FF DC 01 00 90 D0 03 00 FF 98 FF D9 01 00 00 84 03 00 FF 64 FF C5 01 00 00 58 02 00 FF 44 FF B9 01 00 00 F4 01 00 FF 30 FF B2 01 00 00 C2 
> 0A: Got 1 bytes:  FF 
> 0B: Got 1 bytes:  02 
> Done.
> 
> Hope this helps?

It does, thanks. The 0B request above is the part-number request. The
original CP2102 I have here returns 8 bytes if that's requested.

> As I look on the "SerialNumber: 0001" in dmesg it may be possible that
> I've got a cloned chip on the chinesium usb/ttl converter...

Mine has 0001 as serial number as well, but the lack of event-mode and
different vendor request behaviour seems to suggest it could be a
counterfeit.

I'll reply to this mail with a fix that fixes the dropped character
issue by disabling event-insertion mode (and thus parity reporting) for
devices such as yours.

I've verified it here as well as I could, but could you give it a spin
with your device as well? If you want you can reply to the patch mail
with a Tested-by tag and I'll add that to the commit message as well.

Johan
