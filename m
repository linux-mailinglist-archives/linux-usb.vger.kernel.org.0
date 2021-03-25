Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5F3348CA8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 10:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhCYJU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 05:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhCYJUd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Mar 2021 05:20:33 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48975C06174A
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 02:20:32 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id z8so2161120ljm.12
        for <linux-usb@vger.kernel.org>; Thu, 25 Mar 2021 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbPaGAG5CAB0O4WGdpPnr+Sds1cjZTPECOXQC9BbXNk=;
        b=pYLbaOfTMQbkVSB6G6vGj9z8hc/1FIha2+mYDWVgN1lUtBBPkh3B91pPPnBZxGsM3V
         a3G3UL/93yayuuxVsqJZ6VbMzCAY6QeV+5AtYzQh0EQAsdWl5WKLe2FNfpewa3lp/pFH
         Z4YKHNPSZqmo86VhSNxkt41SJAzldNXoTqzfsLQ6r/t+8WBQZ5E/oTeEAOxfo4bSYMPN
         /mw/+lDIpn0YyWcQdBKO+XfWyGyN3dcpWnK8LiC63JitC79Rtds6d/ZzbSM84vbd7RKS
         rFysDCHPZhVydoK6HadZt2Dr/5PvtKsSks3mSFAwxv3xtsaaBDZCkCZThp3vvieW7l0+
         4jTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbPaGAG5CAB0O4WGdpPnr+Sds1cjZTPECOXQC9BbXNk=;
        b=MVbyYdTwE5voH5NMxdN/oQz7Zt8w8Fmfsjg2ijJLwhWyoDalAgodP76RP2maEL2lic
         omeHgMVxqZPVOmzFlkKGfLl9g6kPj5zbCG3e2oQt+fya4b5ogyT45wumyESRY3dhjfzJ
         tWAEVdgXPAbJBwyCB5JdbclfQCfmgDabtvO5JttOgbtvJaDZVpAN7JMhI5wi/eXnJnh8
         B1vsferAWpjibUMA01gxHPX5CEhcBwz2CdN3H0v8b6EbahmuJn0QTvhs0+z7HXoU/+v7
         MzLAm+KCBlDZUN4JCeEsGh7qOUwOuc7LjbubDN7+pdulDY6+pCQqcSCBk3SidH1EMfRq
         9ItA==
X-Gm-Message-State: AOAM531HYCK8RMQdRm7xtUefXuL7H8+eb3LgXkDi9GTN9cXpWKL4PCv4
        y6fgUikR48WPXLFv9Ze8iaTaGbCFIv6iubGGGIUD/Q==
X-Google-Smtp-Source: ABdhPJybjsVb89v9uAJdjlwZfTJw+gqm3MOeXLPzPvLtf9sa/2OdqT/k6EbskWPpzRq2RgOkMBrUlwRqgv9PGwua6f0=
X-Received: by 2002:a2e:9cb:: with SMTP id 194mr4923513ljj.438.1616664030854;
 Thu, 25 Mar 2021 02:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210323153626.54908-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210323153626.54908-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 10:20:19 +0100
Message-ID: <CACRpkdb4BoOdVPao3_GbDdpD0b6p_P1_8_L6bUeSMt_Ez296zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] usb: gadget: pch_udc: Replace cpu_to_le32() by lower_32_bits()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 4:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Either way ~0 will be in the correct byte order, hence
> replace cpu_to_le32() by lower_32_bits(). Moreover,
> it makes sparse happy, otherwise it complains:
>
> .../pch_udc.c:1813:27: warning: incorrect type in assignment (different base types)
> .../pch_udc.c:1813:27:    expected unsigned int [usertype] dataptr
> .../pch_udc.c:1813:27:    got restricted __le32 [usertype]
>
> Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Nice fix! Also easier to understand.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
