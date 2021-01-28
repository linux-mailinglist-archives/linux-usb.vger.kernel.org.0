Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE10E3076E4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 14:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhA1NOf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 08:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231935AbhA1NOW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 08:14:22 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25DCC061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:13:41 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id p15so5333381wrq.8
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Y7mzDVeZC3HTdKoW9kbjX3xtjB7eM31kno0vOiY4EeU=;
        b=aNYgQrbUTdAo4CU9zfBSlRvFmBWo7t6ZnoUCrr7sxuizrxkYo7oku3jXGbqPa7hiJV
         9HDcxyd2dW9jRMfvx1q8pBCRsiehF+QP5eKtdoAH7f9+5jK4pxVxIF0qGMRoTM2pMFvQ
         bXhmRQfWozK5z2iv8UWu5NBQilzlQ7iaiQ6YnjisFap0THTiSqPiAmL9cH9bfRPuN4qw
         yCx5gVcx8dOKdY4Spd0o++v1TquAiQ2Vboq6PXnuhsoZgg/3jHRZ1S9GJ12emg2JzZR/
         Lo/QEcqPeLhvS8XRYbHhZf9xPqU0r7s1oTkoI79qZIdt+88iTyhRBg51nYrJUDJ2bjO4
         O4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Y7mzDVeZC3HTdKoW9kbjX3xtjB7eM31kno0vOiY4EeU=;
        b=B/vYOzUD8/vIp9GkexsQrmwjkocWjBVEE3g69y1wGzE3AsJ/vfPGkGWb25hjgQEc+d
         fxllPtaPWurGdAIn1Rw/LvA5lH6k2r4vziTnsUgNxdaNO2Or3EaeSe1e5PADez93LNpZ
         M9kjIoU1q0nx6Felgf6rGscz+cY5twpMvgGzemR4++8BfyYUUEGyYoSjSp17bBVNFMVy
         styB/SOawc8Wn8oFyuCJV3Pdc81hi2DTQwZurzPpIisJTJqdjXTGeBnCsl+3WeyzL/5r
         8kMEPEo1062Qaoxmf9EE/DH/B3LUvD3DRDsQNupm5a56VagGZxgrhxsqlpl09zWnA3FI
         LILg==
X-Gm-Message-State: AOAM532VG7h2xGKECeALV11POYtCpaKax8L2HJkcv+A/1Ox77zdbBUrF
        idlb0bCvBCUXigHIRNmbE5y/pQ==
X-Google-Smtp-Source: ABdhPJwhqvNi+7Jd+GrVjNqG4LHdESf8dSvM8qWwwQ7eROVPooKMGWGMhtHVWo/4ZCTmr6GhClQTFQ==
X-Received: by 2002:a5d:44cc:: with SMTP id z12mr15994900wrr.7.1611839620673;
        Thu, 28 Jan 2021 05:13:40 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id n6sm5690166wmi.23.2021.01.28.05.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:13:40 -0800 (PST)
Date:   Thu, 28 Jan 2021 13:13:38 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/5] thunderbolt: ctl: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128131338.GJ4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128122934.36897-2-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> Fix kernel-doc descriptions of all non-static functions and struct
> tb_cfg. Gets rid of several warnings on W=1 builds too.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/ctl.c | 47 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 42 insertions(+), 5 deletions(-)

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
