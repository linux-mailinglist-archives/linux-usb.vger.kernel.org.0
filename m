Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 660F61CD1F7
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 08:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgEKGkW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 02:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725790AbgEKGkW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 02:40:22 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626BBC061A0C
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 23:40:20 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id l18so9360156wrn.6
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 23:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=b+54X+TX5kZJ9qRshyticlnYndABBvz6OtR/q492GBo=;
        b=M8EYmyHmTRjm+HdQp+lpCdON/vaMWQpsLthw3YYDANF7NHrHoYvnkT+xgs7I2yegeT
         CndpjBqZ9xaZCJY9kbyDMbvAZHpBdREoRk5PY6Va4ohQa2f4BzAFgSwmC1jJl54zK8Sg
         LK5xF/1zdvab2IqMpowmR3TyvXedv5cKu2yzjZTa9bhOqTYOfHJ/IHJtxTqhURlUjD24
         MKAwgay/5VFJkHkRvtGIjzqshHIZo5Fz567i+B6uir3abJMVwXLIB5Cr0RSrMSxhnew3
         AjkhNADh/Ss5sTc2oCUCtXtfq5h3fUx/VLxtT/rJtg6OPcyHI6h9jRtw/r1dUlBbumb2
         eGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=b+54X+TX5kZJ9qRshyticlnYndABBvz6OtR/q492GBo=;
        b=gF4/ZNIUE3Lni+FQWeagyhWbbHOuSZEqtmkHKD/GsWZEyg9vBoxNHZTiCW54v8T2w5
         WwP3/8yefyxM+yXKK4NWVKMolUu7TDcyt3LIWLwPnI55MAvZPUQOPfUObHr7uXfT6gHj
         SXJkWxIWeXp8pWR7NFPWa+GyZj2AymLlKDK99zY7sIpQn1TkYfjcolSqFeISZ/qRsfY2
         39uAPF8hfIs2STFCEz8BbOXgvslKbKWvuOBRzKyhQj2ZnQJmTr69eH2W19aJx1EcsgqG
         CU5KdpUtPl4alVUGSoaIz2bVW98lw+C4yQf2KhCYw3ILZvp+j/4x570GCW9MVj4SvWII
         El6w==
X-Gm-Message-State: AGi0PuY+kJdfkgLlUZr4F+j0HIiy1RB0ZfezvPJ8FAvTfbFoE88Mlsky
        Fjzf1CMQn/GZr7NHmpFVAtQjyYwX4oU=
X-Google-Smtp-Source: APiQypLNFMVwgMOtwQds6QCltWYpc6Vs3EChos/FuLb+gpdk79SDqJOL0Xi3mG5TizXzQAknF4MLTA==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr10520253wro.252.1589179219073;
        Sun, 10 May 2020 23:40:19 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id w9sm17109112wrc.27.2020.05.10.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 23:40:18 -0700 (PDT)
Date:   Mon, 11 May 2020 07:40:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        sam@ravnborg.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: Re: [PATCH v2 01/10] backlight: Add backlight_device_get_by_name()
Message-ID: <20200511064016.GJ823950@dell>
References: <20200509141619.32970-1-noralf@tronnes.org>
 <20200509141619.32970-2-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200509141619.32970-2-noralf@tronnes.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 09 May 2020, Noralf Trønnes wrote:

> Add a way to lookup a backlight device based on its name.
> Will be used by a USB display gadget getting the name from configfs.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>  include/linux/backlight.h           |  1 +
>  2 files changed, 22 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
