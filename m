Return-Path: <linux-usb+bounces-24877-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57872ADE943
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D903917E3A8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 10:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B98281508;
	Wed, 18 Jun 2025 10:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOAOqYRI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A17281369;
	Wed, 18 Jun 2025 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243221; cv=none; b=O7OqD711IADExdaNQiTZRADKFBXvPPaDiLI5su3c57+pFIB/KyWucY8+NrX+990P9yvXxGfYTT8kCWGZl8HVsOV9BWMYU0usEQW0ECWLCC4ZFZGrK01uG9XuglRVHZw35AvJX33mECVpc4Ok//6qUWNU7LfNKiElRZLcZVU9Tgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243221; c=relaxed/simple;
	bh=AueBCN8tRB74R7bXda+ZgkK2ACmlaLw4HLQJigCYu9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txnhd3F++eay4U0k+6LgN39tNCfVXO9IBaQrMeOnnpZMjCZjfwp1R4RoIKVtOmzT6XYyE2Zd6ub/Lkek938Iin3LZgzhKqld/9r/JOaM/An5u4b2dYwogrsfCrYYorvAOH6yftH0JA4+qIHUKw9rwUmXmkGJki88sAkUakIX91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOAOqYRI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139BEC4CEED;
	Wed, 18 Jun 2025 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750243220;
	bh=AueBCN8tRB74R7bXda+ZgkK2ACmlaLw4HLQJigCYu9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOAOqYRI7zTBWv26itXvLZdWWRRLaHeZ1iwa9q1jcrqFYpArRa1V4qOB9cPvGI8kb
	 3X1Od12B/08BKQHxbN37k4Z8uO1xZrlOHAFYw9ETGBBzgI2TzLswuWY+K1JQS0u6v0
	 se8tPwjG3FZejiybWuku+r4enNg0kqg906oWeNdk6wBxv6inRTET6rApN7Yokm1lYg
	 GZ8ZyH/2dYatyJ+py/2KG6vGeyKgJZmS/4vyBi8ZHxJM+8BDmsmuOzyaQ0coOAepPX
	 lo1vj+/yCiOSvZHwevxyS1Y5bznqpDAmLftww3FBF+ihoVAD50+Rp+S3hiNPVvfXdm
	 kBzBc8huXEpaw==
Date: Wed, 18 Jun 2025 18:40:13 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, shawnguo@kernel.org, s.hauer@pengutronix.d,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] usb: chipidea: imx: implement workaround for
 ERR051725
Message-ID: <20250618104013.GD34284@nchen-desktop>
References: <20250614125645.207732-1-xu.yang_2@nxp.com>
 <20250614125645.207732-4-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614125645.207732-4-xu.yang_2@nxp.com>

On 25-06-14 20:56:45, Xu Yang wrote:
> ERR051725:
> USB: With the USB controller configured as device mode, Clearing the RS
> bit of USBCMD register fails to cause USB device to be detached
> 
> Description
> 1. USB controller working as high speed device mode with USB gadget
>    function enabled
> 2. Cable plugged into USB host
> 3. Use case is software-controlled detach from USB device side
> 
> The expected result is device side terminations removed, increase in USB
> signal amplitude, USB host detect device is detached. But the issue is
> that the clear RS bit of USBCMD register cannot cause device detach event.
> 
> Workaround
> - Use the below steps to detach from the host:
>     write USBCMD.RS = 0b
>     write CTRL2[7:6] = 01b
>     write CTRL2[8] = 1b
> - As CTRL2[8] is set at detach case, so attach the steps should add clear
>   CTRL2[8]:
>     write USBCMD.RS = 1b
>     write CTRL2[8] = 0b
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/ci_hdrc_imx.c |  5 +++++
>  drivers/usb/chipidea/usbmisc_imx.c | 21 +++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index 780f4d151345..79e466e17788 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -331,6 +331,11 @@ static int ci_hdrc_imx_notify_event(struct ci_hdrc *ci, unsigned int event)
>  		if (ci->usb_phy)
>  			schedule_work(&ci->usb_phy->chg_work);
>  		break;
> +	case CI_HDRC_CONTROLLER_PULLUP_EVENT:
> +		if (ci->role == CI_ROLE_GADGET)
> +			imx_usbmisc_pullup(data->usbmisc_data,
> +					   ci->gadget.connected);
> +		break;
>  	default:
>  		break;
>  	}
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 9db67d6d0ec4..415d3ba2e9ad 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -998,6 +998,25 @@ static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
>  	return 0;
>  }
>  
> +static void usbmisc_imx7d_pullup(struct imx_usbmisc_data *data, bool on)
> +{
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	val = readl(usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +	if (!on) {
> +		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_MASK;
> +		val |= MX7D_USBNC_USB_CTRL2_OPMODE(1);
> +		val |= MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> +	} else {
> +		val &= ~MX7D_USBNC_USB_CTRL2_OPMODE_OVERRIDE_EN;
> +	}
> +	writel(val, usbmisc->base + MX7D_USBNC_USB_CTRL2);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +}
> +
>  static int usbmisc_imx7d_power_lost_check(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1115,6 +1134,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx7d_set_wakeup,
>  	.charger_detection = imx7d_charger_detection,
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.pullup = usbmisc_imx7d_pullup,
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
> @@ -1131,6 +1151,7 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx95_set_wakeup,
>  	.charger_detection = imx7d_charger_detection,
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.pullup = usbmisc_imx7d_pullup,
>  	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
> -- 
> 2.34.1
> 

-- 

Best regards,
Peter

