Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD0367EF7D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 21:22:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjA0UWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 15:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjA0UWN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 15:22:13 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92561761C8;
        Fri, 27 Jan 2023 12:22:12 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id v10so5739436edi.8;
        Fri, 27 Jan 2023 12:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=KjwD47Qr6iZP/O9PFJhqPa4DXwn1l74X3nfx6kTwt+q9S7DkJW1ctaL1SAg+HarvRo
         E8mVvJB8G0aM4EzQmGTh0uF45yjqn+nDVC0/6eAe57kksR2S6u2qqOIwcSZgWdFW3Ic+
         ppvwB8u8v0YZuLJ/M88zYnWPZDekyWFImeo5gxaj3lMv1qmVWE33IHZYMQ8JX0vjY640
         2FRiGOVg4AjznpAz8uS+VyysPYvPVhD9Uo/KGFEpLBFv3PmdhrOKmeNOTasLzM2Qmb4L
         fqVMz85pS9/47JF/mmoSYodYM0xJpTbVeWczW1yEX5X21Ww0sQpz4eoYcNIdbzTf+3fs
         QRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mqf3tpDJNX5sIiyTeIYmTr7VbjdNQeu0rlBoqz1e+Q0=;
        b=J9ESqlHP7viclAzgyWFjevE+rpd8WhdiwqtAqvyenTJMcEfr0XT+bZjyljoVB/jwDd
         7kKi0KX+ByMSXOxaWLcR71m1wWu+KKY4Vu722oEAbcyrUEgU60QktFKVfKQW/h5yr8gF
         5TrGz3pSDfgIDIUQxgC+FtM26/Vbz0zPgnkRodYlAB7OoDR/Qne8B2qLokNco4PP8yJz
         1m5iBRi1Urugp/1YR8A9oino2lnkoNtruXeQ5I3QdEwqEnoYd2r5EGzH6ibXPrtcgE2R
         Jbm+NjebSCMZzZZzg47wbIVoNSe219sWe1c/1wPr5/1jloWy0quEAYlxUcrZq1Geg9EL
         4e7g==
X-Gm-Message-State: AFqh2ko40gjG25g9gIBSPZPZNrGhosIzPKTGX1MvSCKZOc8RPIFhTpFJ
        PyPa4RkwNRR+9Lf4rT/Lh+o=
X-Google-Smtp-Source: AMrXdXslchCqGmh70f80P2YbvDJBdxIzu+HfPexB7WQFcZPWKwYNQ5BuM/fuJwEdI0F73cI7vK1NlA==
X-Received: by 2002:a05:6402:28c6:b0:49b:98be:c38 with SMTP id ef6-20020a05640228c600b0049b98be0c38mr44822085edb.11.1674850931014;
        Fri, 27 Jan 2023 12:22:11 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id f5-20020a056402068500b0046dd0c2a08esm2861517edy.36.2023.01.27.12.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 12:22:10 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bin Liu <b-liu@ti.com>, Andre Przywara <andre.przywara@arm.com>
Cc:     Icenowy Zheng <uwu@icenowy.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, soc@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 03/11] usb: musb: sunxi: Introduce config struct
Date:   Fri, 27 Jan 2023 21:22:08 +0100
Message-ID: <12138531.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20230111015332.172021-4-andre.przywara@arm.com>
References: <20230111015332.172021-1-andre.przywara@arm.com>
 <20230111015332.172021-4-andre.przywara@arm.com>
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

Dne sreda, 11. januar 2023 ob 02:53:24 CET je Andre Przywara napisal(a):
> Currently the probe routine explicitly compares the compatible string of
> the device node to figure out which features and quirks a certain
> Allwinner MUSB model requires. This gets harder to maintain for new
> SoCs.
> 
> Add a struct sunxi_musb_cfg that names the features and quirks
> explicitly, and create instances of this struct for every type of MUSB
> device we support. Then bind this to the compatible strings via the OF
> data feature.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


