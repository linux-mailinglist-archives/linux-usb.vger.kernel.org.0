Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B323AAF82
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 11:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFQJR1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 05:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhFQJRU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 05:17:20 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7322C061767
        for <linux-usb@vger.kernel.org>; Thu, 17 Jun 2021 02:15:12 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id z26so4502160pfj.5
        for <linux-usb@vger.kernel.org>; Thu, 17 Jun 2021 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
        b=tspUddDmWP1nXGb8dYzDapkXukDhtaQZ8yVoZQOykE4MszNmnQ2Jc7pAu3v7qBcemT
         UyLs98rU9nEy8e3wRIJkxsl8g3L8Eb/AvQODxlfCIA8Y+SqSVtbG2msAYvDIZFEizfbY
         20UD8As6h7+oRqO/LBfp1JKzos5qS4bIZn22juJCAEEZOMhbhqM1f/S6KCbcFkkK35Tr
         P7laFgsJQmqhNYip+ALRHKPPvbOtIHBYtRpZR/hgm9hpO06Ne5Y1MzvmGVRytTLSpocX
         +CLKqhQk6OUYMP0R+b/JJQ4/QkH+6e5JGgp8Hm8OfSHuZ6CIo4hVwTpj+jWWd51a3cq+
         7N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NiiU6fiVLbE4syulfvGQUEnbQNZvmtFPXY1KRGZ4VKs=;
        b=iWnKqpfb0hcFjTMdTYHiIzqrE2QxOUWJGzDsfjR+iUJ5gfXq2GFJE04TX5z8nDYUmP
         FB/80uNNsVHRBC256jFFYNgXembAvHV08kUwwTwUFVDWmYLeTqIR6jj8Ow6jTTYmSQ34
         9bAiXDd/dZ/Rh3akkvQ0jIksMo2cXCofsEuNyFS9hoTtIl5wcDmupzgNb9MbrIlAQ763
         u0LSu3Av59S4vE4DcZuNm4X5n44YJ3zLiYXhIh6LkStcm0UhaIzmRswjmW2Xc7jSxqW+
         ELKU2VJbEdPTZxau9NXFUY2vB4L4UyI/miPcreAKM+P7PvV0K7fVCWWllRzBHgn18vye
         xqnQ==
X-Gm-Message-State: AOAM532WE7bhScqccE9bg+ZvpZ5cLR56kpB0m4jrvQzByDYVb/3XO0qJ
        DwkAzKL5B2HHWo0ls+RIMEdFM/dj1OhlYpCJUbfFCW98TuarFny4
X-Google-Smtp-Source: ABdhPJyDDRUn2syWiuy8XigFtL3iDYKz59Ub/6ekAvgFfmAY9tRuxX/nulbHrrDC8J99+RHvCUQeMQ9XnjKDaURJSR4=
X-Received: by 2002:a05:6102:2159:: with SMTP id h25mr3349328vsg.19.1623921301368;
 Thu, 17 Jun 2021 02:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 17 Jun 2021 11:14:25 +0200
Message-ID: <CAPDyKFrY4UOO5CbZ8Bj7AH2+3Wo1PRpUv+Zs96tub=MzGuGrrQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-ide@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-crypto@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-can@vger.kernel.org,
        Linux PCI <linux-pci@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, Linux PM <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Stephen Boyd <sboyd@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 15 Jun 2021 at 21:15, Rob Herring <robh@kernel.org> wrote:
>
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Vivien Didelot <vivien.didelot@gmail.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # for MMC

[...]

Kind regards
Uffe
