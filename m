Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F20911E796
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 17:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbfLMQFF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 11:05:05 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43949 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbfLMQFF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 11:05:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id a13so3198880ljm.10
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2019 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbf8k5yJ19A5wSZeXVRUlCPqOm3eyldLxkULlc81AFU=;
        b=ymPQwlgoBu3AuxXxyAS8Pqr3jk0WyzPrXO0bCPOwIOGjnvgBRrGXil4Wbr2ayNyVg0
         5oHwBqXWHlNYU4H4t0AGAUVusSZhkfHiNJjIj3uc5bx4NxoOqz31/r1rWdCvix34S3ZY
         2LTTNgxyQ1bi8H8MZq9m+SG3t+rgn5AEU+AoO5VKhdPwcr7tzMRGFhdW9/jc9cvU1N9p
         yEh3vCXdHeINwcTyiFYrKgZxEzP6mSe5+H8dC7GEWci+dHT6he+jJOMaqoKrHvuaroER
         O8H3WuM0RCU6HzU+YAsXHI4yTGfj4+7zOW1wJoyn1ns5KWkT3b+TjkHMoaPRnN7i7Mnt
         wJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbf8k5yJ19A5wSZeXVRUlCPqOm3eyldLxkULlc81AFU=;
        b=UU57l6DtkcSqaMAAWHXvExfLvZwk5FuKJVmT2I5VmMVPcswTlxQYmYjIz2jQUatb8i
         IYdi2RcoAGhRmLjd2Ug6im8t3HaL50ZSKvhYlWFJ08llkrk0GL6ItU8GWkCJkKerT9Qk
         yhKDAiET1NuRuC2gzyL31yqsoUbygkr/lHabyNyxWwOblpTmRUOI+uWNzCULZRke8XOV
         Xfd1E6h3iAriLHg4e2wO6QHzFu7uqJUTtrlTD5bkvP4AZ7w/K4d2ql3clM3Zk7nXuXha
         +JrwpY3o/VlTlltcKQtbXly8vxniO/yI8tv01XFSsNLFp7MTzzf2/ZGEW4CtwgvLujjW
         1BqQ==
X-Gm-Message-State: APjAAAWHasZESEsR5o+BKDUHcpYaAwZIL33Hx+6yUJ8ppEu6kIxh9OT1
        2WCOzS3jlFIK88SwVW+iVoKgwHMqi/OXVSKnZaBb0g==
X-Google-Smtp-Source: APXvYqwqvR2JGdbH6+gDLiMiftLZwqMCeGYmrtZEZ9p/3pwbALJms19uoBQteKErH11ha+LVboridg4Lm1ql8BrOASI=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr9963179ljm.233.1576253102887;
 Fri, 13 Dec 2019 08:05:02 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191211145104eucas1p1ce04a26eebcd4c22d72f204e7ae0aa5a@eucas1p1.samsung.com>
 <20191211145054.24835-1-m.szyprowski@samsung.com>
In-Reply-To: <20191211145054.24835-1-m.szyprowski@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 17:04:51 +0100
Message-ID: <CACRpkdbBBjXxftu1fw7H9N+hAe_MfkUPJErN6MPJ8Mxirh1w5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4 RESEND] USB3503: correct GPIOs polarity and update
 the driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 3:51 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:

> Marek Szyprowski (3):
>   ARM: dts: exynos: Correct USB3503 GPIOs polarity
>   ARM: dts: qcom: Correct USB3503 GPIOs polarity
>   ARM: dts: sun8i: a83t: Correct USB3503 GPIOs polarity

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

for all these three.

Yours,
Linus Walleij
