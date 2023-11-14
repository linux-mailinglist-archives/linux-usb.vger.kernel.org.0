Return-Path: <linux-usb+bounces-2858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AF7EAAE5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 08:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64ABFB20A99
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 07:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4483F11C8C;
	Tue, 14 Nov 2023 07:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv+cJ6uY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E1C11733
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 07:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF1C433CA;
	Tue, 14 Nov 2023 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699946888;
	bh=+KjAg3oyDvkQWJep1sTAthLSg9NWkezMM9RV7V11nPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kv+cJ6uY7xzWexH3qjNoqOd19GCvow+4H3pIlSYFhjiZZNqlKCNGtK/Rb+KlrhYVw
	 gRSZ9G3VMOXJAtTrLHUxLFu0Bpa9OUjXXny59w1ZmoTMVKLzQTf7gqIGce/NL8rwWb
	 PEU0lmGJp3vo1XPuMuPcXTPUtlzMFvExnOz8suMBR1Wlo+Hw1jiXRgibErPDyMPOsj
	 c+zPO7tuG9h3k7p/v3A8l8PtF3dqoJydguhpn7do46D/bOqVX3LlVLawTmDBgyyioM
	 KJT50OE3RVC5aOGhtrytsfS9pNRLlkZwKDn6QjQ87wnmw+Eyu6O2NfVen871P5vfQG
	 wP1MDDSjsQAQA==
Date: Tue, 14 Nov 2023 15:27:57 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] initialize struct otg_fsm earlier
Message-ID: <20231114072757.GB64573@nchen-desktop>
References: <20231113173125.23696-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113173125.23696-1-oneukum@suse.com>

On 23-11-13 18:31:20, Oliver Neukum wrote:
> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> corruption") in effect hid an issue with intialization.

Typo, hit an issue with initialization.

> In effect it replaces the racy continous reinitialization
> of fsm->hnp_polling_work with a delayed one-time
> initialization.
> 
> This just makes no sense. As a single initialization
> is sufficient, the clean solution is just to do it once
> and do it early enough.

The phy-fsl-usb is not the only user, there are other users, eg,
chipidea.

Peter
> 
> Fixes: bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list corruption")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/common/usb-otg-fsm.c | 7 +------
>  drivers/usb/phy/phy-fsl-usb.c    | 1 +
>  include/linux/usb/otg-fsm.h      | 1 -
>  3 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
> index 0697fde51d00..0aa2eb7396ce 100644
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
> index 79617bb0a70e..4553aaab3761 100644
> --- a/drivers/usb/phy/phy-fsl-usb.c
> +++ b/drivers/usb/phy/phy-fsl-usb.c
> @@ -844,6 +844,7 @@ int usb_otg_start(struct platform_device *pdev)
>  
>  	/* Initialize the state machine structure with default values */
>  	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
> +	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
>  	fsm->otg = p_otg->phy.otg;
>  
>  	/* We don't require predefined MEM/IRQ resource index */
> diff --git a/include/linux/usb/otg-fsm.h b/include/linux/usb/otg-fsm.h
> index 6135d076c53d..cc0bc4edf227 100644
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
> -- 
> 2.42.0
> 

-- 

Thanks,
Peter Chen

