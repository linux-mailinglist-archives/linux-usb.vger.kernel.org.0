Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE9C335751
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 09:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfFEHCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 03:02:46 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35194 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfFEHCq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 03:02:46 -0400
Received: by mail-pf1-f196.google.com with SMTP id d126so14309559pfd.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 00:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=uz4rW4hom4PNyImhqoO7mrnt+7yVJFQ+a19gRd/J1UQ=;
        b=k2mgUNFS8mlgZJLWSI2R4t0x6v3cRS5Cibzq9KsQeI9KAoK6H7pBodfPO0qs0J/hBF
         UnokjKUh6mu48Jv152LXpaxAIemY3F4zfzFSo9NysiwGnJDt8ax3RxYRET3ra0TkQP/i
         GPnwx+W3Hhu5yRpNgUdOJGq+0KClDNJKtGTSYKeDaXwRrQBMN/34vs9cIw762gGL2S2X
         aCq0lADu9jfpEF0rmoDeGo70ZA4BURwaE5YhZ1GEYO/HYwHMaLZ9hL3hbjNuPqnF1VEN
         qBKuQPkKiY/bWef19eOPrZkK5kuzU+JYYp1dQcFzU8F63bw09h+yuZibsYe9AOcoI0tB
         VAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uz4rW4hom4PNyImhqoO7mrnt+7yVJFQ+a19gRd/J1UQ=;
        b=o4gg2YIHK8NcmnP6mwLyuwGy7+X2J+p9SShSP7roHXiSUU9zCdDUKjH+8Xi79bvwf3
         /DmGt4NjDUjb+mvRxWtldGR9W/VxeT7MgFJrQhErKE0mPDPYdfx5cXhvhdmoenGuXn8l
         gbEr7YOAnGSKT5toTSbZ3L95yOiRy+V1Spqf2F/o+GiBKoq/u+uDU4uCvmAAR2bYdjMD
         FI8Z8O9/UIn+W2WRiblf0fl9oHqJ7rhxf9FdXFbyTLo3sYxPwFjOgsriR/szRd9jkqQp
         +GLrKivepUOBDVnlJO1QId3Oa0vgvEd7t4fA/e5BSV2k+3Q5tOC6tojJL9uycSb6mGgZ
         do9A==
X-Gm-Message-State: APjAAAVxAI0pQfKPFwt5nmLwhCioeo3QQFrUbylUcSAY6e/b5/W71yf7
        Uz55absXd/LYhTPSHy5skyG0Kg==
X-Google-Smtp-Source: APXvYqxbp1TM7o6DxILTBx5tTuqENvUDU+OcxxTSnQwTp/YO/ccBSoR/xNWDWoB8WKd14PCiX3fHZQ==
X-Received: by 2002:a63:fa16:: with SMTP id y22mr2444462pgh.15.1559718165590;
        Wed, 05 Jun 2019 00:02:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w62sm7765452pfw.132.2019.06.05.00.02.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 00:02:45 -0700 (PDT)
Date:   Wed, 5 Jun 2019 00:03:30 -0700
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
Subject: Re: [PATCH 8/8] usb: dwc3: qcom: Improve error handling
Message-ID: <20190605070330.GO22737@tuxbook-pro>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604104455.8877-8-lee.jones@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:

> dwc3_qcom_clk_init() is called with of_count_phandle_with_args() as an
> argument.  If of_count_phandle_with_args() returns an error, the number
> of clocks will be a negative value and will lead to undefined behaviour.
> 
> Ensure we check for an error before attempting to blindly use the value.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index f21fdd6cdd1a..633482926497 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -419,6 +419,9 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
>  	if (!count || ACPI_HANDLE(dev))
>  		return 0;
>  
> +	if (count < 0)
> +		return count;
> +
>  	qcom->clks = devm_kcalloc(dev, qcom->num_clocks,
>  				  sizeof(struct clk *), GFP_KERNEL);
>  	if (!qcom->clks)
> -- 
> 2.17.1
> 
