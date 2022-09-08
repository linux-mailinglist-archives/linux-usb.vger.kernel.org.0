Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968535B1747
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 10:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbiIHIit (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 04:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231582AbiIHIip (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 04:38:45 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343AFE1A8E
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 01:38:44 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lz22so15518235ejb.3
        for <linux-usb@vger.kernel.org>; Thu, 08 Sep 2022 01:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
        b=SAoPOQWnZqu89mgLfBmiK5MrA8YCX5o9aGmYu4qqPNVoBkVnERkpNhCjHVCDQ9Zla1
         dwqjtxWA+cJ6EDML6KOuvVZ4R6NIPdCxT8QAEB80mIcXpDf2Zf9m7S4FsFoMJ51USitH
         Qd1pfZ4aI8HWIB9O1qt8jwZQ6YhUw0CUeBplhf899+yVwxpGxiGqmmXQn83Kl/G4s1eI
         C+ZSChYFtQHAmgSz+vgZPMqj3wcCWnPZrWj/U9r/3gRuxpP0SGbraorsJPs29Q973tKF
         kAzOfKhkV3IcUs1n2dwba5aeil8pWoUhDW7HjrjRLDXn9ByPmVyCvnNoBZTuKajNSFhw
         VwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=SqPML+unsouuIp4FVHK4Uf7DFvDcdAzoCu01LQ5xtJU=;
        b=MYzycrX94IVapKkRvdzcNJfVAj5EToq/mdMG8AHQh1s4zLQBbqM69UW0iVfQtxpYop
         tbvdngylYc3Mf+V+/ejxhuwrMhcpXMFtCYYmV/25AwegZt/dQCyTj78GkOSq1zQ2W7g+
         boMJZqxMYRu8WC02WwcsGyTTy15TVta+pKGZBACGNZtVM5fX/ZnouOLLgnFEELL92Mas
         pM0ggY9rCXQSFg9/GEfbSCuStzu3t+Rf06fXxkV2ofxdip9MXEcwlCQh3NNMvTB0CtXM
         eTlDhotoDalB/3y/UwAnIk9F+9p+jIgxHnJhrGsjZUVukcsVG8nRXQf25EvHqWwZ+evH
         IEuA==
X-Gm-Message-State: ACgBeo3xOL+WWfzkfcJFA8KLpjxKBtZNSBDG8EfzEFw8NgDEe/2TJm0f
        8u3+pyPA7g8w0EMfyCqLRn2dB8AlVu1TbfAY2j70aw==
X-Google-Smtp-Source: AA6agR5Qlu6bHigQRlsF7FnyAifGVWu07Yimovaj6W3A7lzSYgEVwFSZi08eyLAuAWp+B7C3eLgpufDg+xQ7EBPkK+Y=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr5281501ejc.526.1662626322796; Thu, 08
 Sep 2022 01:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:38:31 +0200
Message-ID: <CACRpkdaeQFP+H786D=SG4s+sQmxScUzve-uWkm-Sg7xFDK_Syw@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using devm_fwnode_gpiod_get()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Felipe Balbi <balbi@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        David Airlie <airlied@linux.ie>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        linux-watchdog@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to stop exporting OF-specific devm_gpiod_get_from_of_node()
> so that gpiolib can be cleaned a bit, so let's switch to the generic
> fwnode property API.
>
> While at it switch the rest of the calls to read properties in
> bd9576_wdt_probe() to the generic device property API as well.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
