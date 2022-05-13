Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87C3525BB5
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 08:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377395AbiEMGhe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 02:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377403AbiEMGhc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 02:37:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E664D6623E
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 23:37:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8CE07B82C4C
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 06:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52404C34100;
        Fri, 13 May 2022 06:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652423847;
        bh=xDobymSu52pnem9ANQrcwXGVDvmrIS0tWGQwCgIjpEE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tz7gmi2lIkOxh17npBrtEH9J8+6gXHn28MEz/Oz7nNHWEV7+HaAIM7jElBPhUIA7v
         LISZgGQ83r9/nUfRzwsNKhUeRudCJCqV9QBZZ91lojthYuqv8lx1l1yD/8IdM6bSQW
         YUpQgbNkIhGsRvsqmNoAVRfa7oeERXo6/MN/deZYvMJcqlzLh3ICz7RVE87VSAaGbR
         yL+mbqOE8Avh77wU+jIC3otBo13eMa0+5FRxqCZeTVRhuBehKFoWJFsAm3OJTEBnyA
         nEibJk6dBCrEWhN4chs9tb+KAK3G3GHWVRl3I/aNuWCLKIQivtmmTcWyK78YwWaiKj
         vv7b5cC44UxqA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1npOvT-0006Ks-2o; Fri, 13 May 2022 08:37:23 +0200
Date:   Fri, 13 May 2022 08:37:23 +0200
From:   Johan Hovold <johan@kernel.org>
To:     John Paul Morrison <jmorrison@bogomips.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: problems with ch341 driver USB RS485 in Linux but not Windows
Message-ID: <Yn38owQihoRfc+z4@hovoldconsulting.com>
References: <CAO-kYtGwa+CCHGOotmtmJQ6drEVp6hJZDBywAV4JPnCmzBv9qw@mail.gmail.com>
 <YlP1poVgy0bAP3MN@hovoldconsulting.com>
 <CAO-kYtGv90gfb3_yHGFHqPYEXkwCPohTRmVwSaXBLfyLMppJbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-kYtGv90gfb3_yHGFHqPYEXkwCPohTRmVwSaXBLfyLMppJbw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 23, 2022 at 03:51:46PM -0700, John Paul Morrison wrote:
> Hi Johan
> 
> This is the debugging output from the problem device - the chip version
> does not match and there's no break message or quirk flags.
> I compared the circuit boards and the problem device has a 12 MHz crystal
> and the chip is labelled  WCH CH340G.
> The working device doesn't have a crystal and the chip is unmarked or
> scrubbed. The circuit boards and construction appear the same.
> 
> Comparing datasheets the 340 requires an external crystal while the 341 can
> use an internal oscillator, so the working devices have a 341 of some sort.
> 
> I'll try a usbpcap/wireshark of the windows device - anything to look for?

Compare the control requests sent during probe and open with those of
the working device. In theory the bulk data could also packaged
differently but start with looking at the control requests.

You never answered my question on how this device is failing to work.
Is receive working at all? Do you see anything being transmitted even if
garbled?

> Another question - the CH340/341 datasheets list the maximum speed as 2
> Mbps, and the MAX485 line diver says it can do 2.5 Mbps.
> I have not been able to get them to work at 2 Mbps with either Linux or
> Windows but they work at 1.5 Mbps.
> Data is completely corrupted at 2 Mbps as if the baud rate is mismatched.
> Curious if anyone has these working above 1.5 Mbps.

I'm pretty sure we got both 2 Mbps and 3 Mbps to work accurately (at
least at TTL level). See commit 35714565089e ("USB: serial: ch341:
reimplement line-speed handling") that went into v5.5.

> [2419514.614782] usb 3-3.1: new full-speed USB device number 34 using
> xhci_hcd
> [2419514.821688] usb 3-3.1: New USB device found, idVendor=1a86,
> idProduct=7523, bcdDevice= 2.63
> [2419514.821694] usb 3-3.1: New USB device strings: Mfr=0, Product=2,
> SerialNumber=0
> [2419514.821697] usb 3-3.1: Product: USB2.0-Serial
> [2419514.831394] ch341 3-3.1:1.0: ch341-uart converter detected
> [2419514.831434] usb 3-3.1: ch341_control_in - (5f,0000,0000,2)
> [2419514.832185] usb 3-3.1: Chip version: 0x31

Note that the CH340G I have is here working correctly, but the chip
version is reported as 0x30 like your functioning device.

> [2419514.832190] usb 3-3.1: ch341_control_out - (a1,0000,0000)
> [2419514.832680] usb 3-3.1: ch341_control_out - (9a,1312,b282)
> [2419514.833181] usb 3-3.1: ch341_control_out - (9a,2518,00c3)
> [2419514.833685] usb 3-3.1: ch341_control_out - (a4,ffff,0000)
> [2419514.834987] usb 3-3.1: ch341-uart converter now attached to ttyUSB0

Johan
