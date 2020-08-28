Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E9F2555C9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 09:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgH1H6l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 03:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbgH1H6j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 03:58:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE6EC061264
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 00:58:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y6so113434plt.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 00:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PElpbzIDHomzRDBqhzC9EtSuGk5dGo9/mZ4Zosmva34=;
        b=ISB7ntnkpAQLBD08Qe+CwRG4oyGX7bNu/54ttG6U4kcZTr1CXqDq7aE+vYsiYrQ3XC
         fhJu3Ot9XdAp4t9UCHO6tiaW9UlBnbYqGlXJetJ0SNrvmGpkR7KXkZ2OP4/ljZQVwmRF
         XYYJOVWz5g8XjNxGsph+V5EoqidDtb5wUP1nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PElpbzIDHomzRDBqhzC9EtSuGk5dGo9/mZ4Zosmva34=;
        b=BUfjRZdqGNrfy531oZUAtHNI2xUMM+6FWH2GXazfaXtBaLA6HpJMSbeg7q8HDGU+IS
         5uNHao+KRj+u6Sd2pRizYgHWvgswzCRuXzKwWS3HsghyhQ2HpZ5MiQeBczGFoMPZIFqe
         zQBwNAMIHhy/p/hAPpwKsW3JPQgJXYPvpSxUgy5NA+XjZZPGyRoBV7M7SRSFxpMsaPXx
         N5iGI9ZrHjuZXo7kb2oVsS0dkVySv0XOlv97+Vy+qRrWXm6dIODXHwoQcCwxnCqKfi6W
         XLGUmVMPaxfVG+FjagWtoP9qu9+uhmBkGPShvG5ZS7bxe92FJcXnOOCvGBM/yyWwnagf
         y9gQ==
X-Gm-Message-State: AOAM5324ES+c6bnh4U0XLCnKbwlLWutstwsBK4Y+9CGxeLjPQqxFbEkS
        +Ld6ggKx1/Y7tWgHFRyMhUMlDA==
X-Google-Smtp-Source: ABdhPJwYWtmVVE1J1r8j2+MZXqOUgShBQU9gpECocvKDQTrB1tC/VMiqwggHpKTrwS4yij/XM1+b/g==
X-Received: by 2002:a17:90a:b10a:: with SMTP id z10mr223586pjq.102.1598601519328;
        Fri, 28 Aug 2020 00:58:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y7sm403384pjn.54.2020.08.28.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 00:58:38 -0700 (PDT)
Date:   Fri, 28 Aug 2020 00:58:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Joe Perches <joe@perches.com>
Cc:     Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, cocci <cocci@systeme.lip6.fr>,
        Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <202008280056.6442BCC@keescook>
References: <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
 <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
 <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
 <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
 <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
 <5853c58e-7d26-2cf9-6cbf-698ecd93cbf9@linux.com>
 <202008271517.ECC1F1F8F@keescook>
 <5ebe5c2737b59d04f1b8a46008cd3159c638f9d0.camel@perches.com>
 <d99c613aa70617f440c51d9413372b858a4ae826.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d99c613aa70617f440c51d9413372b858a4ae826.camel@perches.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 09:12:06PM -0700, Joe Perches wrote:
> Perhaps something like the below with a sample conversion
> that uses single and multiple sysfs_emit uses.

On quick review, I like it. :)

> [...]
> +int sysfs_emit(char *buf, char *pos, const char *fmt, ...)
> +{
> +	int len;
> +	va_list args;
> +
> +	WARN(pos < buf, "pos < buf\n");
> +	WARN(pos - buf >= PAGE_SIZE, "pos >= PAGE_SIZE (%tu > %lu)\n",
> +	     pos - buf, PAGE_SIZE);
> +	if (pos < buf || pos - buf >= PAGE_SIZE)
> +		return 0;

This can be:

	if (WARN(pos < buf, "pos < buf\n") ||
	    WARN(pos - buf >= PAGE_SIZE, "pos >= PAGE_SIZE (%tu > %lu)\n",
		 pos - buf, PAGE_SIZE))
		return 0;

-- 
Kees Cook
