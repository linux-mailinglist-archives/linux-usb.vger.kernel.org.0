Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0511943BC72
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 23:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239636AbhJZVfg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 17:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237275AbhJZVff (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Oct 2021 17:35:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21AD1C061570
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 14:33:11 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id 187so684272pfc.10
        for <linux-usb@vger.kernel.org>; Tue, 26 Oct 2021 14:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XzQXQ2MohAkVIE6Z1ypSkLWznaHpf1mElx04j/ZoCN0=;
        b=UxRyMLeehHpKsiOX5ddZmwg042BW2d12ZQbTRGAYYj0ICnKYf404XOeftBPWEDwcwQ
         xMop8yjshqGSxRuVZ50GD+W/g7lY0VOVbCThrKnVyxHdQgiVWPsI1ZFMi4yQroQOXC+2
         2WF3tLGh5+FU+nt/OcgP+DnN+YdDPETPvbV0LfmF5762ML0fnIP4FAOi/4xzSUon5tJ/
         WZaPnb26DxLh12PknhGlZwFOyaatomDATSOAHmCIQmmtXmER8TGGWda/c23lyWToA2Md
         18UhRKtkM7MKoviTEnpnwdzljT2E1sQiMa6raD4uEIyk3l27/uH5Ic6drkREJsUpjYhK
         s9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XzQXQ2MohAkVIE6Z1ypSkLWznaHpf1mElx04j/ZoCN0=;
        b=o1axyKWAklYwq316c/8iOMrUurmR31pAWQjeeZxVnt5AouLttWeyTROY3T7Efcmamz
         HKIF1Jd7ZWUaq8SzpQdfyaVqvGJGOEGr+FexxFnZUfSDcFOhCjJKx5dNHV5JINHqUIyp
         V5Zn6B3yPziC+eZuFas7rnPjLDgW4y6fiwbYzU/S7Jd1bSkinWG9P0uzbE4N1idbgkG0
         9oroNfvW7BO2h8JXBLBoqNeSiIztttbQzragIqNl94lANjvUmYOU5zeWP7IjnxS3J1z3
         9q74RKYOOSHC232Hxx9DKczUpH4tbchrfQVCMo1Lnc3RGsoDZPTuDuuKZdwGE9K/6MSJ
         7PNA==
X-Gm-Message-State: AOAM533bMhq85Dmkjj4uMItpDzCnYqCekDc5pANlLHBasu0fQNYvo4RA
        cdp0Pytc26lfqg/IjpkO8PE=
X-Google-Smtp-Source: ABdhPJwD6pFrZvMQQUfUxcsDKMNKwSf5zZzSuGtOzqr3A9rOaGEOgsxucHdVgViNdctlADosomzU8A==
X-Received: by 2002:a05:6a00:15c8:b0:44d:9f7e:ece2 with SMTP id o8-20020a056a0015c800b0044d9f7eece2mr28440743pfu.86.1635283990496;
        Tue, 26 Oct 2021 14:33:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t3sm19613564pgu.87.2021.10.26.14.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 14:33:10 -0700 (PDT)
Subject: Re: [PATCH 01/10] usb: gadget: udc: bcm63xx: fix deferred probing
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-2-s.shtylyov@omp.ru>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c25858ae-0cc6-1c0c-ab2f-8ca00fafc2c0@gmail.com>
Date:   Tue, 26 Oct 2021 14:33:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021191437.8737-2-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/21/21 12:14 PM, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO for some strange reason, so if it returns -EPROBE_DEFER, the driver
> will fail the probe permanently instead of the deferred probing. Switch to
> propagating the error codes upstream.
> 
> Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Not that this is going to happen for this particular driver on the
platform where it is use MIPS BCM63XX but this is still the right thing
to do anyway.
-- 
Florian
