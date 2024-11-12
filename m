Return-Path: <linux-usb+bounces-17470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC029C56C0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 12:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 127F3B4165B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 11:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E232219E48;
	Tue, 12 Nov 2024 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riX5qwcs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4020F5AF;
	Tue, 12 Nov 2024 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731408350; cv=none; b=Zbk2ouwlnzszTjmaPg1+TQ0IgDF4BTz0/Q47a7Au+nGQByHViCmFDV/xjBqgEsTBcdsY2Qy9LfY/FdlSxA8PnHRaftUpGxc0oH3ufB/Jw+GnErK0VInst54LNXO2cZcxRGbLLDG4Q/8rn1PokrwqvXhnIvK8RP2O6xSTNUjsGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731408350; c=relaxed/simple;
	bh=R6b2maNdwe+ovA4dr5//CKaFpQ6RmBWwyQHRZnAj7NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qb74BW3sU0sQFjfrP99Lhpypv4o9+KeaH7HGU7asjROkrHp0aEDOpy9tOG99TAZUE1bfrPGNET0ot2XkgkVJyX5RmV3CKDWO+LM5KuwmVzq8PqjlZ1dUG9RKHzlHH/M7pinKQV97qDqxwNKJrZVjWUcPswMt/B7fCj+55wS394w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riX5qwcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF0AC4CECD;
	Tue, 12 Nov 2024 10:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731408350;
	bh=R6b2maNdwe+ovA4dr5//CKaFpQ6RmBWwyQHRZnAj7NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riX5qwcsg4XYrFblu7be/txKJ65JQUtTrvlr/nn64g/WObZ+T5nhF58jKivrdzmX4
	 vCXHaRGbHM4NrO06rPFIBbJmDEKmsPzGnolNkireYwfxLVJLlV249TB66iu5LdXLz+
	 oQSJt6BAFkSJOrJGSf0F/YQMnDgMbRxNtIt3/3K3FNQWezMeQ3u48ma5Vhs7OM1Dpm
	 TDUaVuRuII9eRHJdjoI/kokTJ0kgPw2s0b3fBsQ8Fsi7in5rjrPJrc4g3Dr4ObM6JE
	 yRI/q+ytTmoZzJCA4htAfKIfcxnjKOz/570pTQyskd5AnnwoB1E30XzHw8k7rPpv5Z
	 3oH4GBdYgozNw==
Date: Tue, 12 Nov 2024 18:45:43 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: chipidea: imx: add imx8ulp support
Message-ID: <20241112104543.GA663650@nchen-desktop>
References: <20241111090916.1534047-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111090916.1534047-1-xu.yang_2@nxp.com>

On 24-11-11 17:09:16, Xu Yang wrote:
> The dtbinding have imx7ulp and imx8ulp compatible with imx7d before. And
> then the dtb follow the dtbinding. However, the driver doesn't add imx8ulp
> compatible now. To make imx8ulp work well, this will add support for it.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 173c78afd502..1394881fde5f 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -1285,6 +1285,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
>  		.compatible = "fsl,imx7ulp-usbmisc",
>  		.data = &imx7ulp_usbmisc_ops,
>  	},
> +	{
> +		.compatible = "fsl,imx8ulp-usbmisc",
> +		.data = &imx7ulp_usbmisc_ops,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
> -- 
> 2.34.1
> 

