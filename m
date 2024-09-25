Return-Path: <linux-usb+bounces-15438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3B7986036
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C76228BA96
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBA6189F58;
	Wed, 25 Sep 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwluAHdP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69E31850AF;
	Wed, 25 Sep 2024 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268403; cv=none; b=CDqhNwzLFBGhjFYJjVZZo0sEtupBV7JAzU4KMmDwOUsxz8GIrwCbtvSfwxxwdnbpiM6CanVO8T5npE4ZxDZwafseaDcCL6u+00Ve8rOjr+o/DVmoZ7gFKoVbVg8odEetvnyF8sM8Mk0WfnEx9biFXaSBsi0SWkTNwglLFrjPaWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268403; c=relaxed/simple;
	bh=Jr0a7OyFA5MH7QCA07k2A92tFPCuGkKAz9K8GdgI394=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBIXQ5Qd1TAA9CyD88GRS1TyHHHnmJL3Tx3MVcFZnTd0Ux1QgHGwfPdDO1GX9g3f/e3s5V+vQdy+FLf7QRyRTEb3lAzdBUVTNcRPOorMvpPYI5QGABJEbmdN/csvIykzFap3Zi2epvClxRkmnXE8ik6y0gT3jtGprqslGY4BZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwluAHdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F5C4CEC9;
	Wed, 25 Sep 2024 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727268403;
	bh=Jr0a7OyFA5MH7QCA07k2A92tFPCuGkKAz9K8GdgI394=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwluAHdPNa7Rq9rfMcw2Qz+gpsil04aVnaV9pjPpsq3pxX/rfdW0uvOWIPq9hBZ6v
	 hbqJyNXyyIjwrDdw52DODMGFRlG0c9LsUr9huZYwO62JaaltzxiYupN08PoRsLwC3D
	 sSMZKnRhNJm0AmRV44fGn7BfqCFTF91A2BSiqjozuTViePi4Ww0swz6RoMbQITOiYK
	 UEuaWU+jipRECpjcMeJXD+uwapTNuaWQlhF2heDYZ8tIRtjs/yYvgB1AxhjZcYwCgK
	 oVbxEvxe70363fYmNLzObO2qZ033K73ia2+AxI5HTx4t9UIfVm1O2Qgojcr48b22Fv
	 apwjBfkjSNcvw==
Date: Wed, 25 Sep 2024 20:46:35 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT
 flag
Message-ID: <20240925124635.GD417263@nchen-desktop>
References: <20240923081203.2851768-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923081203.2851768-1-xu.yang_2@nxp.com>

On 24-09-23 16:12:01, Xu Yang wrote:
> Currently, the imx deivice controller has below limitations:
> 
> 1. can't generate short packet interrupt if IOC not set in dTD. So if one
>    request span more than one dTDs and only the last dTD set IOC, the usb
>    request will pending there if no more data comes.
> 2. the controller can't accurately deliver data to differtent usb requests
>    in some cases due to short packet. For example: one usb request span 3
>    dTDs, then if the controller received a short packet the next packet
>    will go to 2nd dTD of current request rather than the first dTD of next
>    request.
> 3. can't build a bus packet use multiple dTDs. For example: controller
>    needs to send one packet of 512 bytes use dTD1 (200 bytes) + dTD2
>    (312 bytes), actually the host side will see 200 bytes short packet.
> 
> Based on these limits, add CI_HDRC_HAS_SHORT_PKT_LIMIT flag and use it on
> imx platforms.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> ---
> Changes in v2:
>  - new patch
> ---
>  drivers/usb/chipidea/ci.h          | 1 +
>  drivers/usb/chipidea/ci_hdrc_imx.c | 1 +
>  drivers/usb/chipidea/core.c        | 2 ++
>  include/linux/usb/chipidea.h       | 1 +
>  4 files changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index 2a38e1eb6546..e4b003d060c2 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -260,6 +260,7 @@ struct ci_hdrc {
>  	bool				b_sess_valid_event;
>  	bool				imx28_write_fix;
>  	bool				has_portsc_pec_bug;
> +	bool				has_short_pkt_limit;
>  	bool				supports_runtime_pm;
>  	bool				in_lpm;
>  	bool				wakeup_int;
> diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
> index c64ab0e07ea0..17b3ac2ac8a1 100644
> --- a/drivers/usb/chipidea/ci_hdrc_imx.c
> +++ b/drivers/usb/chipidea/ci_hdrc_imx.c
> @@ -342,6 +342,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
>  	struct ci_hdrc_platform_data pdata = {
>  		.name		= dev_name(&pdev->dev),
>  		.capoffset	= DEF_CAPOFFSET,
> +		.flags		= CI_HDRC_HAS_SHORT_PKT_LIMIT,
>  		.notify_event	= ci_hdrc_imx_notify_event,
>  	};
>  	int ret;
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 835bf2428dc6..5aa16dbfc289 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -1076,6 +1076,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		CI_HDRC_SUPPORTS_RUNTIME_PM);
>  	ci->has_portsc_pec_bug = !!(ci->platdata->flags &
>  		CI_HDRC_HAS_PORTSC_PEC_MISSED);
> +	ci->has_short_pkt_limit = !!(ci->platdata->flags &
> +		CI_HDRC_HAS_SHORT_PKT_LIMIT);
>  	platform_set_drvdata(pdev, ci);
>  
>  	ret = hw_device_init(ci, base);
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index 5a7f96684ea2..ebdfef124b2b 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -65,6 +65,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
>  #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
>  #define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
> +#define	CI_HDRC_HAS_SHORT_PKT_LIMIT	BIT(19)
>  	enum usb_dr_mode	dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT		0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> -- 
> 2.34.1
> 

