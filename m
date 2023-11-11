Return-Path: <linux-usb+bounces-2793-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C15EB7E8A5F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 11:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5962B1F20F37
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 10:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D489125BD;
	Sat, 11 Nov 2023 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCxthHA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339A7F
	for <linux-usb@vger.kernel.org>; Sat, 11 Nov 2023 10:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01504C433C7;
	Sat, 11 Nov 2023 10:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699699520;
	bh=7QU9G6Pt0jobK5bptvySxSMCA2aLwKQOGddcVU+8egc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCxthHA8jUEej9Oo3FBMYJ3kt6G0T3Kq5fz4PKwPqLSij2agcf6zZojrd7bx4owJ/
	 qt4/fG5YAvkQkG3ygL9Ye3O0OoROV4nlLAxFtOqWWh9QOs10AEHTJ3/pjJb4mfdG0i
	 a8fl5ThCQAqozqwuWswYg5kJZe2jPwrJz94rgB+RMn8Ng5q8YFHHK3LzfP1VEuog/Z
	 4v/oVTWIyqOGQYMMbW0/O/NYbQHO0mmt0mJloVGG7VNEQHFJfgtpigy9MuCMidaOkv
	 EZC64C+T5BJnMEN5WV36bUClEvJGQxsgxedqJD5RiQL7j+jn27Wb/jUBKI6LDu0gi6
	 Wt/+A30ao3y7w==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1r1lUK-0001L6-1z;
	Sat, 11 Nov 2023 11:45:16 +0100
Date: Sat, 11 Nov 2023 11:45:16 +0100
From: Johan Hovold <johan@kernel.org>
To: Stanley Chang <stanley_chang@realtek.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] usb: dwc3: add device put function to decrement the
 ref-counted reference
Message-ID: <ZU9bPMHqz7Gj4rHj@hovoldconsulting.com>
References: <20231107091252.11783-1-stanley_chang@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231107091252.11783-1-stanley_chang@realtek.com>

On Tue, Nov 07, 2023 at 05:12:51PM +0800, Stanley Chang wrote:
> When the function exits, the count should be decremented via
> platform_device_put and of_node_put.

This isn't really a self-contained commit message (and your use of
'count' is too vague). You're also changing two functions in two
different ways here.

> Fixes: 34c200483569 ("usb: dwc3: add Realtek DHC RTD SoC dwc3 glue layer driver")
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
>  drivers/usb/dwc3/dwc3-rtk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
> index 590028e8fdcb..9d6f2a8bd6ce 100644
> --- a/drivers/usb/dwc3/dwc3-rtk.c
> +++ b/drivers/usb/dwc3/dwc3-rtk.c
> @@ -187,6 +187,7 @@ static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
>  
>  	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
>  
> +	of_node_put(dwc3_np);

You're still leaking a reference in the of_property_read_string() error
path just above.

>  	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
>  }
>  
> @@ -339,6 +340,8 @@ static int dwc3_rtk_probe_dwc3_core(struct dwc3_rtk *rtk)
>  
>  	switch_usb2_role(rtk, rtk->cur_role);
>  
> +	platform_device_put(dwc3_pdev);
> +	of_node_put(dwc3_node);

Please keep the new line before return for readability.

>  	return 0;
>  
>  err_pdev_put:

Johan

