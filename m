Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47A4C12FF92
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 01:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbgADAaK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 19:30:10 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:36130 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgADAaK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 19:30:10 -0500
Received: by mail-il1-f193.google.com with SMTP id b15so38039105iln.3
        for <linux-usb@vger.kernel.org>; Fri, 03 Jan 2020 16:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7In7Tco29iuCsOLy3g6JjgD5lKC+PYNDMM0DSnAitvg=;
        b=Wgc66G9LeOzZp72+ej7p5Z4O+iJVWvtuAoD0JoiShbcTGl8J/e4c3vZdmKYpEbxEAG
         yDWVojzi+DljSxBG5xh7S/vzbqlnKZBHuC2VeK/1FppD+piSv2XQ0j5FNBSZSNFncscL
         pi6RoYJzqABRhX9una3s6tVuIT1IPvbtzucxY/hoKKe7ZPTaYeDLdeYQW28WlsIWrSxD
         PhOlHgpMG2B/hO7radRgW+cjZKlAqeXdLs4EOfaUCpIk8ScqsSn5Cdvycxg7VfaUNkPz
         OAVpcVLq4ngtf2MvObzAAx48P/aw5aW8w9kiqbDkV9d9Nw+StoVzx5sGnLtig5BYsYiI
         vnyA==
X-Gm-Message-State: APjAAAXweQCq/4Ot2qbrRvebhk4+/wOwH0edTHwKytX8PsSsj3Y5nyVK
        Jsn9/MUPL/R+RkwuEQcijcaH/Jk=
X-Google-Smtp-Source: APXvYqz5tkNkBa65cFmHk8NWHr/pTAWBa+g1cLAcFv9Dl8cu6yDv7b/dBPzwvIoVJONghJTmrCrwYA==
X-Received: by 2002:a92:5d8d:: with SMTP id e13mr59588822ilg.285.1578097809139;
        Fri, 03 Jan 2020 16:30:09 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y18sm14150648ilm.9.2020.01.03.16.30.08
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 16:30:09 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 17:28:06 -0700
Date:   Fri, 3 Jan 2020 17:28:06 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
Message-ID: <20200104002806.GA24214@bogus>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 27, 2019 at 02:36:41PM +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> new file mode 100644
> index 00000000..2b2c526
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 Amlogic, Inc
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic A1 USB2 PHY
> +
> +maintainers:
> +  - Yue Wang <yue.wang@amlogic.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-a1-usb2-phy

Use 'const' if there's only 1.

> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy

Don't need *-names when there's a single entry.

> +
> +  "#phy-cells":
> +    const: 0
> +
> +  power-domains:
> +     maxItems: 1
> +     description:
> +       a phandle to respective power domain node as described by generic
> +       PM domain bindings (see power/power_domain.txt for more information).

Drop the generic description. No need to duplicate everywhere.

> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +  - power-domains
> +
> +examples:
> +  - |
> +    usb2_phy1: phy@40000 {
> +      status = "okay";
> +      compatible = "amlogic,a1-usb2-phy";
> +      reg = <0x0 0x40000 0x0 0x2000>;
> +      resets = <&reset RESET_USBPHY>;
> +      reset-names = "phy";
> +      #phy-cells = <0>;
> +      power-domains = <&pwrc PWRC_USB_ID>;
> +    };
> -- 
> 2.7.4
> 
