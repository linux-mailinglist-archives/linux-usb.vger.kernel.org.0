Return-Path: <linux-usb+bounces-26904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4A5B27D41
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 11:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 757047BDA5D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Aug 2025 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D502FC860;
	Fri, 15 Aug 2025 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X7jMwfbl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F52FB977
	for <linux-usb@vger.kernel.org>; Fri, 15 Aug 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755250713; cv=none; b=U4/+dHR+UMPSCCEeDE/JS5SVkdTCraydgi2G30ENf4RhH+M+t0Cn0BNxrxqv+RsKoxbaQWXCiBmvETudJgR4qRM+Luoey95v2yMT0x4Yx3wy8qr3wdZzGGzH/C3pj0kYF2Qw+C3PZr028iR+Nu72RSltvYB6p/1RIdgxFOfzH5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755250713; c=relaxed/simple;
	bh=ej1nHI6Rfa2cz/J9dqAudpp/bJOGjKq99QkA2CX1azU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/9z9Olf0HJ7/1RJV/3EC+Su5JF3LHGZqVGZml9kdjseZzn9L32o8ASMMCMVYfYevxrdjGRVqLSuZnFPg70El08dJU9EgTgNQ0bF7fNSFokAjkx+zKDNmAiXnViFiVmX09+qfwIQcPaLFYbMysgcLLc7sJN/WG2EyneV7h4FmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X7jMwfbl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1737EC4CEEB;
	Fri, 15 Aug 2025 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755250711;
	bh=ej1nHI6Rfa2cz/J9dqAudpp/bJOGjKq99QkA2CX1azU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7jMwfbl6u9oquu3gFEM7lAIm8aJ+t2ivxKLZD8LuencPaS6D+//6lPGJIENml7t+
	 1c570b3fLIYN1VbyFCE401P1Xe6U3J4lHcdvGlvs5D9piL07fs9oU5j3eAmXhkpqs6
	 MO9AZyw/xG3XZJDdPjUFCcCdlA8+2P+HcemCY/7o=
Date: Fri, 15 Aug 2025 11:38:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>,
	Oliver Neukum <oneukum@suse.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] USB: Check no positive return values from
 pm_runtime_resume_and_get()
Message-ID: <2025081502-opacity-rewire-447b@gregkh>
References: <20250811062403.2116464-1-sakari.ailus@linux.intel.com>
 <2025081330-droplet-napping-6843@gregkh>
 <aJ7_CMzCVwPEMSOj@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ7_CMzCVwPEMSOj@kekkonen.localdomain>

On Fri, Aug 15, 2025 at 09:34:00AM +0000, Sakari Ailus wrote:
> Hi Greg,
> 
> On Wed, Aug 13, 2025 at 04:43:05PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Aug 11, 2025 at 09:24:03AM +0300, Sakari Ailus wrote:
> > > pm_runtime_resume_and_get() always returns a negative error code or zero;
> > > there's no need to check for positive values such as returned by
> > > pm_runtime_get_sync(). Simply drop the check.
> > > 
> > > Fixes: 7626c52b6b46 ("usb: usb_autopm_get_interface use modern helper")
> > > Cc: stable@vger.kernel.org
> > 
> > If there is no need for this check, why does this need to be backported
> > to stable kernels?
> 
> It's not necessary IMO.
> 
> The practice lately has been to add Cc: stable if the Fixes: tag is there.

If it actually fixes a bug.

> But there was no actual bug in this case, just that this change ideally
> would have been part of the original patch.

Then it's not really a "fix" so that tag does not need to be there
either :)

thanks,

greg k-h

