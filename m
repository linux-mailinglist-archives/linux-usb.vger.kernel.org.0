Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA082D7F2D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 20:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390392AbgLKTGu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 14:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388215AbgLKTGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 14:06:45 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E865C0613D6
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 11:06:05 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id y17so10076148wrr.10
        for <linux-usb@vger.kernel.org>; Fri, 11 Dec 2020 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=fpPPTe1BQ4FWmxzhApqvIpf5cdvBk6k3Kx2tkhrQqYk=;
        b=znhCohWhGtvDiWVsybr8Pd8ygtlGPgI0TAkqeYHwam3x8bcHEsmf7MfbVhRg6V5AIh
         mPdtUG702qAKTX4JOiS47R9Es8sjd9ecW9EMAdBAFzfztalM/flT2dJ2Zq9FLB8RFRUQ
         yzNJsp8WXxb7b75O1Re5F+Z1v1SZQveAO/OWA2dT+SFwQ0IoXkrvLSjboY/UPlXKrBLe
         h4t2R3ZecrpvLxh0qgx/2EgbGktbKXQPb2bYh5uaPLkxj5FWKMja5DJ/0U8PhRrbTGzd
         MMQ8XQi5MQCt/acJq7ym5ndp1+Orl2iJqndfg05ZjqIa7uuNYO+uXIb4ln1hh35gg7Er
         m4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=fpPPTe1BQ4FWmxzhApqvIpf5cdvBk6k3Kx2tkhrQqYk=;
        b=aupRUX1PUKcqnInEjQDY0PINOvZH59UEYOst4jVpkae+kakI91pvSLc0arSu/jXWvA
         UAjb7MaIQAIQ/r9ps4iUM+X6ULWAxJwcksJBFsLThIBdFro+XYZQTnaCBpgtgi4nbieN
         05KYLQP37BDDjrEReD4jNIHoG8u7zOKS7i7w5hRfxABNrb1Qov6e2NiAA4Jx9BNh+NQ4
         w3V30TqZsJIic58fMLVoshNa5WuaxTxgxeo9aD5xGuW/qMF4ucXc1hp1+zadJuLJyEPV
         elA+Sj7XCzzrKnXKVQpmuBDjWYqs44czo+GYP9IAILFl6C2cC44170vnow9UFxS99gw1
         IOcQ==
X-Gm-Message-State: AOAM530+NmYNrU9BbNaXDGRJzjoTpUGpagnDgBVX04R1hNfiJhzudq9+
        0aEYfbD+wz98N3y9h8D4IPnZ1A==
X-Google-Smtp-Source: ABdhPJzrLKRJuKz6cmy+IlNBBNLpdXXMdAzHfGQGJJ0Se7kTtOYYHiKc5EuHAyQoRdk1GYaNM3didg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr15759389wrr.26.1607713564256;
        Fri, 11 Dec 2020 11:06:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q4sm15673046wmc.2.2020.12.11.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 11:06:03 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
In-Reply-To: <20201210091756.18057-3-Sergey.Semin@baikalelectronics.ru>
References: <20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru> <20201210091756.18057-3-Sergey.Semin@baikalelectronics.ru>
Date:   Fri, 11 Dec 2020 11:06:00 -0800
Message-ID: <7hpn3g9n8n.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:

> In accordance with the DWC USB3 bindings the property is supposed to have
> uint32 type. It's erroneous from the DT schema and driver points of view
> to declare it as boolean. As Neil suggested set it to 0x20 so not break
> the platform and to make the dtbs checker happy.
>
> Link: https://lore.kernel.org/linux-usb/20201010224121.12672-16-Sergey.Semin@baikalelectronics.ru/
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Queuing for fixes after adding:

Fixes: 9baf7d6be730 ("arm64: dts: meson: g12a: Add G12A USB nodes")

Thanks,

Kevin
