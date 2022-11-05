Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC7F61DE86
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 22:14:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbiKEVOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 17:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230274AbiKEVOI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 17:14:08 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B560713CCC;
        Sat,  5 Nov 2022 14:14:06 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x2so12258264edd.2;
        Sat, 05 Nov 2022 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4NP9yupkpzBRyQpmDT8lYy2UWrONdv5iBY3bNlIxTE=;
        b=fCiW8BnrNQDhBG/jBne3EdTh6WbpaMBZr0F+ItEpV+9o7LtESAX2aCcb+qyicB3bn8
         +FaoQd4zmCu+TlYQHJ2H2xdkCtVzvPtpvOwBhjdjzhKVgExK6JdmAKdkznuvKbepHrno
         2NdOKVdyCHeyq2DxSa4fgVDTENLg3+BkhY7FPazBwTUhDuCppyy8GUzuW3HIFsMs9b5p
         MN98D0CttT2kxUXk5byk6dAiowgXhoKFFIs6HE6Xe6YSWfZLL6b/+7BoaKt0VQ1JXVq+
         8gli8a/2wpo9zaqpgDilmHe91hlF/v1Hsr3wi2qfUMkTV4HpQ9a/bNr+5TNpb5kVJA7M
         7EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4NP9yupkpzBRyQpmDT8lYy2UWrONdv5iBY3bNlIxTE=;
        b=FoyzYaJOHataHhE5BOVo8WFWBFckbHB6l1iiT4tBgcDsgi92QxVafMSDiSGTGamQyO
         clF6d4YQinWJWMbrQzBj3TMcNIkAJqhfZj+TpYMGeQOM22q1+s0WcES25ynzqYOLSMzU
         yC4bXCV2UfFqCehmXTK75vp7UdQkB+0YT/ed+25ePoOb+wWIdOM91ddKsOKGXEZb3t1X
         BYjpUWACjjad2kvcQjEgYUeCcRSup0cTIWQmHD7zwsiPDgkxy9bN1Dy3pYz4WvQFuPZD
         FDs9aTP8vVEplfKhATlqAq0dNdDqnrpQ3YOMsPMpcyZdvf9+eqpyuvGdKOVhDDuW6Mp6
         Emtw==
X-Gm-Message-State: ACrzQf192XcskXlgA7wuG/rokmxmnZD+37Zq0Qd1aOr8qAHAZnRH7NYY
        DLQd4rr6Jq14xGhl3L8TI7M=
X-Google-Smtp-Source: AMsMyM58qlmgkIdlBAoBbOk1+UZVOpUM/uCQW/HCKTww4S/Feij3fS3NWbeHWkIPIyrAr2a613tvFg==
X-Received: by 2002:a05:6402:90b:b0:45c:16a0:ec1e with SMTP id g11-20020a056402090b00b0045c16a0ec1emr43671146edz.427.1667682844639;
        Sat, 05 Nov 2022 14:14:04 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b00731803d4d04sm1330633ejx.82.2022.11.05.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:14:04 -0700 (PDT)
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
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: h616: X96 Mate: Add USB nodes
Date:   Sat, 05 Nov 2022 22:14:03 +0100
Message-ID: <8136023.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20221031111358.3387297-8-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-8-andre.przywara@arm.com>
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

Dne ponedeljek, 31. oktober 2022 ob 12:13:58 CET je Andre Przywara napisal(a):
> The X96 Mate TV box has two USB-A ports, VBUS is always on and connected
> to the DC input.
> Since USB port 0 is connected to an USB-A receptable, we configure it
> as a host port. Using it as a peripheral is dangerous, because VBUS is
> always on.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


