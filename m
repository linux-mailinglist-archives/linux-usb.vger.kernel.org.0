Return-Path: <linux-usb+bounces-23279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A52FFA95A75
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 03:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEE99173F00
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 01:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299D826ADD;
	Tue, 22 Apr 2025 01:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfbhQx6D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9242AB4
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745284987; cv=none; b=JXyLpIKLWAbrsePw5P1YiLjIffRyO6es/Qcb7um/DHfnxXOpkTKY3O4bI0a1Hjp82I9TOkOmlCttIRUjoB1VaUZ1y8G0bRpi3pkjAHi6O3Dm+qzaJXVsDxQnuR9ZkXIRd2odkTufQg2I31k6NxCFn3TnkC0WbZ5H5UmCRiU5n7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745284987; c=relaxed/simple;
	bh=VVAtjiBtysUcQTVCwzMYrX8RjTKU5t8j4/G1n2+kgF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9Zhi6saK6CuFDnYGK+RQmz91U33eUnOYGy+o8FanF0+G+di+usbpECHCqxMu/eryATgjLBVSu+M66EiKX5ntefL1MQrfZtAqqOaOE35DdvEynZOyd2ZyjBlJBsrNxXL1hY9qdg7anYcJNToMoPTknQEeyS6LaJRyqarl3fgnLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfbhQx6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6633AC4CEE4;
	Tue, 22 Apr 2025 01:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745284987;
	bh=VVAtjiBtysUcQTVCwzMYrX8RjTKU5t8j4/G1n2+kgF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfbhQx6Dqf3zuRWObNAf2NMquEF/eBSZKjjVvAMby4p2IvSgNhQVsV8gtaCkWC+j7
	 eyYa9fQWoC3gs2f+ZbKHHZYFatuIOMVnUvQM3e4GpsO4/bGAnfMmNxG3iW1nC4foUP
	 xSqzDHLY/S3AVpYfqplzxMU1Qc2waas3cSIcyBG/NEZNGFSXqdkGHCmQhTGS6SGagx
	 Qji2Yr45Fkhl/xG/ivk4oJuP+AKSPMujtWg9h0BeNeh5se1wmuQCDqWFH5XEwaKU5Z
	 QdcBDGVoVuxkHLHFxiY+AZwLXPQ6qO+Q23Kbxbgyz2fbvUaZTahZ+5/1J+CxX3loxF
	 kPdZ91gnwL9cQ==
Date: Tue, 22 Apr 2025 09:23:00 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: initialize struct otg_fsm earlier
Message-ID: <20250422012300.GA3584429@nchen-desktop>
References: <20250417111502.140474-1-oneukum@suse.com>
 <20250421014545.GA3578913@nchen-desktop>
 <410a1a6a-d866-44ad-8592-5babd3fe50b1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <410a1a6a-d866-44ad-8592-5babd3fe50b1@gmail.com>

On 25-04-21 11:15:37, Dmitry Osipenko wrote:
> 21.04.2025 04:45, Peter Chen (CIX) пишет:
> > On 25-04-17 13:14:54, Oliver Neukum wrote:
> >> The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> >> corruption") in effect hid an issue with intialization.
> >> In effect it replaces the racy continous reinitialization
> >> of fsm->hnp_polling_work with a delayed one-time
> >> initialization.
> >>
> >> This just makes no sense. As a single initialization
> >> is sufficient, the clean solution is just to do it once
> >> and do it early enough.
> >>
> >> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > 
> > Add Dmitry.
> > 
> > I am okay for this change, and see what's the Dmitry's response.
> 
> Thanks for notifying me
> 
> > Peter
> >> ---
> >>  drivers/usb/common/usb-otg-fsm.c | 7 +------
> >>  drivers/usb/phy/phy-fsl-usb.c    | 1 +
> >>  include/linux/usb/otg-fsm.h      | 2 +-
> >>  3 files changed, 3 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/usb/common/usb-otg-fsm.c b/drivers/usb/common/usb-otg-fsm.c
> >> index e11803225775..a22d536ccdf8 100644
> >> --- a/drivers/usb/common/usb-otg-fsm.c
> >> +++ b/drivers/usb/common/usb-otg-fsm.c
> >> @@ -117,7 +117,7 @@ static void otg_leave_state(struct otg_fsm *fsm, enum usb_otg_state old_state)
> >>  	}
> >>  }
> >>  
> >> -static void otg_hnp_polling_work(struct work_struct *work)
> >> +void otg_hnp_polling_work(struct work_struct *work)
> >>  {
> >>  	struct otg_fsm *fsm = container_of(to_delayed_work(work),
> >>  				struct otg_fsm, hnp_polling_work);
> >> @@ -193,11 +193,6 @@ static void otg_start_hnp_polling(struct otg_fsm *fsm)
> >>  	if (!fsm->host_req_flag)
> >>  		return;
> >>  
> >> -	if (!fsm->hnp_work_inited) {
> >> -		INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
> >> -		fsm->hnp_work_inited = true;
> >> -	}
> >> -
> >>  	schedule_delayed_work(&fsm->hnp_polling_work,
> >>  					msecs_to_jiffies(T_HOST_REQ_POLL));
> >>  }
> >> diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
> >> index 40ac68e52cee..7f0fdba689de 100644
> >> --- a/drivers/usb/phy/phy-fsl-usb.c
> >> +++ b/drivers/usb/phy/phy-fsl-usb.c
> >> @@ -845,6 +845,7 @@ int usb_otg_start(struct platform_device *pdev)
> >>  
> >>  	/* Initialize the state machine structure with default values */
> >>  	SET_OTG_STATE(otg_trans, OTG_STATE_UNDEFINED);
> >> +	INIT_DELAYED_WORK(&fsm->hnp_polling_work, otg_hnp_polling_work);
> >>  	fsm->otg = p_otg->phy.otg;
> 
> The original problem was fixed for the ChipIdea driver in the common USB
> code, while this phy-fsl-usb is the Freeescale USB driver that has
> nothing to do with the ChipIdea and the common code, AFAICT. Hence this
> patch should be wrong. I suggest not to change the original logic.
> 

Thanks for confirming it.  I did not check the user for OTG FSM
carefully since there are no active users long time.

I have checked that the phy-fsl-usb has not used hnp polling,
and the fsm->host_req_flag is not allocated. The chipidea driver is
the only user for hnp polling, so this patch is not needed.

By the way, I just curious that are there any products in market still
use OTG FSM?

-- 

Best regards,
Peter

