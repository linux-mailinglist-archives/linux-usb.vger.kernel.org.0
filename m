Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FDB4FB78B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 11:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344420AbiDKJep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 05:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiDKJeo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 05:34:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86F62529A
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 02:32:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8300061022
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 09:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4131C385A4;
        Mon, 11 Apr 2022 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649669549;
        bh=g8mqsCsDp1Il+1rZfUhFT8Muq38HY2n8IZouRZa4x2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JpnfLUxzBVJD0NwV7VHDvi27eaZ6C/nN+jr39+BYuL+k3RyPP9napYMQAZPVnwfdX
         fbVw+giIM7cwGc3g2u5qz0YOJIP0UYIpCiWyFfRANw78xHoQzk+/6DMXVtJSoolJyd
         /eVf0W15iVhvYTRfovnAnF7btWR3iNswlW2dUTdApmCTH4xjPPUFfqJ3PppCLhoLxL
         8LQWvedE1CQqS3fE4uE3z1W0W+EyDOVjabsI2zVG5gtZ6pRtnNK0n/53f34EQVoXWo
         Yk9nRsBIhEl9shfnBh1AajCIepqPpv2n8qPGNaPRH9avkUEq5+rGChni1K9saT/AxG
         vILtEHAkcsZfQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ndqPG-0003Tz-MI; Mon, 11 Apr 2022 11:32:23 +0200
Date:   Mon, 11 Apr 2022 11:32:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     John Paul Morrison <jmorrison@bogomips.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: problems with ch341 driver USB RS485 in Linux but not Windows
Message-ID: <YlP1poVgy0bAP3MN@hovoldconsulting.com>
References: <CAO-kYtGwa+CCHGOotmtmJQ6drEVp6hJZDBywAV4JPnCmzBv9qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-kYtGwa+CCHGOotmtmJQ6drEVp6hJZDBywAV4JPnCmzBv9qw@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 06, 2022 at 05:40:36PM -0800, John Paul Morrison wrote:
> Hi
> 
> I have a few CH340/341 USB RS485 adapters - they all look identical
> and use the ch341 driver with ID 1a86:7523 but I've found one that
> reports a different iProduct and bcdDevice from the others. They all
> work fine in Windows but one has problems transmitting in Linux.
>
> I have tried this on a few different machines/kernels.
> 5.13.0-30-generic #33~20.04.1-Ubuntu SMP Mon Feb 7 14:25:10 UTC 2022 x86_64
> 5.10.92-v7+ #1514 SMP Mon Jan 17 17:36:39 GMT 2022 armv7l
> 5.10.93.2-microsoft-standard-WSL2 #2 SMP Sat Mar 5 13:40:04 PST 2022 x86_64
> 
> miniterm and dmesg offer some clues - the problem device shows
> different CTS/DSR states
> I have not been able to work around this with stty or in miniterm
> 
> problem device
> miniterm
> --- RTS: active    DTR: active    BREAK: inactive
> --- CTS: inactive  DSR: inactive  RI: inactive  CD: inactive
> --- software flow control: inactive
> --- hardware flow control: inactive
> 
> In Windows the Termite com program shows CTS/DSR/RI/CD active
> If I run socat in Windows sharing the serial port, and socat Linux
> using a pty the Linux serial application works perfectly but fails
> using the ch341 driver directly
> 
> dmesg
> [702953.276954] usb 3-4: new full-speed USB device number 2 using xhci_hcd
> [702953.426006] usb 3-4: New USB device found, idVendor=1a86,
> idProduct=7523, bcdDevice= 2.63
> [702953.426014] usb 3-4: New USB device strings: Mfr=0, Product=2,
> SerialNumber=0
> [702953.426017] usb 3-4: Product: USB2.0-Serial
> [702953.426919] ch341 3-4:1.0: ch341-uart converter detected
> [702953.427336] usb 3-4: ch341-uart converter now attached to ttyUSB1

So it seems you've come across a device that uses a different protocol.
The CH340 I have here also has bcdDevice set to 2.54 as your working
device below do.

What chip version is the driver reporting if you enable debugging? For
example, using:

	echo module ch341 +p > /sys/kernel/debug/dynamic_debug/control

I have "Chip version: 0x30" here. Do you see any message about "break
control not supported" during probe?

You mention that modem status reporting and transmit doesn't work, but
what about receive?

I'm afraid I can't suggest much else but possibly trying to trace the
USB requests that Windows driver uses and see if you can confirm any
differences and if needed reverse engineer the new protocol.
 
> working device
> miniterm
> --- RTS: active    DTR: active    BREAK: inactive
> --- CTS: active    DSR: active    RI: active    CD: active
> --- software flow control: inactive
> --- hardware flow control: inactive
> 
> dmesg
> [  699.616711] usb 1-1.4: new full-speed USB device number 7 using ehci-pci
> [  699.726105] usb 1-1.4: New USB device found, idVendor=1a86,
> idProduct=7523, bcdDevice= 2.54
> [  699.726113] usb 1-1.4: New USB device strings: Mfr=0, Product=2,
> SerialNumber=0
> [  699.726117] usb 1-1.4: Product: USB2.0-Ser!
> [  699.726517] ch341 1-1.4:1.0: ch341-uart converter detected
> [  699.727292] ch341-uart ttyUSB0: break control not supported, using
> simulated break
> [  699.727411] usb 1-1.4: ch341-uart converter now attached to ttyUSB0

Johan
