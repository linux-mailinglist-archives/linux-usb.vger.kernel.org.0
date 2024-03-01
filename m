Return-Path: <linux-usb+bounces-7398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C008186E675
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 17:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71AA128AEB9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2583A1A7;
	Fri,  1 Mar 2024 16:53:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C889039AE6
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 16:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709312035; cv=none; b=e0ycjxoPXp1ARlgTx4uhecwQEvuXHceyA/Symz65f8LTV7lqnBmAJPcA9nm9Ltlr0qXWlA72cyOIKwxScnu/HCLb7kITYcESyIi/doy/tYQzHGXRNiLRe8IV+NsayGWUTg5oVdseZ5/NZg9Kqbleqm99IJL46fG1haAyQv/fhO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709312035; c=relaxed/simple;
	bh=29SVKj6G+k0fROpoD+ltEVOKHLMNDqiZ/KNCqWGiZI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/owANEblCgtBEedGoNwb9WQ9KF3ShVBmvgww4cA3Eo0yU6eWE+E/0vKe8jCLHSzeCeRoqSz3tjPWZ1zFb291DSr9ZMPOjDAXh6v+Wjpqi3EWMvLirt105KtlgVVttOPgNpB/ftvBVGO550uMxsb3SFtKCFESlkaG9EoYaBRqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 39476 invoked by uid 1000); 1 Mar 2024 11:53:45 -0500
Date: Fri, 1 Mar 2024 11:53:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tom Hu <huxiaoying@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] usb-storage: Add Brain USB3-FW to IGNORE_UAS
Message-ID: <a960f1c2-a858-498e-a0cf-4c15d74487d5@rowland.harvard.edu>
References: <20240226075936.1744353-1-huxiaoying@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226075936.1744353-1-huxiaoying@kylinos.cn>

On Mon, Feb 26, 2024 at 03:59:36PM +0800, Tom Hu wrote:
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
> Signed-off-by: Hu Xiaoying <huxiaoying@kylinos.cn>
> 1

What is that 1?

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

The vendor and product ID values have a suspicious look, but they appear 
to be genuine.

> +		"Brain",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> -- 
> 2.25.1

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

