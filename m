Return-Path: <linux-usb+bounces-686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1507B7B17E4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 11:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0375E281E83
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 09:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88667347B5;
	Thu, 28 Sep 2023 09:54:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D37B2E65C;
	Thu, 28 Sep 2023 09:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0609CC433C8;
	Thu, 28 Sep 2023 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695894848;
	bh=Kj0SxZL7f2frf3BzU+23hjNt9BY8ETQvEskGUsbV/hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gULcXwiUDniTb2iIJ5XPcTY87uGCuTkYI8R0xtBdMAmb9/eB2zqPZPBqjKv+nP7Pq
	 kFh84pLK03Orf/m3c3SJvElUXGm6LvWu2mnOCvBziCJuxw4X+UPAGgp3eYyNHsBOnl
	 TwIqXLIrlUjTHR+efpZdzbUQnEzumPxaueXH+iTNBB8ywkIwvFWEcVYIS/iAI+fM2F
	 1Hw2Jch+qBOYVopFva0kci1f1iFrWsRPsmrdgX3BTHNlp2UI182Ssy2o25nc5XcYyk
	 PjsMJ3W66VQEVV3Kz9/+6lQY1/+1B84YFuCyvMzWc/xTpR+HYz8JecxkKnBCePo78a
	 fdqlMDb138uKQ==
Date: Thu, 28 Sep 2023 17:53:55 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, xu.yang_2@nxp.com,
	peng.fan@nxp.com, avifishman70@gmail.com, tali.perry1@gmail.com,
	joel@jms.id.au, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, j.neuschaefer@gmx.net,
	openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: chipidea: add
 CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag
Message-ID: <20230928095355.GA2081690@nchen-desktop>
References: <20230927095509.267029-1-tmaimon77@gmail.com>
 <20230927095509.267029-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927095509.267029-2-tmaimon77@gmail.com>

On 23-09-27 12:55:07, Tomer Maimon wrote:
> Adding CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag to modify the vbus_active
> parameter to active in case the ChipIdea USB IP role is device-only and
> there is no otgsc register.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/otg.c   | 5 ++++-
>  include/linux/usb/chipidea.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index f5490f2a5b6b..647e98f4e351 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -130,8 +130,11 @@ enum ci_role ci_otg_role(struct ci_hdrc *ci)
>  
>  void ci_handle_vbus_change(struct ci_hdrc *ci)
>  {
> -	if (!ci->is_otg)
> +	if (!ci->is_otg) {
> +		if (ci->platdata->flags & CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS)
> +			usb_gadget_vbus_connect(&ci->gadget);
>  		return;
> +	}
>  
>  	if (hw_read_otgsc(ci, OTGSC_BSV) && !ci->vbus_active)
>  		usb_gadget_vbus_connect(&ci->gadget);
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index 0b4f2d5faa08..5a7f96684ea2 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -64,6 +64,7 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_PMQOS			BIT(15)
>  #define CI_HDRC_PHY_VBUS_CONTROL	BIT(16)
>  #define CI_HDRC_HAS_PORTSC_PEC_MISSED	BIT(17)
> +#define CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS	BIT(18)
>  	enum usb_dr_mode	dr_mode;
>  #define CI_HDRC_CONTROLLER_RESET_EVENT		0
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
> -- 
> 2.33.0
> 

-- 

Thanks,
Peter Chen

