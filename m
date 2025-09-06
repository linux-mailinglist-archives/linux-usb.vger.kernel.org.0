Return-Path: <linux-usb+bounces-27631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52083B46DA5
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 15:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F04EF5A2BA0
	for <lists+linux-usb@lfdr.de>; Sat,  6 Sep 2025 13:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F3A2EFDAF;
	Sat,  6 Sep 2025 13:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Txih4u6H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4742258EF3;
	Sat,  6 Sep 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164610; cv=none; b=lKJgfuENSZQVGJcnJzsXLr/X/gnQatiktKoOgGnLB31NHDZ+r1GxOGpr4giqlZ/XJ8DbAUcRPi2SeAOovR5P4K6mLLFeNUJN4Q902UCckjN/TVzlRPViaBxibqMUi3lNESQh8NyFoRwkvltb5Nwrt0+tYBhNDe5Tgd+kM+hpgk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164610; c=relaxed/simple;
	bh=vPgCbmP/DGlsw1rAlcsgGu706SXF9RmpPE5Xl39OipM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIAD5vo3i1LBxRaz0nfoej88DS7wY5WKTbpo2LAX3PHkSeDANpkeG0v0wwQuIulA1UDsVLxejGBefn6Krq7dEL26kkoHA8vBERzXpeAMLI76RnDAEAE6nOkD6YIssyyJVaB8oAmS1llY3fqKtX4cUdc5S7U1qaPaOfg4nU1LLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Txih4u6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F358AC4CEE7;
	Sat,  6 Sep 2025 13:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757164610;
	bh=vPgCbmP/DGlsw1rAlcsgGu706SXF9RmpPE5Xl39OipM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Txih4u6HNNYuGDLOyRmfAmaEaJhkWoGYoukEpURCBU3vGloN8e735ymIXPKPXfTBm
	 6TiFCJA2gDmUfuvz3UlisaWNXFVoElI9iwdEbSZd69IZmDHrEHbLTGmXqp3Hd6h1UE
	 YgUnFdQGYEeRPkcH/UvcRD6L76NY+wIJkOTLFUXw=
Date: Sat, 6 Sep 2025 15:16:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: royluo@google.com, jkeeping@inmusicbrands.com,
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: udc: Add trace event for usb_gadget_set_state
Message-ID: <2025090657-unpinned-unnatural-2ccd@gregkh>
References: <20250818082722.2952867-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818082722.2952867-1-khtsai@google.com>

On Mon, Aug 18, 2025 at 04:27:19PM +0800, Kuen-Han Tsai wrote:
> While the userspace program can be notified of gadget state changes,
> timing issue can lead to missed transitions when reading the state
> value.
> 
> Introduce a trace event for usb_gadget_set_state to reliably track state
> transitions.
> 
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
>  drivers/usb/gadget/udc/core.c  | 1 +
>  drivers/usb/gadget/udc/trace.h | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index d709e24c1fd4..e28fea614496 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1125,6 +1125,7 @@ void usb_gadget_set_state(struct usb_gadget *gadget,
>  {
>  	gadget->state = state;
>  	schedule_work(&gadget->work);
> +	trace_usb_gadget_set_state(gadget, 0);

Will this show the state the gadget has been set to?  And why not just
do that in the work callback, as that is when it really happens.

What is the output of this trace line?

thanks,

greg k-h

