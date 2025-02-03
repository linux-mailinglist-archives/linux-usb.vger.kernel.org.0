Return-Path: <linux-usb+bounces-20009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBBAA25E90
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 16:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6E0168C3D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 15:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D116D20A5E3;
	Mon,  3 Feb 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="o8qahSDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2E20A5CA;
	Mon,  3 Feb 2025 15:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595912; cv=none; b=VYVemmo7c16Q7FGy3GidiMHPIq+Ibvum38fqvyj9DgRyj13qz4Hv5jYJJpmZjSBtXZI/X9FmnSpjbspSIhHbCsu/UMkHu4Z3AGqXKr95MUhcx55VlTYdg/gTYHwGX56v86WmXZfI01wYW65pEuLVtFN8AezDttx2HnFPUtgM0n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595912; c=relaxed/simple;
	bh=ldqVj/+Gzlf0yp1nyCQex67h2aGM3SbrOeSwqcT4dXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zyp8KwRRjSfb/DjlWR8Pc2LEJa2wFRa3Xbt3VJQwzfb9Syh5W1rhMY5ex9+k7B2pNcpbv/XbkJM/5spAkgavkWyJ2l56JO81ByJnaRBoEP4joQw9EIAq/6G+ji1Xg0egzbpUA4INAmjQ94kWGglV1vqw1hZtQLI1JdJEj4JfvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=o8qahSDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F8AC4CEE0;
	Mon,  3 Feb 2025 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738595911;
	bh=ldqVj/+Gzlf0yp1nyCQex67h2aGM3SbrOeSwqcT4dXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8qahSDSco+hcHrUOPFMZs8ya/Bnt82F6hi/MWgU0k875YY6BAfBkLseNBsMjdMK3
	 zi6HSJ5aXdmcB7dJfQIQ4vo4VmYwAn7qd02ktBoD6GnWMO5DwO2wZXtmhl0XCGc5Ly
	 e3NWGGebkzj/8+Q7LFAliiPHu2BxAqx3joswDPGE=
Date: Mon, 3 Feb 2025 16:18:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benson Leung <bleung@chromium.org>
Cc: heikki.krogerus@linux.intel.com, abhishekpandit@chromium.org,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: Re: [PATCH 1/2] usb: typec: thunderbolt: Fix loops that iterate
 TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
Message-ID: <2025020328-lunacy-commend-9f52@gregkh>
References: <Z5Psp615abaaId6J@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Psp615abaaId6J@google.com>

On Fri, Jan 24, 2025 at 07:40:23PM +0000, Benson Leung wrote:
> Fixes these Smatch static checker warnings:
> drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn: why is zero skipped 'i'
> 
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Please always use 'git send-email' or if not, manually thread your
patches so they all show up together as a series.  These are both
individual and as such, don't play nice with tools.

I'll try to manually handle them, but you owe me...

thanks,

greg k-h

