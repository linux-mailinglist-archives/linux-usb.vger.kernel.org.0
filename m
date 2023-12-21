Return-Path: <linux-usb+bounces-4482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 899EA81B01A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 09:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 449FC282A8A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 08:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6C7171D3;
	Thu, 21 Dec 2023 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpJMRLXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544AB171C4
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 08:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E7FC433C8;
	Thu, 21 Dec 2023 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703146492;
	bh=XMPL8d3WusmpgbGVbFhpN7SrqKyUlyr2xc75iH/5V4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RpJMRLXeTcFoJYvKRFr7krTwDot2100GHWtGPsvezImm/15rB6JMzGyFZDT6CbC7E
	 1X1xtO5mKkjfH3UCtSgDBag8m5NYRfPRvH6MdU7DFqiE0eNmPkcp2ByQBEtQ85VTGl
	 9bJi+5Qnn37XBW2OmXdIdQ/yEO0ILi/UOHMbrID/RDLv7ifiQYo4L462onMhUDx5QZ
	 JMwp7rCi+BtMGQ4luaoLYV6DzrNPex7RjUY/MLjqOUYaGOkZUQ8r+aDyRnWB3bUL+G
	 rKHXf7/8DZfVAbw8RJasiyA73KS55x4K3yrFmdwsLYZfiSedA9nXY968C7wROeBKqc
	 in7OGk9uYpUeA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rGECi-00033I-2T;
	Thu, 21 Dec 2023 09:14:52 +0100
Date: Thu, 21 Dec 2023 09:14:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Mark Glover <mark.glover@actisense.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ftdi_sio: Actisense PIDs constant Names
Message-ID: <ZYPz_MS9BDEJVx0S@hovoldconsulting.com>
References: <AS8PR10MB4424F3366DA20492BA9B1605FABAA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZWB5VtdzyGsROpuO@hovoldconsulting.com>
 <AS8PR10MB442424BD43EE4AECDDC93F1EFA8EA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZXq4A-Uht67KcJNV@hovoldconsulting.com>
 <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <AS8PR10MB4424408E2BFBD055150629C9FA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR10MB4424408E2BFBD055150629C9FA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>

On Wed, Dec 20, 2023 at 01:57:40PM +0000, Mark Glover wrote:
> This changes the constant names for unused USB PIDs (product identifiers)
> to reflect the new products now using the PIDs.

Commit messages should use imperative mode (see the process
documentation) so I changed this to:

	Update the constant names for unused USB PIDs (product
	identifiers) to reflect the new products now using the PIDs.

and similar in the commit summary (Subject) where I also added the
missing common prefix ("USB: serial: ").

And when revising patches you should indicate that in Subject (e.g.
"[PATCH v2]") and include a short changelog below the '---' line (which
is missing below, but goes below the SoB).

Next time, try using git format-patch to generate the patch.

> Signed-off-by: Mark Glover <mark.glover@actisense.com>
> 
> diff -urN linux-6.6.4/drivers/usb/serial/ftdi_sio.c linux/drivers/usb/serial/ftdi_sio.c
> --- linux-6.6.4/drivers/usb/serial/ftdi_sio.c	2023-12-03 06:33:10.000000000 +0000
> +++ linux/drivers/usb/serial/ftdi_sio.c	2023-12-12 10:39:51.157327241 +0000
> @@ -1033,9 +1033,9 @@
>  	{ USB_DEVICE(FTDI_VID, ACTISENSE_USG_PID) },
>  	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGT_PID) },
>  	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGW_PID) },
> -	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AC_PID) },
> -	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AD_PID) },
> -	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AE_PID) },
> +	{ USB_DEVICE(FTDI_VID, ACTISENSE_UID_PID) },
> +	{ USB_DEVICE(FTDI_VID, ACTISENSE_USA_PID) },
> +	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGX_PID) },
>  	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AF_PID) },
>  	{ USB_DEVICE(FTDI_VID, CHETCO_SEAGAUGE_PID) },
>  	{ USB_DEVICE(FTDI_VID, CHETCO_SEASWITCH_PID) }, 

For some reason that I was not able to determine, this hunk did not
apply to mainline despite that there hasn't really been any changes to
the surrounding code since 6.6.4 (which you used to generate this
patch).

I fixed it up manually this time. End result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-linus&id=513d88a88e0203188a38f4647dd08170aebd85df

Johan

