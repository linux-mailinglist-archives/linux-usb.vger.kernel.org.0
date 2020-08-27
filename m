Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA1B2550FA
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 00:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgH0WQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 18:16:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbgH0WQ7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 18:16:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403CEC061264
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 15:16:59 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mt12so3367113pjb.4
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 15:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lLmbzoSbX37WRFYQW3L/1ffMVUDf88bIb2L15ySX4bI=;
        b=Sn1Xn765zecNGssYNGAzm6wFGVk/ZUhv3yF24YKSHrrm6U0gqIZZZDxVzDAyNtP0T4
         cXAMTSit0hEdTaUdP8eWW8XSdX0PhQMN7+d7nso/G2BMTeqMHmL3Cdk9S54CZ6SMe7Zl
         DkBln/HezvkLX2GPBY0Q+sV4MPupwJjvZ0xzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lLmbzoSbX37WRFYQW3L/1ffMVUDf88bIb2L15ySX4bI=;
        b=tNGh00YPMYwWNW/IL3m3Kpbp/njnogfXBO78Dl9Dte7qjfr67c+rAqfzyfgPLxO+Vy
         1ujIbYfSIjKKrd279bgw1plnn2x9WkEY341bvUgPbx01/Afjh7b+rZqeuza2i9v1GrTT
         KNp5CbsoM4JnlWt1Tlu41+gXsT/FJPMSsgfcS3HhIDTWgy+90/F5siRVga302lOQUJaN
         EBlFJdgt+n17ch38Ogk1JEl1ZY5DQh0t76lTzWjzFwh+VBzfytGqll4FNFie92WzIn90
         Goq3Yhc3PPc089K4K+sr5IGmBjTBR7CGwZ++8Xo4Vl/RZemVsoFJlpvLwuuM2g+u0vqN
         ptAw==
X-Gm-Message-State: AOAM5316MH50u++fyEBZqeOcBu3zTr/0VQ/8W3u5cMlwbAhxgoAW7D6s
        KOYPmoCqOENmkkPUgqpu/DPgTQ==
X-Google-Smtp-Source: ABdhPJxc4Utn2CJ+IfyCfdMPjgDjTvD7I3FRBoJwWEMSO3xb8hDq51v6hjQN8kpG25RPcBppMWR8wg==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr845122pjj.6.1598566618642;
        Thu, 27 Aug 2020 15:16:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id lw2sm3005169pjb.34.2020.08.27.15.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 15:16:57 -0700 (PDT)
Date:   Thu, 27 Aug 2020 15:16:56 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     David Laight <David.Laight@ACULAB.COM>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        cocci <cocci@systeme.lip6.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net" 
        <accessrunner-general@lists.sourceforge.net>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <202008271516.ED209B68@keescook>
References: <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
 <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
 <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
 <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
 <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
 <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
 <cf9b1ea3716305447be43bffc8f90b7ef7292f5b.camel@perches.com>
 <c3926f18f98e446daad957cd66a94890@AcuMS.aculab.com>
 <ca08f34a5aaa3e9031a934296dd97fc806dab66f.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca08f34a5aaa3e9031a934296dd97fc806dab66f.camel@perches.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 03:11:57PM -0700, Joe Perches wrote:
> On Thu, 2020-08-27 at 22:03 +0000, David Laight wrote:
> > From: Joe Perches
> > > Sent: 27 August 2020 21:30
> > ...
> > > Perhaps what's necessary is to find any
> > > appropriate .show function and change
> > > any use of strcpy/sprintf within those
> > > function to some other name.
> > > 
> > > For instance:
> > > 
> > > drivers/isdn/mISDN/core.c-static ssize_t name_show(struct device *dev,
> > > drivers/isdn/mISDN/core.c-                       struct device_attribute *attr, char *buf)
> > > drivers/isdn/mISDN/core.c-{
> > > drivers/isdn/mISDN/core.c:      strcpy(buf, dev_name(dev));
> > > drivers/isdn/mISDN/core.c-      return strlen(buf);
> > > drivers/isdn/mISDN/core.c-}
> > > drivers/isdn/mISDN/core.c-static DEVICE_ATTR_RO(name);
> > 
> > That form ends up calculating the string length twice.
> > Better would be:
> > 	len = strlen(msg);
> > 	memcpy(buf, msg, len);
> > 	return len;
> 
> or given clang's requirement for stpcpy
> 
> 	return stpcpy(buf, dev_name(dev)) - buf;
> 
> (I do not advocate for this ;)

Heh. And humans aren't allowed to use stpcpy() in the kernel. :)

-- 
Kees Cook
