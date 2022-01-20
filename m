Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AFF4956F4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 00:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244848AbiATXZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 18:25:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244268AbiATXZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 18:25:11 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03ADC061401
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:25:10 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id d12-20020a17090a628c00b001b4f47e2f51so8889894pjj.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=w1nPkHfyHQXG/nOSFtwlyaLbq3roA1X2sdssHC0elvQ=;
        b=Ix1/w5PwSZaxEnTOSnN8lFHz5BzHNISbYg3o4X/5FfrjAJcYg+Z9AxP1i88D+Iuk2k
         5844byKA5qT/8MjQMo4NTzAahB22GacfkglUSK48eaBjOrMoBg3nLtQn58IL90xpHhst
         OCWKTBx7wJWqWCVt3G3dmJQvfaE4vquRE2J8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=w1nPkHfyHQXG/nOSFtwlyaLbq3roA1X2sdssHC0elvQ=;
        b=vxlKdf365BU4MnkyC2WtNtt1n4lD/dqtT61U0B4IxVDbazunispJB/ytqIvMB3zkUz
         KstAP5Vq8J8w76FLim+TwrBpDu2G4C9mM9quQEjn61/P6nYnyZKdNcwauJONezfd87HV
         wP6nbFCDNFjJ9NwpzM7CbhgoBbwbNMIOYo81mVtn4CZXXHNw4SVd1PvOXD/zoTgLLVzT
         sC7uXtwQz6Q1EOV1DdbMyhl4hsGmbK+Oz6+LO5aNeDqxaSA0REewbUX3iPdFuh118bAB
         6eZgDr8qd7d2L7Tftl6rftnjQrjwFo3TaE6crHAFV8Vn1UELzs/up6Ey1ntitiqWbP4m
         SnUA==
X-Gm-Message-State: AOAM532Up2GDOnYlRqlfTqAP91Yz3PbvFCwG8AZCHXgRDadbry93vD33
        ZRRCDR1KYFKfV/5vvDsL4tf5gw==
X-Google-Smtp-Source: ABdhPJxAAzugtPgJMISLYKCZZSbFl8rfDNRHbrnPqXYh5u376l6iBymNZh4HKNGrGrUjYUMc8uDABg==
X-Received: by 2002:a17:902:d502:b0:14a:6d74:7fed with SMTP id b2-20020a170902d50200b0014a6d747fedmr1050546plg.23.1642721110386;
        Thu, 20 Jan 2022 15:25:10 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g12sm4218174pfm.119.2022.01.20.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 15:25:10 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:25:09 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] usb: host: fotg210: Use struct_size() helper in
 kzalloc()
Message-ID: <202201201524.F8A4377@keescook>
References: <20220120222043.GA33559@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120222043.GA33559@embeddedor>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 04:20:43PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/usb/host/fotg210-hcd.c:4017:20: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Good-bye more open-coded calculations. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
