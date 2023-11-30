Return-Path: <linux-usb+bounces-3514-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F87FF718
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 17:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7ACDB20F8F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 16:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09C854F98;
	Thu, 30 Nov 2023 16:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 5A5DFD50
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 08:52:10 -0800 (PST)
Received: (qmail 253508 invoked by uid 1000); 30 Nov 2023 11:52:09 -0500
Date: Thu, 30 Nov 2023 11:52:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFC] USB: check for transmissible packet sizes when matching
 endpoints
Message-ID: <dff34e08-446e-49cc-944f-7b2c50908095@rowland.harvard.edu>
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

Why would a bulk endpoint descriptor's maxpacket size ever be 0?  Are 
there any devices that have such a thing?

If we do encounter one, it will trigger a dev_notice() in config.c's 
usb_parse_endpoint().

Alan Stern

