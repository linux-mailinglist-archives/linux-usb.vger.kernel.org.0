Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B17561DE6D
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 22:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbiKEVOF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 17:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiKEVNr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 17:13:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20AFE13F99;
        Sat,  5 Nov 2022 14:13:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id b2so21347704eja.6;
        Sat, 05 Nov 2022 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3Atp6OQ0hihmNz5QNadkHqhzgkTJKoUcjOaBjypw+Q=;
        b=bglHRnU7qLXHRwlACNnGxRtFU87lku3jx4z8p+iuFay60Y+qhtekjyPje77IX2HDUm
         PQqQWBuCa5r1TADFDwyvCE5As/H+aB7sd/4WYChe2pomHXSaVaqszjNd556B0ViY3QTf
         dXsFgprtTwBld3U36VY2vBkYBuT5lsZ6qde8XiV3CaYm/nQJwPYiiVyBHdZQdMaRF7bb
         tBvlENeZXV01SkeWeEvj8lojikZX3K6pnbpZksLONvd6BzBxxHIeHIG1g70opmppmoit
         qn0EwdMw3SiTI3AXQ/eIhv/+VPKpwRj2H5zGv0MPVQjDEOSPmxBM6yp7kXXceRO+g9UN
         MqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3Atp6OQ0hihmNz5QNadkHqhzgkTJKoUcjOaBjypw+Q=;
        b=YHPku5HdpyYMuGg1UdgWl8Xtz8y5/ixhr573NOZEkhJ+xNFrInSCg0isL41q2TnEf6
         VhdWismycTlu7n3ZxjF/ImZNH+qaMSwMtdWF0V+krcNg5Q7YFWCbDnvcRe21XFoMXcOH
         s6xhskMRr+DNrjFS11eaBBln4u9ov8pY9+7ozGmNFbOONBX5kO/63dmkxWjQtEPrHdfT
         pWEoN79hqnUdJjZbhg40GBh/eNpPIFdk0hfVsdddnpd/gg5/fuOcvYKdxvZBOtGPdVU9
         fC6E8inCX/GUjKR+ld4eqdig9rWBxHM2hXH92X1yAok76ztPtnY4bz/5O36mPajgOxQL
         8ibA==
X-Gm-Message-State: ACrzQf0RC792v6Z//0nz7wWmqTo0jRfxWfNSryoAGac+q4y72Y64PtKw
        fZW4vhDqaVAZM37N82J558k=
X-Google-Smtp-Source: AMsMyM79/7WOpzBWpxDgJ8bsfPTIPC+HmiuFD6hoPreKi16DPueMc86u46duAg2o3oOTVhj7pnUXHA==
X-Received: by 2002:a17:906:33d8:b0:7ad:a195:ce51 with SMTP id w24-20020a17090633d800b007ada195ce51mr40269876eja.365.1667682819641;
        Sat, 05 Nov 2022 14:13:39 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0078d22b0bcf2sm1324907ejz.168.2022.11.05.14.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:39 -0700 (PDT)
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
Subject: Re: [PATCH v2 6/7] arm64: dts: allwinner: h616: OrangePi Zero 2: Add USB nodes
Date:   Sat, 05 Nov 2022 22:13:37 +0100
Message-ID: <3195779.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20221031111358.3387297-7-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-7-andre.przywara@arm.com>
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

Dne ponedeljek, 31. oktober 2022 ob 12:13:57 CET je Andre Przywara napisal(a):
> The OrangePi Zero 2 has one USB-A host port, VBUS is provided by
> a GPIO controlled regulator.
> The USB-C port is meant to power the board, but is also connected to
> the USB 0 port, which we configure as an MUSB peripheral.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


