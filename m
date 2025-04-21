Return-Path: <linux-usb+bounces-23251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820DA94A87
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 03:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2586D3B0F65
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 01:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B917921D3E3;
	Mon, 21 Apr 2025 01:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAM/2Pqf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B5E21CC6D
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745199955; cv=none; b=iE91SsVqCuiwgRGmMywUoir17StlsleKvlKkWVKem5b01gl+H877spNjdWNDC0xe2D77Swo1k544dgeOvHCvXXQORlVrQLs+GfQlnSzGGtmKEuiY6pcmxlzBMNp9SeJpYC0pGcMcBaWepLLDpemSkqLSDUuQr/YLN5DaqHktbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745199955; c=relaxed/simple;
	bh=6FWM6D4EOdsYh4yGifOIVQja1/ju33ogJ5m6B077mwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozZmHEjrxMndz5p+Cxq4jMi1y8+JJYro5xg5dJ+pMQxSEAInBiExcjULZ1+G9CFwi5jMLKyyaxZgLpfphLZkCJKdNqTFWn4PeaEky1dx67uPmqZ/Bk1s3gNP+lMpguemHD6i1Amkzg0SHgXDeZYcI0rrY2Dq1UfPTsgahvRUl6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAM/2Pqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC37DC4CEED;
	Mon, 21 Apr 2025 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745199952;
	bh=6FWM6D4EOdsYh4yGifOIVQja1/ju33ogJ5m6B077mwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAM/2Pqfq6rn2prIVHKkFJjzpPsRhWzO+s+a8nIJDiLle10p2hHA2uLH7FW4viXpF
	 pJ7IYj9UsRci75xf0iPeOH3yfzdH4aMg+9l50M0FxwnFl1/88CCHrGMle4sWnkqLme
	 SxwsLPXkkzpRiJYnNfCLCTQvIhiwsCTdQTNEzH9uQbIlthzmkDE6xLHDHA/jP1aIRC
	 wZ6KyyULdLJ+I8Z3wS5+56xKdxtpqNeFEcbNzLWs0fe+zjruiaEZ/EXev/pD53DTWH
	 Ulm++wrwwPeZsVDx88v/BD1i2WH2VW1NZZJTBA2i7jpXTXYuGRz8KRgEvPAI98wcap
	 mOYapxrJweVjg==
Date: Mon, 21 Apr 2025 09:45:45 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Oliver Neukum <oneukum@suse.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: initialize struct otg_fsm earlier
Message-ID: <20250421014545.GA3578913@nchen-desktop>
References: <20250417111502.140474-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417111502.140474-1-oneukum@suse.com>

On 25-04-17 13:14:54, Oliver Neukum wrote:
> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> corruption") in effect hid an issue with intialization.
> In effect it replaces the racy continous reinitialization
> of fsm->hnp_polling_work with a delayed one-time
> initialization.
> 
> This just makes no sense. As a single initialization
> is sufficient, the clean solution is just to do it once
> and do it early enough.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Add Dmitry.

I am okay for this change, and see what's the Dmitry's response.

Peter
> ---
>  drivers/usb/common/usb-otg-fsm.c | 7 +------
>  drivers/usb/phy/phy-fsl-usb.c    | 1 +
>  include/linux/usb/otg-fsm.h      | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
> index e11803225775..a22d536ccdf8 100644
> --- a/drivers/usb/common/usb-otg-fsm.c
> +++ b/drivers/usb/common/usb-otg-fsm.c
> @@ -117,7 +117,7 @@ static void otg_leave_state(struct otg_fsm *fsm, enum usb_otg_state old_state)
>  	}
>  }
>  
> -static void otg_hnp_polling_work(struct work_struct *work)
> +void otg_hnp_polling_work(struct work_struct *work)
>  {
>  	struct otg_fsm *fsm = container_of(to_delayed_work(work),
>  				struct otg_fsm, hnp_polling_work);
> @@ -193,11 +193,6 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
>  	if (!fsm->host_req_flag)
>  		return;
>  
> -	if (!fsm->hnp_work_inited) {
> -		INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
> -		fsm->hnp_work_inited = true;
> -	}
> -
>  	schedule_delayed_work(&fsm->hnp_polling_work,
>  					msecs_to_jiffies(T_HOST_REQ_POLL));
>  }
> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
> index 40ac68e52cee..7f0fdba689de 100644
> --- a/drivers/usb/phy/phy-fsl-usb.c
> +++ b/drivers/usb/phy/phy-fsl-usb.c
> @@ -845,6 +845,7 @@ int usb_otg_start(struct platform_device *pdev)
>  
>  	/* Initialize the state machine structure with default values */
>  	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
> +	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>  	fsm->otg = p_otg->phy.otg;
>  
>  	/* We don't require predefined MEM/IRQ resource index */
> diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
> index 6135d076c53d..26cb7e84cd50 100644
> --- a/include/linux/usb/otg-fsm.h
> +++ b/include/linux/usb/otg-fsm.h
> @@ -183,7 +183,6 @@ struct otg_fsm {
>  	struct mutex lock;
>  	u8 *host_req_flag;
>  	struct delayed_work hnp_polling_work;
> -	bool hnp_work_inited;
>  	bool state_changed;
>  };
>  
> @@ -308,5 +307,6 @@ static inline int otg_start_gadget(struct otg_fsm *fsm, int on)
>  }
>  
>  int otg_statemachine(struct otg_fsm *fsm);
> +void otg_hnp_polling_work(struct work_struct *work);
>  
>  #endif /* __LINUX_USB_OTG_FSM_H */
> -- 
> 2.49.0
> 

-- 

Best regards,
Peter

