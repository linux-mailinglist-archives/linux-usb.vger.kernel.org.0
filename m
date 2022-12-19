Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6369A650E2C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 16:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiLSPA6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 10:00:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiLSPAh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 10:00:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5C7DF70
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 07:00:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4161FB80E47
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 15:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FBAC433EF;
        Mon, 19 Dec 2022 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671462032;
        bh=mwIAlRO+fnJmISWacM9m0ULvYFPEO+JD1PgaYDX2bc8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f1PwitlHhu/fYiKz0+NlB7G59MVP7o7pyjTxh3ZITOb9wOzvhALhqV9ebiuT/fBAc
         E9PWWcmC3r56crF8GpcJ/5BI4XIFMuiRpdvdmVZWTyltXRGQysUC1+wnzK1dIkHmiT
         5Ufd1N673pOgpncqzwtCmcK37II9GLmSROzaKowQ=
Date:   Mon, 19 Dec 2022 16:00:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6B8jd7dHsa85Wny@kroah.com>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Bfx+Ksm/Qz3N8y@hilbert>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 12:57:43PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> Hello,
> 
> this is a popular in UK education board: https://microbit.org/
> - the currently sold (Version 2) one. It does on the same USB 3 things:
>   mass storage, ACM, and serial. Serial appears unknown to the kernel.
> 
> With Linux kernel 6.0.8 on x86_54, and various USB serial drivers installed, upon plugging into USB
> port, I see in dmesg:
> 
> [45460.035306] usb 1-3: new full-speed USB device number 10 using xhci_hcd
> [45460.166959] usb 1-3: New USB device found, idVendor=0d28, idProduct=0204, bcdDevice=10.00
> [45460.166965] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [45460.166967] usb 1-3: Product: BBC micro:bit CMSIS-DAP
> [45460.166968] usb 1-3: Manufacturer: Arm
> [45460.166970] usb 1-3: SerialNumber: 9905360200052833525e24a702a68552000000006e052820
> [45460.172168] usb-storage 1-3:1.0: USB Mass Storage device detected
> [45460.172538] scsi host1: usb-storage 1-3:1.0
> [45460.173203] cdc_acm 1-3:1.1: ttyACM0: USB ACM device
> [45460.175258] hid-generic 0003:0D28:0204.0005: hiddev96,hidraw0: USB HID v1.00 Device [Arm BBC micro:bit CMSIS-DAP] on usb-0000:00:14.0-3/input3
> [45460.175581] usbserial_generic 1-3:1.4: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [45460.175585] usbserial_generic 1-3:1.4: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [45460.175587] usbserial_generic 1-3:1.4: device has no bulk endpoints
> [45460.175818] usbserial_generic 1-3:1.5: The "generic" usb-serial driver is only for testing and one-off prototypes.
> [45460.175821] usbserial_generic 1-3:1.5: Tell linux-usb@vger.kernel.org to add your device to a proper driver.
> [45460.175823] usbserial_generic 1-3:1.5: generic converter detected

Is there some script adding this device id to the generic driver such
that you are binding to this device?  Did the script come with the
device?

How well does it work?  Why did the developer choose to use this generic
driver instead of a real one?

> [45460.175905] usb 1-3: generic converter now attached to ttyUSB0

It is not unknown, seems to bind here, but does it work?

thanks,

greg k-h
