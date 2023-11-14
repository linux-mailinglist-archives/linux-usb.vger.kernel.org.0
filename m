Return-Path: <linux-usb+bounces-2859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF237EABB4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 09:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC2DC1C20A2B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 08:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFCF11C84;
	Tue, 14 Nov 2023 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evo9Jq1Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47467BE4A;
	Tue, 14 Nov 2023 08:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF65BC433C8;
	Tue, 14 Nov 2023 08:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699951138;
	bh=Qz4bqCfb39E5fvYkFxANSDUiv0YU+cze73hZIqUJoas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Evo9Jq1Z02upcf0EdAXLr4DlJDNCEFzN9aofJ05Ssk28wE/s7yhMnPCIvtgjG0ebI
	 YM6fuhkTs2jJDiOoKnHakIJYHuesen4hL+NtfDBjRZvQF8EuPFzgLbCkoBmgNzOZsE
	 s3n/I/E9TmOG/fgt1nv3OA3McT+8vff5mbv0UJyMud8/LPvkoJ6JH5x0L/A9jKkM+j
	 7txpZPI0iD1r3pY5eyEyrFoBp5IL1uS3Seukf8ep1Cy8W1L4C8p18vwf0qlBY4/6U+
	 +6XOvxBO1VkkzrCzFAJVUCL8vBorLhLrC2Na/51HzRKdACb/vSbbch47ukXavw6VqS
	 7H3lwKgnE9B8Q==
Date: Tue, 14 Nov 2023 16:38:38 +0800
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] usb: cdns3: support power-off of controller when in
 host role
Message-ID: <20231114083838.GC64573@nchen-desktop>
References: <20231113-j7200-usb-suspend-v1-0-ad1ee714835c@bootlin.com>
 <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231113-j7200-usb-suspend-v1-4-ad1ee714835c@bootlin.com>

On 23-11-13 15:26:59, Théo Lebrun wrote:
> The controller is not being reconfigured at resume. Change resume to
> redo hardware config if quirk CDNS3_RESET_ON_RESUME is active.

Current logic has power off judgement, see cdns3_controller_resume for
detail.

> 
> Platform data comes from the parent driver (eg cdns3-ti).
> 
> The quirk should be passed if the platform driver knows that the
> controller might be in reset state at resume. We do NOT reconfigure the
> hardware without this quirk to avoid losing state if we did a suspend
> without reset.
> 
> If the quirk is on, we notify the xHCI subsystem that:
> 
> 1. We reset on resume. It will therefore redo the xHC init & trigger
>    such message as "root hub lost power or was reset" in dmesg.
> 
> 2. It should disable/enable clocks on suspend/resume. This does not
>    matter on our platform as xhci-plat does not get access to any clock
>    but it would be the right thing to do if we indeed had such clocks.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  drivers/usb/cdns3/core.h |  1 +
>  drivers/usb/cdns3/host.c | 20 ++++++++++++++++++++
>  2 files changed, 21 insertions(+)
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
> index 6164fc4c96a4..a81019a7c8cc 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -88,6 +88,9 @@ static int __cdns_host_init(struct cdns *cdns)
>  		goto err1;
>  	}
>  
> +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME)
> +		cdns->xhci_plat_data->quirks |= XHCI_RESET_ON_RESUME | XHCI_SUSPEND_RESUME_CLKS;
> +

If you set this flag, how could you support the USB remote wakeup
request? In that case, the USB bus does not expect re-enumeration.

>  	if (cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW))
>  		cdns->xhci_plat_data->quirks |= XHCI_DEFAULT_PM_RUNTIME_ALLOW;
>  
> @@ -124,6 +127,18 @@ static void cdns_host_exit(struct cdns *cdns)
>  	cdns_drd_host_off(cdns);
>  }
>  
> +static int cdns_host_suspend(struct cdns *cdns, bool do_wakeup)
> +{
> +	if (!do_wakeup)
> +		cdns_drd_host_off(cdns);
> +	return 0;
> +}
> +
> +static int cdns_host_resume(struct cdns *cdns, bool hibernated)
> +{
> +	return cdns_drd_host_on(cdns);

This one will redo if controller's power is off, please consider both
on and power situation.

> +}
> +
>  int cdns_host_init(struct cdns *cdns)
>  {
>  	struct cdns_role_driver *rdrv;
> @@ -137,6 +152,11 @@ int cdns_host_init(struct cdns *cdns)
>  	rdrv->state	= CDNS_ROLE_STATE_INACTIVE;
>  	rdrv->name	= "host";
>  
> +	if (cdns->pdata && cdns->pdata->quirks & CDNS3_RESET_ON_RESUME) {
> +		rdrv->suspend = cdns_host_suspend;
> +		rdrv->resume = cdns_host_resume;
> +	}
> +
>  	cdns->roles[USB_ROLE_HOST] = rdrv;
>  
>  	return 0;
> 
> -- 
> 2.41.0
> 

-- 

Thanks,
Peter Chen

