Return-Path: <linux-usb+bounces-14658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2996C542
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 19:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F753B24553
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 17:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE6F1E6320;
	Wed,  4 Sep 2024 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KxDctDlA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E111E631E
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725470327; cv=none; b=W/FC+mkNyUD5tYq67DoyAqm8KY3nZOxQ/MKR8CZkKpw/l7CZN13wv+XHR6EE9k1GJjJ4Yh9lcNNnw1b5EhyGZNg/DiExab0fLG7AbW3kn5F6Zh2UoIrw83cOpjMoU4GEx1mfpSJYNFBT7joUALHg5WiB/ZglKsaWMLm6QmmzrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725470327; c=relaxed/simple;
	bh=Zu0tCPYF60yoHX9IamQ90HU71W/sQX4XgL8BEONEABE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+x/eNEIA6qvyWJOestZs2s2+YrkBBdu++N6O4wnAqSxqrWfTVcoJaVRK8XCTEHFbEA1Rp+7GnB+WawUazbaxAFYF5bEMz0nzRYjB5HbJBbTtBWHpwaXV818uJo9xbGipcRkjgAve5UAsbPIs9eP18wQmv+d4vV1rPZfUiVm0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KxDctDlA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A753C4CEC6;
	Wed,  4 Sep 2024 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725470325;
	bh=Zu0tCPYF60yoHX9IamQ90HU71W/sQX4XgL8BEONEABE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxDctDlAfjQ3+UBfKtPz1TO932U105uDtP7k/I+AeE8xBdjhE2HeOrX6++QWWmmKb
	 Hlm+nIfy0xH4YvS5tdhV3YANkuISG3DacY6tCCjYpWRNvH/e2nRSlyGqMBZLOSSGFr
	 ZZX+un/DJEeplRCCRI07m/W5+liNs/TPgzqYDt+Q=
Date: Wed, 4 Sep 2024 19:18:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
Cc: "stable@kernel.org" <stable@kernel.org>,
	"balbi@kernel.org" <balbi@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
Message-ID: <2024090424-womb-designed-fe35@gregkh>
References: <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
 <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>

On Wed, Sep 04, 2024 at 03:01:39PM +0000, Vrastil, Michal wrote:
> This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.
> 
> Fix install of WinUSB dsriver using OS descriptors.
> Without the fix the drivers is not installed correctly
> and the property 'DeviceInterfaceGUID' is missing on host side.
> 
> The original change was based on assumption that the interface number
> is in the high byte of wValue but it is in the low byte, instead.
> Unfortunately, the fix is based on MS documentation which is also wrong.
> 
> The actual USB request for OS descriptors (using USB analyzer) looks
> like:
> 
> Offset  0   1   2   3   4   5   6   7
> 0x000   C1  A1  02  00  05  00  0A  00
> 
> C1: bmRequestType (device to host, vendor, interface)
> A1: nas magic number
> 0002: wValue (2: nas interface)
> 0005: wIndex (5: get extended property i.e. nas interface GUID)
> 008E: wLength (142)
> 
> The fix was tested on Windows 10 and Windows 11.
> 
> Fixes: ec6ce70 ("usb: gadget: composite: fix OS descriptors w_value logic")
> Signed-off-by: Michal Vrastil <michal.vrastil@hidglobal.com>
> ---
>  drivers/usb/gadget/composite.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

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

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

