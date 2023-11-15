Return-Path: <linux-usb+bounces-2887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6657EBAEF
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 02:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16BBC1C20AF1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 01:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFC9631;
	Wed, 15 Nov 2023 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q6RvKmz8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C723739B
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 01:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FE1C433C7;
	Wed, 15 Nov 2023 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700011907;
	bh=yXBKupjbGGe9yXiS0kNsrAK5OXSaPn7AaVydL3aYSUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6RvKmz8h0rL82j0V5DFIvKMRD/dThzI7mXk2iBkIISQxbwSlpyjc4AqHKyw2EA85
	 qAruXV1Z4/AdGniPEZ2qqaSoyZQ18EqToRkibYoZSV8FQpt8mLpdzoNJa1oBaXUkEs
	 ggc6aF76ax8OUfRnBGnP9/SoAjT+5m2E0eDX8euKnlJ3ALVWgnHiMDsQ0329UWhy1y
	 DR68SBAyfCukeIIZeBLHamQhQHxGj517cIxyxXMuTrePw9Pqz8uFwJegGQnMqnXGzO
	 BI6yJNqrhPnQlpyXNQ+PxUKS/CgTbIPthGGdO8kBC34a+v+xFjkCZh9tDAymeV7jA7
	 Fmvz1NZTx/pmg==
Date: Wed, 15 Nov 2023 09:31:37 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] initialize struct otg_fsm earlier
Message-ID: <20231115013137.GA69668@nchen-desktop>
References: <20231113173125.23696-1-oneukum@suse.com>
 <20231114072757.GB64573@nchen-desktop>
 <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>

On 23-11-14 10:44:36, Oliver Neukum wrote:
> Hi,
> 
> On 14.11.23 08:27, Peter Chen wrote:
> > On 23-11-13 18:31:20, Oliver Neukum wrote:
> > > The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> > > corruption") in effect hid an issue with intialization.
> > 
> > Typo, hit an issue with initialization.
> 
> No, it hides an issue.
> 
> > > In effect it replaces the racy continous reinitialization
> > > of fsm->hnp_polling_work with a delayed one-time
> > > initialization.
> > > 
> > > This just makes no sense. As a single initialization
> > > is sufficient, the clean solution is just to do it once
> > > and do it early enough.
> > 
> > The phy-fsl-usb is not the only user, there are other users, eg,
> > chipidea.
> 
> Interesting.
> Are you saying that somebody calls otg_start_hnp_polling() without
> a prior call to usb_otg_start()?

Yes, phy-fsl-usb is the freescale implementation. Others may have
different, see ci_hdrc_otg_fsm_init for detail.

Peter

> If so, how is struct otg_fsm initialized?
> Currently struct otg_fsm is partially initialized and that just
> makes no sense.
> 
> 	Regards
> 		Oliver

-- 

Thanks,
Peter Chen

