Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7533076D4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 14:13:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbhA1NMc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 08:12:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232099AbhA1NMT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 08:12:19 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA435C061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:11:38 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id v15so5359184wrx.4
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R8QVLaEMVDREe4i7MsWZQrj1QdIjJk54mdS9eDFpOmw=;
        b=KsEVBVjYMAAyKGyNIlUthVpXf1dTESVNl47Lcj2sujYROsBiwfqi7rztknIoTaqost
         t0HrqFWUNK0nU+yCYrEgznQE3hFCi3ra22SeKwNcU9h2b8s534xFGfwe3goTrWjzHzje
         kLdacisXelHDVnktaJ1Oj+ZCkMa686JAwYUwmr6yZLpJ//d59SvJEhWgpRP5qRsDMbgL
         qSGkM+qONIfVqRz2Ubb9vyV57b5kL2/zJ8bzh+MkSM70V0NfRkflVMNidXLQE0cAisd0
         DWaoU9YtycADssSoqplrKpzj/g4XZsVtkY4f/rJ9WOgSgojH1nHbgduegUp10VUrlZuR
         Vl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R8QVLaEMVDREe4i7MsWZQrj1QdIjJk54mdS9eDFpOmw=;
        b=qSIgX89Xg6OOgoGF26tpVPATT94bMzsRToQwYvd/g83deUrUqcDX5NgZSPNHUv9YW7
         cgBf2bapwjzZBj/LadN4UzzAugnTKL88VzlUawL37SuYevhYlibD6aRB93buEHVBitqR
         DtWjtFnLlLkaeHG/zY1c0N4fiVQbFCBLcXhqH1Tuic93DuaRH4xNeNtzpBuJXA8AlTL/
         V9HfeEEqtx4E+bb6LmLZNJmfiW6fCcGvyu6UibD1rGzhiPS5JKdFlRguZRI1ExPpuKpZ
         1e6UWXCycTHOsOOuwU1gZvzAKhWJsjmeBATD6PkqbkdKzLALD9B0P8t0sCZM6s8w3cW+
         1g0w==
X-Gm-Message-State: AOAM532P2nZvkvKA1ppj+D83ZRywaKW7aXjaN/4NqB6qLUN5ajrMwOlQ
        wUtVJS+k4+lyENpqIPispLZJqA==
X-Google-Smtp-Source: ABdhPJyQcTP5/TL1jtGngQV2sITO9HMnlEA/uwChmRQBIIJPcc8/LTaNK1xtExQYneRAgeUINsounw==
X-Received: by 2002:a05:6000:cd:: with SMTP id q13mr16149188wrx.138.1611839497638;
        Thu, 28 Jan 2021 05:11:37 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id d17sm1805142wma.2.2021.01.28.05.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:11:36 -0800 (PST)
Date:   Thu, 28 Jan 2021 13:11:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 3/5] thunderbolt: path: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128131135.GI4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128122934.36897-4-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> Fix kernel-doc descriptions of the two non-static functions. This also
> gets rid of the warnings on W=1 build.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/path.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
