Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1B73AA979
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 05:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhFQDXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 23:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhFQDXH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Jun 2021 23:23:07 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35326C061574
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 20:20:59 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id u18so3822658pfk.11
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 20:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OnNyegzcueNAVVexywZOaMaHFg4WpSSkzCiod7o42Dw=;
        b=X4jZcnOKMcGtW3MJdkyIoX+CzIYRM/Anl6+iAu7QSt3jvNHJMu43Dkk+hAgWIUcCst
         ndm+uK6nRboo4qUc0BCbXYWxGu7gpsdgHVr6tFKVJSidFH3IcydomGfeyEjolf2fqITK
         a3BzuIX36GlEjFePCt5CY/SNmx29mz7Mj7WvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OnNyegzcueNAVVexywZOaMaHFg4WpSSkzCiod7o42Dw=;
        b=CQXoohyUgUzEXIMdJkr3x5EYVAvk7o1izxcZ6GbYFQmkRl/Md4HC5ySQyBYpIvfb1y
         gk8OyKd2w0uM0HpYE8dajhMPwxvr1+z0G+YHzExQjrWOYohifoH8b4MnCMWmozE8GUir
         L3iFVTppl2NhwDmyEVXpWnEripGTez9uG4fSSbpjtIc921ZQ2BLsRCD5op6psmBTgPkE
         yYC8DUMFKAySj3Hc9lFIfF05zts8AJi7+RRg3rx9WMVY+ZC58SpcoEgFiKTHiDzZKVKZ
         LFxARrSXuyx6wLb2AFEwZeoR4r82G1NWxxK5gZA6rLX0AeyINal2cS7XcdNTrUZVE4F9
         zJEA==
X-Gm-Message-State: AOAM531pdfNJWHKhOeSv7y/VMS8SeihlSOAMr8rzKV70kgWXTAMbQJ2k
        /Byg07gUA9jervb2s4o17fTm3g==
X-Google-Smtp-Source: ABdhPJy21XBJfsZ+mRRvCXJv9m/hG8tXl5m6mgoLNXP50a3Mp2SvmLki85os/6/tjXabH+u8SYV4Sg==
X-Received: by 2002:aa7:8186:0:b029:2f7:f70a:b7be with SMTP id g6-20020aa781860000b02902f7f70ab7bemr3104165pfi.64.1623900058822;
        Wed, 16 Jun 2021 20:20:58 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d3sm3528629pfn.141.2021.06.16.20.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 20:20:58 -0700 (PDT)
Date:   Wed, 16 Jun 2021 20:20:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hayes Wang <hayeswang@realtek.com>,
        Lee Jones <lee.jones@linaro.org>, EJ Hsu <ejh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] r8152: Avoid memcpy() over-reading of ETH_SS_STATS
Message-ID: <202106162020.A7E55AC6@keescook>
References: <20210616195303.1231429-1-keescook@chromium.org>
 <YMpY49PLAyObVxC4@lunn.ch>
 <YMpawKzzect5nqs9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMpawKzzect5nqs9@lunn.ch>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 16, 2021 at 10:10:40PM +0200, Andrew Lunn wrote:
> On Wed, Jun 16, 2021 at 10:02:43PM +0200, Andrew Lunn wrote:
> > On Wed, Jun 16, 2021 at 12:53:03PM -0700, Kees Cook wrote:
> > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > field bounds checking for memcpy(), memmove(), and memset(), avoid
> > > intentionally reading across neighboring array fields.
> > > 
> > > The memcpy() is copying the entire structure, not just the first array.
> > > Adjust the source argument so the compiler can do appropriate bounds
> > > checking.
> > > 
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  drivers/net/usb/r8152.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> > > index 85039e17f4cd..5f08720bf1c9 100644
> > > --- a/drivers/net/usb/r8152.c
> > > +++ b/drivers/net/usb/r8152.c
> > > @@ -8678,7 +8678,7 @@ static void rtl8152_get_strings(struct net_device *dev, u32 stringset, u8 *data)
> > >  {
> > >  	switch (stringset) {
> > >  	case ETH_SS_STATS:
> > > -		memcpy(data, *rtl8152_gstrings, sizeof(rtl8152_gstrings));
> > > +		memcpy(data, rtl8152_gstrings, sizeof(rtl8152_gstrings));
> > >  		break;
> > 
> > Is this correct? The call is supposed to return all the statistic
> > strings, which would be the entire structure.
> 
> Ah! now i think i get it.
> 
> Although *rtl8152_gstrings == rtl8152_gstrings in terms of addresses,
> the compiler sees that *rtl8152_gstrings is sizeof(ETH_GSTRING_LEN),
> but we are copying sizeof(rtl8152_gstrings), so it will issue a
> warning. So you remove the * to indicate we are interesting in the
> whole structure of arrays.

Right! Sorry if that wasn't more clear. :)

-- 
Kees Cook
