Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFDF21897A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 15:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgGHNsE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 09:48:04 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39412 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgGHNsD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 09:48:03 -0400
Received: by mail-ed1-f68.google.com with SMTP id d18so36231986edv.6;
        Wed, 08 Jul 2020 06:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wyUXf/Z3LcTCSm83RuiDQ8lmWVjeAVDbwuZYQmWJr+E=;
        b=eafc9omeFQ1Wbn5gANJkMAbZO+nvlegxp2APCreQpYBujwE9ngbaIz5aG56pgtGqRs
         puR/dqVNVNPQhDpp5e0adRYaiImD1KZf1B98+SD3GiZhiNzbsqCkiH5GHtQ8ZLPfYcqN
         dvtMmCTFg87VB6PTchGul8P/yM0jL0I3K3LsxDk93DVesRLFJ/mtnSj8MIfFJGLEN1eO
         8hyGw+Ga3YjeRRUnBEW3Btn0IowmhdJv55+YEjlaK/MuGRITW+evMlPijElKc/jobnRI
         WgksL1DQC99yqZtqydPCR7cluMhhRXnd6SAcZ8nFpAqOBRwtbhnV/yWo0am9W91XDuEV
         BqHg==
X-Gm-Message-State: AOAM530dwBUx8D6004OUzEPjwbSD7T4lheSenxG2lWe075B9gyklMlkH
        qeo54pvKHmE0g28mF+dBabwm0a2O
X-Google-Smtp-Source: ABdhPJzwXfeEilY43pqV9jsF2ZDwSoyFRMe7FBLUUPhwJYjNsfclijWF+S0YyS3tu97JHuZx/91TYw==
X-Received: by 2002:a05:6402:337:: with SMTP id q23mr68252323edw.63.1594216081602;
        Wed, 08 Jul 2020 06:48:01 -0700 (PDT)
Received: from kozik-lap ([194.230.155.195])
        by smtp.googlemail.com with ESMTPSA id v25sm19466613edr.74.2020.07.08.06.48.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 06:48:00 -0700 (PDT)
Date:   Wed, 8 Jul 2020 15:47:58 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH RESEND] phy: exynos5-usbdrd: Calibrating makes sense only
 for USB2.0 PHY
Message-ID: <20200708134758.GA32497@kozik-lap>
References: <CGME20200708133811eucas1p1df7b92d7e0ba512c5a7ecdb948edbfcf@eucas1p1.samsung.com>
 <20200708133800.3336-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200708133800.3336-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 03:38:00PM +0200, Marek Szyprowski wrote:
> PHY calibration is needed only for USB2.0 (UTMI) PHY, so skip calling
> calibration code when phy_calibrate() is called for USB3.0 (PIPE3) PHY.
> 
> Fixes: d8c80bb3b55b ("phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
