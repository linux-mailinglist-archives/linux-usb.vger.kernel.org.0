Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72F6412B5F4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Dec 2019 17:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfL0Qko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Dec 2019 11:40:44 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:37683 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfL0Qko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Dec 2019 11:40:44 -0500
Received: by mail-ed1-f65.google.com with SMTP id cy15so25734358edb.4;
        Fri, 27 Dec 2019 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgrOcm9k9IAQcFI+FWINNDCQ0Z4VaYkcjqiXu7nzoSs=;
        b=Yf6Cu8DGYWlCJdHGMC0bCW0kyLJBuSPvgcu9lEwGombWcvTkBDMvNqz5BXObWo3yok
         p5el38LSnq5WwV5xPaxH2kD1uC1zQLDc90NKaHzo5pMnK5IM3t5+g7M6Dy89kSbkesBD
         PKuPfIb9Ne2DPhT2T1AyR9N4f1vZHB8G2afcutDR21ntb4f5EV1WNUttItuiRsGW8lO3
         oagm92RwvJIfhFK20d9NRpGz+rCQDCS24AeDaFlUwM9TI5mAPRcuwVkhqJOw521B+iVu
         Fw2LLTkI4p8vCWe4nn2jFEx3hCfknLrdce2dS+tW5Z5HpnuhBts1ssj/AkZzzy4Yc5KX
         T1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgrOcm9k9IAQcFI+FWINNDCQ0Z4VaYkcjqiXu7nzoSs=;
        b=pmt/lep4OKT5bpw0G8jDFuhPRRjK97qYmncIp75afqTXy7JP2qiCJGgezxoMTjuq8l
         H5lJ+M5bKY34erA7wg8f8a1YPLvNdXERLvpmJxDalOeeoJn4D+OSbPQ77SRE7xS4Tj7y
         UjKyAz7xYbm5xHHarbTYqQpDYK0mreT4cxkEU5XfMKF/PuNVeOGBWch1iy+U1JbdW+Ig
         15J70RRLi1FNwKwAp4AHpYTkc53ogfZwBPD5cNourVQYeCjtGtNnH9nRdzPCw5xl/HG6
         D/8zXV0A07E9oSLYGtuX0hRBX+WrJX+2ey9BVbvdig+7EzIs8uxdglCWPtCRAAbiawKR
         6q/w==
X-Gm-Message-State: APjAAAXKUynsK6LQaevVZ4EID1r0LOXpT4lwRrV1UiFe9HEZhGrTCAsy
        P9WgD5fBA3LgQ9B6lZtZwtx2jNCyneI9OCscGus=
X-Google-Smtp-Source: APXvYqxkHYAyndioq3rkIDvgR0cbdviWKBnIZcDlDoZQCfu0BNG7PYKVTKcaxVPiAWtYOYRzgvoWo7ltBXVq83a0o5o=
X-Received: by 2002:a50:bae1:: with SMTP id x88mr38955946ede.10.1577464842282;
 Fri, 27 Dec 2019 08:40:42 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com> <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 27 Dec 2019 17:40:31 +0100
Message-ID: <CAFBinCCEz-xezKatuHDPRURRWa3YNmgMObbr85GSvaT_bLFcNQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hanjie,

overall this looks good to me and I have one question

On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +       if (priv->soc_id == MESON_SOC_A1)
> +               value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
...here we have some CLK_SEL bit

[...]
> -       priv->clk = devm_clk_get(dev, "xtal");
> -       if (IS_ERR(priv->clk))
> -               return PTR_ERR(priv->clk);
> +       if (priv->soc_id == MESON_SOC_G12A) {
> +               priv->clk = devm_clk_get(dev, "xtal");
> +               if (IS_ERR(priv->clk))
> +                       return PTR_ERR(priv->clk);
> +       }
but here we don't need any parent/input clock?
does this mean that the USB2 PHY on the A1 SoC doesn't have any clock
inputs? how does it generate the correct clock for itself then?


Martin
