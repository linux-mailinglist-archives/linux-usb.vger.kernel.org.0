Return-Path: <linux-usb+bounces-3081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5E57F2AD5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 11:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6851D2822D5
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 10:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738E632C9E;
	Tue, 21 Nov 2023 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4vK5vs4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7DC3A26F;
	Tue, 21 Nov 2023 10:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42018C433C8;
	Tue, 21 Nov 2023 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700563268;
	bh=6ssmz9Fzj5B5OmCb07mIm3SGwRw9YGJdqqjNOMzjqjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4vK5vs4oL3icSXZydnqDM56wAeOdVXHDrdnc5HGhc07aObDsKuXDA6nPc9Kb/AjO
	 tFTsFjQsYLFV6t2wKtWlJRyz8RSctyacMs0ecueARCS6ikBk4balsn1z9IN/cBBhf5
	 b8a4mu42V8h2H1j9aw4XOLMiz4gg1lBZeQc8Rcqdpa7CAMwhGOZUPS43Aoercery22
	 A+VWLfY9me9tZNzztinOEcud0MxToeqAgO3RzE+vgDoV0GfSa1VN6plMRXx4ONNNBw
	 52A1UllKq6WlZhEA3yy3s6mPDMlPFWkKB4LuyaHcT/uK52CcIyMSq30d/3K552YJil
	 8xS4+R7zYbMxg==
Date: Tue, 21 Nov 2023 18:40:56 +0800
From: Peter Chen <peter.chen@kernel.org>
To: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ThomasPetazzonithomas.petazzoni@bootlin.com,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>
Subject: Re: [PATCH v2 5/7] usb: cdns3: add quirk to platform data for
 reset-on-resume
Message-ID: <20231121104056.GA541474@nchen-desktop>
References: <20231120-j7200-usb-suspend-v2-0-038c7e4a3df4@bootlin.com>
 <20231120-j7200-usb-suspend-v2-5-038c7e4a3df4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120-j7200-usb-suspend-v2-5-038c7e4a3df4@bootlin.com>

On 23-11-20 18:06:05, Théo Lebrun wrote:
> The cdns3 host role does not care about reset-on-resume. xHCI however
> reconfigures itself in silence rather than printing a warning about a
> resume error. Related warning example:
> 
>   [   16.017462] xhci-hcd xhci-hcd.1.auto: xHC error in resume, USBSTS 0x401, Reinit
> 
> Allow passing a CDNS3_RESET_ON_RESUME quirk flag from cdns3 pdata down
> to xHCI pdata. The goal is to allow signaling about reset-on-resume
> behavior from platform wrapper drivers.
> 
> When used, remote wakeup is not expected to work.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> ---
>  drivers/usb/cdns3/core.h | 1 +
>  drivers/usb/cdns3/host.c | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
> index 81a9c9d6be08..7487067ba23f 100644
> --- a/drivers/usb/cdns3/core.h
> +++ b/drivers/usb/cdns3/core.h
> @@ -44,6 +44,7 @@ struct cdns3_platform_data {
>  			bool suspend, bool wakeup);
>  	unsigned long quirks;
>  #define CDNS3_DEFAULT_PM_RUNTIME_ALLOW	BIT(0)
> +#define CDNS3_RESET_ON_RESUME		BIT(1)
>  };
>  
>  /**
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index 6164fc4c96a4..28c4d1deb231 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -91,6 +91,9 @@ static int __cdns_host_init(struct cdns *cdns)
>  	if (cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW))
>  		cdns->xhci_plat_data->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>  
> +	if (cdns->pdata && (cdns->pdata->quirks & CDNS3_RESET_ON_RESUME))
> +		cdns->xhci_plat_data->quirks |= XHCI_RESET_ON_RESUME;
> +
>  	ret = platform_device_add_data(xhci, cdns->xhci_plat_data,
>  			sizeof(struct xhci_plat_priv));
>  	if (ret)
> 
> -- 
> 2.42.0
> 

-- 

Thanks,
Peter Chen

