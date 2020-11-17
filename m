Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5791C2B5BA0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 10:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgKQJRA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 04:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgKQJRA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 04:17:00 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB064C0613CF
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 01:16:59 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id m6so5217560wrg.7
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2020 01:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MDtk7CaVA2R3o2gPQYkO2PpHsr3cKxkUX8lkMgx4vWk=;
        b=jCSg/LpM9T3TasQK0pOYLU2PdOBSCJ7rhx2ywbCucbK35JyfPpw4TsIeTKgrQ5K5A4
         adeg0g/wSdtS/8A/fTMKmCFoIGMweGqpVivYLpnzjYNuKOV9Kagign9KKHaN2nnyLryK
         tkbrbWKxXyHq8FevU+rMII3OLsKsFo6FguEHDfhm+bmT0oixa22i29HG5MB4mb+wU0bx
         OxdN33czTGYhfmqTBm7hvtOUM/UBpVlJSfUzJfMoWZvI0w28g7PZ2K7AMR/B9G+2lH8X
         mdyKW8Sz/sAi5r9Y1kRfAHPnbR7qs+SurdOIAydwebkFyCl8MTRsEvVDKMcL3n1ztlKS
         YOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MDtk7CaVA2R3o2gPQYkO2PpHsr3cKxkUX8lkMgx4vWk=;
        b=mM6iFbRoFeY7fZMIhw94KNhPizT/9P6SrrXfyi5A/DZIWLVgKCJEfBOncvFxOv/8d0
         bL+uT1zOul+XLKO+mxzBB9ufu6K5UHSbN6B5fAzJLVcqyV+sVvn48spj5q9t1r24+q8H
         101wku+DgR49QsVghmVVHU/+jhrUPtCUpb37E1IYcbaIeePCzcDp7PLyZGC7xiwRQJ8J
         JIq5DJtQlO38AJmkZ7oHVYBYhQLfacqLYJW2hbYEnI1YmlkFvmYxCEgVL3J2+1PVMsCS
         PWUU+mD15FU4tJXl52O6FzUciNb7Swi1bYUJyshA5QrJme+IoXRfl+MjGvmCiG/I6bQY
         U0SA==
X-Gm-Message-State: AOAM530ed/cxC/YDd5zD04KIDkp6kPSIhqA37g0Qz312kgp2YmV2WDPg
        7DUhEDz6pTQQN67gHlXypSE5SA==
X-Google-Smtp-Source: ABdhPJycFFxJJ184g8hhJdy18ua9XwfcJ0b61PxrGHf3KdoaD1f5//kMGDhO47wCHXJ23ejf/LCtEA==
X-Received: by 2002:adf:9066:: with SMTP id h93mr25171539wrh.166.1605604618486;
        Tue, 17 Nov 2020 01:16:58 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:b09f:f7de:c7af:258b? ([2001:861:3a84:7260:b09f:f7de:c7af:258b])
        by smtp.gmail.com with ESMTPSA id 15sm2589534wmg.1.2020.11.17.01.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 01:16:57 -0800 (PST)
Subject: Re: [PATCH 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-amlogic@lists.infradead.org,
        Jerome Brunet <jbrunet@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <20201113000508.14702-2-aouledameur@baylibre.com>
 <CAFBinCC92FfvFt1aAspkF_Mrrtu_QpS327TN2=9Yc3tWMTcu_w@mail.gmail.com>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <cdb9db35-6da3-259f-1c75-8d897f755571@baylibre.com>
Date:   Tue, 17 Nov 2020 10:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC92FfvFt1aAspkF_Mrrtu_QpS327TN2=9Yc3tWMTcu_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Martin,

On 14/11/2020 20:13, Martin Blumenstingl wrote:

> Hi Amjad,
>
> On Fri, Nov 13, 2020 at 1:06 AM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>> @@ -124,6 +126,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
>>   {
>>          struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
>>
>> +       reset_control_rearm(priv->reset);
> please move reset_control_rearm after clk_disable_unprepare as
> mentioned on the other patch to clean things up in reverse order of
> initialization

Agreed, will fix it in next change !

>
>>          clk_disable_unprepare(priv->clk);
>
> Thank you
> Martin
>
Thank you for the feedback !

Best,

Amjad

