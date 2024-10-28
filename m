Return-Path: <linux-usb+bounces-16780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F49B2F1E
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 12:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567161C217ED
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 11:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEF41D8E12;
	Mon, 28 Oct 2024 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hdf2SnIu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395031D7986
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 11:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730115878; cv=none; b=PT65kNYvqosZFDsFXo0Axd52dxBUOujQhdRLntxoICwNz+el7u5U6z28nWLmArkZ/ZaTFZR8pEZHoTShTGr8NL3H+OXYSPNBciEGAK+XUKPCJSFf9Q7ExtyJ/4wSYiclVQp+kYKf1KEfehll2B2qlYfkUBs8xDWcOt31LvheJ2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730115878; c=relaxed/simple;
	bh=sIrBYg66hmwWk7TsDy2bhP4Kq6hK7NxiK4s3ASUWf5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgjClxomLuRhAYH8IPyQgSH0cB2fZj+tV4OJapD5GrowBVsXDPfpmBJuzbjjByFnqv4jRKJnP4fFJ5vzdE5R5VJCWqwhsaJVUGlqhSNfDM12Rj9fGPN6SwVjFShvyhWIXdhkZgcuyFukUBQlNOuPlCNr4XOsgRv6YA86ll78IsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hdf2SnIu; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e35fb3792eso38979857b3.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730115875; x=1730720675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sZVio8cvkxkCAcUKP0pXIkXjIVgnIaUFuCYZiRy+dgw=;
        b=Hdf2SnIu1EwafM/87KxO2k/ifP8fMS0KNIvY9KdHeyCpKTjlL72xsCb7Xbyc1xzImy
         kO4aIE9jfVwJUNj2VXiDQt4L5K6hHqd8R/OGschD7SVoSCrLvVXHJpy6U9dRQXxhLna2
         wC60ZMoNcv85TPc4z54N3PWgpyr2JeeJ9Ze5/Xjv9mxxQa1+4/BQqD4oK598IMnQNGFE
         5LrJuOMa4AEqQdOvx1qkCYndMGC3ijCkLhvGTOQINCVcPdxy8YsTUGQ8ROtDQKkzX1Qm
         hl6+UfhukwqOzLzRf2Ic5eJ7Ia7OY0KFVB/k9l7BY8wasX0ccyGupkqx3BRWtSCHiIQq
         y1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730115875; x=1730720675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZVio8cvkxkCAcUKP0pXIkXjIVgnIaUFuCYZiRy+dgw=;
        b=oNNZqg9Er7ufZL4JmKHYVKfe2z0ufpXDq89esNw4UecsR+LPAO8O6kUJ2+wGofvqEF
         ngmSb2Lv11TAQqg39fyK9R0TEdsEFf7/ooGv7KTzCLTe2qfzX0CXZGa5rCwkxnYFz7P/
         OOtspeJud8wZSEfJlyE/x+eFl01qnIvET/+tX0kw9pFeymoZ0CC5xPz5g67xsQ5rkw7s
         uR2r6DQ7HyZejTp7+AoNop8FvhoG3MSz+1k27hz0y1Wt3RbRbC/xrhgDv32nWxrALP68
         2krlQc6Iw1jUO1rY20D4GW/XaKTkQcaHTOjGmlr+eBnqBBo+jd7VFrcT79milhDmYFrz
         8q8A==
X-Forwarded-Encrypted: i=1; AJvYcCWSuhcuJFNUc0ACcR2IQ/n718XrL0DPIFk3+bARERNL36sn0HfNCOTPba6KL2+dzFAkejNgb7bNlwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlY61ORiwew+XW0r1kQ6U2r/1dY1qpmx0T1vmWyLdS9zJNWtt6
	njCzy+lbg1mPrlpSIzeq88D3qdq/C/5aBFjYkkakWcMddxmKgiRzJfnVYzhk+wbCqi+Me5JDp27
	BQxPR4EjCxxHHlRi0LsrKbZPKT53obna/D1sdZw==
