Return-Path: <linux-usb+bounces-35458-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OUyMCjrw2kAvAQAu9opvQ
	(envelope-from <linux-usb+bounces-35458-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 15:03:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E963265A6
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 15:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B24301B737
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 13:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C798C2494D8;
	Wed, 25 Mar 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XfGZREpn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5354323909F
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445859; cv=none; b=ULqUESzPM+MvMFR/9HVSe3mWbQvwBrgwXW8vPFW6keMH4gsCPgB3JK4RaStUmmQO0D2Rb3tXWbwg4tseXWQ8vqps6kERLw5QdZeo9I/SWdXGFfjsy6IK5k+ysI9ROVv+c30J0KzM8N6A5OWKFdwOxM4OKwdk02+qxqiAAfIVxKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445859; c=relaxed/simple;
	bh=jeGMxZYHPRsnUPciISrOyWUVvNUQNKfn5LsVBvkXoOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GihN4flOxPrNfE+/xCkJlfsK3WznUkGjqud/jPgggQKnmBafhXYdQmgpMt5IKvtpL4kVAAP5tge6W+bSmtMLgjE7ieQ+rSsoWRv2+afsSCfbXhgThFfpOawWKsR/Leb/en6AwYNxCJe94cXbMNjWjCg3d7r9NAPzJerk+OslS6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XfGZREpn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595A0C2BCB2;
	Wed, 25 Mar 2026 13:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774445858;
	bh=jeGMxZYHPRsnUPciISrOyWUVvNUQNKfn5LsVBvkXoOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XfGZREpn+DMkkGc1aA/VeW+TRT4OMTJSPIq70qUX/9Gv+FkOJdxQb39Fy1cLiFVym
	 iW8z5xx9nnUaP8AQkPA2vLUHOlS4sCT54f2YP4uQaaz5QggMygNe9K38VAcgHEFLwT
	 NobsJAdLAPyL/p6ztx6q2/hkekry3MvORvpOUeIM=
Date: Wed, 25 Mar 2026 14:37:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <2026032549-zodiac-navigator-23ac@gregkh>
References: <20260325120123.1989-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325120123.1989-1-charlesyeh522@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35458-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,intel.com:email]
X-Rspamd-Queue-Id: 55E963265A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 08:01:23PM +0800, Charles Yeh wrote:
> Add support for the PL256X (TYPE_MP) device by adding its PID.
> Also fix an unused variable warning in pl2303_update_reg() reported
> by the kernel test robot.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603250523.9ktgw2Ju-lkp@intel.com/
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> v2:
>  - Remove unused 'struct device *dev' variable in pl2303_update_reg()
>    to fix build warning.
> ---
>  drivers/usb/serial/pl2303.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index e5bbda1d63b3..67b78d2fcc92 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -347,7 +347,6 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
>  static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
>  {
>  	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
> -	struct device *dev = &serial->interface->dev;
>  	int ret = 0;
>  	u8 *buf;
>  
> -- 
> 2.51.0
> 

Please don't add a bug and then fix it up in a later patch, just redo
the original patch and send it as a v2 as the documentation describes
how to do.

thanks,

greg k-h

