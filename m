Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358E3299636
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 19:57:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783609AbgJZS50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 14:57:26 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44106 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782903AbgJZS50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 14:57:26 -0400
Received: by mail-ed1-f65.google.com with SMTP id t20so10554073edr.11;
        Mon, 26 Oct 2020 11:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/0/Qeh6M/INK2bAIaSZzTQvAeqNQLbqX6xwvUrGewQM=;
        b=JoIrML2Au6DTkOy1BaPzzMZh5hR6QPaV9Sj/TwNhFSYlImF9kJY/9sLKPvB7Bg3KPb
         Ewq5Ac7aYd97+w2YqlUjL0MNclRYFrz1RygBmN7UDyaasu/7VF3pfL4b7wEGpvXryXUb
         R+Otisqjh34CGj7vqNAXjj2jQC4GQZ8kH4A2a8kZa1dd3A7VqPPt/yj8E9TojhDQ5S3y
         7/6Q8z2yBBN4MO6Ee8ok7kDnljRopH+Qx8gEiF0q40skJ4A9Uoy7lxSut3IH2VTJfZKN
         hthIk5rzkxk0lWj1hKVspDJBdRyGV55gHDykEPacfk2Z6/dbpOdPI2vM8HTM0i2iVKRa
         VquQ==
X-Gm-Message-State: AOAM532NarU1rxAfZVwSONUYNJaDfSuy5RH9G4D45aEBaUNrPns34PaV
        iHk4EIhjFvhf1Yb7BwtveDyoChKo2Hg=
X-Google-Smtp-Source: ABdhPJzQ+0K/G0r0EUW6jHQm6kneOPG5bCd1U7QCfa5Yuxq5JtGaFoWbaki4yVKHyJ89xooxO01GEQ==
X-Received: by 2002:a50:eb8e:: with SMTP id y14mr17463199edr.285.1603738644205;
        Mon, 26 Oct 2020 11:57:24 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id ss7sm6365398ejb.28.2020.10.26.11.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 11:57:22 -0700 (PDT)
Date:   Mon, 26 Oct 2020 19:57:20 +0100
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
Subject: Re: [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes
 name
Message-ID: <20201026185720.GC170936@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-27-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-27-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:56PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ++--
>  arch/arm64/boot/dts/exynos/exynos7.dtsi    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

