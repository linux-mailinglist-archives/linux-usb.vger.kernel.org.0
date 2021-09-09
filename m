Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F6F40436D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 04:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbhIICJz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Sep 2021 22:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhIICJy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Sep 2021 22:09:54 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B7BC061575
        for <linux-usb@vger.kernel.org>; Wed,  8 Sep 2021 19:08:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id l11so530920lfe.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Sep 2021 19:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jF4r72yLaRggwcAjrtTZuOMrXDcg6PWuCWwtjX6fYkU=;
        b=BkgmwTiZ9RWCEk1eof05JMutvd+MbIAC6f6DeiVFQSesCwh3LcZbB5oDj8uHgcoSPI
         fuD5b0Eg8jF8uOhjbk9/9jBQ2z2oA1UsYPYsjgDCEe5AUBjbclunNe0sSlvha/ODeCAP
         GMJHop4ScCftLOrnhTFt/2UQSDPZALnchjdtCBj2ToMGzMHOOTV1BwIw7vnze0tP6g+E
         c9zg4QS/Swq7OFkslSwz7r/2RLyLqg436W4kerx+knjwSjnhfvioGzPFd2gFXiZ9HRp5
         f1m5M0+RnbXgnjHmbq7m46n+z4NI1kMpsIEINg9MwSwB8x32kuxDBcQyzcYjmI3V0htE
         Nr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jF4r72yLaRggwcAjrtTZuOMrXDcg6PWuCWwtjX6fYkU=;
        b=jck8t3m/wtEwgxC4f2sqA/SO6Ft90Vwnnmm3l4jsn/whm0JPTKWWLZ0VtyXLGN1wmm
         YcS7Zi39nSyjCWQQsDEMNpV21wQZK9Gnusp4IesnGYVFtQSI+sEdxU9lYTu8OqJN0FF9
         VCeXQ/a2L6YCTjwRbGo/Z8oaaWyj/d12/O7YdGu0BqohvEQwLiFB339klLIveJ7qBcML
         NBM+27wd1toB8bJ3df8UQAMArt9gJ5K9uNgv3M7U7S76kVN8FiwfqhD4NaEOFPHKpttb
         KUL+1euYnyT9lyq2VDkgyZWW0VTA/vK/N4ApHJQ1uV0JJXV8bM/eDF5Es7IdmRX9H6sX
         gPxA==
X-Gm-Message-State: AOAM5334E8mTrRqNGKJse7vit/WRZndSI4Emo3KiUjp3MartoFkfaTMX
        povLTrsrw9zqPHHPz1s1v9s738nOqevP3tdqPPwy0g==
X-Google-Smtp-Source: ABdhPJzyDfhvXgHemAhiLOvn9ZmKFmimLUs/B3MpBgZ3B6YYQJFcHfl7iG+mjq/eb/d8Qpdrhpz+YyUKPz6/jKpbtsk=
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr493133lfv.613.1631153324443;
 Wed, 08 Sep 2021 19:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <1631068099-13559-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1631068099-13559-1-git-send-email-jun.li@nxp.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 8 Sep 2021 19:08:31 -0700
Message-ID: <CALAqxLXFaO-ABZ=Ryk9-gQLwA85vYafPMku27WY6Z2pLT2XCvQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: core: balance phy init and exit
To:     Li Jun <jun.li@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Chen Yu <chenyu56@huawei.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        faqiang.zhu@nxp.com, dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 7, 2021 at 7:51 PM Li Jun <jun.li@nxp.com> wrote:
>
> After we start to do core soft reset while usb role switch,
> the phy init is invoked at every switch to device mode, but
> its counter part de-init is missing, this causes the actual
> phy init can not be done when we really want to re-init phy
> like system resume, because the counter maintained by phy
> core is not 0. considering phy init is actually redundant for
> role switch, so move out the phy init from core soft reset to
> dwc3 core init where is the only place required.
>
> Fixes: f88359e1588b ("usb: dwc3: core: Do core softreset when switch mode")
> Cc: <stable@vger.kernel.org>
> Tested-by: faqiang.zhu <faqiang.zhu@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Tested-by: John Stultz <john.stultz@linaro.org> #HiKey960

thanks!
-john
