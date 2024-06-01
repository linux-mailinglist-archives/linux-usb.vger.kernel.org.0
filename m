Return-Path: <linux-usb+bounces-10740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2308D7046
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2024 15:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FBF81F22EFC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jun 2024 13:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214D21514F0;
	Sat,  1 Jun 2024 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="f3vaZ/v/"
X-Original-To: linux-usb@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA69BE78
	for <linux-usb@vger.kernel.org>; Sat,  1 Jun 2024 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717249361; cv=none; b=MpmLwT1cKeWk5GtlhiyCf9fxkWp3CcJ9giD9o8+VwWB2boCRWAKjODO8DDga6DVgHGNN4eSx2hvXIevdqw6x9K2OYDVui7Fy/k1T8ameTHe/c+V1azQOWIAwZlZ553syQGPdPCgeuDZP7biHu5iD3lZOK+m/6uXDvuyy8A5aixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717249361; c=relaxed/simple;
	bh=SH0xg2/TC8u23Q2MiVfelki1BHd498w9fSc0Jd6h3aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z2MX6+nTyjMmsJXLxQfTstDoc+Z5KK73xOlkNLRd6+CxiRxJ7R94ZBI2KVH919aZ180f91aFO1nsFSvjuOWyRwaIbKFWEK2dOwBeqfJ8hpv73wFfSt4ReZpAg/48F7lcLh2wkfhmob+7dUQjSw+1F+yE5wOUmaKj7TS7QuCCMEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=f3vaZ/v/; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1717249351; bh=SH0xg2/TC8u23Q2MiVfelki1BHd498w9fSc0Jd6h3aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f3vaZ/v/DGlJ25gF5Pi4fLgi2V2IU6qOwUfU00HQvqd3XLOpmlgAXi+QvOoDYixn7
	 LpZGZo5FI70jAAQoqlYuQUDVTGayj9FClBBkV+yOnS2rkNjrP2o77MQTqxxmb/PNcJ
	 NGghS+DxqDu4/aojosrfpMBF6SmI4mDlraSp4M7g=
From: Luca Weiss <luca@z3ntu.xyz>
To: gregkh@linuxfoundation.org, Peter Chen <peter.chen@kernel.org>
Cc: linux-usb@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Wouter Franken <wouter@franken-peeters.be>
Subject:
 Re: [PATCH 1/1] Revert "usb: chipidea: move ci_ulpi_init after the phy
 initialization"
Date: Sat, 01 Jun 2024 15:42:29 +0200
Message-ID: <4894045.GXAFRqVoOG@g550jk>
In-Reply-To: <20240517023648.3459188-1-peter.chen@kernel.org>
References: <20240517023648.3459188-1-peter.chen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Freitag, 17. Mai 2024 04:36:48 MESZ Peter Chen wrote:
> This reverts commit 22ffd399e6e7aa18ae0314278ed0b7f05f8ab679.
> People report this commit causes the driver defer probed, and never
> back to work[1][2].
> 
> [1] https://lore.kernel.org/lkml/20240407011913.GA168730@nchen-desktop/T/#mc2b93bc11a8b01ec7cd0d0bf6b0b03951d9ef751
> [2] https://lore.kernel.org/lkml/20240407011913.GA168730@nchen-desktop/T/#me87d9a2a76c07619d83b3879ea14780da89fbbbf
> 

Hi all,

the original commit appears to break USB on Qualcomm msm8974 also (and
probably other platforms), as reported in
https://lore.kernel.org/all/87546d93-3fe7-4459-b44a-47cbcab9da74@me.ssier.org/

Could this get picked up?

Regards
Luca


> Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Wouter Franken <wouter@franken-peeters.be>
> Signed-off-by: Peter Chen <peter.chen@kernel.org>
> ---
>  drivers/usb/chipidea/core.c | 8 ++++----
>  drivers/usb/chipidea/ulpi.c | 5 +++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index bada13f704b6..835bf2428dc6 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1084,6 +1084,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	ret = ci_ulpi_init(ci);
> +	if (ret)
> +		return ret;
> +
>  	if (ci->platdata->phy) {
>  		ci->phy = ci->platdata->phy;
>  	} else if (ci->platdata->usb_phy) {
> @@ -1138,10 +1142,6 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		goto ulpi_exit;
>  	}
>  
> -	ret = ci_ulpi_init(ci);
> -	if (ret)
> -		return ret;
> -
>  	ci->hw_bank.phys = res->start;
>  
>  	ci->irq = platform_get_irq(pdev, 0);
> diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
> index 89fb51e2c3de..dfec07e8ae1d 100644
> --- a/drivers/usb/chipidea/ulpi.c
> +++ b/drivers/usb/chipidea/ulpi.c
> @@ -68,6 +68,11 @@ int ci_ulpi_init(struct ci_hdrc *ci)
>  	if (ci->platdata->phy_mode != USBPHY_INTERFACE_MODE_ULPI)
>  		return 0;
>  
> +	/*
> +	 * Set PORTSC correctly so we can read/write ULPI registers for
> +	 * identification purposes
> +	 */
> +	hw_phymode_configure(ci);
>  
>  	ci->ulpi_ops.read = ci_ulpi_read;
>  	ci->ulpi_ops.write = ci_ulpi_write;
> 





