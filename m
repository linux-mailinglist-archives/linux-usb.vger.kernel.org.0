Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051343076BF
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 14:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhA1NH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 08:07:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbhA1NHn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 08:07:43 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08BC061756
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:07:03 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a1so5343481wrq.6
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4n7sUv7EiBR4EPTkB3K7FUMHv/EXCS+Ck09rQjCqlYU=;
        b=jQ6DlYiKQ2L1mG3SkoLG7EircOdnIRIZZ03Eub6jXLRTKvU38uKp2+vryOljBljkzL
         M77uheZteOwWT5EvOXUenoP1ZBSj6rKuP/d4q8S6JupFlPfreCdlc1PVrQjLwtqfDDZ0
         3EMgRHPoA07TO0cyt/ihRO84zoPT94L2UyqB2oHWH7a6Y0Mp9QQVmV9poatIS13H2D4r
         i/mTxH4MMtg/MGwKtL1vlK8PMubpWGrO44CI2GlCIU9O/ZLQrKD+MbBKMxwtZJ9W39id
         zOl+zYa4m9N8sg2U/meCQc7rE9mL8nDbk8xiVZ1YKwRhH+xV9RgtYZCa3ris68TDAHXq
         6Ihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4n7sUv7EiBR4EPTkB3K7FUMHv/EXCS+Ck09rQjCqlYU=;
        b=bDKl81oT034iGeVnUZSEhrzgfk9DwUyhT2bGpkaRlX1ZOEfm75fN3wW7rQKb+BBzAE
         hgCkeZ5i2K9GCb3sZIJiUGXU02Rw5ZbhaZjGkEhUxHJUQ6AYHiTkkUbkQLraP+YKGc5l
         6jNYcmfL/iu6e7q1TIDqOGYD+96gaO8wA5dab2RHdm6YJPxs15YUpv5qqquySl3i1VYP
         YY9m+5wth6+fD4ZY3ITLxJfClQRqs7Y8l76dX/o/SwxuAEoSgdJIEmzd5K/QuEVlTeqF
         w6ouRipy6i/f4EGsfUSvv/izGD7P3RNNjd1MIZMOPUWDV9FTne2631mfo56MSVGKnnXz
         LjEw==
X-Gm-Message-State: AOAM532L6C5F8Nr/xcdY6lZHYtLWAdpnGvAMQFecSuDB8Ikz8vmNrea4
        It4m8MBf9KG4DDp+SmNzDCgFew==
X-Google-Smtp-Source: ABdhPJysV1GMbktvtvKzETh21d32xWL//+fAqSG4y2uUD2RHBmu2q3uabdL5AkMvXspP/hH8rdBnIQ==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr16001377wrm.366.1611839221832;
        Thu, 28 Jan 2021 05:07:01 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id d2sm7518767wre.39.2021.01.28.05.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:07:01 -0800 (PST)
Date:   Thu, 28 Jan 2021 13:06:59 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 5/5] thunderbolt: switch: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128130659.GF4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-6-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128122934.36897-6-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> Fix kernel-doc descriptions of all non-static functions. This also gets
> rid of the warnings on W=1 build.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/switch.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index 6ca3efba4520..6e2ca8f066f5 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -525,6 +525,8 @@ int tb_port_state(struct tb_port *port)
>  
>  /**
>   * tb_wait_for_port() - wait for a port to become ready
> + * @port: Port to wait
> + * @wait_if_unplugged: Wait also when @port is unplugged

Nit: @port is usually used to specify the parameter directly.  In this
case I think you just want to say 'port', as you're referencing the
physical (or virtual) port, rather than this functions parameter.

Other than that, looks good:

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
