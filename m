Return-Path: <linux-usb+bounces-19395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B9A1378E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 11:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9FC3A8178
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 10:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23461E86E;
	Thu, 16 Jan 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pLSh52pl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193EF1A0731;
	Thu, 16 Jan 2025 10:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022375; cv=none; b=W6wyrdbYlAbKerJLhU6lZQKdv12zNlXEC35QYOyKKG/IuWy6iNt7GetjVuqLE06fOMka+i9UviGYwTRyEmGwAat4DNIfMDFVXk8BOXQeFDbMAqlnR/2wvbxDqd+AVF+4A8q5GFMTHcSfxqpvnEM8ZjzpDofm/r4hx+s6wr3x3Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022375; c=relaxed/simple;
	bh=9/F2fzTv3GvyVaO1EkpYKWIhZ7mBJutyTAbFFb9oDEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxYMqyOGNQiMQ2fDtksIopFW9hjTDqMl9VvSFZbSwhqp80t7n5g55vc6r4QcNallVTnG0D8dixYxNw8g2H2HjZzx44e+C68JlHCwyl0t7fLMH86q+5YSMzfg8y9CKXylJYTWag8t9gvrBI9Ev9eexUtfPnc3lRzbhPVpDT5btIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pLSh52pl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39954C4CEDF;
	Thu, 16 Jan 2025 10:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737022374;
	bh=9/F2fzTv3GvyVaO1EkpYKWIhZ7mBJutyTAbFFb9oDEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLSh52pln9JeevzPds/rex3x9tTey/qa67nBg6R9+n1nqkmVCCPOO0GaQ/kALNYu0
	 ZXcaoFkLK7k7CRrDRrgrA5NPudp+7Mg/gRkbnsclcoV6vjPg8ZquoaLDSfqBFIX40O
	 SkORaVpphHfiLeaT3CwmxYLYPxwQkrm/ifT6Ie/0=
Date: Thu, 16 Jan 2025 11:12:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "fengchunguo@126.com" <fengchunguo@126.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: typec: Added power_operation_mode_show type
 check when usb slowly detect
Message-ID: <2025011634-lurch-goon-d135@gregkh>
References: <1737011671-88288-1-git-send-email-fengchunguo@126.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1737011671-88288-1-git-send-email-fengchunguo@126.com>

On Thu, Jan 16, 2025 at 03:14:31PM +0800, fengchunguo@126.com wrote:
> From: Gary <fengchunguo@126.com>

Full name please.

> 
> When the type of usb inserted one un-defined power mode, only 90mA
> voltage, system panic sometime.So added the one condition for avioding it.
> 
> Reproduced:
> 1.Inserted usb cable for charging slowly.
> 2.System panic sometimes. The log:
> Unexpected kernel BRK exception at EL1
> msm-dwc3 4e00000.ssusb: DWC3 exited from low power mode
> Internal error: BRK handler: 00000000f2005512 [#1] PREEMPT SMP
> Skip md ftrace buffer dump for: 0x1609e0
> Hardware name:Qualcomm Technologies, Inc. Blair QRD (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : power_operation_mode_show+0x48/0x50
> lr : dev_attr_show+0x38/0x74
> sp : ffffffc015d83c00
> x29: ffffffc015d83c00 x28: ffffff80517212c0 x27: 000000007ffff001
> x26: 0000000000000001 x25: 0000000000000000 x24: ffffff801b9274f0
> x23: ffffff805a9f1cc0 x22: ffffffda7b7a2608 x21: ffffff8050e99000
> x20: ffffffda7c5fb5b0 x19: ffffff801b9274c8 x18: ffffffc01568d070
> x17: 00000000df43c25c x16: 00000000df43c25c x15: 0000000000000000
> x14: 0000000000000000 x13: ffffffa77aadf000 x12: ffffffda7c4a1210
> x11: ffffff8050e99000 x10: 0000000000000000 x9 : ffffffda7ae948ac
> x8 : 00000000fffffffa x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000040 x4 : 0000000000000000 x3 : 0000000000000004
> x2 : ffffff8050e99000 x1 : ffffffda7c5fb5b0 x0 : ffffff80858ca008
> Call trace:
>  power_operation_mode_show+0x48/0x50
>  dev_attr_show+0x38/0x74
>  sysfs_kf_seq_show+0xb4/0x130
>  kernfs_seq_show+0x44/0x54
>  seq_read_iter+0x158/0x4ec
>  kernfs_fop_read_iter+0x68/0x1b0
>  vfs_read+0x1d8/0x2b0
>  ksys_read+0x78/0xe8
>  __arm64_sys_read+0x1c/0x2c
>  invoke_syscall+0x58/0x11c
>  el0_svc_common+0xb4/0xf4
>  do_el0_svc+0x2c/0xb0
>  el0_svc+0x2c/0xa4
>  el0t_64_sync_handler+0x68/0xb4
>  el0t_64_sync+0x1a0/0x1a4
> Code: 93407c00 a8c17bfd f85f8e5e d65f03c0 (d42aa240)
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: BRK handler: Fatal exception
> 
> Signed-off-by: fengchunguo@126.com <fengchunguo@126.com>

This does not match above :(


> ---
>  drivers/usb/typec/class.c | 3 ++-
>  include/linux/usb/typec.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 4b3047e..22d99ce 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2163,7 +2163,8 @@ void typec_set_pwr_opmode(struct typec_port *port,
>  {
>  	struct device *partner_dev;
>  
> -	if (port->pwr_opmode == opmode)
> +	if ((port->pwr_opmode == opmode) || (opmode < TYPEC_PWR_MODE_USB)
> +			|| (opmode > TYPEC_PWR_MODE_MAX))

Please use the proper coding style :(


>  		return;
>  
>  	port->pwr_opmode = opmode;
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d616b88..3b12c46 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -71,6 +71,7 @@ enum typec_pwr_opmode {
>  	TYPEC_PWR_MODE_1_5A,
>  	TYPEC_PWR_MODE_3_0A,
>  	TYPEC_PWR_MODE_PD,
> +	TYPEC_PWR_MODE_MAX,

This is odd, you are saying we are somehow running off the end of the
list of enumerated types?  That means something else went wrong here,
not that we need to have a MAX value in the list.

thanks,

greg k-h

