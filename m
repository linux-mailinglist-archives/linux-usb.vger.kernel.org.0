Return-Path: <linux-usb+bounces-19995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F81A25AB6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 14:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7E5163C6D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F72204C3E;
	Mon,  3 Feb 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="drkIDBbh"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20E22040B5
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588884; cv=none; b=CO3NBID3ox2bTMJ8i0m5sxW2dX3a9L0j5VUXl60SU56R75luycdhBQMwAAH8keU8L1zvtUKyhybc0kMZze4KfSeHtsZfju28tkYiPtr1+6W9qS3WEoo015d5zUx7LDXkDnSA+gTlncCJ9OCpufiUN7AsFoHrixZMcX9S8Vk4AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588884; c=relaxed/simple;
	bh=43aqwoFqEadmaiaEL1evHdDHKrDHYllGJKxj2XFQdv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=InqcUHJBqrTWZht6hhzmr574md+GtLZBaVv5ymDP8j99Ow1gMFvxnkNzGN2u4f3kPWEHwDBMAhPEf+XHaCx/YReHHkNtG4LAmQRM8PgFKBapsLNBEHMxitZbyyxCUWIT1r32dckP339/GR7G8eLhwvVoG1J9giFZ2jJwyK1Qq4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=drkIDBbh; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 3 Feb 2025 14:21:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738588869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oSl7lrm4KEuJioP7eaV2gboPggwLzfzD3mDrXk5z0bM=;
	b=drkIDBbhAYcULTSuQt9kmDX+HKaZKBJYl4rCH25JaGU11sjRAjthhDUf4/LdJE9CQdIltj
	MXJrthEEKYyaJqBhPoiFsJuGP+9HOaRVSG/xR5fs29z8Xi3xH4ghibGxABvDo/JuS+EMwT
	G9JX4xg56u5s+kEGgBqi6gfkP2kaJss=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: usb251xb: silence EPROBE_DEFER error on boot
Message-ID: <i2qbsl5vhi7ltwxabmnbeiixcb4kmliezuokmv7sknkfgzwgns@g4jhh4ldugcz>
References: <20250203-defer_usb1-v2-1-eba405ebee2c@atmark-techno.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-defer_usb1-v2-1-eba405ebee2c@atmark-techno.com>
X-Migadu-Flow: FLOW_OUT

On Mon, Feb 03, 2025 at 03:33:49PM +0900, Dominique Martinet wrote:
> Use dev_err_probe to silence EPROBE_DEFER error on boot:
> [    0.757677] usb251xb 1-002c: failed to get ofdata: -517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
> Changes in v2:
> - removed redundant error code in message and brace
> - Link to v1: https://lore.kernel.org/r/20250203-defer_usb1-v1-1-f6bba254215d@atmark-techno.com
> ---
>  drivers/usb/misc/usb251xb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index e24cdb667307802b9eee856e20744ebf694395e8..4fb453ca545013f8b89c43d3bb5cc6d1c53b39c9 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -636,10 +636,8 @@ static int usb251xb_probe(struct usb251xb *hub)
>  
>  	if (np && usb_data) {
>  		err = usb251xb_get_ofdata(hub, usb_data);
> -		if (err) {
> -			dev_err(dev, "failed to get ofdata: %d\n", err);
> -			return err;
> -		}
> +		if (err)
> +			return dev_err_probe(dev, err, "failed to get ofdata\n");
>  	}
>  
>  	/*
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb1-254070d18cc9

Acked-by: Richard Leitner <richard.leitner@linux.dev>

