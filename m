Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBAC114E86
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 10:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfLFJ7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 04:59:03 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44858 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbfLFJ7C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 04:59:02 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so6954866lji.11
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2019 01:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyzLHMFusnHJRiDnE2ztNconBXq3RjA4qT8/LMOhjTc=;
        b=CPXP3PnHt5+rX/UPG0DAiF2l3hFqyuFDyAJuc7kWxLQCc0vrIRsQRv2LPHnr0gKPNR
         hMfKGSU/sqrRSME759gGj4uuwow8BjIXeEosmIBNOyYYRznqbMlymtan/3omfht+qUH8
         Znmlevxi1Bf3ZGTWHwsVs3hCPGlOvNKYPAPgn/QO/M9bY1OMUtjjzJXTS9qmr8o8RFun
         biXQi1X4mJJuXx6HlcI1WmPJ1BrCLeIUlJr9iZjyakI+aKbaZrFeLAS6fUSmxoZxqxBK
         It9JOh1w6Tm5feNCBOAKQKIGr6Ee/RtWmd51PO47LY2D17Z9sPmfEHgJY+qd4LqF8HpH
         zSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyzLHMFusnHJRiDnE2ztNconBXq3RjA4qT8/LMOhjTc=;
        b=WvHFQR1f9ekqBWOq48A1X7maRX8fvykfJnjm8lS//yS5qhU4DGliXt7TRj704t/CjK
         FeqQM0IfUnlaUnPwZsyie6xfCR/UjgmKWKAI2pR775UX+Fu74bbuXd71Xn2CJfsE0sQE
         vtZmwXA9IMjtzba+iH7IKWqZ90xetelvkdVwlVI5IDxkP2hzOjE6ai8BQYUjd5SfppFJ
         +31MBB96L+n4I7XfIBITzE2M3Yd/NLUlctBMDr0Pq/C6KW9fsHQfrjo6G+tHuTd4M5Lu
         FspbPVLlqLCDk/B9VSfSgAx94HOYlIVGXVKshVipkJhc5U44Zxk8o4i2VFJTLhACJyGt
         Wzdg==
X-Gm-Message-State: APjAAAXiMItnE7xFHFV40QEDhQ1hVIQGc6KIqnh7Bq+CQuoH0rU/RP5z
        E8100Eln4Gxogf0kKeAqDaja7CZDhMbFICKVUjKQOA==
X-Google-Smtp-Source: APXvYqxbv5stwFkpeXLNN/0iHDwhJbvAdqsRB200Ii9MbcIpy6iMsWhrxqlHJzsiRaRU107TvuQ+UGSS85fefHydm0A=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr7993988ljm.233.1575626340447;
 Fri, 06 Dec 2019 01:59:00 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191205145641eucas1p1e3f40dff8a0c8e9ca47425e2370eabbb@eucas1p1.samsung.com>
 <20191205145633.187511-1-linus.walleij@linaro.org> <39902b1d-656c-2dc9-34bc-3bfe715db22f@samsung.com>
 <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
In-Reply-To: <e4ba86d5-3c25-8b2c-981c-efaad4ebc60c@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Dec 2019 10:58:48 +0100
Message-ID: <CACRpkdZmPN-3_+VgBcrC_DczT4HzBWAg6tDa1hd=yAktnpYPdA@mail.gmail.com>
Subject: Re: [PATCH] usb: usb3503: Convert to use GPIO descriptors
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stefan Agner <stefan@agner.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 6, 2019 at 10:14 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

BTW:

> I really wonder why
> it worked fine with non-descriptor code and the ACTIVE_LOW DT flags...

The old code ignored the polarity flags in the device tree and
assumed everything was active high, that's how. It could as well
be hardcoded to 1337.

Yours,
Linus Walleij
