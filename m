Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B32A27F7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 11:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgKBKNz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 05:13:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728320AbgKBKNw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 05:13:52 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D32C0617A6
        for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2020 02:13:51 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w14so13846402wrs.9
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2020 02:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=qEpMw23gik0Zy4VDnek4EfIoIErvpNQjzilx/+sMN14=;
        b=c3dnaK1I7lvCJTtmqJQs/DPW2BW/maLvV/VYfg+kYeVwT6orwEGYCxHihWzDGdv775
         cKwmIppr3+zF89JMQf9kzr8yMQ1Z2dP2k8DOj8EbE4600pB1eDpbWxenVHsKfN2J1AFA
         Eb7uO4Lr4MkdDsEpz7whYQJb9lrsSGgBY2/7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=qEpMw23gik0Zy4VDnek4EfIoIErvpNQjzilx/+sMN14=;
        b=T5jA1QYAb4XjRlTW/aIuObEawfPAx2FmXHtMrngRhaDsSx6JonXt7j25KCFWj8hq1U
         AQ5Dn8gqASLIcyxmt3fn2yPuQPJWW3FqsMAQKg3ituDQUkhuuJk1+vLbJ2M1t5nWsvEq
         2aGXMuh1uD17Ha8VEna4bZslQ4pjddfq0qqJZtLv4Y95vL51tp8tTZ54k7c1+6a91Rzv
         OtwaTIfI+Awjpm8VPl4+qIKEF2UmTUM6mIu9nTwNIuCsJk1X+nw1aOlVy1uOnruJB766
         Xfiam3VLElUWhXUCr2KiGb/n6gz+ykQ9iQYI5B2/ImP1ySD0kWtzAwBLdWkhsT/8yjJA
         7Zjw==
X-Gm-Message-State: AOAM530DN2S8cOUZQQQx7q7MMS7yybBIH7QrCOzp+5mFgY/4FDWTScJK
        F9tIDpTmkks7j0yd/B3vptCV9g==
X-Google-Smtp-Source: ABdhPJykHwAOQmxI8pX8lATJv4ibSQNph/5KwF/5QCKMhFdPKihwExX/WqcndN45HJE7L1TrACJkIQ==
X-Received: by 2002:adf:ea0b:: with SMTP id q11mr19504135wrm.80.1604312029917;
        Mon, 02 Nov 2020 02:13:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id s9sm24415586wrf.90.2020.11.02.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 02:13:49 -0800 (PST)
Date:   Mon, 2 Nov 2020 11:13:47 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Peilin Ye <yepeilin.cs@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] console: Remove dummy con_font_op() callback
 implementations
Message-ID: <20201102101347.GN401619@phenom.ffwll.local>
Mail-Followup-To: Jiri Slaby <jirislaby@kernel.org>,
        Peilin Ye <yepeilin.cs@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        George Kennedy <george.kennedy@oracle.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
 <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <a8157089-bc72-c409-c7cc-2fd7eb087ebc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8157089-bc72-c409-c7cc-2fd7eb087ebc@kernel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 02, 2020 at 10:47:55AM +0100, Jiri Slaby wrote:
> On 02. 11. 20, 10:36, Peilin Ye wrote:
> > `struct console_font` is a UAPI structure, thus ideally should not be
> > used for kernel internal abstraction. Remove some dummy .con_font_set,
> > .con_font_default and .con_font_copy `struct consw` callback
> > implementations, to make it cleaner.
> 
> ESEMANTIC_ERROR.
> 
> 1) What do you refer to with the last "it"?
> 
> 2) What's the purpose of mentioning struct console_font at all?
> 
> 3) Could you clarify whether you checked it is safe to remove the hooks?
> 
> 4) All the hooks now return ENOSYS for both consoles (and not 0). Is this
> intentional?
> 
> I know answers to the first 3 questions, but you need to elaborate a bit in
> the commit log to connect those sentences. Esp. for people not dealing with
> the code on a daily basis. Ad 4) I am not sure.

