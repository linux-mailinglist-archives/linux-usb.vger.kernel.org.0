Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2DA64ADC76
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 16:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiBHPVy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 10:21:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379858AbiBHPVx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 10:21:53 -0500
X-Greylist: delayed 98 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 07:21:52 PST
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6A6D1C061579
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 07:21:52 -0800 (PST)
Received: (qmail 529266 invoked by uid 1000); 8 Feb 2022 10:21:51 -0500
Date:   Tue, 8 Feb 2022 10:21:51 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: gadget: f_fs: Support zerocopy transfers via
 mmap.
Message-ID: <YgKKj46jN1zGyqYR@rowland.harvard.edu>
References: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
 <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
 <YgJJi0q+/oV9SRq8@kroah.com>
 <20220208124817.3bd884ba@ingpc2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208124817.3bd884ba@ingpc2>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 12:48:17PM +0100, Ingo Rohloff wrote:

> > > +		atomic64_sub(amount, &ffs->mmap_mem_usage);  
> > 
> > Why not use a real lock instead of trying to do a fake one with this
> > atomic variable?
> 
> I don't think there is a good reason using the "atomic" stuff:
> I think this code path anyway is not hit that often (only when you mmap or
> munmap buffers), so this should not have any noticeable impact on performance.
> 
> I just took the code from "drivers/usb/core/devio.c",
> "usbfs_increase_memory_usage()".
> I am still convinced it is correct.
> 
> You are of course right: You can easily use a lock here and this makes the
> intention of the code a lot clearer I guess.
> 
> I will modify the patch accordingly.

If you also feel like making a similar change to the code in devio.c, it 
would be welcome.

Alan Stern
