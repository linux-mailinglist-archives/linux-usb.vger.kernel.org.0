Return-Path: <linux-usb+bounces-14039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2495DF3D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 19:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D68A91F21CB7
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 17:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA31247A6A;
	Sat, 24 Aug 2024 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="spzgzSOm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15380B
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724521252; cv=none; b=jCfUS8MMOBrYJnqm2yR1r5+NmEnbZ9stmTeS1pA0+t6QSPw/NQx2ku1wumJpsKjl6Fw7g+GjQfWaip/Fb/PVtppEZKZcDJiXt9LDSNJzGMNfwNQj/ag9LDAfBoies9+Z1TkBHQInV44QOGjBpIyfkC2sDaXjFPJ/Ur7SYN+56bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724521252; c=relaxed/simple;
	bh=TVVuq04htXBhj++FDTlOTJ9GMgp5AAJKu+47FLdvy5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kw9F2khd1lCDGBGA8XbWXG+zDWJlc50I6h9CCNi0kuWnhN16npaq9RAR652ccJ4AwZ+0Na0BRm66UWI5/NaAIVErmBKah8ZiUCfov479V2iEnfNu68f84T021DgNurqFrRSCWtL9iwjwH5uiiIUcIngQSL7xxUnVSpqQpL/0h7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de; spf=pass smtp.mailfrom=arcor.de; dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b=spzgzSOm; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1724520806;
	bh=kG0jHjfRBcybVVbXcH7NXvzrp0oLEvljze+BIAZei9Q=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 In-Reply-To:From;
	b=spzgzSOmZB1CvAGhYnZyO0zyo1De5U8pw5PFwhqsZ8z7aaNUUzKyU+A6OOcepoGx/
	 tfgfqwJAcg5jqfVR6a/mMJZoPFRnY3aylSl4E5+LCQ95MMGexmZpxERZGh42zMyeqG
	 xCS9SlUzk5I/49n3WTykVWsTegb6NV/QcHEXAuak=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4WrkYf0kLsz1yR7;
	Sat, 24 Aug 2024 17:33:26 +0000 (UTC)
Received: from arcor.de (p57a23853.dip0.t-ipconnect.de [87.162.56.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4WrkYR42SHz90r8;
	Sat, 24 Aug 2024 17:33:12 +0000 (UTC)
Date: Sat, 24 Aug 2024 19:33:05 +0200
From: Reinhard Speyerer <rspmn@arcor.de>
To: alon.barlev@gmail.com
Cc: linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] USB: serial: qcserial: add support for Sierra Wireless
 EM7511
Message-ID: <ZsoZMVlT2hfr3qx_@arcor.de>
References: <20240823183553.2288-1-alon.barlev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823183553.2288-1-alon.barlev@gmail.com>
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1464
X-purgate-ID: 155817::1724520801-4A7FB44E-22CA2892/0/0

On Fri, Aug 23, 2024 at 09:35:53PM +0300, alon.barlev@gmail.com wrote:
> From: Alon Bar-Lev <alon.barlev@gmail.com>
> 
> Add support for Sierra Wireless EM7511 0x90b0/0x90b1 compositions.
> 
> Signed-off-by: Alon Bar-Lev <alon.barlev@gmail.com>
> ---
>  drivers/usb/serial/qcserial.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index 703a9c563557..4e19536a603c 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -165,6 +165,8 @@ static const struct usb_device_id id_table[] = {
>  	{DEVICE_SWI(0x1199, 0x907b)},	/* Sierra Wireless EM74xx */
>  	{DEVICE_SWI(0x1199, 0x9090)},	/* Sierra Wireless EM7565 QDL */
>  	{DEVICE_SWI(0x1199, 0x9091)},	/* Sierra Wireless EM7565 */
> +	{DEVICE_SWI(0x1199, 0x90b0)},	/* Sierra Wireless EM7511 QDL */
> +	{DEVICE_SWI(0x1199, 0x90b1)},	/* Sierra Wireless EM7511 */

Hi Alon,

the interface layout for the DEVICE_SWI(0x1199, 0x90b1) entry from your patch
disagrees with the usb-devices output from
https://forum.sierrawireless.com/t/em7565-1199-90b1-usbx-qcserial-issue-ubuntu-20-04-mbpl-driver-fail-to-compile/26361
and the Sierra Wireless MBPL_DRIVER_R27_ENG2-usb-src.tar.gz driver attached
to this thread https://forum.sierrawireless.com/t/driver-make-error/30702 .

As a consequence the DIAG interface would not be supported by the mainline
Linux kernel.

Regards,
Reinhard

