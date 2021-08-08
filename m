Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D12A83E3CC9
	for <lists+linux-usb@lfdr.de>; Sun,  8 Aug 2021 22:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231608AbhHHUun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 8 Aug 2021 16:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhHHUum (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 8 Aug 2021 16:50:42 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B509C061760
        for <linux-usb@vger.kernel.org>; Sun,  8 Aug 2021 13:50:23 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g21so21514843edb.4
        for <linux-usb@vger.kernel.org>; Sun, 08 Aug 2021 13:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CIvbNuWQrRFDJO54GmZe7iqsy+1L6US8bxbF34vLd8=;
        b=EgFKXdXZolQIDWKX/1e7+uHA9itMkXe93xCFp7VhDdIdM1d2ZCGrMcdJUVswPRWd96
         ajAk9Bov1dEZ5WHBYxW4rVrhZU1hRm4dWAZ/JFBUcO/SS84T9oZL1Z0HbKZKKs0Hq9Aq
         pRz5PbS0nJ3fWUyHJJwgxUxo/8LQobSvk3py615wsicF3rzEdGOYWp/6dqeNDmxwJ/Lf
         jzh9U4JmlGdPhiFot7DR4pYYqj6s0CShaK9DrMJIgq2C+jWSelcD8vnQk2MoX89rF19K
         uY+HRLGKHyuGyFzO8CcDYA2DhzPEfgXksKHOFDb9VkecqziQYq6eBq0JILha5r+9edwO
         sJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CIvbNuWQrRFDJO54GmZe7iqsy+1L6US8bxbF34vLd8=;
        b=W3pMDicDfqIxj545YM2AXhY220BFpysUqTi0LMwQxfVhgpwOp3Tk5Q6ZVnlc7orarH
         qakpiHBhejXFSzTZblfQAe+FNNC0USf/XeGiWs81saEU6ERXQUctaEY8CVqFLG16Rumg
         kGrvbnz6zZezeX/hc4XYy0IaYPsPnuGcyB3gjEO3M1x+FPiw3/1v495EE20NaCZ01XN7
         /ulc6qtA0tvZIOfZbMN76nNn1lZWyIXp7yr3/IFfHDc3rRbLfPXnUCKyvXQthGhcYPoO
         VMb+F86+iYh8wC9dS+TzDweenWBGue+reTq1a1juyXJf+LKuqIUFSz5RdTbQYiG8T5hz
         Hjfg==
X-Gm-Message-State: AOAM530VqED8xxGhCFzpWjLUrsXLKWf/87OLRhX1HA1H5XghNcGXyRiJ
        ZdKhSscxq/poyZPyRNNGXN03/RvxonHlRGmvxnQ=
X-Google-Smtp-Source: ABdhPJwHyCrOq/EpJ8M83NXU4cCw0Q2UbyxbppGA6JvEiqQhFlPwP57Z3W+bMLyWMyD8g+xtlCZIuGUhDbgrSEDHKCA=
X-Received: by 2002:aa7:d3cf:: with SMTP id o15mr3406276edr.98.1628455821445;
 Sun, 08 Aug 2021 13:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru> <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
In-Reply-To: <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sun, 8 Aug 2021 22:50:10 +0200
Message-ID: <CAFBinCBKk_2Pk+8Uztx3yN8HSxiDcCW6VTF5duX3SuX+B8bzjw@mail.gmail.com>
Subject: Re: [PATCH 1/9] usb: dwc3: meson-g12a: add IRQ check
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sergey,

On Sun, Aug 8, 2021 at 10:37 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Thanks for spotting and fixing this issue!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
