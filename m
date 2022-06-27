Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84FE55C97D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbiF0M5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 08:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233710AbiF0M5X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 08:57:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674E8BC02
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 05:57:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 20ED4B81123
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 12:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8FEC3411D;
        Mon, 27 Jun 2022 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656334639;
        bh=n+Fl3O86p3ACattygvMTLHKC3tBqG6ZbrLJMbEj2OQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uVvQ/91625a1VSKlZinR+1mE4YTGt4uMRWnCdUqZIpvqtymEmWqSTD4YrL/is+83s
         7teOKofHzVYiNQ7erHiZ8zGSDHYC0dd/BJL0TsXc8fRrz5o/lKDzmw/sZc5N5xoemy
         PzQ+4Ig/3lqcvETW2K4Q/WR/mWj4LJ474omCxZoA=
Date:   Mon, 27 Jun 2022 14:57:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jookia <contact@jookia.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: acm_port_shutdown hangs for 30 seconds
Message-ID: <YrmpLXcPeHW4fnvz@kroah.com>
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiynBKeGJCMEkgyO@novena-choice-citizen>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 13, 2022 at 12:58:28AM +1100, Jookia wrote:
> Hello there,
> 
> I've been banging my head against this issue over the years but sat down
> and started to debug it today.
> 
> When I try to quit GNU screen, minicom or another serial program it
> sometimes hangs for around 30 seconds.
> 
> To reproduce I do this:
> 
> 1. Connect an Arduino Micro with stock LED blink firmware
> 2. Run 'screen /dev/ttyACM1 9600'
> 3. Type some letters (no response from the board is given)
> 4. Quit in some way
> 
> If I skip step 3 (typing letters), the hang does not happen.
> 
> In userspace the hang happens at a call to close() on the TTY, and using
> perf and ftrace it looks to be spending a lot of time poisoning urbs in
> acm_port_shutdown.
> This kind of makes sense to me as there is some in flight data to be
> sent and there's no acknowledgement coming from the chip.
> 
> I've had this issue with embedded Linux boards too that for some reason
> or another have stopped functioning.
> The current solution I have is to forcefully unplug the board, but
> that's not ideal.
> 
> My questions are:
> 
> - Is this a bug?

It's a bug in your hardware, yes.

> - Can I reduce the timeout somehow?

You could, but then you risk the problem of hardware that needs delays
to not work properly.

What host controller driver is this showing up on?

thanks,

greg k-h
