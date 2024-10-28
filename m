Return-Path: <linux-usb+bounces-16777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EB9B2E42
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 12:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 646BEB2460F
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 11:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F6E1D7E5F;
	Mon, 28 Oct 2024 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHbvzbmw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2E1D416B
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113038; cv=none; b=mUEt0f4c25gvGr5yPFNY+bSuJLsI7KfHn6Q/sGWFsSeT337+8aGPn0a8S4v4+vrL+VRFUz4Fzz/Lq90PJ6YnSxOhjeGvhVxqsUPvSaPuXkTOPo/TrSVu8pdJ7Twiu8C0MUUoYpoNlchOEnoYswY/l/3uRyCAATjIuIKkZ6Qw8J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113038; c=relaxed/simple;
	bh=ACRaOUj1WOVfpWuhZEMw7VYY4sp45JSXpzq4OnInkZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTzvm9FefYhjtMBv/JnOTsRw0OR7ioVvd19FkZS+DKKohZIiEyVEiCi2M60POjzhhsYQ64mUeiH4IErkkr1s4J0RJEFO+dU7S+geLq3DBBjgMpB79u57NzxloP0c9UJEBQnHg1LYrrwrZCz5/mnYcantkc/APH1+U8MoPf3kzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WHbvzbmw; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5fadb5e23so35895487b3.3
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730113035; x=1730717835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48Mqgz0yoPcTn42M0JioJyjAgLLTyWy+bgFbYFVMpQY=;
        b=WHbvzbmw7l1r2ZG7BL3KVSyHXykcGwjuarvHb5RWaPKS709EGyoLHGPwhZKfVPecNH
         zympayYcjvrU0BiN2acYrvRLCDOgdiX99bCJsrY5YGh6d6A6qKRH32/imJcwyVzcp+5+
         4Vq7y9di3iLgTtzzCsv0TRgMm8yELz+51VWVkQRlpGETLIlBGpXva+a6R01Z4hcSMBbe
         mfFXbhCFdHiYveosWl1Z+9c+h5G4z4NKVO/m/EMA2fnmihZ/L76zVEffteu+qkDWAlx8
         pPn5m/2ai9GENpUQpKL2Mt2ntiuCchdkwKmqeKdcj7caHBBNcduT8dPKbfvvbAlSrU3+
         XG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113035; x=1730717835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48Mqgz0yoPcTn42M0JioJyjAgLLTyWy+bgFbYFVMpQY=;
        b=lm0zjDjl7ZkeP8fmZkISNgv9SBwU1dYgZir0s8Ensr9iq7D4KM980ONwV4SdGx0FPM
         qbmBza9lhAlFToDVgXrNzNuF0WYu1DuRpTvFIwcJUGii1q9cDtyICrklOJJSEv7tI4dV
         dPhz67BidfvBtZiMISxLWE0kO0AbR9YT39gDXhMYaaSjesZDd+GYE46BLpPJnHjoXUUP
         EsdmhtHGiFJF2ujsILyt1Nf8DdX7GbEejEDwLMCxJF28Du/oKuv/6UrUR3WQidBqQ5Y4
         oEzP4IPgyUGSw4O/w+fEcDfsI4VbJGVMupWYQCB3Uh+ELEnqd5aDgj4n0JJv9qD7/FbI
         hh5A==
X-Forwarded-Encrypted: i=1; AJvYcCV9/zR75Gl6dUmwHEgxNFfZguuXvN+i4SeWmb+QrkMM9I64tDuGoVhhOlYVzLxV7sx1B3Rddrj46bA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+sxtXKPU5JmT0PzGbpLr68wjkgTrk+zfPjM1BgYjD+7UVPdn3
	YZTDYwunyQArDN2hWcucMcZTr4HWPeprOn1QX2fdGjT5IQPzcGA6vrdvtqDy2aJdTAvSJVhCWQC
	h6DgmM1AFgxoystuVKnn3OLZy1ZnwdVOCFSjQ2Q==
X-Google-Smtp-Source: AGHT+IHA0r4lmbXa1zcBrKWmUfLUZyXRw9N6lNM3hTgpKMnZRgAzGlVS4oP7yDvcJkxKm4/yuGEHcyAWNjCtADPWGf0=
X-Received: by 2002:a05:690c:3809:b0:6e3:1063:91ca with SMTP id
 00721157ae682-6e9d8ad3e88mr72127657b3.40.1730113035192; Mon, 28 Oct 2024
 03:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025103621.4780-1-wahrenst@gmx.net> <20241025103621.4780-6-wahrenst@gmx.net>
In-Reply-To: <20241025103621.4780-6-wahrenst@gmx.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Oct 2024 11:56:38 +0100
Message-ID: <CAPDyKFoKuZD596mVNeV5VszU8ncQ8cPda1fbktb3UQQiv+67GQ@mail.gmail.com>
Subject: Re: [PATCH V5 5/9] mmc: bcm2835: add suspend/resume pm support
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
> Add a minimalistic suspend/resume PM support.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/mmc/host/bcm2835.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
> index 107666b7c1c8..17c327b7b5cc 100644
> --- a/drivers/mmc/host/bcm2835.c
> +++ b/drivers/mmc/host/bcm2835.c
> @@ -1343,6 +1343,30 @@ static int bcm2835_add_host(struct bcm2835_host *host)
>         return 0;
>  }
>
> +static int bcm2835_suspend(struct device *dev)
> +{
> +       struct bcm2835_host *host = dev_get_drvdata(dev);
> +
> +       if (!host->data_complete) {
> +               dev_warn(dev, "Suspend is prevented\n");
> +               return -EBUSY;
> +       }

This should not be needed.

The mmc core makes sure all outstanding requests have been flushed,
before the host controller becomes suspended.

> +
> +       clk_disable_unprepare(host->clk);
> +
> +       return 0;
> +}
> +
> +static int bcm2835_resume(struct device *dev)
> +{
> +       struct bcm2835_host *host = dev_get_drvdata(dev);
> +
> +       return clk_prepare_enable(host->clk);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(bcm2835_pm_ops, bcm2835_suspend,
> +                               bcm2835_resume);
> +
>  static int bcm2835_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -1471,6 +1495,7 @@ static struct platform_driver bcm2835_driver = {
>                 .name           = "sdhost-bcm2835",
>                 .probe_type     = PROBE_PREFER_ASYNCHRONOUS,
>                 .of_match_table = bcm2835_match,
> +               .pm = pm_ptr(&bcm2835_pm_ops),
>         },
>  };
>  module_platform_driver(bcm2835_driver);

Kind regards
Uffe

