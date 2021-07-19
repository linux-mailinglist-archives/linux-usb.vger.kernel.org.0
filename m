Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79B3C3CE40E
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 18:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348294AbhGSPl5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 11:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347100AbhGSPkb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 11:40:31 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95972C04E2E2
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 08:32:17 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so272178pjo.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Kmt2cg/fkXuZjEdxyWE8pRVcvkj1R557wxD+8nN3Ok=;
        b=hgL8lBoQqCRxpnus/lHkYBGhXNRWjb+JkyBny7Lu6W0bUAFSojtDkk0NRfcW/P67hN
         ZTNrJcVKYpnFEsb+KmwmbCY+0gYmxObzaO/ROsKVqf2ZlqM+hqG0vgAShj1lbQVNiHxn
         j6Odcu7sD7yQea5jIh3SP/FuexftrzpQ1Yu2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Kmt2cg/fkXuZjEdxyWE8pRVcvkj1R557wxD+8nN3Ok=;
        b=Xk1tZf21MsDYpJq5ZQN+pjt26gb4tpCrNpoUzQH3crdBKy3/HzDRhJVEOscWKuC8T5
         IkpckxTUIIJhxJmv3JZxGRN4VpibtAxeDgRpjezyyXmBR6MvQZ/8I0P6F6TqDPBlgiFA
         dwwygkn2aa/xx1Ku458QYzZzKNVgdww363vm1N+LWwGdTDSlYJ5w8xLUxWoqiKr4BSiw
         CeJM5ejfRmqEulwGshRAKHSJso4cvID1HHn7hV4yX57Mgk36ubDRYm7K9pEkGIOVybrQ
         AFN3tWZoZugEYW0RphFmZNYEUPjSKUNMma6y3cQFcx/xsX4nOnkm0CN13plTTknsh8sX
         Z/yw==
X-Gm-Message-State: AOAM530jvPCsWIDe9xg5259n07EF49Zsza2NCslzJsZ5gAFmo0C5lWf0
        ROydpWpFuDxTdhouUisBURqhoQ==
X-Google-Smtp-Source: ABdhPJxyRJ7ou2o3JRD7V5QiKompWLrj/d5i7RO9xpszj74VyxKp7jCDNDZlK8szrGSsH+sqr4CI0g==
X-Received: by 2002:a17:90a:9b03:: with SMTP id f3mr24337900pjp.184.1626710309067;
        Mon, 19 Jul 2021 08:58:29 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:ed1c:9d37:79a:b9d8])
        by smtp.gmail.com with UTF8SMTPSA id i8sm5713369pgj.78.2021.07.19.08.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 08:58:28 -0700 (PDT)
Date:   Mon, 19 Jul 2021 08:58:25 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 4/7] arm64: defconfig: Explicitly enable
 USB_XHCI_PLATFORM
Message-ID: <YPWhIX06NxpjAfoH@google.com>
References: <20210623184124.3504047-1-mka@chromium.org>
 <20210623114025.v13.4.Id45138610b749ff775186ac10b3d01c504ddf4f3@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623114025.v13.4.Id45138610b749ff775186ac10b3d01c504ddf4f3@changeid>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Will/Catalin,

does this change looks good to you and could get an Acked-by?

If so: would it be ok to land it through the USB tree with the
rest of the series? It seems a conflict would be relatively
unlikely.

Thanks

Matthias

On Wed, Jun 23, 2021 at 11:41:20AM -0700, Matthias Kaehlcke wrote:
> The dependency of USB_DWC3 on USB_XHCI_PLATFORM is being changed
> from 'select' to 'depends on' by another patch. The defconfig selects
> USB_DWC3 and implicitly USB_DWC3_DUAL_ROLE, to keep this unchanged
> USB_XHCI_PLATFORM now needs to be selected explicitly.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> 
> Changes in v13:
> - patch added to the series
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 08c6f769df9a..d7f22b18e37a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -795,6 +795,7 @@ CONFIG_USB_CONN_GPIO=m
>  CONFIG_USB=y
>  CONFIG_USB_OTG=y
>  CONFIG_USB_XHCI_HCD=y
> +CONFIG_USB_XHCI_PLATFORM=y
>  CONFIG_USB_XHCI_TEGRA=y
>  CONFIG_USB_EHCI_HCD=y
>  CONFIG_USB_EHCI_EXYNOS=y
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 
