Return-Path: <linux-usb+bounces-22969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC3A85DCE
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 14:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F2B2189FD32
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 12:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4792367B2;
	Fri, 11 Apr 2025 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lXu1b/Ox"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AD2367A4
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375789; cv=none; b=JmP4HBu6To13L9JbmoH3CRxRsuN3jGSaq6L1hCLAKQau3Kj8pS7v5z70RUwvA/V0JZ50gd5arul5cmDsdNorZUmhsCv6UqpGqcA26otyaSmWufCkaO5MBGAvYo4WyJb/hfJc2Qp9+4NPqiygehlJ/ougDpfb/VIK7tDZqXPTWjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375789; c=relaxed/simple;
	bh=sqv8FkS3uqBv8tFb+x4WAowRSy71HZw4VD8U5kxUKLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHm742Xe2xif8o711FIG1FVEuorWikIjyYA4N1AGEPnFfICZg1eH8eTA/j+Qsd7JIOmakFotMksbGzHQjRYPtfv0XyJqh4jY7p8ehv2Ko/HE+ogGh0LjDDqzrcRQOZkeORULqC1vLg4pdW2Vlzj7KMdO/QKsbaRSle2smLO4Kko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lXu1b/Ox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296C0C4CEE2;
	Fri, 11 Apr 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744375788;
	bh=sqv8FkS3uqBv8tFb+x4WAowRSy71HZw4VD8U5kxUKLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXu1b/Ox5mxaOIwWXN6eTtjY5zHAyunrKwCD4NkB7FGkfn/uInCW4iioDAm09/3B0
	 yq0BChHEe4JZjDpMP2lMh8mlp5pqQgFsZREanrGHT5aTs/WXCLcufGPcSJgVwPEoqG
	 UUKtOmXy+jsPbr1b2zCexAkcPcvmk+fLYXKFKa6o=
Date: Fri, 11 Apr 2025 14:49:45 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Amit Sunil Dhamne <amitsd@google.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-usb@vger.kernel.org,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] MAINTAINERS: Assign maintainer for the port controller
 drivers
Message-ID: <2025041127-vicinity-slate-6b72@gregkh>
References: <20250407133306.387576-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407133306.387576-1-heikki.krogerus@linux.intel.com>

On Mon, Apr 07, 2025 at 04:33:06PM +0300, Heikki Krogerus wrote:
> Especially the port manager (tcpm.c) is so major driver that
> it should have somebody watching over it who really
> understands it, and the port controller interface in
> general. Assigning Badhri as the designated reviewer and
> restoring the status to Maintained from Orphan.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Badhri Jagan Sridharan <badhri@google.com>
> ---
> Hi,
> 
> I'm proposing here that Badhri takes the role of the maintainer of
> the core tcpm.c and tcpci.c. I think he would be the best person for
> the job.
> 
> Badhri, I hope this is okay with you.

I need an ack from Badhri before I can take this.

thanks,

greg k-h

