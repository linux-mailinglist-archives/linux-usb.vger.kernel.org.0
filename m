Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F60729962D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 19:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1790996AbgJZS4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 14:56:42 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41318 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782924AbgJZS4m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 14:56:42 -0400
Received: by mail-ed1-f65.google.com with SMTP id l24so10577733edj.8;
        Mon, 26 Oct 2020 11:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZapFfo48nLdK89lmKH5z6puJUVQRUqCTYV3aNDgABQc=;
        b=Io8qY9IukHwd3oMBqWpbsMobm7WfBg5vb7rCGaUlkRN/MBJ2cR8eOw1iEw7pvO5sEW
         24P7tX0xyAqZqL79UlOYiJfsxD/iubhcet9TmqZX2HuUVHcjDVy8kk0JiR3RNOH3J3m0
         q5hUBZPA266oLN+IURqx0LyeoZcAD1gD0fyPjLjrLHuB+aKMOOOsKxhSMjaqZ0EuOa9d
         0hExLaNHD7j2Ov1DZ47nweR/JDK0NXydP8xlbqEfQywBW+4oa94N5RnFb9k8IY3wKjh4
         mYBJaDoGo1O/3MTqQvSXflQrHPV+ddDX4zXH1UbgI4Qu1365byMVI/ZG2MTB1xH4Qseq
         N16g==
X-Gm-Message-State: AOAM531fLeuvtZwIxh3wB50hTcGH3UN5M32eFF0i7mYtozKoyfIr3g9T
        DzNbQEAq0mIWjKrpnn0MJ5V7ekiv9qE=
X-Google-Smtp-Source: ABdhPJzbdS07OQalwMtMxqAa94+07UzaG8fMVEH5mvnueFa5GlaN0WreGMbtCmxLrMcd4SnV1ZgFFw==
X-Received: by 2002:aa7:c608:: with SMTP id h8mr16772774edq.16.1603738599946;
        Mon, 26 Oct 2020 11:56:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id p20sm4467362ejd.78.2020.10.26.11.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:56:38 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:56:36 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
Message-ID: <20201026185636.GB170936@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-20-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-20-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:49PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos54xx.dtsi | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

