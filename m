Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341B6468D73
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbhLEViw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 16:38:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235904AbhLEViw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 16:38:52 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D38FC061714
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:35:24 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u17so10996393wrt.3
        for <linux-usb@vger.kernel.org>; Sun, 05 Dec 2021 13:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=epWjfoqIM5iM8Kz2eHVOpsCTtELbUSkxxeWV41PDpW0=;
        b=OH9kxve8qHVsQAMeKTPC1GB/VPe94tQYHgN3VYiWtZ8nRQj2PJ5tqn21D/Ro873eqD
         OrCBvchlyGjZVtEj9yZKhlrFwf0X2wX9jcNOwLfA0dIZqNJKg4lUPtNeeK6fLzFVB4IU
         JpPWc3a9Iz8tnv8Zn7pwSAVJN+qmT86ujg5H2A9IiCeFdJrEQ5F5yihpaSwP9XtIgZw8
         yjNermRVLnonL/L1MLjOSzBh3CFMmYXKAm+R2F8Z4DKDwb/n1MaKNF+43t5Z9yuOP5TJ
         4UcARE79UAJCnzziYAnnWZ96J0iARaY79LmQSMQv5D+wyAYYQl6PAPTR8FcEQ5td9Tff
         1ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=epWjfoqIM5iM8Kz2eHVOpsCTtELbUSkxxeWV41PDpW0=;
        b=QNbPuKkOOIcgu//csuCBZOFA0OYJ2UDNczLqc0bkYLJU3aO8SxkxmwRyEdn0XuHT55
         gsurPtRqfUxoSI3uvGmftcoCpBXVb0/pCzulyxUFOxP7TPgeHNEYB4SaA04U99LULflt
         FtumSKJHR3hGttM3pHHfNDevJIec5BTcRF6XEPU8RED5ReTqBQWuLbBf8neVmWWZDvVE
         UsdZQgCcYYFev+HatjK/0bw9VNFJEVUupOPC7YcK34bjZWrjm4/WD2Nw+kox/qzF8kP+
         FtU6ca/DxlOd5HoGbzj9QOi4xtgBun2SeZ5jODX7Dt4WyarIvYmkKS9xKADHPOUjsoyg
         hbMw==
X-Gm-Message-State: AOAM531MpEKs3mC96/wSaXXE0njc7ymJ3WQR7uaemiM0fN0hzgjP2m8Q
        EcnVR2kS6XiVsQiZhkbXzgu+fxAHMByVbA==
X-Google-Smtp-Source: ABdhPJzB6cCTgywiUB+081lYOTTBwfJt4abdsi4rweJO3t1NPS5I3U+LPForvYeP/306N9mi2sJUbg==
X-Received: by 2002:adf:97c2:: with SMTP id t2mr38605987wrb.577.1638740122521;
        Sun, 05 Dec 2021 13:35:22 -0800 (PST)
Received: from [192.168.1.24] (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.gmail.com with ESMTPSA id j40sm11535887wms.19.2021.12.05.13.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 13:35:21 -0800 (PST)
Subject: Re: [PATCH v3 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org,
        jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-4-aouledameur@baylibre.com>
 <CAFBinCCvOnrvC64sA++5DegZq1g9MmwvnCiYh-WB4dSkoBsCBA@mail.gmail.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <bb0ca11d-789a-6f43-ffad-624407122fdd@baylibre.com>
Date:   Sun, 5 Dec 2021 22:35:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCvOnrvC64sA++5DegZq1g9MmwvnCiYh-WB4dSkoBsCBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Martin,

Thank you for reviewing this.

On 21/11/2021 00:57, Martin Blumenstingl wrote:
> Hi Amjad,
>
> Thanks for working on this!
>
> On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>> +               reset_control_rearm(priv->reset);
> Using priv->reset in this driver currently requires an IS_ERR check beforehand.
> When I wrote the driver originally I used the following code in
> phy_meson8b_usb2_probe:
>    priv->reset = ...
>    if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
>      return PTR_ERR(priv->reset);
>
> That means: priv->reset can (in theory) be an error pointer at runtime.
> Since your patch is valid: can you please add another one (before this
> one) in the series and change the priv->reset error checking to use
> something like:
>    if (IS_ERR(priv->reset))
>      return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset), "Failed to
> get the reset line");

No worries, will do.


Regards,

Amjad

> With such a patch you can consider this one as:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
>
> Best regards,
> Martin
