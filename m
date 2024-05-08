Return-Path: <linux-usb+bounces-10141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3D78C006B
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 16:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FFA81F20D38
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 14:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6867D8664A;
	Wed,  8 May 2024 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="KNWzT6Dz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536686643
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715179545; cv=none; b=BsJe7a8AyjUM4QwJl97dVu7SBfHse8jjCOnpRTftRlL0gE84n+rAT4rxXmd5J6ftwxcrDpPPoai2H5UKLOYtOlQ25OMmoMbRDDC4BMEH+SV3B0naKqd97xRvtPLdYa9RGNCl0iIpHdNNFS0XY9JluaLfehJYR3Qwi9ZIZaCIqNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715179545; c=relaxed/simple;
	bh=W5WLFqaKghNQtjN4vPUeHjtJYwrnGgMyQykFFT0sL7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAA+/Hk5UFpyIqa5a4d8HKDc85jL92C/cAMfEBtCJ97fmnFMb6bDd/rAkCoqU4q/ypVaf1hXpyo1tZsZt9T9/YbBtx2Mok+sUGZRDeQEXUHK/yps7l723binYEh1X2ljPdToRZiu7SSxclWHj2F0nPfS+pGJAHYTwqaugcON8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=KNWzT6Dz; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id ABF4E600298A;
	Wed,  8 May 2024 15:45:40 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id UHSXUetuEJ0L; Wed,  8 May 2024 15:45:38 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 2C197600242E;
	Wed,  8 May 2024 15:45:38 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1715179538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LDs4ywgzvmFT/u8PseKh9vK/J9tLxMkGQbhIt2XVziE=;
	b=KNWzT6DzShpSv+vzC1Qn+I13mQEzsKBK5kZfKBfuO4ivJkWMH2Yt45Py/SPhMhdsvGoc1y
	BJuiSog+ca09QsKRtSNNFUnyvfqo0Y7qvQZmRDHzXiuh6ud6wIfutx8tXeM4//DOqWjlGS
	L4eSebV7qCCkr6XwQFBCO0i4RKdj0UE=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:4589:2164:1bc5:2670])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6F1FA3600A6;
	Wed,  8 May 2024 15:45:37 +0100 (WEST)
Date: Wed, 8 May 2024 15:45:34 +0100
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [bug report] usb: typec: ucsi: Only enable supported
 notifications
Message-ID: <5nfx6cag5z3wjglaip7tby5y6gnqjavuhb5k62zajk3ejelcpi@rnzq642oqqtr>
References: <dd955f16-bbb9-4d51-98ea-31cad358ab69@moroto.mountain>
 <eo56goqwajv2p3wwfrma2wowv7t5fc6fhfapkb75ixs5rvl63a@4joxxdo7bq37>
 <bde4764d-ef93-4c63-91e5-8087ce2bc329@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde4764d-ef93-4c63-91e5-8087ce2bc329@moroto.mountain>

On Wed, May 08, 2024 at 05:34:57PM GMT, Dan Carpenter wrote:
> On Wed, May 08, 2024 at 03:22:49PM +0100, Diogo Ivo wrote:
> > Hello Dan,
> > 
> > On Wed, May 08, 2024 at 10:53:05AM GMT, Dan Carpenter wrote:
> > > Hello Diogo Ivo,
> > > 
> > > Commit 27ffe4ff0b33 ("usb: typec: ucsi: Only enable supported
> > > notifications") from Mar 27, 2024 (linux-next), leads to the
> > > following Smatch static checker warning:
> > > 
> > > 	drivers/usb/typec/ucsi/ucsi.c:1671 ucsi_get_supported_notifications()
> > > 	warn: was expecting a 64 bit value instead of '((((1))) << (24))'
> > > 
> > > drivers/usb/typec/ucsi/ucsi.c
> > >     1665 static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
> > >     1666 {
> > >     1667         u8 features = ucsi->cap.features;
> > >     1668         u64 ntfy = UCSI_ENABLE_NTFY_ALL;
> > >     1669 
> > >     1670         if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
> > > --> 1671                 ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;
> > > 
> > > ntfy is a u64 but UCSI_ENABLE_NTFY_CAM_CHANGE is unsigned long.  So on
> > > a 32 bit system this will clear the high 32 bits.  So far as I can see
> > > ntfy should just be a u32.  Either way, the types should match.
> > > BIT_ULL() is the way to do that if it really needs to be a u64.
> > 
> > In my view this variable really should be a u64 and the definitions of
> > the UCSI_ENABLE_NTFY_* need to be changed to BIT_ULL(). This is due to
> > UCSI versions 2.0 and up definining a new notification on bit 33, crossing
> > the u32 barrier. My suggestion for addressing this is sending two
> > patches, one for changing BIT() -> BIT_ULL() and adding the missing
> > define for the notification of bit 33 and a separate patch to handle
> > this new notification bit in ucsi_get_supported_notifications()/ucsi_init().
> > 
> > Thank you for the report and please let me know if this sounds
> > reasonable, or if it would be better to split the changes in another
> > way.
> 
> Yes, this sounds reasonable to me.  I don't know the hardware at all and
> didn't know you were planning to add a BIT(33).

To be honest this was not something I had thought about and I looked
into it after seeing your report; if this extra notification was not
there the best solution would probably be to use u32.

Best regards,
Diogo