Yup the behaviour change from 4) needs to be called out. I think this
should then also be done as part of the large patch series to remove the
dummy functions from all console drivers.

I don't expect the errno change to cause trouble, and it's the more honest
errno - changing fonts not supported is the truth. But if it is, we can
patch that up appropriately when we get a regression report. That's kinda
unavoidable with old crufty uapi like this one here.

Also a bikeshed: Additional information like the patch changelog or
reasons why you do something is imo best to include in the commit message
itself. It ends up looking a bit less tidy sometimes, but often there's
crucial information in these parts that was accidentally left out from the
commit message.
Thanks, Daniel
> 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >    - [v2 2/2] no longer Cc: stable, so do not Cc: stable
> > 
> > Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/
> > 
> >   drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
> >   drivers/video/console/dummycon.c        | 20 --------------------
> >   2 files changed, 41 deletions(-)
> > 
> > diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
> > index c63e545fb105..dfa0d5ce6012 100644
> > --- a/drivers/usb/misc/sisusbvga/sisusb_con.c
> > +++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
> > @@ -1345,24 +1345,6 @@ static int sisusbdummycon_blank(struct vc_data *vc, int blank, int mode_switch)
> >   	return 0;
> >   }
> > -static int sisusbdummycon_font_set(struct vc_data *vc,
> > -				   struct console_font *font,
> > -				   unsigned int flags)
> > -{
> > -	return 0;
> > -}
> > -
> > -static int sisusbdummycon_font_default(struct vc_data *vc,
> > -				       struct console_font *font, char *name)
> > -{
> > -	return 0;
> > -}
> > -
> > -static int sisusbdummycon_font_copy(struct vc_data *vc, int con)
> > -{
> > -	return 0;
> > -}
> > -
> >   static const struct consw sisusb_dummy_con = {
> >   	.owner =		THIS_MODULE,
> >   	.con_startup =		sisusbdummycon_startup,
> > @@ -1375,9 +1357,6 @@ static const struct consw sisusb_dummy_con = {
> >   	.con_scroll =		sisusbdummycon_scroll,
> >   	.con_switch =		sisusbdummycon_switch,
> >   	.con_blank =		sisusbdummycon_blank,
> > -	.con_font_set =		sisusbdummycon_font_set,
> > -	.con_font_default =	sisusbdummycon_font_default,
> > -	.con_font_copy =	sisusbdummycon_font_copy,
> >   };
> >   int
> > diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
> > index 2a0d0bda7faa..f1711b2f9ff0 100644
> > --- a/drivers/video/console/dummycon.c
> > +++ b/drivers/video/console/dummycon.c
> > @@ -124,23 +124,6 @@ static int dummycon_switch(struct vc_data *vc)
> >   	return 0;
> >   }
> > -static int dummycon_font_set(struct vc_data *vc, struct console_font *font,
> > -			     unsigned int flags)
> > -{
> > -	return 0;
> > -}
> > -
> > -static int dummycon_font_default(struct vc_data *vc,
> > -				 struct console_font *font, char *name)
> > -{
> > -	return 0;
> > -}
> > -
> > -static int dummycon_font_copy(struct vc_data *vc, int con)
> > -{
> > -	return 0;
> > -}
> > -
> >   /*
> >    *  The console `switch' structure for the dummy console
> >    *
> > @@ -159,8 +142,5 @@ const struct consw dummy_con = {
> >   	.con_scroll =	dummycon_scroll,
> >   	.con_switch =	dummycon_switch,
> >   	.con_blank =	dummycon_blank,
> > -	.con_font_set =	dummycon_font_set,
> > -	.con_font_default =	dummycon_font_default,
> > -	.con_font_copy =	dummycon_font_copy,
> >   };
> >   EXPORT_SYMBOL_GPL(dummy_con);
> > 
> 
> 
> -- 
> js
> suse labs

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
