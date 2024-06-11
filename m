Return-Path: <linux-usb+bounces-11124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7DF903238
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5050B23711
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 06:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5895117107C;
	Tue, 11 Jun 2024 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nplywNJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F4142A93
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718086129; cv=none; b=BktUU+c4Q6dZajUSnk3rYK0KG5BMybiEanEVsiT272rGEaeL/MisnrXDgZb6SkdBy7j3S8B0vQOZMZHbA79JqIWsIU3setBIXB+QAiD9xJHrjqFMVFXPI9/VFxp7JdY9Ao1IZCJgjni9Ml3wJLME0NmbGNRofMZRDNrV13chz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718086129; c=relaxed/simple;
	bh=nW12M9oSkDJMshYrZBVo/Yd0tS500v5i+hlsKinkDUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tz1CtTQAyMTlfXtqDcYDN8fRF5RCPYOmUb6QVDbTKtPOwR/iKHgT4mLRwJOxsDgV+lOB9/uYgKjxIYw4bqfObOp7LKv8ntgWeJ6K2RNIbCoAPe2+a8CPeHHtx2PuY3aZBFogA2OV3zp0B5p79F/4nZXCszxT/EHNfMgvJfisoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nplywNJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3441C2BD10;
	Tue, 11 Jun 2024 06:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718086129;
	bh=nW12M9oSkDJMshYrZBVo/Yd0tS500v5i+hlsKinkDUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nplywNJgdTucmg4TwSfC+wGpSe1ptw8jPuZz42boW/bF1FHrpJqg7KPNzhKMNb+4T
	 f9CcInHCNWMQOs04zjtqCtlW9vg2sCZip19qSuO9+ZQgSIfnQ5GQ1C4T9cdZp3Bgmv
	 wJ9//csLXpJYDojgwET/SSij/vaLz0BuHfVyN2gs=
Date: Tue, 11 Jun 2024 08:08:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alban Browaeys <alban.browaeys@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: add NO_REPORT_LUNS quirk for at least a few Seagate external
 drives to fix smartctl with uas
Message-ID: <2024061133-exclaim-recovery-3a59@gregkh>
References: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9791b3eee4fc52b45f1ea9b9724bf977bf5c38d4.camel@gmail.com>

On Mon, Jun 10, 2024 at 09:25:54PM +0200, Alban Browaeys wrote:
> I found that for "smartctl" to work on my two Seagate Expansion
> external USB3  I had to add the "j" usb-storage quirks ie
> "US_FL_NO_REPORT_LUNS".
> (They are years apart).
> 
> 
> 
> Bus 002 Device 008: ID 0bc2:231a Seagate RSS LLC Expansion Portable
> Bus 002 Device 007: ID 0bc2:2037 Seagate RSS LLC Expansion HDD
> 
> 
> Could these be added to drivers/usb/storage/unusual_uas.h
> with the "US_FL_NO_REPORT_LUNS" quirk, after the existing
> "UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999," for the Seagate
> "Expansion Desk"?

Sure, want to send a patch for this?

thanks,

greg k-h

