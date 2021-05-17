Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3101A383A28
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 18:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241345AbhEQQj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 12:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343490AbhEQQjR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 12:39:17 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACD81C043144
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 08:44:36 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id o66-20020a4a44450000b029020d44dea886so1562069ooa.5
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vKjbNm+qWDtQMfOdoaa4ZDvCZPDo9ZFKDTV49+Bk1MM=;
        b=LDYOVo7bifxw9D07bYJY2Sb9XkbfO5vweyr2XB84rtmrbRmZq7zbZqM094rNFBCafx
         pG9FzYuOPNef3W4Qf/a8jrQELLT+eBE8LbdmjDmMNRivPNAFS7nqLQhWsnLn5r1IWu8F
         QP6Yr1qKT55Lejuv7E2IMR+D/StwrNy15NDe0bMmibpTSkwQ9dK/HZkSRcL+tfORv9IE
         22nAyZfG1yjn6fCE4J8eBJRcrY3k0oZ3kxO01zgycWXEJOGVqjiKdFL4jE5q3uzUqz5n
         kFLoWdP0mFHniBAUIwYe1A8Gg+gK2CVBSg/Iq8Yq2bIRENYHNWwwu/kB/SVswqYOhcdM
         rpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vKjbNm+qWDtQMfOdoaa4ZDvCZPDo9ZFKDTV49+Bk1MM=;
        b=b7Lq/OAUu5ZDpKXM5C27oPkot1sWdKCYYaShWNP8/GQzq3sZwr70+9b5D8ro01/Y06
         CEF2e9Rm2WRWRdA/u+1Skc/1xZT2isQURpH+dmTQQhIuDdcGlfaC/y/ys2OjJeN1HPol
         WcTxg7iRCBPWuiAHYAUBZ53uHjMYda6C16SSReoNIhv6PzXAnyQrAXHk0/9sTFmdfJPC
         3NwfKOEVp3dNlY7X6fDwSpr1RAjBDVh80g52bEjCY7/cIRx6S/wc55o6wSm+mQLJXRvp
         ZVSz31LKdctTBWleU8SzDnCB9MTAD/Ex+EuWzUY1AgLDqKlDT0SRrpQ7kE2cpXCC7cab
         Veow==
X-Gm-Message-State: AOAM531fSvZW/T+9uTnKJwLQHWm2o9Mdi6Zu3bv3J7rM41RTRek9A/yL
        rjj/sMyLC18buhOt9DXj/GZECw==
X-Google-Smtp-Source: ABdhPJwXJLwB0dkG7wxydNRP3vXW/ojAZ7j+qvCQgIDrrL9la6cwoeXOoISDWo/M22Tsx61v19LHYQ==
X-Received: by 2002:a4a:bd04:: with SMTP id n4mr416419oop.29.1621266276028;
        Mon, 17 May 2021 08:44:36 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w66sm3118066ooa.37.2021.05.17.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 08:44:35 -0700 (PDT)
Date:   Mon, 17 May 2021 10:44:33 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
        USB <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: mux: Fix matching with typec_altmode_desc
Message-ID: <20210517154433.GU2484@yoga>
References: <20210516034730.621461-1-bjorn.andersson@linaro.org>
 <CAHp75VdfnM+Vr-8__zHPaQ5wDyv8Eg=DMQ0+HRCpWWrSQBZniw@mail.gmail.com>
 <20210517151416.GT2484@yoga>
 <CAHp75VdmTKLnGrm19UF5TqYDcNtqCmjt8NWVEDv__5qHsvnF3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdmTKLnGrm19UF5TqYDcNtqCmjt8NWVEDv__5qHsvnF3A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 17 May 10:37 CDT 2021, Andy Shevchenko wrote:

> On Mon, May 17, 2021 at 6:14 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 17 May 04:13 CDT 2021, Andy Shevchenko wrote:
> > > On Sun, May 16, 2021 at 6:47 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > In typec_mux_match() "nval" is assigned the number of elements in the
> > > > "svid" fwnode property, then the variable is used to store the success
> > > > of the read and finally attempts to loop between 0 and "success" - i.e.
> > > > not at all - and the code returns indicating that no match was found.
> > > >
> > > > Fix this by using a separate variable to track the success of the read,
> > > > to allow the loop to get a change to find a match.
> 
> ...
> 
> > > > -       nval = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
> > > > -       if (nval < 0) {
> > > > +       ret = fwnode_property_read_u16_array(fwnode, "svid", val, nval);
> > > > +       if (ret < 0) {
> > > >                 kfree(val);
> > > > -               return ERR_PTR(nval);
> > > > +               return ERR_PTR(ret);
> > > >         }
> > >
> > > This changes the behaviour of the original code, i.e. nval can be
> > > still positive but less than we got from previous call. Some fwnode
> > > backends in some cases potentially can _successfully_ read less than
> > > asked.
> > >
> > > Perhaps
> > >
> > >   nval = ret;
> > >
> > > or drop the patch.
> > >
> >
> > Per the kerneldoc of fwnode_property_read_u16_array:
> >
> >  * Return: number of values if @val was %NULL,
> >  *         %0 if the property was found (success),
> >
> > @val is not NULL, as we just checked for that, so the function will
> > always return 0 on success.
> >
> > I don't see anything indicating that the number of elements can be
> > different from what fwnode_property_count_u16() returned.
> 
> Okay, I have checked the backends of fwnode and indeed, OF case (from
> where I remember such behaviour) deliberately does
> 
> if (ret >= 0)
>   return 0;
> 
> Otherwise the rest return 0 directly / explicitly.
> 
> The only exception is _read_string_array().
> 

I wasn't aware that the string array behaved difference, and the
kernel-doc gives no hint either. Thanks for pointing it out.

Regards,
Bjorn
