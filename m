Return-Path: <linux-usb+bounces-24875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDAAADE921
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276493A3B03
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 10:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39565283FDF;
	Wed, 18 Jun 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F92DU9Xz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28BFBA27;
	Wed, 18 Jun 2025 10:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750242939; cv=none; b=S98YQxYROmYSgEOMXt4ySymuNgiVucCJMeSY+ffa1aEZYty/XR2mBGBV+4D/Ys3WQqGHe6orEg28zKv7tZzeTSaB93Ac2duUUh7thZow2vC29ATs4vMRbPPM3upUtMcWg7e+3uahI6+4U+eWRyUr6Oi6p4Uytkq/IMet0K2Rh4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750242939; c=relaxed/simple;
	bh=uQq6wFByjowqdb8ZEtYJxgOfGSnymBUZntpzmJfPC0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGzi6v21OULAS5nyTztUGyHQTQvrkpK7BOWhMBVrJ3aWU8IAyZ2HE2hiTh0tr+iUPQjRMS9QPHAV9xRf871TO0su17YJBOSG0b2F1RheV9a4N0OefuBg5DCRF4NkL4hxNYrUT98Z32gnvtOwPu+dycMb4jLbgArQf0+2dbwP9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F92DU9Xz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7174C4CEED;
	Wed, 18 Jun 2025 10:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750242939;
	bh=uQq6wFByjowqdb8ZEtYJxgOfGSnymBUZntpzmJfPC0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F92DU9XzfpeDePTmi2dV6OxHOR7wG+d2NFrXKZ4CscAbw2YikJiNyofF6makh6pyA
	 0vybxsewrYkr9u9DA72d9lj1Z1WT8PF8dmdf1vy2apu6nbQUlJy3AiUjcCbhe+QAfJ
	 /dQwKblIKnB8f9V0X3JgYKDE+xfbW5qfv0kDbkNC/PyAL3Qv4/N0ppmo5n6e91hdzf
	 892yBFvCGJX65BlcE/g0Q+/5sq3Wnwl4Kq3noWBPsos6Y8+Eg5sxNWC8YQKoD6s5VT
	 L5U1s75FOUNwfvz99tBBbM7kDV8xzifCqotAcEJOM3IWhQmosGvmIs5jQpdZ3sF79s
	 XxsrIZxy/We7Q==
Date: Wed, 18 Jun 2025 18:35:30 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] usb: chipidea: udc: add
 CI_HDRC_CONTROLLER_PULLUP_EVENT event
Message-ID: <20250618103530.GB34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-2-xu.yang_2@nxp.com>

On 25-06-14 20:56:43, Xu Yang wrote:
> The device controller will send CI_HDRC_CONTROLLER_PULLUP_EVENT event
> when it's going to pullup or pulldown data line.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c   | 5 +++++
>  include/linux/usb/chipidea.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 1a48e6440e6c..64a421ae0f05 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1970,6 +1970,11 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
>  		hw_write(ci, OP_USBCMD, USBCMD_RS, USBCMD_RS);
>  	else
>  		hw_write(ci, OP_USBCMD, USBCMD_RS, 0);
> +
> +	if (ci->platdata->notify_event) {
> +		_gadget->connected = is_on;
> +		ci->platdata->notify_event(ci, CI_HDRC_CONTROLLER_PULLUP_EVENT);
> +	}
>  	pm_runtime_put_sync(ci->dev);
>  
>  	return 0;
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index ebdfef124b2b..e17ebeee24e3 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -72,6 +72,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_IMX_HSIC_ACTIVE_EVENT		2
>  #define CI_HDRC_IMX_HSIC_SUSPEND_EVENT		3
>  #define CI_HDRC_CONTROLLER_VBUS_EVENT		4
> +#define CI_HDRC_CONTROLLER_PULLUP_EVENT		5
>  	int	(*notify_event) (struct ci_hdrc *ci, unsigned event);
>  	struct regulator	*reg_vbus;
>  	struct usb_otg_caps	ci_otg_caps;
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

