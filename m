Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859DB5B16A2
	for <lists+linux-usb@lfdr.de>; Thu,  8 Sep 2022 10:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiIHIOL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Sep 2022 04:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231405AbiIHINn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Sep 2022 04:13:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51039DAB9A
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 01:13:26 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b35so5150566edf.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Sep 2022 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XWkSveJnRzdKknQVJvingAQ78zNNLel+FWq5VV07OlE=;
        b=jRLi85+fXwo43KQrU4myTG9XTPSquksWe/XvRX7TYb7GraJKW8IJtYfovgGkczWfO1
         bYwJMLLFG6PNudKjBUQzz73STtBFd6V4x5FD4C8WkgDYNMvtc+1Bl0Kja840zmydb7Dk
         R1f+8EAh9SdZYshHDAY4euPG9fH7mHOJQvVccAuIrdg0ZDbUqPHo8WyX9mHuYCGimM24
         YP3WQ6HmoChixUzx1paI/lXVpo3wZrRWlGGVbaMD9oe607cEm80TQq9udOFb7fMoKVdH
         qENdLT4lSWItLbHHuJ2dWiNS4MMdyM1rMc/BVCp3BIYXfVem88Ot/yq4n9Crmzb5y308
         lUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XWkSveJnRzdKknQVJvingAQ78zNNLel+FWq5VV07OlE=;
        b=g7rMyXBAzTuVKAJbmMl28T+HGbPUxUZdIXruXoNz1DI3TWkohixcfhgK5/+a4Lj1Ur
         oX2PFzVra8f9p3gFFALh3nh4QjB/sMJW3ie8mkTPELE4wi37ZBbtquK4VCS95UjowfRU
         ejRb8RE/oGu0jdhRrkLxXE4Dm0TG/5BttPRPU1LQIUbGL1Wy4DLgMnfIiF+B0snBNMf4
         FdIBzIiBBt2oRF17qM4plYkmd9eIcbqW+/N5sNR3xmmHuvNOigTG0503skOsDdCq+2SC
         yAuGPLwcHs6xaiabBUoXIaXKxxU0JIirvjTxNdTFaw9U56QX4WG7wIshIopCSiFm5rC+
         v3YQ==
X-Gm-Message-State: ACgBeo2YrLly5Jyh99p1RO0X6bsJ/u2Bfsjjs5XtX1D+GoaS8xZHeEna
        PjW7IbL3WZTnC7QJtihTWtjq8AkdL4te6cbaoKJ/KQ==
X-Google-Smtp-Source: AA6agR61mT7tkyrz3ia2WmI9qL8rb9Hia3J00WfiGHtjyrq5l+uSjyAmKJyQgQF5xs6AGHNJPzuPDon8GNuoQIkZGu4=
X-Received: by 2002:a05:6402:51d1:b0:448:bed1:269c with SMTP id
 r17-20020a05640251d100b00448bed1269cmr6168449edd.205.1662624804730; Thu, 08
 Sep 2022 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:13:13 +0200
Message-ID: <CACRpkdasPuDGzGLbeHo5oE-9aakVzhSmtbOUHpfu+KTEAHMCOA@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I would like to limit (or maybe even remove) use of
> [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> a bit, so let's switch to the generic device property API. It may even
> help with handling secondary fwnodes when gpiolib is taught to handle
> gpios described by swnodes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
