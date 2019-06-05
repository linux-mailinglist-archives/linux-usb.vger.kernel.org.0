Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2424A356DC
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 08:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfFEGTh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 02:19:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34926 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEGTg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 02:19:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id p1so9308732plo.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 23:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8NDvqSiCIKv+/i60Ynslx6ipNYtxvNjYvkZ3l5Jrxiw=;
        b=Jv+ylw+eYYUmtx1uLMAE5WfRGbPZcDvoOmC1qqQkMmVoWISm6X+KqDoG/xkKlfZp1M
         O6gSWIh+Sh12hcQ1RTa4KsSVZBTgRrVifmZUjlC3+RENnfGGKqgwZIjqDpBIZG7ZZ0o9
         cgt6l84qKjCge1D0+WNYLBz4yjubpHHQLrQE/uGjorTP8Bo6TcuCatE17fGGRYUdhLHa
         YrMCziHY1qjVIkTMkhNdM+sEuMQR9wqYTzegHOCf/2dCREgk/m0XHsyumJ/GOC18x5+a
         DQ6HMN7Cc1c/9R7EJYu5f/Ojspos4AX5jlFgJbN4m2txeCi4CRZW+ZO99kX+jPvezxjt
         KgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8NDvqSiCIKv+/i60Ynslx6ipNYtxvNjYvkZ3l5Jrxiw=;
        b=Imhp4v4SuyMnjulQ0e6bmOaN57/CcZ0I+XWLpLe5d2ui/rWNjGQp1ejVjZt82ezhhm
         4qYU0KInu8LwmhtGEsmVwjAClcMWjM5lu9reG+L0pmpG8bbG3x/ADHlLLxaXEN4be1u8
         YSlQKLt6uNQ1mK9dYgsqAsk7lr3Ba1+W1OvQ1BbZ5YgdFacL1A0VXTqCYqaQaXulUPcE
         EgKbb1dRDyt3zXXi363pAW8O7AIjBmQB/TyF8y0d1gGsQyybK5Ek4oNomtBFqQxbh6VG
         ORvTqMfYGHHC3yzurjkFdcSuywwnODNp05z9JejmACx79LJQP59uLgr5ZQHCO9o49AyZ
         yOzQ==
X-Gm-Message-State: APjAAAV9gvEMca4vhTT++1lIgIukwCqNoH1tLSG1TAgkVwrP3Yfmdaj2
        gkHj5iKRAMV4N8K+egubFi6u/A==
X-Google-Smtp-Source: APXvYqwh+STN/4aMELzC9REIaRk3yfuoyfOR7lNLNz7fdt88CIQ5SzfZxE21KW+S3BxQ6DpLT5kMqQ==
X-Received: by 2002:a17:902:a708:: with SMTP id w8mr39377169plq.162.1559715575910;
        Tue, 04 Jun 2019 23:19:35 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t25sm15044103pgv.30.2019.06.04.23.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 23:19:35 -0700 (PDT)
Date:   Tue, 4 Jun 2019 23:20:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605062020.GL22737@tuxbook-pro>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604104455.8877-2-lee.jones@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:

> The Qualcomm Geni I2C driver currently probes silently which can be
> confusing when debugging potential issues.  Add a low level (INFO)
> print when each I2C controller is successfully initially set-up.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0fa93b448e8d..e27466d77767 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +

I would prefer that we do not add such prints, as it would be to accept
the downstream behaviour of spamming the log to the point where no one
will ever look through it.

Regards,
Bjorn

>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 
