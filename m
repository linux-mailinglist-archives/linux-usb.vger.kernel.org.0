Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34751954C0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 11:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbgC0KEO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 06:04:14 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37545 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726418AbgC0KEO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 06:04:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id r24so9576855ljd.4
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 03:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=fm1BGbXw3YbyFJAFmqHvsEnrwOu7+/+ujtJ86z5Orejx852KLJeCDtQq+soYhGzfCj
         2rAfF7PxQg2H2Sgjn2JBjFbILfIVHBT7QxDFDZh2R3HOuTeyVGc0fKnVbnrXO43QCj8x
         cXlH+JS+Jobqck2T5KLCJ/QxbIlZUnxiWcd/WFLXFPVgiIHA/VQnYBo2xwwlOuCaoBNf
         PV01d4t1H3eQqxbYRIT2/sc/hXgoikPd8X3chF1TEDLMvJhtp9ZecGoNxVyrMZXDYddu
         VUti7wxKuFzjCVhJlxMkwTw2df/O1qZUfem6Ydt42/5xj5qm4D1YHiUkYri/dNaN3Cn1
         sdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtl1Eialsdl3z7ZP76hLFrTUnrm/Xwed3O3Is0v5u2s=;
        b=OiQhh+ZWj7jLlCtlCiCsl/Bqa3dmu2x7BNkSX1AQLVbfe9G+wCdQ22HXOg5tp6za4T
         sET0KHo79Ttrx5y3KDOabjWFakpH6hgwO+hKqtKB64keZIkVdEM3ty+QrIzOwFzEK/TJ
         0Q9SiMPSbh+qhUq/7edGQviQqURmaK6XDPwwB7IikK6XYx8UabOrROd2HBSTEb8aXSTI
         J96gKY1mmD+sD7iHNMZk81jPj2TEquc6DOYbqd3YzihbxhTDhLalq3ScBFvztu4YyMyH
         i4BqN25GMvBcnj27gPPWtU4uHNqUn4gswOQqVZc4AQLNQG0vxUxsCyA7QXyBX5IS5ZzL
         WcMA==
X-Gm-Message-State: AGi0Pub/AARJMwjXF/onR0l6V38PjB5xieGtepmA2RrBq1L3RSTORGfw
        nf0/eB2S9I/w6FfOU+QP7fkz59dFhAN/Scu5KsgKRw==
X-Google-Smtp-Source: ADFU+vsLFzRSaI0mp4F0YlxEk/ZWtLbeZk2X0x8rIBWVbKHsUZE12xxYtPOS4x7TLee1muHrdP/vfqhKQcCaKg9I0tI=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr7696484ljh.258.1585303451336;
 Fri, 27 Mar 2020 03:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200317093922.20785-1-lkundrak@v3.sk> <20200317093922.20785-22-lkundrak@v3.sk>
In-Reply-To: <20200317093922.20785-22-lkundrak@v3.sk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 11:04:00 +0100
Message-ID: <CACRpkdaEnODObC7emg2M7Ayn_JkeLuc3HpV4VhJcwaZ+=sDLcg@mail.gmail.com>
Subject: Re: [PATCH 21/28] dt-bindings: gpio: Convert mrvl-gpio to json-schema
To:     Lubomir Rintel <lkundrak@v3.sk>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-media@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-rtc@vger.kernel.org,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lubomir!

Excellent work! Just nitpicks:

On Tue, Mar 17, 2020 at 10:40 AM Lubomir Rintel <lkundrak@v3.sk> wrote:

> +++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.yaml
> @@ -0,0 +1,173 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/mrvl-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA GPIO controller

This binding is lacking a license. Please use the dual GPL+BSD license
tag.

> +maintainers:
> +  - devicetree@vger.kernel.org

I don't know if Robert Jarzmik is in on maintaining this, would you accept
it Robert?

Yours,
Linus Walleij
