Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511DB19DDB0
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 20:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404400AbgDCSL4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 14:11:56 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41288 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403929AbgDCSLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 14:11:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id a24so3872292pfc.8;
        Fri, 03 Apr 2020 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=InL1nM5nwgThlKsD/4bkNX1qcE/bZXvGbtLxWiEV5Yo=;
        b=OxNu8hBJrUoQp2Lb2LIE/UM5hirqfD6c5uMcQCXC2u8pOw3HMfXarstJO/SPvZ/x8i
         BQe2iL6TEiAjxfoflrg9GDgbZmUFSh8CImE/isyKwE0HXK0NWjFvdWBlnJefkopigLAs
         hswZZMDAxa/GfH6bYsDLzLxtJem2o7n9R6JZ3ZIhMYuDfce8GXD2CFQ/kkR9k7vy9tz1
         bcDg9TYQ7l/V1htX4BFoA9GsDTYnA55u7mM7/DLaInC/lJxe6JhWwKupkIZ3LAXot4u2
         8Yd4v8YR5YukTm+WSgPlssyQAGFnGGIvWAmFENAQOFoIss7KRNDnFSg2+QaFJFGKI5qT
         3mWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=InL1nM5nwgThlKsD/4bkNX1qcE/bZXvGbtLxWiEV5Yo=;
        b=jyReMOwJbcd861kDszhjskoNMq0P/FH5zkmmJkos1mVsJBfZUmm9dnax7XVZ3vpzHi
         C9Lm1ue409UEMCL/YQYpjLNKlaW9sJnJs86EwiKZkyCHMB+Zl19LezbPOzGEd49JOwRW
         DROV/KGMsIfLFA0nmeabUu1WgQbc22Gt7D6hKix55PdgwnUAWGJxdTEQasWTTEm9CV9d
         gQHVEMLVJ2ZiguQmtJVsPVAHbyrlGWI/Pw2PhkvTxI/bF4IC2c0859Ks6oeSQ2DpTWOn
         DkzXu9Y1SVbJNa5BLWW2n2OzeL62fFhck1nwpAdj7qcfgtxVgN4TQbo+iE3Vhiqcrqxq
         c7fw==
X-Gm-Message-State: AGi0PubyibA0B+XHTVGRHapp+BjOhrco0DUgi7Q2JoliaoiLWx6bwTF/
        EfsNQl9BNOFL8PUtTPtoAQ==
X-Google-Smtp-Source: APiQypKjRNoAgzx/5wb/M/owzZxHRM/lRGtcZ2rOjqj2maD9tPRdTD1mkbejOsaR2Xm24xtV7NYdUA==
X-Received: by 2002:a62:87cc:: with SMTP id i195mr9725165pfe.75.1585937512702;
        Fri, 03 Apr 2020 11:11:52 -0700 (PDT)
Received: from madhuparna-HP-Notebook ([2402:3a80:d32:bec6:f832:439c:9244:ba33])
        by smtp.gmail.com with ESMTPSA id y28sm6275223pfp.128.2020.04.03.11.11.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 11:11:51 -0700 (PDT)
From:   Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date:   Fri, 3 Apr 2020 23:41:45 +0530
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        gregkh@linuxfoundation.org, hariprasad.kelam@gmail.com,
        colin.king@canonical.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org,
        andrianov@ispras.ru
Subject: Re: [PATCH] usb: host: u132-hcd: Remove u132_static_list
Message-ID: <20200403181145.GA7574@madhuparna-HP-Notebook>
References: <20200402232228.22395-1-madhuparnabhowmik10@gmail.com>
 <Pine.LNX.4.44L0.2004031038200.7035-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2004031038200.7035-100000@netrider.rowland.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 03, 2020 at 10:39:33AM -0400, Alan Stern wrote:
> On Fri, 3 Apr 2020 madhuparnabhowmik10@gmail.com wrote:
> 
> > From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > 
> > u132_static_list is a global list protected by u132_module_lock.
> > It is read in the u132_hcd_exit() function without holding the lock
> > thus may lead to data race.
> > However, it turns out that this list isn't used for anything useful
> > and thus it is okay to get rid of it.
> > Thus, remove the u132_static_list from u132-hcd module.
> > 
> > Found by Linux Driver Verification project (linuxtesting.org).
> > 
> > Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > ---
> >  drivers/usb/host/u132-hcd.c | 8 --------
> >  1 file changed, 8 deletions(-)
> > 
> > diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
> > index e9209e3e6248..52f70cf063ea 100644
> > --- a/drivers/usb/host/u132-hcd.c
> > +++ b/drivers/usb/host/u132-hcd.c
> > @@ -81,7 +81,6 @@ static DECLARE_WAIT_QUEUE_HEAD(u132_hcd_wait);
> >  static struct mutex u132_module_lock;
> >  static int u132_exiting;
> >  static int u132_instances;
> > -static struct list_head u132_static_list;
> >  /*
> >  * end of the global variables protected by u132_module_lock
> >  */
> 
> You forgot to remove the u132_list member from struct u132.
>
Thank you for letting me know, I will send the patch again with this
change.

Regards,
Madhuparna

> Alan Stern
> 
