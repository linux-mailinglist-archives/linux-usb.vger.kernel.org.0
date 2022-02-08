Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B45B4ADC63
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 16:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351347AbiBHPUu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 10:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351332AbiBHPUj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 10:20:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E36AC061579
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 07:20:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2E21F6159A
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 15:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DD1C004E1;
        Tue,  8 Feb 2022 15:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644333636;
        bh=efc9dst9JUAagJsc/BOpyCeDjkf0kfrhNyGGsRArHOI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=deVXKsXJgfX9JmgKQaQm3NLKVtjJZ+zqf+mi1g18NwezFLi8SqqEr/aF1icB5Maau
         DY+cKcP2fa9Di6zzTHER4w2nGihTYYseqk6taf0AofSaq7q6B2YEm5aE0UgLzStgxs
         76HjBaRKloyx+T2hjEtX81A1nv06t4bmKRC9Crac=
Date:   Tue, 8 Feb 2022 16:20:33 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Felix Becker <linux.felixbecker2@gmx.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [usbserial] device 0421:069a is supported, in fact.
Message-ID: <YgKKQSOuwBy1cQ6H@kroah.com>
References: <20220208125958.295e8a0b@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208125958.295e8a0b@gmx.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 01:00:48PM +0100, Felix Becker wrote:
> Dear "linux-usb" mailing list people,
> 
> I was directed here by the email-bot of Greg Kroah-Hartman.
> 
> First I was contactim him directly, since at [1] it is written that
> things regarding the `usbserial` driver should be directed to him,
> which in turn I was getting from a question on where-to-address-this
> which I asked here [2].
> 
> 
> Here the issue I want to address:
> 
> 
> I have a device which is ignored by any in-kernel driver, but when I
> tell `usbserial` manually to drive that device (via
> `modprobe usbserial vendor=0x0421 product=0x069a`), it provides two
> serial ports where useful things can be made via the second.
> 
> It is a Nokia 130 mobile phone, and it provides an "AT"-style serial
> interface where things like address book synchronisation can be made.
> 
> It has the following vendor:product number 0421:069a.
> 
> So I suggest to you to add that device as a supported device to
> `usbserial`, so that hotplug works.
> 
> In `lsusb` it shows up as
> `Nokia Mobile Phones 130 [RM-1035] (Charging only)`, so the string
> `(Charging only)` should be removed then, too.
> 
> (The phone itself has two USB modes: "Memory card" (which will make it
> behave as mass storage with access to the microSD-card) and a mode
> which is called in the phone's menu as "Charging only", which is the
> mode interesting here and which in fact is more than "carging only").

Can you provide the output of `lsusb -v -d 0421:069a` for us?

thanks,

greg k-h
