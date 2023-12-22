Return-Path: <linux-usb+bounces-4512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0C81C395
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 04:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AFD91F25394
	for <lists+linux-usb@lfdr.de>; Fri, 22 Dec 2023 03:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57A5184C;
	Fri, 22 Dec 2023 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obG8Yim+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662717C7
	for <linux-usb@vger.kernel.org>; Fri, 22 Dec 2023 03:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FD9C433C7;
	Fri, 22 Dec 2023 03:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703216526;
	bh=P7h8IFjd6XQxMOmZ4+m88fAgrs2f7/PSu0zBioB9ySw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obG8Yim+ZWvrs8t2n8tlQNoR9o8KoNsK/m8DtYucDrK+LzOm5b4d0OU0Dhc0uRYwK
	 8ddIsU69Zo1dDruDStOkyIS4QmSSUo/kkc8Oo0SvdBeexfQtel9vGGFBSLw20pgkV+
	 xx+DTJfOR+CSMZIW17uSOWeoJLgKiFvbNfWAhGcV2fK30XelyyB1rPQUAYurCCvyLK
	 BCui3zzVAIzHmPAzLv3adguhNyATRpfXy5kfk7Ph69TDgoTCpUwQrcbX1wSQYKAiaN
	 PGTNqWdV0AuPUFjcOlpLgAZXc8XmW0YosY251/uBfrqgEhCv5Jx/9Ox6dO1OUPNVcG
	 TUEXYD+PK3hQQ==
Date: Fri, 22 Dec 2023 11:41:55 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, luca.ceresoli@bootlin.com,
	jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] usb: chipidea: wait controller resume finished
 for wakeup irq
Message-ID: <20231222034155.GB1951375@nchen-desktop>
References: <20231218061420.3460145-1-xu.yang_2@nxp.com>
 <20231218061420.3460145-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218061420.3460145-2-xu.yang_2@nxp.com>

On 23-12-18 14:14:19, Xu Yang wrote:
> After the chipidea driver introduce extcon for id and vbus, it's able
> to wakeup from another irq source, in case the system with extcon ID
> cable, wakeup from usb ID cable and device removal, the usb device
> disconnect irq may come firstly before the extcon notifier while system
> resume, so we will get 2 "wakeup" irq, one for usb device disconnect;
> and one for extcon ID cable change(real wakeup event), current driver
> treat them as 2 successive wakeup irq so can't handle it correctly, then
> finally the usb irq can't be enabled. This patch adds a check to bypass
> further usb events before controller resume finished to fix it.
> 
> Fixes: 1f874edcb731 ("usb: chipidea: add runtime power management support")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

> 
> ---
> Changes in v2:
>  - no changes
> ---
>  drivers/usb/chipidea/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 7ac39a281b8c..85e9c3ab66e9 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -523,6 +523,13 @@ static irqreturn_t ci_irq_handler(int irq, void *data)
>  	u32 otgsc = 0;
>  
>  	if (ci->in_lpm) {
> +		/*
> +		 * If we already have a wakeup irq pending there,
> +		 * let's just return to wait resume finished firstly.
> +		 */
> +		if (ci->wakeup_int)
> +			return IRQ_HANDLED;
> +
>  		disable_irq_nosync(irq);
>  		ci->wakeup_int = true;
>  		pm_runtime_get(ci->dev);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

