Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4F632C617
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347074AbhCDA11 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235604AbhCCQFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 11:05:52 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE1EC061762
        for <linux-usb@vger.kernel.org>; Wed,  3 Mar 2021 08:03:04 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id z9so11514439iln.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Mar 2021 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlCoHdrHwzFyKrGMLRWyNUHIOyPdF/GbZeImGDz8wq0=;
        b=cjQNm2CYodjavO8DTOBBmNVCObrgXF1DrthYCbp5n7yaDb5GFnh4C75DJT863fC6p5
         /q/7FAQCECdCA2YfWzpr4ivpCYy9ssaptU0g/GE5fhyusrfyB2U03unAMlvBMIY0H3zF
         Qze4WC0h9kaPldZaAbiuG1vJVKsp6SNIjFO9CEoruKp+VXjwozWuKsLDRfwGM1SHfTnr
         b/DSF6lu7uTo+MgrkQtNujqDztM2dh4JgBTqE/jrk+k/QkjyMSZ5Ufksc6DRf/XlFKwV
         fI9jX0yIww9a8md5w11AsfLgx2SuzaSbCAF31efbshqYO20fGHOHIR9nPra5XCKInpBm
         idvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlCoHdrHwzFyKrGMLRWyNUHIOyPdF/GbZeImGDz8wq0=;
        b=nYGy/ilzM3MMXMJqwag26tqkBuWrmCsYW8D90jCvXgueInjjAWfh4lagx7O1V+xgl0
         x0QiSOnskJQmQso3Fz2xqC3hx9KyyWhB6o+V4GG+x7nuNXpVHaj6R8dHYSW20YbV57yB
         ICt5FhNsV6tGzVefJt0B/wq6rCn9EFSRSDQTuLzX2/OCbvRDobSmvO5ZLIoLRik2HpVU
         8hAYytna1SPIp+oHgVwCL+zWsj3g6MiwOvnnikvZJTeGWAOHVgD+c36NFDagHyDliFfY
         HO1LJnCEdYI8BO3YMh95LLgaVSBe93G53nSKtG1i7JqLGIYcc7hUM5QUjgJy9vlDYaCd
         +rmg==
X-Gm-Message-State: AOAM533A/Lc2ozrJgFiZv0uzuSxLArzv8aBTha/Ln/gDTXB7hBgC7xXX
        RAESdH+PHBSqvd+HfcupGZbIb6a0H188/J4xJpmO9Q==
X-Google-Smtp-Source: ABdhPJzWkHyxJe0NzceF7XETf16b9fqLN4/ttrAqSVQHhs60VadqEDCFHTCSwfAGtHcxxc863jggycnhWNNy/tkOA40=
X-Received: by 2002:a05:6e02:e87:: with SMTP id t7mr22630570ilj.211.1614787383623;
 Wed, 03 Mar 2021 08:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303095826.6143-1-colin.king@canonical.com>
In-Reply-To: <20210303095826.6143-1-colin.king@canonical.com>
From:   Ray Chi <raychi@google.com>
Date:   Thu, 4 Mar 2021 00:02:51 +0800
Message-ID: <CAPBYUsCPj12enyMp9AMzFEAgd5MdKh7dYN5DNFpZwofBYnjG8A@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Fix dereferencing of null dwc->usb_psy
To:     Colin King <colin.king@canonical.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 3, 2021 at 6:00 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the null check logic on dwc->usb_psy is inverted as it allows
> calls to power_supply_put with a null dwc->usb_psy causing a null
> pointer dereference. Fix this by removing the ! operator.
>
> Addresses-Coverity: ("Dereference after null check")
> Fixes: 59fa3def35de ("usb: dwc3: add a power supply for current control")

Acked-by: Ray Chi <raychi@google.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/dwc3/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index d15f065849cd..94fdbe502ce9 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1628,7 +1628,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  assert_reset:
>         reset_control_assert(dwc->reset);
>
> -       if (!dwc->usb_psy)
> +       if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>
>         return ret;
> @@ -1653,7 +1653,7 @@ static int dwc3_remove(struct platform_device *pdev)
>         dwc3_free_event_buffers(dwc);
>         dwc3_free_scratch_buffers(dwc);
>
> -       if (!dwc->usb_psy)
> +       if (dwc->usb_psy)
>                 power_supply_put(dwc->usb_psy);
>
>         return 0;
> --
> 2.30.0
>

Thanks for fixing this bug!

Regards,
Ray
