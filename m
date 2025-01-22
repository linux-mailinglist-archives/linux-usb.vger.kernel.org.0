Return-Path: <linux-usb+bounces-19624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836CA19162
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9942188C6BD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 12:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40303212B1D;
	Wed, 22 Jan 2025 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="keUwydZm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D06320FA96;
	Wed, 22 Jan 2025 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549019; cv=none; b=PQ83D5pZseIHxxoO93FNgIFkKVCbJadmg3Nr6X2y2SrE5sX3P+O2teYnvBGXPKbbfBrNK6SC8yGT8KvqKMoaDBE+9jHFOrZMry5I/UDa3Nohpw1uEwRd7zK1j8dMDtdEiyOODevfmWKmTCsqFNIKCGjzSUht6KBJkd+Zz0+TZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549019; c=relaxed/simple;
	bh=vWLceCUDe4c8LpdMa/rW445wYP1vIZ2yuc53Xxuc7is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDp052nKeXKU7KD8Un2+Z+jYTFnr3+qWWPv6POwXBc98kLVPbkjR0m35rPaejkqw7whQBh/GKFE58GMeAol5luemOOquWGTgoutfKJ6IDXVa86oeYQYIaHS5+TFhoPKrEzx6AMAl8Wgmp07ctLyVdPV2iU0zh3qWi6cV1WkQ8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=keUwydZm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7656AC4CED6;
	Wed, 22 Jan 2025 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737549018;
	bh=vWLceCUDe4c8LpdMa/rW445wYP1vIZ2yuc53Xxuc7is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keUwydZmO0b9YgB5uhjg4M+RLFwtG/mCpqBfq5VOv/AT5C4356s2AvDTjAX1wnYn3
	 3k9K+zObeveOt/lnRp2sRid1pTn6rO2lGyutfc9wAwBuiQJhDxmKpBu2bboxEDWWSV
	 P8SJv60jEM5OL8r5AiAFYpqAzsUW22juE7FeKeBQ=
Date: Wed, 22 Jan 2025 13:30:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	sergei.shtylyov@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
Subject: Re: [PATCH v2] USB: usbip: fix null-ptr-deref in status_show_vhci()
Message-ID: <2025012202-crabgrass-scribble-ae2c@gregkh>
References: <20250122121529.15421-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122121529.15421-1-qasdev00@gmail.com>

On Wed, Jan 22, 2025 at 12:15:29PM +0000, Qasim Ijaz wrote:
> If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
> the error path calls usb_remove_hcd() and also sets 
> pdev->dev.driver_data to NULL.
> 
> Consequently, any subsequent call to platform_get_drvdata(pdev) 
> (which returns pdev->dev.driver_data) may yield NULL, causing a 
> crash if that pointer is dereferenced.
> 
> Fix this by adding a sanity check to ensure "hcd" is non-NULL
> before proceeding with further operations.
> 
> Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
> Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/usb/usbip/vhci_sysfs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> index d5865460e82d..d4a1aa6d06b2 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -76,6 +76,9 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
>  	}
>  
>  	hcd = platform_get_drvdata(pdev);
> +	if (!hcd)
> +		return 0;
> +
>  	vhci_hcd = hcd_to_vhci_hcd(hcd);
>  	vhci = vhci_hcd->vhci;
>  
> -- 
> 2.39.5
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

