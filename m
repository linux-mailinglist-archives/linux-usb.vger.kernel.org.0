Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6271E3076C3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 14:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhA1NIK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 08:08:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231465AbhA1NID (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 08:08:03 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC7FC061574
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:07:22 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d16so5289435wro.11
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=SPuphhbUAs//2Hq49D9KUKl73AwzHliKfi7pPSQG8j0=;
        b=woauAaFXTK7kwnA5AaqW2FMPMG/Aj2XaN38Tv7qY41NMN3lttpeKZHhmfLoq1KeEgB
         b94xMFRhm5pql1fTuv9KfFdDCYCGSqfwgNHToVLXKUXeXswjIci9GuWYJakcik/mJQsB
         D9FFMm/Y+SXSJlhdz7z+2VJjp5mGimiOPYc7w5Hz9cTJn5RAQOThdNgFBWjDEMQeanoL
         JiIG0WQgydNtGVuqXg/N00kAB7tK4cTbaevUdiHMD8xom7QXD+nRHK+SCDyGurILxGkk
         HbVYo8Il3xOYe9WK80+BGYRWxkaoYMrf1NNQHFRB6CEOM59wQMLgQIpHRJd2105Qc+IW
         T2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=SPuphhbUAs//2Hq49D9KUKl73AwzHliKfi7pPSQG8j0=;
        b=UvVmIbta/5sa3GUixzretG/om7XEUlnW0i4B9NC/2XeUnmOckKuDc8HYq4H9mRV/BD
         dZs5CzWoS84iPjV5hHjTXw5kaVXwrnFb7YpJXzRBH0U7SDkFpq6e+tg+FZSMgwy245dt
         g3FDh9V4nELs1bkUOOZfg/jSejTNpsjCP1H89PDI7eKE5QyXfmGmGYka4+PDRTeNsTUq
         bSyEzl7AfyEa80faIGhttN3kAlc+udxv50U21gioIf+BVgX/tt7B+armedbPBniEgUe9
         SgZzCx5GBDoDooFJBsHDifXxC/9ihQLOsRs2i1wL7T1iUFcBnk5SSUatrAvXfkL3+3wr
         XohA==
X-Gm-Message-State: AOAM530mtH3GzTU5313dSRLN3+CcAr/w/tGUa2Pc+2WoC7/SzMfbNXhX
        K7yMbBJuRYRoPcy6xuRF4lewiBTkeN4snUNe
X-Google-Smtp-Source: ABdhPJxBkNZyQyNjW6ghBwcbyIPut4U5lOzKBzUbLhWdPM2oTPC81YCppKOoCibje2w4mwZdZLhDYw==
X-Received: by 2002:a5d:524f:: with SMTP id k15mr16348383wrc.16.1611839241738;
        Thu, 28 Jan 2021 05:07:21 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m8sm7022383wrv.37.2021.01.28.05.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:07:21 -0800 (PST)
Date:   Thu, 28 Jan 2021 13:07:19 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 4/5] thunderbolt: nhi: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128130719.GG4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-5-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128122934.36897-5-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> Fix kernel-doc descriptions of the two non-static functions. This also
> gets rids of the warnings on W=1 build.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/nhi.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
