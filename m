Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131E74AD7F6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353066AbiBHLzE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:55:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343656AbiBHLzD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 06:55:03 -0500
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 03:55:01 PST
Received: from smtp1.lauterbach.com (smtp1.lauterbach.com [62.154.241.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20F3DC03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 03:55:00 -0800 (PST)
Received: (qmail 3260 invoked by uid 484); 8 Feb 2022 11:48:17 -0000
X-Qmail-Scanner-Diagnostics: from ingpc2.intern.lauterbach.com by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.063407 secs); 08 Feb 2022 11:48:17 -0000
Received: from ingpc2.intern.lauterbach.com (HELO ingpc2) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gregkh@linuxfoundation.org>; 8 Feb 2022 11:48:17 -0000
Date:   Tue, 8 Feb 2022 12:48:17 +0100
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/1] usb: gadget: f_fs: Support zerocopy transfers
 via mmap.
Message-ID: <20220208124817.3bd884ba@ingpc2>
In-Reply-To: <YgJJi0q+/oV9SRq8@kroah.com>
References: <20220202172056.44722-1-ingo.rohloff@lauterbach.com>
        <20220202172056.44722-2-ingo.rohloff@lauterbach.com>
        <YgJJi0q+/oV9SRq8@kroah.com>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,

On Tue, 8 Feb 2022 11:44:27 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Wed, Feb 02, 2022 at 06:20:56PM +0100, Ingo Rohloff wrote:
> > This patch implements the same functionality for FunctionFS as
> > commit f7d34b445abc00e979b7 ("USB: Add support for usbfs zerocopy.")
> > did for USB host devio.c

> ...

> > +/* Check whether it's okay to allocate more memory for mmap */
> > +static int ffsm_increase_mmap_mem_usage(struct ffs_data *ffs, u64 amount)
> > +{
> > +	u64 lim;
> > +
> > +	lim = READ_ONCE(ffs->mmap_memory_mb);
> > +	lim <<= 20;
> > +
> > +	atomic64_add(amount, &ffs->mmap_mem_usage);
> > +
> > +	if (lim > 0 && atomic64_read(&ffs->mmap_mem_usage) > lim) {  
> 
> What prevents it from changing right after you read this?

Nothing.

First of all: I just used the same code as in "drivers/usb/core/devio.c"
functions "usbfs_increase_memory_usage()" and "usbfs_decrease_memory_usage()".

As far as I understand the code of these two functions, this code to imposes a
limit on the amount of kernel space memory, a user might allocate via "mmap"
calls.

The construction makes sure that when "ffsm_increase_mmap_mem_usage()" returns
successfully, it is guaranteed, that "mmap_mem_usage" *was* smaller/equal than 
"lim" at the time the atomic64_read() call was done.

Of course "mmap_mem_usage" might change immediately after the atomic64_read().
But as far as I analyzed, this still limits the total amount of memory
allocated, as long as you make sure that you do the allocation of memory
*after* "ffsm_increase_mmap_mem_usage()" returned successfully and you
deallocate the memory *before* you call "ffsm_decrease_mmap_mem_usage()".


> > +		atomic64_sub(amount, &ffs->mmap_mem_usage);  
> 
> Why not use a real lock instead of trying to do a fake one with this
> atomic variable?

I don't think there is a good reason using the "atomic" stuff:
I think this code path anyway is not hit that often (only when you mmap or
munmap buffers), so this should not have any noticeable impact on performance.

I just took the code from "drivers/usb/core/devio.c",
"usbfs_increase_memory_usage()".
I am still convinced it is correct.

You are of course right: You can easily use a lock here and this makes the
intention of the code a lot clearer I guess.

I will modify the patch accordingly.

so long
  Ingo
