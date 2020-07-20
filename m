Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA6B2258F3
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 09:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgGTHuU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 03:50:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39490 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgGTHuT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jul 2020 03:50:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id q5so16784088wru.6;
        Mon, 20 Jul 2020 00:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qsYFxuiVJQ8AwkMCbPhhmnP96yIZdaIh3P0cMkWmLM4=;
        b=Dx6e+76JCjmohULdhcjrptU0HFrv/RhACllmo97T3AvtegRYjU+3tdMrrLaEDWMoQA
         tgKQ1wEZICUdur9C0Yn7plBiFtPbrPiBtF0dAlyv7ecmfIVyrV+WKac+4vu/FlIvrnLD
         NFavICqgYLQmVcjidFRH1S6hezO8/m8H7qn073KgFdbmkoa/W+8HOufseCjE+ZQjbEWq
         HLI+U15aMcVJj9NBv/VJjQz4wDlzfsPAwmE6rB+FxMAd4/NUw6AsjTT6cArpLqRLn+3C
         F5EJzz2Kb3/KYFjdMKzrVmi9Yan+Oq2fDPDAPfQEWVm/Frtvm7PullPd8eagSki2JG+g
         FP5w==
X-Gm-Message-State: AOAM532kjvARjttZC2WrTv0+JOj9sJxFymFKe7oBEN11fRi+nF9Q8qzI
        YmW7dLKQYFTUOSmlcj4qzao=
X-Google-Smtp-Source: ABdhPJyuB6MNY9/TxDm8Vc5ztVukt0nIGOozl1ml3uktZb5ASxV5ASqOPKzSAElaBaJyVi2UYirVeA==
X-Received: by 2002:a5d:6348:: with SMTP id b8mr3712910wrw.362.1595231417394;
        Mon, 20 Jul 2020 00:50:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id p25sm28968324wmg.39.2020.07.20.00.50.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 00:50:15 -0700 (PDT)
Date:   Mon, 20 Jul 2020 09:50:13 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4] phy: samsung: Use readl_poll_timeout function
Message-ID: <20200720075013.GA6711@kozik-lap>
References: <20200713074243.530-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713074243.530-1-linux.amoon@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 13, 2020 at 07:42:43AM +0000, Anand Moon wrote:
> Instead of a busy waiting while loop using udelay
> use readl_poll_timeout function to check the condition
> is met or timeout occurs in crport_handshake function.
> readl_poll_timeout is called in non atomic context so
> it safe to sleep until the condition is met.
> 
> Fixes: d8c80bb3b55b ("phy: exynos5-usbdrd: Calibrate LOS levels for exynos5420/5800")

There is no bug in original code so Fixes tag is not appropriate. Remove
it please.

Best regards,
Krzysztof

> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes v4:
> Rebased on to of patch [0] https://patchwork.kernel.org/patch/11651673/
> --Fix the commit message.
> --Fix the error timeout condition for -ETIMEDOUT
> ---
> Changes v3:
> --Fix the commit message.
> --Drop the variable, used the value directly.
> Changes v2:
> --used the default timeout values.
> --Added missing Fixed tags.
> ---
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 39 ++++++++----------------
>  1 file changed, 12 insertions(+), 27 deletions(-)
> 
