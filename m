Return-Path: <linux-usb+bounces-2888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C637EBAF1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 02:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288712813D1
	for <lists+linux-usb@lfdr.de>; Wed, 15 Nov 2023 01:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3548644;
	Wed, 15 Nov 2023 01:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNaZ9CFw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8C630
	for <linux-usb@vger.kernel.org>; Wed, 15 Nov 2023 01:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43210C433C8;
	Wed, 15 Nov 2023 01:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700012043;
	bh=YIoGq50g6zcgskKR2M5Iob3BeI+SWmDR55vEWTY5zLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNaZ9CFw/s7JqO8rtJHg/+AAlayu2jAOAgI3V82ONcnE92uDNG/SEKtm4p4Ig2qJk
	 UqSKlaU8U0Cr8SuXMJDF3SPKoflm/GI/rAqFU59XQInKdunGWKJQ5a/A2g+mZxm9tB
	 R5JhtTBHbNOvhb2idytJ6mIF3V0ynkSmH/LnfzmVi7c99GblKsjOIae7vTBg0FfuTy
	 Yn9TCyqHqLijnbEmUyCCPpwBkpDXpmR8F6cSupcz6l/gtj+ekcDTL8trNz49IFS/1B
	 l6emAx76VXTUPTy8UJZNpIdTCm2LQQdYLlxvNF7Z9WUIeJtSy7yyC9dZXrhoQjBeOB
	 vR68e/Cr24/jQ==
Date: Wed, 15 Nov 2023 09:33:53 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] initialize struct otg_fsm earlier
Message-ID: <20231115013353.GB69668@nchen-desktop>
References: <20231113173125.23696-1-oneukum@suse.com>
 <20231114072757.GB64573@nchen-desktop>
 <1501d722-d193-4440-b5ea-a9586fca9a2b@suse.com>
 <f05f2890-74a1-4e29-99fc-7fc4f22437f1@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f05f2890-74a1-4e29-99fc-7fc4f22437f1@rowland.harvard.edu>

On 23-11-14 10:33:55, Alan Stern wrote:
> On Tue, Nov 14, 2023 at 10:44:36AM +0100, Oliver Neukum wrote:
> > Hi,
> > 
> > On 14.11.23 08:27, Peter Chen wrote:
> > > On 23-11-13 18:31:20, Oliver Neukum wrote:
> > > > The earlier fix bf88fef0b6f1 ("usb: otg-fsm: Fix hrtimer list
> > > > corruption") in effect hid an issue with intialization.
> > > 
> > > Typo, hit an issue with initialization.
> > 
> > No, it hides an issue.
> 
> The typo was in the last word of the line, not the fourth word.  That is:
> 
> 	s/intial/initial/, not s/hid/hit/.
> 
> Peter had a typo in his correction.  :-)
> 

Alan, thanks for pointing it.

-- 

Thanks,
Peter Chen

