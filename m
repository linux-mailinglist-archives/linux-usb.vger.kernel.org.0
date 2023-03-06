Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1776E6AB5D0
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 06:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjCFFC0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 00:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCFFCU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 00:02:20 -0500
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086CFE079
        for <linux-usb@vger.kernel.org>; Sun,  5 Mar 2023 21:02:18 -0800 (PST)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-17638494edbso10128500fac.10
        for <linux-usb@vger.kernel.org>; Sun, 05 Mar 2023 21:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+YN0F1HdMnuHar7bYxgXcUl3w2yvmhyQJ80J9Xov3w=;
        b=ItWJGW7lsr7wbvnu6ME9BwD1nZQZvcD9vVlnblE6VBHFjy8ReTooeadcSJqmr30ff6
         0AOY1Cy4AJwN0EBENh4JBC2yMq3NoPCByA7sPNrmJznVewgLrsDnWCsIHWmoacYGN7yV
         3mMYseYZ9J/Zyepqu4YMQvo4JUm6bRzWHkDPTd0/KkVJSOvTztbaKEs/12Z31xeo7gge
         Xe2nhDVhe9vtY8QSuxANt19DcUkfwVkcBRavmrRXwBqaPG9hmNatOUYRZ7IBUBhzErTT
         dNuC9O6vpABj4ZbYv7W2ubYRbmHmk8m+ZU3IA7lreTzBCULLqqsfQcXpP0YKThYZWiRf
         v1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+YN0F1HdMnuHar7bYxgXcUl3w2yvmhyQJ80J9Xov3w=;
        b=nzI08qfMHo+RdzcZTbLPS3JQHZWyco0KEnHqpI43557885Jl21T4phJVWjcLeuEkld
         kDJu6grFnv1tABmd6UaIvltEO1sK52SmukDiEVwopTgrIiyU79jFWc8vqct4VKLdhLE5
         2pmgtYKG4dr4RBZl3yucCsHdWKA4vl36yc5dxnA8Hybl7jblnD/8mDrm79azftU7aspx
         Ig3suepOsEsmLCiAqtxsWLs19Pc56EdoyrNOqNmsly5/L30pIxzUPvdmzWQBLtV23KgZ
         4QQQnCjxtpFRfO/2Ou31iV7BIuc5C0npb0H35i+t21DR6MzK4K7s8rO03OwFP8pSdRRW
         tEEA==
X-Gm-Message-State: AO0yUKV4HskW2rW66FcvB23T2mWs1cs3ubZj7cAh6kzOBDgP7dVxNk0X
        WeISGlkSDd2qwG/MsYBq1OO2wIQO07Ba7ozZt7bLvQ==
X-Google-Smtp-Source: AK7set/9iaPE1Eoe9S7cRkBeIC+gf9mbqi0d7/xhCAKDgJI1/mpRmwm0jwRInDR61SswWXR9KP7wakxA0qSFMhi470E=
X-Received: by 2002:a05:6870:1a97:b0:16e:ddc:2d41 with SMTP id
 ef23-20020a0568701a9700b0016e0ddc2d41mr3175791oab.6.1678078933888; Sun, 05
 Mar 2023 21:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125143503.1015424-1-bero@baylibre.com> <20230125143503.1015424-10-bero@baylibre.com>
 <8c348b39-67f3-9210-1929-8b2f093be24c@baylibre.com> <Y/XenZUmT7Nh2qGP@kroah.com>
In-Reply-To: <Y/XenZUmT7Nh2qGP@kroah.com>
From:   =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date:   Mon, 6 Mar 2023 06:02:03 +0100
Message-ID: <CAP2ifjPvsvPyF56=YXrc9Ti6ZSLOxEXbMCOP-Qa4ZSempfod=g@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] arm64: dts: mediatek: Initial mt8365-evk support
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alexandre Mergnat <amergnat@baylibre.com>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
        maz@kernel.org, lee@kernel.org, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, daniel.lezcano@linaro.org,
        chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
        nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
        sean.wang@mediatek.com, zhiyong.tao@mediatek.com,
        khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Feb 22, 2023 at 10:21=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Wed, Feb 22, 2023 at 09:17:39AM +0100, Alexandre Mergnat wrote:
> > Hi Matthias,
> >
> > This is a gentle ping to know if you can take this patch please.
> > Sorry for the double mail, I screwed up the first send.
>
> It's the middle of the merge window, we can't take _ANYTHING_ now.
> Please wait until after 6.3-rc1 is out.

Now that 6.3-rc1 is out, can we try to get this patch merged? All the
i350 driver patches are waiting for this to land.

ttyl
bero
