Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD9374AF3EB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 15:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiBIOSr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 09:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234418AbiBIOSq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 09:18:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983A2C0613C9
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 06:18:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 53538B8219A
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 14:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B50C340E7;
        Wed,  9 Feb 2022 14:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644416319;
        bh=4zicxh+a6ACRFkFboxRalWyOUJwutm8YVw4BZrcXJZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FAyg/jrBL3G54a+JHqD7IoX+HUJlaIJyCZpIALCjdmN/Nxf5Iv7WOroyWJ1C/G+Ko
         FnCBZrXI20H+LHFNa4IhiWGMXx957RTSKdRSL65yIIAgvqkeSO1YLJOao1Ebu7Q7EN
         Aeg3Ip2U0W8Aa4iLzJSUIe7qsB0Nr+RIn+4siDI+2w4SH6ZzaC0Mvk9iQOgG8FJOB7
         hLhIvIh9lLIMFg+pWJmSAeLBA7Qhb6ZN4WCQLgThbBDCd+h9vaosxJVGWXEtJzRAgx
         0n8H+ZQy515mjWc6ntUJYZgcGamUoOyXjztYJqC+gPDcgtnZjU54Sg71VuMTPp0zyJ
         05EFhB3D8GxDg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nHnnX-0002E3-8I; Wed, 09 Feb 2022 15:18:19 +0100
Date:   Wed, 9 Feb 2022 15:18:19 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmytro Bagrii <dimich.dmb@gmail.com>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jan-Niklas Burfeind <kernel@aiyionpri.me>,
        linux-usb@vger.kernel.org,
        Frank A Kingswood <frank@kingswood-consulting.co.uk>,
        Frank Zago <frank@zago.net>
Subject: Re: [PATCH] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YgPNK1v541ohUMtv@hovoldconsulting.com>
References: <20220207000822.697343-1-dimich.dmb@gmail.com>
 <YgJHRKQHQheKTwjU@kroah.com>
 <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6df2c9e6-8757-d5e4-0c27-d47f53bee2e1@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 03:34:19PM +0200, Dmytro Bagrii wrote:
> On 08.02.22 12:34, Greg KH wrote:
> > On Mon, Feb 07, 2022 at 02:08:23AM +0200, Dmytro Bagrii wrote:
> >> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.

> >> CH341A has three different modes of operation selectable either by
> >> hardware pin connections or by external EEPROM configuration. Each
> >> mode is represented by corresponding product ID:
> >>
> >> 0x5523: Asyncronous Serial Interface
> >> 0x5584: Parallel Printer Interface
> >> 0x5512: EPP/MEM Interface
> > 
> > That does not corrispond with what Jan-Niklas said in the original
> > commit.
> 
> The page mentioned in the original commit is unavailable for me for some 
> reason.
> 
> I refer to the chip manufacturer documentation from here: 
> http://wch-ic.com/downloads/CH341DS1_PDF.html.
> 
> I have this kind of CH341A programmer: 
> http://www.chinalctech.com/cpzx/Programmer/Serial_Module/266.html
> 
> When mode selection jumper is set to UART:
> 
> [52206.834474] usb 1-4.1: new full-speed USB device number 10 using xhci_hcd
> [52206.925482] usb 1-4.1: New USB device found, idVendor=1a86, 
> idProduct=5523, bcdDevice= 3.04
> [52206.925494] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
> SerialNumber=0
> [52206.973701] usbcore: registered new interface driver ch341
> [52206.973710] usbserial: USB Serial support registered for ch341-uart
> [52206.973720] ch341 1-4.1:1.0: ch341-uart converter detected
> [52206.974424] usb 1-4.1: ch341-uart converter now attached to ttyUSB0
> 
> ch341 creates /dev/ttyUSB0 and it works as a serial port, as expected.
> 
> When mode selection jumper is set to I2C/SPI (it uses EPP/MEM Interface):
> 
> [52413.942116] usb 1-4.1: new full-speed USB device number 11 using xhci_hcd
> [52414.033085] usb 1-4.1: New USB device found, idVendor=1a86, 
> idProduct=5512, bcdDevice= 3.04
> [52414.033097] usb 1-4.1: New USB device strings: Mfr=0, Product=0, 
> SerialNumber=0
> [52414.040928] ch341 1-4.1:1.0: ch341-uart converter detected
> [52414.041930] usb 1-4.1: ch341-uart converter now attached to ttyUSB0
> 
> ch341 creates /dev/ttyUSB0 but it doesn't work.
> 
> To use CH341A programmer as I2C/SPI converter either external module is 
> required or userspace tools must be used. But they don't work until 
> ch341 handles 1a86:5512.
> 
> If unbind device from ch341 module:
> 
> # echo 1-4.1:1.0 > /sys/bus/usb/drivers/ch341/unbind
> 
> I2C/SPI tools start to work correctly.
> 
> >> (See "5.3.Function configuration" in datasheet at wch-ic.com/downloads/CH341DS1_PDF.html)
> >>
> >> When CH341A is configured as EPP/MEM Interface it appears as 1a86:5512 and being mistakenly
> >> handled by ch341 USB serial driver.
> >>
> >> It is possible to use CH341A in EPP/MEM mode only if ch341 module is blacklisted, but it must be
> >> unblacklisted every time to use CH341A as a serial converter. Also obviously it is impossible
> >> to use two CH341A boards in different modes simoultaneously.
> > 
> > Please wrap your lines at 72 columns.
> 
> Sure. Should i submit new patch verіon then?

Please do so. But make sure you read this thread first if you haven't
already:

	https://lore.kernel.org/r/YJ0OCS/sh+1ifD/q@hovoldconsulting.com

I don't remember all the details, but judging from a quick look it seems
we're just waiting for someone to resend the revert with a proper
explanation.

It would be good if Jan-Niklas could chime in too and confirm if he's
able to use the device in UART mode instead.

Johan
