Return-Path: <linux-usb+bounces-3533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D476C80081F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 11:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8DF51C20E0E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 10:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF0320B18;
	Fri,  1 Dec 2023 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCRlbMPR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E181CAB9
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8DAC433C8;
	Fri,  1 Dec 2023 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701426203;
	bh=dJ1cukc9ejZDR4rZInL7JJRrb2AC84aaPIZcu2JxBeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCRlbMPRGUOIaCATV8RvRcoF1Jo0Br38phZutn88qw2yE0XAXw/1NPjjqzKaxiDi5
	 SysQkM8KAiVxv5floLXOd8pisXAATM1TeKqB/rvF3pTJJ4h7C1pPlb7POHywaPWs67
	 zcOGZS+k+nov7KaPz3nKDrnzY17hr6uFa+J+jwp3kstSUItRNlo+OSI2Zy9du6f2FK
	 ZcaRYW7iYhK0v61qUEiXz8aM+5RACVQJfRqHVWF2jrPUGndGY96SHXLFGl7P2BkM/k
	 OWNtXzTqvAszAw2MNyG4Wc2goXNGszjuROCrxGtWM8P5TQq0ruuBH8TFd5UBu++6jK
	 bHo2F8CsSohvg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r90gg-0004Uh-0P;
	Fri, 01 Dec 2023 11:23:58 +0100
Date: Fri, 1 Dec 2023 11:23:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [RFC] USB: check for transmissible packet sizes when matching
 endpoints
Message-ID: <ZWm0Psayu1jomQMx@hovoldconsulting.com>
References: <20231130114006.31760-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130114006.31760-1-oneukum@suse.com>

On Thu, Nov 30, 2023 at 12:39:45PM +0100, Oliver Neukum wrote:
> Looking for a bulk endpoint to transfer data over
> we need something that can transmit data.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/usb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 2a938cf47ccd..d163bd279021 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -80,6 +80,9 @@ static bool match_endpoint(struct usb_endpoint_descriptor *epd,
>  {
>  	switch (usb_endpoint_type(epd)) {
>  	case USB_ENDPOINT_XFER_BULK:
> +		if (!usb_endpoint_maxp(epd))
> +			return false;
> +
>  		if (usb_endpoint_dir_in(epd)) {
>  			if (bulk_in && !*bulk_in) {
>  				*bulk_in = epd;

This reminds me of 2548288b4fb0 ("USB: Fix: Don't skip endpoint
descriptors with maxpacket=0") and 

	https://lore.kernel.org/all/20200102112045.GA17614@localhost/

We have at least one ftdi device with broken descriptors that would be
hurt by this if usb serial used this helper to look up the endpoint.
That isn't the case currently, but in theory there could be other
devices like that.

Is there a real issue you're trying to address here?

Johan

