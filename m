Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF194DCEBC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 20:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbiCQTXV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 15:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238093AbiCQTXM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 15:23:12 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C9872217C4B
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 12:21:54 -0700 (PDT)
Received: (qmail 7452 invoked by uid 1000); 17 Mar 2022 15:21:53 -0400
Date:   Thu, 17 Mar 2022 15:21:53 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: Re: [linux-next:master] BUILD REGRESSION
 8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
Message-ID: <YjOKUZ4nxs8EGg8p@rowland.harvard.edu>
References: <6232d299.9omOW8g6S6l31UFc%lkp@intel.com>
 <YjNfHsqfjPqBMejZ@rowland.harvard.edu>
 <CAHk-=whkHmpA2FM6Ve8bUu7hcyWBLznQU8RJzOdpfa-0EVPCpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whkHmpA2FM6Ve8bUu7hcyWBLznQU8RJzOdpfa-0EVPCpQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 17, 2022 at 12:11:59PM -0700, Linus Torvalds wrote:
> On Thu, Mar 17, 2022 at 9:17 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > These warnings seem pretty bogus.  Their meaning isn't entirely clear,
> > but the statements they complain about copy a 1-byte location to a
> > structure consisting of eight 1-bit fields (or the equivalent).
> 
> bit field sizes are not well-defined by the standard.
> 
> Eight 1-bit bitfields may well be an "int", with just 8 bits used (and
> it might be the high 8 bits of the 'int').
> 
> The fact that you declare them with "char member:1" does *not* mean
> that the bitfield is encoded in a char. It might be. Or it might not
> be.
> 
> "packed" may or may not help.
> 
> The basic fact is that bitfields simply are not hugely well-specified.
> They are a convenience feature, not a "this is the layout in memory"
> feature.
> 
> The fix for the warning itself would probably something along the lines of this:
> 
>     --- a/drivers/usb/storage/ene_ub6250.c
>     +++ b/drivers/usb/storage/ene_ub6250.c
>     @@ -2400,7 +2400,6 @@ static int ene_ub6250_resume(struct
> usb_interface *iface)
> 
>      static int ene_ub6250_reset_resume(struct usb_interface *iface)
>      {
>     -       u8 tmp = 0;
>             struct us_data *us = usb_get_intfdata(iface);
>             struct ene_ub6250_info *info = (struct ene_ub6250_info
> *)(us->extra);
> 
>     @@ -2412,10 +2411,9 @@ static int ene_ub6250_reset_resume(struct
> usb_interface *iface)
>              * the device
>              */
>             info->Power_IsResum = true;
>     -       /*info->SD_Status.Ready = 0; */
>     -       info->SD_Status = *(struct SD_STATUS *)&tmp;
>     -       info->MS_Status = *(struct MS_STATUS *)&tmp;
>     -       info->SM_Status = *(struct SM_STATUS *)&tmp;
>     +       info->SD_Status = (struct SD_STATUS) { .Ready = 0,};
>     +       info->MS_Status = (struct MS_STATUS) { };
>     +       info->SM_Status = (struct SM_STATUS) { };
> 
>             return 0;
>      }
> 
> but the fact is, using bitfields there is simply WRONG. Because this
> code that sets these fields from the hardware results:
> 
>         info->SD_Status =  *(struct SD_STATUS *) bbuf;
> 
> is fundamentally buggy. You are assuming little-endian bitfields. That
> is just not well-defined.
> 
> Just don't do this. Use 'unsigned char' to specify that you want a
> byte, and use actual flags values to test the bits in that byte.
> Because that is actually well-defined and works.

Got it.  Thanks for the advice; I'll create a suitable patch.

Alan Stern

(PS: Sorry about the messed up email address in the CC: list.  I must 
have left out the <> characters when typing it in by hand.)
