Return-Path: <linux-usb+bounces-7482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F5870472
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 15:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99F5F286FB5
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 14:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B044087F;
	Mon,  4 Mar 2024 14:43:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E09203FB02
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709563402; cv=none; b=u/yQGAclmSQVA9HYuFklYBVF2bAh9HE9Bs0rCqzeMBbuj7A9O2OnDO1iaagbtyYNI45SBe4fiBp8m2HshJKVEBxpjoq9Z4rKbJ9kKUeog50b9Pkf7P/GKEvTzYv4d9/Q2DB1hjZeMarfkDF96jLgoJq8Lkx9SfgskAMFJVvXBJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709563402; c=relaxed/simple;
	bh=/e3YSr6EaPb16DoscPkC9vKDf8OfVAFCGz6JzX0IlCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNJhUBQs1mILve35bXshiK5rbyFel/IyK/HSdPwIw64K4rnMYWLxFa46DJnai2QsE9yvbbVfjhOB+Uph52U5QrprgM/Dyx48Hf2UQ5st42rNFeMdkyVvwQQDJDLAX8DZOMuKwP4tin40tdCAnm8MCYDJAXeQfn3sz5FdK5CYKuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 122045 invoked by uid 1000); 4 Mar 2024 09:43:12 -0500
Date: Mon, 4 Mar 2024 09:43:12 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tom Hu <huxiaoying@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v2] usb-storage: Add Brain USB3-FW to IGNORE_UAS
Message-ID: <eb015716-7695-4567-a553-0b6960cb2026@rowland.harvard.edu>
References: <20240304031656.174888-1-huxiaoying@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304031656.174888-1-huxiaoying@kylinos.cn>

On Mon, Mar 04, 2024 at 11:16:56AM +0800, Tom Hu wrote:
> The UAS mode of BRAIN USB_HDD is reported to fail to work on several
> platforms with the following error message, then after re-connecting the
> device will be offlined and not working at all.
> 
> [  622.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
>                    inflight: CMD
> [  622.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
>                    04 00 00
> [  622.536330][ 2] sd 8:0:0:0: [sda] tag#0 uas_eh_abort_handler 0 uas-tag 1
>                    inflight: CMD
> [  622.545266][ 2] sd 8:0:0:0: [sda] tag#0 CDB: Write(10) 2a 00 07 44 1a 88 00
>                    00 08 00
> 
> These disks have a broken uas implementation, the tag field of the status
> iu-s is not set properly, so we need to fall-back to usb-storage.
> 
> ---
> v2: remove junk information from patch.

No, the junk information is still present.

> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

And I have to rescind this Acked-by.

> Signed-off-by: Hu Xiaoying <huxiaoying@kylinos.cn>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1f8c9b16a0fb..98b7ff2c76ba 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -83,6 +83,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
>  
> +/* Reported-by: Tom Hu <huxiaoying@kylinos.cn> */
> +UNUSUAL_DEV(0x1234, 0x1234, 0x0000, 0x9999,

The junk information is the "0x1234, 0x1234" values.  And if you try
removing it from the patch, you'll find that the patch doesn't work.

> +		"Brain",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),

Fortunately you can get the same effect by setting a module parameter 
for usb-storage.  For example, in /etc/modprobe.d/brain.conf:

# Brain USB HDD doesn't work in UAS mode (tag field not set properly)
options usb_storage quirks=1234:1234:u

Alan Stern

