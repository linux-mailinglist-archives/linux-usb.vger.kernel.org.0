Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0485761FB13
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232220AbiKGRTI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbiKGRTH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:19:07 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A334B1DDCF;
        Mon,  7 Nov 2022 09:19:06 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id i21so18651703edj.10;
        Mon, 07 Nov 2022 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WABWUxZUHt8M//n3pzxOX7MgxD/7jpIO4F4+cpbuU8Q=;
        b=cpl9IXvObpPpjDH3q0oTFikx4eVLJa54BcB/VF0a60o7zdTUxUZjVIJCeZu8YGuHkd
         amLM3TtYK/VXTOi1Ex9hUPMTvVoRB36Nm6yAMunAenrqLerTNX8L1TvFt2mxvodyttp2
         ZGuky8vhB+yro3tgFDE38RD+V3wDU+eTW8Lmz3XeS+W0oIfEwcwYIkjg3MOeSjgHZZlQ
         Nav/8phCbPoH7E6RoJv4xH4jtV3IViXN+pxzSMBkQSol8Zt5PVE7pGXJmmSlGqAyW/Rz
         PIPEyRWHpePO6Cx0T8nawzfcZCFn5wHF1gcheffTNhyB1m998KTAvmVxcYbVK3iUHTwT
         njfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WABWUxZUHt8M//n3pzxOX7MgxD/7jpIO4F4+cpbuU8Q=;
        b=76ZAKawunugjMIar6yRbewlO5vGG6OcdNXuhKgMQq/IwJ4Rfg2YAHVDFHEhDmhug8a
         kSDecOjQLpKaf7ngRy4vh0Cezhboi47mEkX3epLtvxHwcILPEInk7SnZ96nJeuKKCp50
         SgN0Sd10tvQGlVDAydnu3QcBlzcUw762XSqQwuQGEcOhMf606Q3+ypWJ6jIAyaBYK8ju
         tNiKV4eCSx7Pb8uirKqvwzRlQkLM0iqwSzaOtsUe4D8/eAwQVbbY86x7oLRZ8lnoTnt0
         e/xQYyqZzW6sPrZSfjVyoCikMuh4TozYv2zFQkPrIqj1v+QOaOqt/Pp3J7H9Y/xJzu2P
         mLDw==
X-Gm-Message-State: ACrzQf2wxDP7jOiOjZQmnDjesXWWD4qXEtBMoIUU4VrEgBHsBLZ9n3K2
        XEyOxyrmJfG52a3X8C2cWzk=
X-Google-Smtp-Source: AMsMyM5VWvezBWyZBcC5CBPMjq7W4wsBETjGxm7Jxg6eDUizPN9CQhdCoHHadTq4T1yOhrqyQQBoUQ==
X-Received: by 2002:aa7:cfda:0:b0:461:9d22:3484 with SMTP id r26-20020aa7cfda000000b004619d223484mr53028888edy.142.1667841545234;
        Mon, 07 Nov 2022 09:19:05 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id eh9-20020a0564020f8900b004587f9d3ce8sm4471906edb.56.2022.11.07.09.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:19:04 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 05/11] ARM: dts: suniv: add USB-related device nodes
Date:   Mon, 07 Nov 2022 18:19:03 +0100
Message-ID: <5616911.DvuYhMxLoT@kista>
In-Reply-To: <20221106154826.6687-6-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-6-andre.przywara@arm.com>
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

Dne nedelja, 06. november 2022 ob 16:48:20 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The suniv SoC has a USB OTG controller and a USB PHY like other
> Allwinner SoCs.
> 
> Add their device tree node.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


