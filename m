Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2C633EB3
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 08:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfFDGDa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 02:03:30 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39434 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfFDGDa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 02:03:30 -0400
Received: by mail-lj1-f193.google.com with SMTP id a10so15234250ljf.6
        for <linux-usb@vger.kernel.org>; Mon, 03 Jun 2019 23:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=i2zQuakiG65DKwTnUcLO7LrQSuNy84OsGfJd0B0W8E0=;
        b=a2gHthCETx7YLWV25cCfZiOio7rfXAhJfVn6xEN6+7AT8sG0l67huI7Kxc5BceHXmR
         Hdp+1UsZ6H1MAFK/LjTA+Mt9wk7Df/vqXYy47+0ep8uyQnk0/TMx3q9l/0UxHgjuZl2h
         ptmm5q4X3u30OtXY2QU+WLtk5q0gtkjmrAYlkxRQd8NpzD8LXh3XbM5SN/k35VBIouqH
         YrXWfcoHq0QVB9IH+EtgFLbiqrzWbxx3iybpfjhlA7MpStBZcSsnmZwVS11iM4JECVUu
         nlUg6WRh5NG0d02N47DP4fes1UEutfGcv/h4czh/p3FuZG70hF49kzL8J32lqrh1asYD
         ViDg==
X-Gm-Message-State: APjAAAUWqxv1kkSbVVCUVhnS2GgI2+xY8rrX8tJIxdM/FhCYYLMZYE9R
        9Il0KTtqJsbh6UJqY89rXZQ=
X-Google-Smtp-Source: APXvYqxhE0+G3UqzflobQvS++uxR7skK8yTEtUNpI3Uz2qKFhWD1RVb+ZuEnzQf6wR2xBWdct1H87w==
X-Received: by 2002:a2e:6c01:: with SMTP id h1mr16599668ljc.103.1559628207942;
        Mon, 03 Jun 2019 23:03:27 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id p1sm3588683ljj.1.2019.06.03.23.03.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 23:03:27 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hY2Xc-00076B-UB; Tue, 04 Jun 2019 08:03:24 +0200
Date:   Tue, 4 Jun 2019 08:03:24 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: Use dev_err() instead of pr_err()
Message-ID: <20190604060324.GF3668@localhost>
References: <20190604020901.15197-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604020901.15197-1-festevam@gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 03, 2019 at 11:09:01PM -0300, Fabio Estevam wrote:
> dev_err() is more appropriate for printing error messages inside
> drivers, so switch to dev_err().
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/usb/chipidea/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 27749ace2d93..1b6495829265 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
>  	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
>  
>  	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
> -		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
> -		pr_err("lpm = %i", ci->hw_bank.lpm);
> +		dev_err(ci->dev, "cannot enter in %s device mode",
> +			ci_role(ci)->name);
> +		dev_err(ci->dev, "lpm = %i", ci->hw_bank.lpm);

Please also add the missing newlines '\n' (and check if there are more
instances of that mistake in this driver).

>  		return -ENODEV;
>  	}

Johan
