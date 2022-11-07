Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18E3061FB0E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Nov 2022 18:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbiKGRSe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 12:18:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiKGRSb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 12:18:31 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABF41DDCF;
        Mon,  7 Nov 2022 09:18:30 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id q9so32114004ejd.0;
        Mon, 07 Nov 2022 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+FL3EYtmTevx+/qcGveIJl0H5e1m/91jGuQ0ro55J0=;
        b=DUznBw1PxsVpisi4ux5m0ygNTpMneN6HgLhaY0gCqNr4zYyifoCpVqSKvsnwyJjnC2
         i5Rhq2cJARubP2+64WPHBO9zDgjXOhXQkStEgAvSQ5hOYRhHA0wzA0jCNfBsFAdDoCb+
         91Fg4uAoTzylUw59WfohWOi4vdAf67w5uROfVrPa6dseoQNYSZ1w071aLrDPRIMTtgtr
         imE2N1dWD3HY9T227a0AIALk9499TodWKdOcKGqj/vOr0q3J+YFgzGPvR1ni6i8drW+c
         17Sdtb6a5LyC++DUSUoGzYZLBujb5VtR65SCcDki4NZLNQme/ZnT1GrUKIA0+DOQeuoe
         LVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+FL3EYtmTevx+/qcGveIJl0H5e1m/91jGuQ0ro55J0=;
        b=EWv2qQPaeulklfTii5PZJ4Mp9aNJPCtZ4BgcP4RC+/YIw1v4yKIuSufBoPpMh2mnza
         NDvMYe3nH1tc5tIEL8IE+DLkKSedBnDTw7uVgvNstWBlUw2sV+5fRmf33qV3/9Uzw6F6
         /faLDSozwpqD5n2KOv6iqCRqbDoTdBgUeIc9qo4Yjt2CFVJDY92fX5q8KesauGbsducl
         X5Gqp9E6vz83idsyBBviGT4uDhc+JxDieZCIVQ6C7YB7c4+q65b5IL30DbaukjowwnWe
         35JgP+NWXntD0+Qm9u1eUDzRRQs7pld4LAUSL2LYGrNbESzHn9FSNJ9W/mTGWK1W79vT
         CLDg==
X-Gm-Message-State: ACrzQf1BdthZcpa9l6ggiVfqPR/bqE5LSGHjXuJRCrfkQi8Rv0afnHJC
        YHzNezuE8Ja3IEjVip2/FZo=
X-Google-Smtp-Source: AMsMyM6mV3aLso4CUT6uTdUiMHuu3LgcREAPDJpTwtCVBhcwZHXn3+qSLcJ2foQdm1a08lQY1XzMNQ==
X-Received: by 2002:a17:907:720d:b0:7a9:b7e6:8612 with SMTP id dr13-20020a170907720d00b007a9b7e68612mr48312406ejc.435.1667841508935;
        Mon, 07 Nov 2022 09:18:28 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709062b5200b00731582babcasm3698252ejg.71.2022.11.07.09.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:18:27 -0800 (PST)
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
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date:   Mon, 07 Nov 2022 18:18:26 +0100
Message-ID: <2652859.mvXUDI8C0e@kista>
In-Reply-To: <20221106154826.6687-4-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-4-andre.przywara@arm.com>
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

Dne nedelja, 06. november 2022 ob 16:48:18 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> 
> Add support for its USB PHY.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


