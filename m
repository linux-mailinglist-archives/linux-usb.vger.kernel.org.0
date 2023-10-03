Return-Path: <linux-usb+bounces-1041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C016D7B6C13
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 16:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 2B23D281866
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 14:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCAE3418E;
	Tue,  3 Oct 2023 14:49:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470EC31A96
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 14:49:12 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E82C6
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 07:49:10 -0700 (PDT)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4S0LLY2BcRzDqJZ;
	Tue,  3 Oct 2023 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1696344549; bh=C7ZHZ+RinBqTTRf+l9AJPrqtvTf2/wCeCd9APY2162g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eu9PMOEq25GTDNsb4TugTGEQy10Jrtqnh2zOZ8kWZ9qxdax1zxQrwMi3Q78Pw+MkZ
	 JtNVdBKHMQMbbu/LXYaiF3e6R2tmoznRUjrkFMbztWGtzEUuuQNvclURpnkkrPJhIX
	 /LhG+/dHPU5HpB3RuEpdcGNULjWan1+TPCLfw0AE=
X-Riseup-User-ID: 75FD601219AA0F8F5BF04A133343C920805E058D5070B544F0F01B52ABBDCC9E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4S0LLV63jczJnL4;
	Tue,  3 Oct 2023 14:49:06 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>,
 Kenta Sato <tosainu.maple@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: John Youn <John.Youn@synopsys.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 stable <stable@kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
 Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH] usb: dwc3: Soft reset phy on probe for host
Date: Tue, 03 Oct 2023 14:49:03 +0000
Message-ID: <6120384.lOV4Wx5bFT@melttower>
In-Reply-To:
 <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
References:
 <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Thinh,

I can confirm that this patch fixed the USB 3.0 port on the Pinebook Pro. It may 
be too late for a Tested-by but:

Tested-by: Dang Huynh <danct12@riseup.net>

Best regards,
Dang

On Wednesday, September 13, 2023 12:52:15 AM UTC Thinh Nguyen wrote:
> When there's phy initialization, we need to initiate a soft-reset
> sequence. That's done through USBCMD.HCRST in the xHCI driver and its
> initialization, However, the dwc3 driver may modify core configs before
> the soft-reset. This may result in some connection instability. So,
> ensure the phy is ready before the controller updates the GCTL.PRTCAPDIR
> or other settings by issuing phy soft-reset.
> 
> Note that some host-mode configurations may not expose device registers
> to initiate the controller soft-reset (via DCTL.CoreSftRst). So we reset
> through GUSB3PIPECTL and GUSB2PHYCFG instead.
> 
> Cc: stable@vger.kernel.org
> Fixes: e835c0a4e23c ("usb: dwc3: don't reset device side if dwc3 was
> configured as host-only") Reported-by: Kenta Sato <tosainu.maple@gmail.com>
> Closes: https://lore.kernel.org/linux-usb/ZPUciRLUcjDywMVS@debian.me/
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/dwc3/core.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 9c6bf054f15d..343d2570189f 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -279,9 +279,46 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
>  	 * XHCI driver will reset the host block. If dwc3 was configured 
for
>  	 * host-only mode or current role is host, then we can return 
early.
>  	 */
> -	if (dwc->dr_mode == USB_DR_MODE_HOST || dwc->current_dr_role ==
> DWC3_GCTL_PRTCAP_HOST) +	if (dwc->current_dr_role == 
DWC3_GCTL_PRTCAP_HOST)
>  		return 0;
> 
> +	/*
> +	 * If the dr_mode is host and the dwc->current_dr_role is not the
> +	 * corresponding DWC3_GCTL_PRTCAP_HOST, then the 
dwc3_core_init_mode
> +	 * isn't executed yet. Ensure the phy is ready before the 
controller
> +	 * updates the GCTL.PRTCAPDIR or other settings by soft-resetting
> +	 * the phy.
> +	 *
> +	 * Note: GUSB3PIPECTL[n] and GUSB2PHYCFG[n] are port settings where 
n
> +	 * is port index. If this is a multiport host, then we need to 
reset
> +	 * all active ports.
> +	 */
> +	if (dwc->dr_mode == USB_DR_MODE_HOST) {
> +		u32 usb3_port;
> +		u32 usb2_port;
> +
> +		usb3_port = dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
> +		usb3_port |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
> +
> +		usb2_port = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
> +		usb2_port |= DWC3_GUSB2PHYCFG_PHYSOFTRST;
> +		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
> +
> +		/* Small delay for phy reset assertion */
> +		usleep_range(1000, 2000);
> +
> +		usb3_port &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
> +		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
> +
> +		usb2_port &= ~DWC3_GUSB2PHYCFG_PHYSOFTRST;
> +		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
> +
> +		/* Wait for clock synchronization */
> +		msleep(50);
> +		return 0;
> +	}
> +
>  	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
>  	reg |= DWC3_DCTL_CSFTRST;
>  	reg &= ~DWC3_DCTL_RUN_STOP;
> 
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d





