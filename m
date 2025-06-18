Return-Path: <linux-usb+bounces-24883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E8ADED28
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25BE6189330C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BCA72E2651;
	Wed, 18 Jun 2025 12:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1sYAmuO9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CE2E3AE7
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251537; cv=none; b=Kmfcoi+GyXnuGBtiERq5xq9JOi+vlBYcza3opaFezNIdO8YHo2D9YqYwYFvg0oVktZ7BFpCmbw0gJE8xdTFLVyZzm61LHed6oxnnOXLYBRZRD8zJJ1stTnRpP6YyxgGYdHwGGIvMz7FSUAsCqiqPAM2O3VYPwux1mtfasPmdmRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251537; c=relaxed/simple;
	bh=lkmylJBdl4mOw5yUPl3JSYo2WSEISIeqi1EVEl87jfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+IjM7Qg1NtAwCYpYmcCiYy36yFM1P0fgYsrUcQRz/w6GSIehKL+EackCgMXVFUtLPMS/zWwb7s3rbYW9jPzSyAysOOMtkR1pdNmGJLFcxbnUHKGdvUniI+wAgTPbr6rlC+Q0J9XkkfPScrWEl8JlWh8ojkPz2GZicDDsf0DUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1sYAmuO9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9BCC4CEE7;
	Wed, 18 Jun 2025 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750251536;
	bh=lkmylJBdl4mOw5yUPl3JSYo2WSEISIeqi1EVEl87jfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1sYAmuO9JCyvqB/vKjpfn/9mnGvbpGGSb1gFuhUrfJOqdCU+oPhGwh4GSZZWFNyrP
	 NWk4YsiaLPNGFinQujUjnzjYJsJ40O9a866rcdDLx7+QsqQz954ps5rLDHIZgl4UNK
	 cPGAhSLuCtkdl2MNBaWXdLwwvZwHb+06SFAtMjCo=
Date: Wed, 18 Jun 2025 14:58:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Subject: Re: [PATCH] USB: serial: pl2303: add PL2303G GPIO_A and GPIO_B
 functions
Message-ID: <2025061801-popcorn-xbox-9f5f@gregkh>
References: <20250618123513.12-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618123513.12-1-charlesyeh522@gmail.com>

On Wed, Jun 18, 2025 at 08:35:13PM +0800, Charles Yeh wrote:
> PL2303G (TYPE_HXN) series ICs: PL2303GC, PL2303GS, PL2303GT, PL2303GR,.. etc.
> 
> For example:
> PL2303GC can provide up to 16 GPIO (general purpose input/output) signals.
> they are composed of GPIO_A0~A7 and GPIO_B0~B7 respectively.
> 
> In addition to the original UART functions such as Tx, Rx, RTS, CTS, etc.,
> users can also use GPIO to implement certain applications,
> such as turning on/off the LED power.
> 
> Users can download the PL2303G Linux GPIO app: PL2303G_Linux_GPIO_Test.c
> from the Prolific website.
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
>  drivers/usb/serial/pl2303.c | 182 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 182 insertions(+)
> 
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 22579d0d8ab8..be7e695bea60 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -175,6 +175,37 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define PL2303_HXN_FLOWCTRL_RTS_CTS	0x18
>  #define PL2303_HXN_FLOWCTRL_XON_XOFF	0x0c
>  
> +
> +struct PL2303G_GPIO {

Didn't checkpatch complain about this?  Linux structures are all
lowercase.

> +	u8 GP_Branch;
> +	u8 Number;
> +	u8 Value;

Same here, always use checkpatch.pl on your changes before sending them
out to catch basic coding style issues please.

> +};
> +
> +
> +#define GPIO_AB_CONTROL_MODE		_IOW(0x81, 10, struct PL2303G_GPIO)
> +#define GPIO_AB_OUTPUT_MODE		_IOW(0x81, 11, struct PL2303G_GPIO)
> +#define GPIO_AB_SET_VALUE		_IOW(0x81, 12, struct PL2303G_GPIO)
> +#define GPIO_AB_GET_VALUE		_IOR(0x81, 13, struct PL2303G_GPIO)

Why are you adding custom ioctls for just this driver?

And where is the user/kernel api definition of this so that userspace
could know about it properly?  You can't bury it in a driver like this.

And where did 0x81 and the other numbers come from?

Also, the structure here will not work in the user/kernel api at all,
always use the proper user/kernel data structures if you are going to do
this.

But overall, no, don't add a new user/kernel api for gpio devices, we
have at least 2 already, please don't add another one.  What is wrong
with the current ones?

> +	switch (cmd) {
> +	case TIOCGSERIAL:
> +		memset(&ser, 0, sizeof(ser));
> +		ser.type = PORT_16654;
> +		ser.line = port->minor;
> +		ser.port = port->port_number;
> +		ser.baud_base = 460800;

Are you sure this baud_base is correct?

thanks,

greg k-h

