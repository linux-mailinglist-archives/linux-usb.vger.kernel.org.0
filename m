Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC0761FE3F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 20:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbiKGTJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 14:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232906AbiKGTJ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 14:09:26 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3E84248F1;
        Mon,  7 Nov 2022 11:09:25 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id 13so32838773ejn.3;
        Mon, 07 Nov 2022 11:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc34CxtEOLkSkiQr361kqOgarEc3e05LL4CC8n3q+Yg=;
        b=MfJt6vqUvl9d2QwzN79EWkGlv9xQvsKg6qW/nuvZj3vutK07lQREteD9jvTdwD4mUs
         cCe2VwZo3iEJF6ZVHT4lp+dSS5XgBxg9O/SdckevvjaiK92s6OPeQtPRbE26fiKGNr1s
         Xm05WlDJc9s4nVcFIcISpz4vHrFkOpb87Kvx/AggAEjHwP97g78jEUq9nU3YIlVk+yvX
         Vw2UGW6EOVcTEs8cesZj5GtkEndzTKKIBL8mZdR0Gs+x5RWLcU/oNIYPNcDmXvfkkAp+
         31I9CxdidxbQ30o8A6EqGJ2W4STLOoG/uss/ng536xqR6ijghJbrTrnO++Jps53BaECt
         lPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wc34CxtEOLkSkiQr361kqOgarEc3e05LL4CC8n3q+Yg=;
        b=xiAvGx+pbzhjiFZ75KtV5/2kbRzPmwjbpv2e3HehKLvPE6Hausa8CLGiWvZn8cyT8c
         ge7zyncd3y4j0k4lIGYNDYRjdRXnqeXHjdOkFpXeno1De5hUhAPQcUlAvb6Gsp94sLz6
         wKDWVos+/wQkEFY98OgyqQcWMw7gKOh6eImJPiDjtfhMSkF5TvevocfakENsNOgWxV0W
         YEhZecwQAUjvQIVWR7v+pvY9/gKCQGFOUJ6TwFAw93sdnB9eNvKiEDGZOD6746N3MhIO
         eu2KbGjEqfRZlgwaH1VADwDrIgtErBQzchsgESs0qwnHTrROVSmLkXnm1aPvxxl6t6xL
         Pi3g==
X-Gm-Message-State: ACrzQf2y5VfIW6+s1Qf3n2JGuYgpS9cdmVEePLEOLoqrP0A3CfdJgDUh
        MLhdiwxzzUfop02DUD8PcPw=
X-Google-Smtp-Source: AMsMyM7RT31J7AYXOqj7NXxs7sV37GSZBoUybdyBFoXG5ZdfIxCN8Q5j0SVVcDS70m8z7me697XQFA==
X-Received: by 2002:a17:906:730d:b0:78e:9ca5:3269 with SMTP id di13-20020a170906730d00b0078e9ca53269mr49378907ejc.366.1667848164346;
        Mon, 07 Nov 2022 11:09:24 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k10-20020a17090632ca00b007adaca75bd0sm3783218ejk.179.2022.11.07.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:09:23 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 0/7] arm64: sunxi: h616: Add USB support
Date:   Mon, 07 Nov 2022 20:09:22 +0100
Message-ID: <111191160.nniJfEyVGO@kista>
In-Reply-To: <20221031111358.3387297-1-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne ponedeljek, 31. oktober 2022 ob 12:13:51 CET je Andre Przywara napisal(a):
> This is a fixed and rebased update of the previous version, with only
> the DT binding and one DT seeing changes, triggered by Krzysztof's
> comments. For a changelog see below.
> Thanks to Karl for testing this on the OrangePi Zero 2!
> 
> ------------------------
> The USB IP used in the Allwinner H616 SoC is very similar to the one
> used in the H3 chip: it contains four USB 2.0 host controllers and four
> PHYs, where the first PHY is shared with a separate USB-OTG controller.
> 
> But out of the four ports, only port 2 works out of the box, the other
> ports require some resources and registers of port 2 to be enabled as
> well.
> 
> Implement the required workaround in the Allwinner USB PHY driver, and
> key this off the respective compatible string. This core code is
> contained in patch 3/7. The first two patches add the respective DT
> binding documentation, whereas patch 4/7 encodes all the configuration
> options for the H616 USB PHY into the driver.
> The last three patches add the respective devicetree nodes, to the H616
> .dtsi, but also to the DTs of the two supported boards.
> 
> This allows USB to be used on any H616 based machine. This was tested on
> the X96 Mate box.
> 
> The patches in this series were originally contained in the initial H616
> support series, but where dropped there to speed up mainlining of the
> basic support.
> 
> It is now based on v6.1-rc3 and is also available here:
> https://github.com/apritzel/linux/commits/h616-usb-v2
> 
> Please have a look and test on your hardware, especically on all ports
> exposed on header pins of the OrangePi Zero2 board.
> 
> Cheers,
> Andre
> 
> Changelog v1 .. v2:
> - Add Krzysztof's ACK
> - wrap If: clause in allOf: (patch 2/7)
> - limit old (H3) PHYs to 4 clocks (else clause, patch 2/7)
> - change subsystem to phy: in subject (patch 2/7)
> - use "regulator-" prefix for DT node name (patch 6/7)
> - drop unneeded status property in regulator node (patch 6/7)
> 
> Andre Przywara (7):
>   dt-bindings: usb: Add H616 compatible string
>   dt-bindings: phy: Add special clock for Allwinner H616 PHY
>   phy: sun4i-usb: Introduce port2 SIDDQ quirk
>   phy: sun4i-usb: Add support for the H616 USB PHY
>   arm64: dts: allwinner: h616: Add USB nodes
>   arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
>   arm64: dts: allwinner: h616: X96 Mate: Add USB nodes

Applied patches 1, 5, 6, 7. Thanks!

Best regards,
Jernej


