Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65AB16291B5
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 07:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiKOGBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 01:01:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbiKOGBj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 01:01:39 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECCD1EAC7;
        Mon, 14 Nov 2022 22:01:38 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id l11so20423785edb.4;
        Mon, 14 Nov 2022 22:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myor8n787DIBkDuVhefOsckVQpCRvL9+vEoJMW5tQZ0=;
        b=pPsj20BpS4ORtdE6mibv0QMuBA6Ig37PW4ZlcrAv+d715th7RdYh0EB2hkzYzQ116G
         l8a+1qOaYcWxpbDwBeO8aK4RJ7AWy0oJnUkQd2bgia2sBEy21hUDzkXmnjMiD7zcKhE+
         JU5HghiJELpmf4tF8PkOxK0+Yjo+EQWO59ou+P+UI8dmmJbbGbQ2V8OcAQ+/SNWUj/W8
         AEmsjk4NFxfkYxhGZraXXO7pxBTB+yUibGUwfN1co3AUZFvLQqrj6WNar9AE2SS/KuaN
         eE0qPp6XzMIZkYyo/QXK50m8fu/fA6Bxqze9Kxcqa01E7UavD9zQPNYjuGdfiMV4RrWp
         5mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Myor8n787DIBkDuVhefOsckVQpCRvL9+vEoJMW5tQZ0=;
        b=7861tvYmXaU9fSmAUzTSluYqzyn1TF/Ns9dTDGIJ3awksrw+msS7cLLVvl+Ux0IFt0
         kK9rTUs/0LuUfah1frxT259h3YFBe7uapA3yR6sertxfn8/hV1l8JdVKkzAST8E8wOHU
         wUzgYwzGgWSuOc0cievISQcU3SlgpQ1O8G+92eXVA0j7ggl0y2+JZj52vF/z8UZQeHg3
         wEoB82suG3O1MRS78TRDWCLwp4YTBVBUIZn9SEUHQsHvjtqpnCUx/jPbP54zLtfhtlbm
         XclqUtsfzZ4MWVJoak4P1jjIEuzJY3H9oEOBHJNJW6JyzBG5IE8mjoq4fW70dn+v+3hr
         FHPA==
X-Gm-Message-State: ANoB5pk8LyqLin7JTQbCDf9sv8GdiDrVhC8SLyLd3yw2hKd59ZBZOigM
        iiVHYIb+dCmhvBpZm+XhSjI=
X-Google-Smtp-Source: AA0mqf6i/3jHh060R/CT+OjGDanwY7AeoEfxktpAznZjdGnSsvDp8mT/+1qho0mFOEhF9tNVyrlqiA==
X-Received: by 2002:a05:6402:17c2:b0:459:443a:faf4 with SMTP id s2-20020a05640217c200b00459443afaf4mr13748008edy.297.1668492097365;
        Mon, 14 Nov 2022 22:01:37 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id 3-20020a170906328300b007aec1b39478sm4953604ejw.188.2022.11.14.22.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 22:01:36 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Andre Przywara <andre.przywara@arm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on F1C100s SoC
Date:   Tue, 15 Nov 2022 07:01:34 +0100
Message-ID: <4438485.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <Y2ypy0CM8rJGu2g4@matsya>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-4-andre.przywara@arm.com> <Y2ypy0CM8rJGu2g4@matsya>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne =C4=8Detrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a=
):
> On 06-11-22, 15:48, Andre Przywara wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> >=20
> > The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> >=20
> > Add support for its USB PHY.
>=20
> This does not apply for me, please rebase and resend
>=20
> Also, consider splitting phy patches from this. I dont think there is
> any dependency

DT patches in this series depend on functionality added here.

Best regards,
Jernej



