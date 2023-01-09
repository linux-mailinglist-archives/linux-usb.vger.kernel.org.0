Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67C6366277B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 14:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbjAINoq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 08:44:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237271AbjAINiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 08:38:10 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D3E2628
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 05:35:55 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id c82so1247342ybf.6
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 05:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qnppp6O9rdKqbwFnY5I7NEyC+PLI49fpb8XjPx9K9kY=;
        b=X5KBMlY+l3uEKb3KlAV/VkLeIZQlibfQI7xC0OEIMJWiX1pzgdPRkFkUDfldoqejWP
         qx3CpUdKYQJE9qqkyYEgYRUJMr/qXageQlaPEuyS9VYuQgL5KWNdWEa7NpUsSY38jb35
         kpsJLNys+M8NNRoeLVFcOhtSKnkC7yA3/qIkNNyINYnszPTRYMZmtjeu4fHqk98mBdlp
         j2kbOVve4XGndCbLypd4+p3QK1xG0dxBrG3FmZkq/hPKjzULYboVBM6l9imslaIyZmNW
         J5w/fiIT35b/v3j64NyNZeo4qNF2MkgGdZNyFoOF/2rfcv3v0ScaukX2Uz4/pBnxuzVQ
         d8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnppp6O9rdKqbwFnY5I7NEyC+PLI49fpb8XjPx9K9kY=;
        b=EQ5wdBFEFlkUIH06GdapoKZII79UDSn5GU6FXtBkG2FhQFSz1tvWVE0ZtoY3JH4G3s
         jeU0fMk1/DQc1uoEe+X4pZyfBnzvP8dCl6RqSXCPSnBNAm8fqIqcvrpDuxdfnuW+keL3
         NoiQW0tX+o08EnTkeq4M+iVlzRBRYRpdEXfrZVBCEqWm8zNmg5XqGns98FmDciB9Gsi3
         HqhqmvFiO2IQ+qcCo/Ew966jlFOuADqQtJQa4/ywghbKCD+Cik2i36z2IWHJDEFgkTLE
         Qwd6kiICz2cShrlbL80xuLCQpJVTDrCdE5QGheW0Fpc6unN2A9vmyKFEjIBXTD8pbhpZ
         XWGw==
X-Gm-Message-State: AFqh2kpYzNh7ICf/dz+RyBZ9nrl9GagjEfrR2COfhUb2H6NR2D6PshIx
        tYkuD5yHhu3F6SWCxKAY3cMOReJUQVVRWie9XbXZzg==
X-Google-Smtp-Source: AMrXdXt+flubROOHapYHT2FaRO7FxPa9Na5CMrvvqi4lErIiX3EJ1CN07iHonh9qeMFuiACLFZuGrIn3WqgqO1jsWJs=
X-Received: by 2002:a25:911:0:b0:7bf:fd02:6dbb with SMTP id
 17-20020a250911000000b007bffd026dbbmr55958ybj.341.1673271342147; Mon, 09 Jan
 2023 05:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20230101220149.3035048-1-bero@baylibre.com> <20230101220149.3035048-5-bero@baylibre.com>
In-Reply-To: <20230101220149.3035048-5-bero@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Jan 2023 14:35:30 +0100
Message-ID: <CACRpkdY-VqM_mzgJ=n9fEtFJD64EBie1EQF+8Bk5iLE68mCnSA@mail.gmail.com>
Subject: Re: [PATCH v7 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
To:     =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
        matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org,
        angelogioacchino.delregno@collabora.com,
        allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
        sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 1, 2023 at 11:01 PM Bernhard Rosenkr=C3=A4nzer <bero@baylibre.c=
om> wrote:

> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>

Looks good to me, do you want me to just apply this one patch to the
pin control tree?

Yours,
Linus Walleij
