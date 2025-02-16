Return-Path: <linux-usb+bounces-20691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 941F0A37258
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 08:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84C3F7A3BC6
	for <lists+linux-usb@lfdr.de>; Sun, 16 Feb 2025 07:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226414C5B0;
	Sun, 16 Feb 2025 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LpfSGUTD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B415748D
	for <linux-usb@vger.kernel.org>; Sun, 16 Feb 2025 07:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739689796; cv=none; b=F7HAt0jD5eHna496MduU2/7saYONkNFnx0QVUmsozyk83GpW1GU6DsXnLDFO68WxCT5HwHy9qxynAqZJePgXiktj379zJY/aXhfcJRTvYSjaxIqUrdJGGGU7Mwhk2kpIbO3zUU+1omWcJkdXIhK1BTAyMdMUBpShYqOobWVG7b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739689796; c=relaxed/simple;
	bh=AewVF/TKw9BmPAghkQprwmaUui0uwprAYn/yOitnXK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0zSjnfRzP5cOgm0zbSF5p+fs9NPPhIzTjX01TO4mN0YnBFutIwrP1BSi4VqUNecs08YsfL0LfTE8wD00iaYItvrG4IGFR6GRHhPUus9w79N4ome+geRq57P5kduA1jcavaq2Jbg605HsJYwvBZZVYAjT2ix0AQes2AHKm6pguE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LpfSGUTD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA40C4CEDD;
	Sun, 16 Feb 2025 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739689795;
	bh=AewVF/TKw9BmPAghkQprwmaUui0uwprAYn/yOitnXK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LpfSGUTDsTEtISAL7DDAY1kK2ktTwVm/yUSm7Q8WVQgr9BIvqV9Q6JTTGsqyo3gon
	 k1Dc9M1FjKni7p4nu8TmWVabtgX6u3G9L0H5H8j3pz7LzTOcUhZ95xaeT9qQ7dd+bO
	 rQQRPuNpnlsrmR5WcT7KqFaB9I6ZNY3HR7K8Keyg=
Date: Sun, 16 Feb 2025 08:08:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Suraj Patil <surajpatil522@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: displayport: Update outdated FIXME comment
Message-ID: <2025021610-tartness-doorstep-4439@gregkh>
References: <20250216001609.106616-1-surajpatil522@gmail.com>
 <20250216001609.106616-3-surajpatil522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250216001609.106616-3-surajpatil522@gmail.com>

On Sun, Feb 16, 2025 at 12:16:09AM +0000, Suraj Patil wrote:
> The port mode is intentionally fixed to DFP_U; remove the FIXME tag.

Really?

> 
> Signed-off-by: Suraj Patil <surajpatil522@gmail.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index ac84a6d64c2f..732ee9399921 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -727,7 +727,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	struct fwnode_handle *fwnode;
>  	struct dp_altmode *dp;
>  
> -	/* FIXME: Port can only be DFP_U. */
> +	/* Port mode is fixed to DFP_U. */

Are you sure this can be removed?  I read this as this is a problem and
needs to be fixed in the future sometime, why is this suddenly not a
problem?  What commit id fixed it?

thanks,

greg k-h

