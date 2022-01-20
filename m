Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912054956EF
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 00:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244378AbiATXXi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 18:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236336AbiATXXh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 18:23:37 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953C6C06173F
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:23:37 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso4410684pjv.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Jan 2022 15:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lduCeOqPdSTlCLiMlTMlBr0TrHGcn0qNkeRoiqzXtfY=;
        b=Tagcjltxo0I0fKDczR2ACgPLHMs3KryA/yK5fII/qCYbLC7DaQfWzu3vZ0RSeSEiAF
         NyVkTlt1UDl/h8adLLt0YYKrxJ3ibYWoukquSdkv7P/RPG7vWmOk/Qw+cf9ipSogVY27
         0mPk5B1yGWcfPI7YS1wAtGS22rHM5k3Yp1uUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lduCeOqPdSTlCLiMlTMlBr0TrHGcn0qNkeRoiqzXtfY=;
        b=fD9Je+x4c6GUkIe8VKwZVD67o7Nbqfdnsg9pgpl4FT0PUTy/5srek+gJukXN7kCJvz
         Nu4AX3ZW0JneN6pj+HjCkrZq7lzIRxdLmZPpwgGumV66uVvITCg7b89Mf8+KpaConRLy
         j8eBtj7tN3aDZh5rdOVceXQEJibUUQJpncy70zJVcLNe311pnQ0ymKQ7L9AY4kZ2MUpK
         pkR4T2Jj0r0Cq9J4Igp6mHykzKGhZ4GzlXZ6zGmlpx1uRVVYWdH31atbvTXOgYdYj6d2
         avp5y9quVNYy37NpVUfd9i7tVkYh104utP7QftmQ0mffLVsH+cyiBvoHQWy7hNjXBAFX
         mo8A==
X-Gm-Message-State: AOAM531O6TFtmrR51Jh+fKkCNwjGG1NjzpjDIZnDdIgPPycT2xFsOwio
        l8mhRwTeXNbASMXhQfnHOwPRIOL/sEeT9g==
X-Google-Smtp-Source: ABdhPJwufFh4eVcPYvGSPoZKSaXE7v6aGiTtmnW3kUWA081zSJz5fs8kHlDamGxEGn8AOy2r8M1j2Q==
X-Received: by 2002:a17:902:d509:b0:14a:fbb1:86c3 with SMTP id b9-20020a170902d50900b0014afbb186c3mr1066845plg.78.1642721017197;
        Thu, 20 Jan 2022 15:23:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v4sm4438260pfu.202.2022.01.20.15.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 15:23:36 -0800 (PST)
Date:   Thu, 20 Jan 2022 15:23:36 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] USB: serial: ti_usb_3410_5052: Use struct_size()
 helper in ti_write_byte()
Message-ID: <202201201523.9751D119@keescook>
References: <20220120213131.GA32119@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120213131.GA32119@embeddedor>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 03:31:31PM -0600, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version,
> in order to avoid any potential type mistakes or integer overflows that,
> in the worst scenario, could lead to heap overflows.
> 
> Also, address the following sparse warnings:
> drivers/usb/serial/ti_usb_3410_5052.c:1521:16: warning: using sizeof on a flexible structure
> 
> Link: https://github.com/KSPP/linux/issues/174
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks good.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
