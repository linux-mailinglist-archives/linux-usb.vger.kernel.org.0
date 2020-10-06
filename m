Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CCC284858
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 10:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgJFIWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 04:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgJFIWy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 04:22:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3241FC0613D6
        for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2020 01:22:54 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e18so6496487wrw.9
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2020 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gQZ92N8EMr7LGVwcFgd0mzk1VK6749oG4otqf+GLMOc=;
        b=zz0oXuy8DvLu/oqK9eyLFeY6GHKr0NNTLe+2Dc/x+LalYxQQw6uANkSbT/JLx0kvFw
         JsFeeLTos6PMTBn+7hMGtQhoLWEqq+QuVUSBlZUX0ftSWK1YjyFRCOSMOBqz5D6MKAf1
         trjhFyJHYmtSCLJ5XHzS7cF0NIB/qannWZC+J0hX6vMT6mPQvXUmjZ455nksyYjcFU+P
         Sjl2xSWKvUjPg0CnAC82f7nU5/tWpx/auKHYNX85Ug+b+OjV7o89Jn5KftNigXVWbulQ
         oiixrU7pMYnJfnHsL1qk6QIXkuIzWdHeWBqffLu7TxlUGZ9S3im+iPRnZpD+Am2dPSXN
         L+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gQZ92N8EMr7LGVwcFgd0mzk1VK6749oG4otqf+GLMOc=;
        b=F6DmL79d1fBOe+pzCeGaryL3mu3ppbj+8rEcxNZkGAQ455YrfuUnJurzDlscQICESe
         KHzvDoZnhmbnEHtfJWD4gQFTdStFjpLyc+1Zopc2fIRuXCtD2MBNtHojG3HgZeC4si0N
         CTLW67oVzmI8/EeAA9Y4qYN72xTkLHzni1IMMWgBXo/w4n9gWKQ4KgxhRNdIj5iIglZa
         FvTYlkxbq3y8l9yRRyU085P/rsmonW1xYwkxv85VeUgQILJ6WHHrBeI6swaCrdw5/Mtu
         g2MKtSFr/0o3CYCFFnqrIGO7FPfdikerV0sL8tMsJyhhXGf4p/ULqdHwVycbqPVMPcff
         czkQ==
X-Gm-Message-State: AOAM533u1ABMlBgSmft+xdZzEXCq6bRz09BaMeTnOJWcQfIlBwZPiqAz
        q/SIn1VMjjrYgabtPyjJGCfjXw==
X-Google-Smtp-Source: ABdhPJxneCP/XHEIGTuaYnepMY95XJGJWgT/9+OwKrX8AbsmbSuGbQwcSXMgWa3UoshUsl19yJaa5g==
X-Received: by 2002:adf:fa52:: with SMTP id y18mr3564855wrr.264.1601972572464;
        Tue, 06 Oct 2020 01:22:52 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id v17sm3056116wrc.23.2020.10.06.01.22.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 01:22:51 -0700 (PDT)
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Albert Ou <aou@eecs.berkeley.edu>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Andrew Lunn <andrew@lunn.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        "David S. Miller" <davem@davemloft.net>, dmaengine@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Jens Axboe <axboe@kernel.dk>,
        Jonathan Cameron <jic23@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Richard Weinberger <richard@nod.at>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <9d2a9da4-d28d-dcf0-2b43-66e28b6b8dec@linaro.org>
Date:   Tue, 6 Oct 2020 09:22:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 05/10/2020 19:38, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
> 
> Signed-off-by: Rob Herring<robh@kernel.org>
> 
>   Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 ++
>   Documentation/devicetree/bindings/nvmem/nvmem.yaml           | 2 ++

for nvmem parts,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

thanks,
srini
