Return-Path: <linux-usb+bounces-36740-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK4BJE4Z82nNxAEAu9opvQ
	(envelope-from <linux-usb+bounces-36740-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 10:56:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA049F85E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 10:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 969D73009FBD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 08:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD71534EF1F;
	Thu, 30 Apr 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHlIKIaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581AC32BF24;
	Thu, 30 Apr 2026 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777539230; cv=none; b=nzr37FqnKVlYds8BZa40mtdOoDiTthn8KAWjrbp+laqtMGRcx0BLLlpzN4hnFG2PMOpkzZ65POFUvByRMHoZWvKI8wGQKG1fuHAOF+KyHXZVR+n4yeLTlYKp+I2bPUMb78M5gYihhQsYt3T7z9H7ix/ZDOaYD4XNe1nLAEmPDUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777539230; c=relaxed/simple;
	bh=U68PvlB+91PF0juAyjKVAtvKorNw75LTb/h4DOMfdcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWpbYU/RkrUYSgJOZr6/mVLW4iP3aAd7z/nZdGCMrpuu+UTB5EJoqphYAJBKmBJU5p01u3b9EOvHSVTT64U3aXkLDvaaPr84K7nypRqpPp6PzRzu8uhkh8WK7iPKF6jMTls0qyS1moqngtNP4S49r0GnS6KzbTLnW4GMUpL2uYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHlIKIaN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE69C2BCB3;
	Thu, 30 Apr 2026 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777539230;
	bh=U68PvlB+91PF0juAyjKVAtvKorNw75LTb/h4DOMfdcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AHlIKIaNFTgrR3t5kylp1yJ3SnVgwP5DCu1KTqwv3mfUy0z0573CgxQoaqsQjmutl
	 f6rC+ee6/JmfUJs5FNOjjrc3lPEoA11FtystjW+2E1Eou7Ig8qVO8gt2TGwUx8iuu9
	 bP+ho1MNXPmebFUQwsQv0kmdTSj+Nt55Fv9hXiybHDaTqjySEtRHNR3h8Uy2wEfl+w
	 pjA5Xg/g80ME08eKv4S1m8OC3P7ZRe9SuH+munjcX4/uw69MGSToxlHNv8WRx5R18w
	 SXyduCOkDQYQSpBN3zGhgnRBSjINeYsmNU2QUDw1rSduGQ3jHe+y5RMSQAgHI577nj
	 UoUn2VjACgrrA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIN9X-00000000vca-3P2D;
	Thu, 30 Apr 2026 10:53:47 +0200
Date: Thu, 30 Apr 2026 10:53:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Jack Wu <wojackbb@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: qcserial: add new usb-id for Dell Wireless
 DW5826e-m
Message-ID: <afMYm8XKfgJ5LPWZ@hovoldconsulting.com>
References: <20260427063502.2314843-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427063502.2314843-1-jackbb_wu@compal.com>
X-Rspamd-Queue-Id: E4EA049F85E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36740-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid,compal.com:email]

On Mon, Apr 27, 2026 at 02:35:02PM +0800, Jack Wu wrote:
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea & 0x413c:0x81eb.
> 
> It is 0x413c:0x81ea
> T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=110 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81ea Rev= 5.04
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=qcserial
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms

> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

This devices uses MBIM instead of QMI (and a different interface number)
so the comment for QCSERIAL_SWI may need to be updated.

Is this a rebranded Sierra Wireless device as well?
 
> It is 0x413c:0x81eb
> T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=109 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81eb Rev= 0.00
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=qcserial
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>

The address here does not match your From address.

> ---
>  drivers/usb/serial/qcserial.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index 1a930dc668e4..7322a984509a 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -188,7 +188,8 @@ static const struct usb_device_id id_table[] = {
>  	{DEVICE_SWI(0x413c, 0x81d2)},   /* Dell Wireless 5818 */
>  	{DEVICE_SWI(0x413c, 0x8217)},	/* Dell Wireless DW5826e */
>  	{DEVICE_SWI(0x413c, 0x8218)},	/* Dell Wireless DW5826e QDL */
> -
> +	{DEVICE_SWI(0x413c, 0x81ea)},	/* Dell Wireless DW5826e-m */
> +	{DEVICE_SWI(0x413c, 0x81eb)},	/* Dell Wireless DW5826e-m QDL */
>  	/* Huawei devices */

Please keep the entries sorted by PID and keep the newline separator
before the Huawei devices.

>  	{DEVICE_HWI(0x03f0, 0x581d)},	/* HP lt4112 LTE/HSPA+ Gobi 4G Modem (Huawei me906e) */

Johan