X-Google-Smtp-Source: AGHT+IHLKeKx9NpqZxAGiLQJMaILqzRYuWQfYpYj/MQf6dPo+SbTGqn7EpjJInbFkjakb3I2ccTD9UYXD8f0NCsex7M=
X-Received: by 2002:a05:690c:3804:b0:6e3:6467:f46c with SMTP id
 00721157ae682-6e9d89f3b5emr75751517b3.14.1730115875249; Mon, 28 Oct 2024
 04:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025103621.4780-1-wahrenst@gmx.net> <20241025103621.4780-5-wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-5-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 12:43:58 +0100
Message-ID: <CAPDyKFqwozGppFLJhjTc86nW1rodZymBbVZr+VpN4e2J3VowMQ@mail.gmail.com>
Subject: Re: [PATCH V5 4/9] mmc: bcm2835: Introduce proper clock handling
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Vinod Koul <vkoul@kernel.org>, 
	Minas Harutyunyan <hminas@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, 
	"Ivan T . Ivanov" <iivanov@suse.de>, linux-arm-kernel@lists.infradead.org, 
	kernel-list@raspberrypi.com, bcm-kernel-feedback-list@broadcom.com, 
	dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 12:36, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> The custom sdhost controller on BCM2835 is feed by the critical VPU clock.
> In preparation for PM suspend/resume support, add a proper clock handling
> to the driver like in the other clock consumers (e.g. I2C).
>
> Move the clock handling behind mmc_of_parse(), because it could return
> with -EPROBE_DEFER and we want to minimize potential clock operation during
> boot phase.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/bcm2835.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 3d3eda5a337c..107666b7c1c8 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -148,6 +148,7 @@ struct bcm2835_host {
>         void __iomem            *ioaddr;
>         u32                     phys_addr;
>
> +       struct clk              *clk;
>         struct platform_device  *pdev;
>
>         unsigned int            clock;          /* Current clock speed */
> @@ -1345,7 +1346,6 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>  static int bcm2835_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct clk *clk;
>         struct bcm2835_host *host;
>         struct mmc_host *mmc;
>         const __be32 *regaddr_p;
> @@ -1393,15 +1393,6 @@ static int bcm2835_probe(struct platform_device *pdev)
>                 /* Ignore errors to fall back to PIO mode */
>         }
>
> -
> -       clk = devm_clk_get(dev, NULL);
> -       if (IS_ERR(clk)) {
> -               ret = dev_err_probe(dev, PTR_ERR(clk), "could not get clk\n");
> -               goto err;
> -       }
> -
> -       host->max_clk = clk_get_rate(clk);
> -
>         host->irq = platform_get_irq(pdev, 0);
>         if (host->irq < 0) {
>                 ret = host->irq;
> @@ -1412,16 +1403,30 @@ static int bcm2835_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err;
>
> -       ret = bcm2835_add_host(host);
> +       host->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(host->clk)) {
> +               ret = dev_err_probe(dev, PTR_ERR(host->clk), "could not get clk\n");
> +               goto err;
> +       }
> +
> +       ret = clk_prepare_enable(host->clk);
>         if (ret)
>                 goto err;
>
> +       host->max_clk = clk_get_rate(host->clk);
> +
> +       ret = bcm2835_add_host(host);
> +       if (ret)
> +               goto err_clk;
> +
>         platform_set_drvdata(pdev, host);
>
>         dev_dbg(dev, "%s -> OK\n", __func__);
>
>         return 0;
>
> +err_clk:
> +       clk_disable_unprepare(host->clk);
>  err:
>         dev_dbg(dev, "%s -> err %d\n", __func__, ret);
>         if (host->dma_chan_rxtx)
> @@ -1445,6 +1450,8 @@ static void bcm2835_remove(struct platform_device *pdev)
>         cancel_work_sync(&host->dma_work);
>         cancel_delayed_work_sync(&host->timeout_work);
>
> +       clk_disable_unprepare(host->clk);
> +
>         if (host->dma_chan_rxtx)
>                 dma_release_channel(host->dma_chan_rxtx);
>
> --
> 2.34.1
>

