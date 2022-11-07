Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D39561FB1A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:19:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232763AbiKGRTe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:19:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbiKGRTc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:19:32 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3499D1DF18;
        Mon,  7 Nov 2022 09:19:31 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id y14so31977269ejd.9;
        Mon, 07 Nov 2022 09:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=eP5ltGXdVJCTEnfFtucRNeoiDO5ISElM4ZgzkK3SF43MMp6aAHv4/ErdPHVGtlA/k+
         fVY5bwSwb2xnDbU7WgI0MzBFD2e0CfvwXjQvJ8PF0YAxl3187R+6KDI6cfhDgP0ORfVY
         3R6PFcO2XHWhAXPMASTCWpAKIcOHU885WW0tkCW5Ru9//iZw1EohBjJJlCeb2X0Bk+OI
         eKJkTRWaQd9GPAybx3k9MUln2IJG9A63ws42uE3087CsVN4nu+MzvbQcnN/TSLVMIQjy
         rDzJIgswPG4pItlOEbw6HXDD6jeBUrK4WWx+T+1Qdozru/hxX769+VXqQ4nWwlqWWN/h
         /kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=csCWk1NMLQIzpOy3o+QoKhaS0wnmluQFonLtO4JbwZRv4xjEOGxgGHysTJcIH8DImo
         8neKD8VeNd8Pg3Ty8LSznVNEfiA2+7e77kpa/r+EgjUU5fV/LsqF0V8Uwm12hVNeAl46
         Y0nHILZniETkgmRz0Sr2Iyj3QeVXfCS71kATnqD1QCdhyrkhHGxdkvRdeM1A8OJEyfQT
         //o+xy5Px9kTh9NjTsKs5iaPAJ9KLpHoY2qJvkwOLL/ieI2xCWIJC1sWl7N1ugBd3MJK
         8Cig1i0DA8AqaX5xuqTQZZi2P1bDh1ssWtIgJpeQylC+054rArSsqRWoAWa2HJP1I+hm
         eOmQ==
X-Gm-Message-State: ACrzQf2WmyZLnRFv9CApe7PtttbJAGQu+z5MMMv765YCjmiUmkm0eirj
        TZ9y0jEVFekrhBQJcSVF5W0=
X-Google-Smtp-Source: AMsMyM6LCBPpdH5Hhccy3tvFaUxUzv+rtYf8WatcRANMUVqlYQrqC2RObFbO+iRqfgVOlcqQlUZMnQ==
X-Received: by 2002:a17:907:1c01:b0:79d:637c:7848 with SMTP id nc1-20020a1709071c0100b0079d637c7848mr49606542ejc.513.1667841569716;
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7da18000000b004643f1524f3sm4485651eds.44.2022.11.07.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
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
Subject: Re: [PATCH v3 06/11] ARM: dts: suniv: licheepi-nano: enable USB
Date:   Mon, 07 Nov 2022 18:19:27 +0100
Message-ID: <4780198.31r3eYUQgx@kista>
In-Reply-To: <20221106154826.6687-7-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-7-andre.przywara@arm.com>
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

Dne nedelja, 06. november 2022 ob 16:48:21 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
> to the USB pins of the SoC and ID pin connected to PE2 GPIO.
> 
> Enable the USB functionality.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


