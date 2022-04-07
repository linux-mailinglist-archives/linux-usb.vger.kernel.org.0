Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A92624F81E2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 16:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344103AbiDGOi6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 10:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344023AbiDGOi4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 10:38:56 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0091112A8E3
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 07:36:55 -0700 (PDT)
Received: (qmail 223946 invoked by uid 1000); 7 Apr 2022 10:36:55 -0400
Date:   Thu, 7 Apr 2022 10:36:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Lin Ma <linma@zju.edu.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, mdharm-usb@one-eyed-alien.net
Subject: Re: [PATCH v0] USB: storage: karma: fix rio_karma_init return
Message-ID: <Yk73B5jKKMoYFCoj@rowland.harvard.edu>
References: <20220406100259.6483-1-linma@zju.edu.cn>
 <Yk2tR4iEr5/T6o+h@rowland.harvard.edu>
 <18ed9d8e.3c7eb.1800193253f.Coremail.linma@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18ed9d8e.3c7eb.1800193253f.Coremail.linma@zju.edu.cn>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 07, 2022 at 09:11:02AM +0800, Lin Ma wrote:
> Hi Alan,
> 
> > Not exactly.  rio_karma_init() is a usb-storage initFunction (see 
> > the usb_stor_acquire_resources() routine in usb.c), and these functions 
> > are supposed to return either 0 or a negative error code.
> > 
> > So you should make the routine return -ENOMEM, not 
> > USB_STOR_TRANSPORT_ERROR.  You can simplify the patch by changing the 
> > line where ret is defined; initialize it to -ENOMEM rather than to 0
> 
> Thanks for pointing out that, and as I dig deeper, I found that the use of error code
> is "totally a mess" in the usb storage.
> 
> Taking the initfunction for example, there are below 6 cases
> 1 karam: rio_karma_init()
> 2 realtek_cr: init_realtek_cr()
> 3 aluda: init_alauda()
> 4 isd200: isd200_init_info()
> 5 shuttle_usbat: init_usbat()
> 6 onetouch: onetouch_connect_input()
> 
> The (1) is erroneously return 0 even when the kzalloc if failed, must be fixed.
> The (2) and (6) uses -ENOMEM when allocation fails. (2) will also return -EIO when
> another kzalloc fails or rts51x_check_status() fails.
> The (3) uses USB_STOR_TRANSPORT_ERROR when allocation fails (seems that I learned a
> mistake from here).
> The (4) uses custom ISD200_ERROR when allocation fails.
> The (5) uses constant 1 when allocation fails.
> 
> It's worth pointed out that (except (1)), the others though not following the standard,
> it won't cause bad thing because the callsite of these initFunction just check whether the
> return is zero.

That isn't true.  Look again at the code:

> /*
>  * Just before we start our control thread, initialize
>  * the device if it needs initialization
>  */
>  if (us->unusual_dev->initFunction) {
>      p = us->unusual_dev->initFunction(us);
>      if (p)
>          return p;

If p isn't zero then this function uses p as its return value.  Thus it 
does more with p than just check whether it is zero.

>  }
> 
> I will then send patches to make sure all initFunction follow the standard.
> 
> > 
> > And don't forget the error code for when the rio_karma_send_command() 
> > call fails.  In that case the return value should be -EIO.
> > 
> 
> Okay, will add this in next version of this patch.
> 
> > 
> > Shouldn't this also be marked for the stable kernels?
> > 
> 
> Sorry, I didn't get it, do you mean add another tag like "Cc: stable@vger.kernel.org"?
> Or I just need to CC the mail to stable mail list?

I mean add another tag.  See the description of Option 1 in 
Documentation/process/stable-kernel-rules.rst.

Alan Stern

> 
> Regards
> Lin
