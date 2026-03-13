Return-Path: <linux-usb+bounces-34728-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJnHF9zLs2n2awAAu9opvQ
	(envelope-from <linux-usb+bounces-34728-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:33:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D948827FB49
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365AB3082A5A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7417E382F30;
	Fri, 13 Mar 2026 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niLQGoi8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0329C38239B;
	Fri, 13 Mar 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390655; cv=none; b=ooeMZqyTtaqsmrA24wgxV8GGZe8ca8fAVgMZd3W0FbuP0qFQYQMfKURlUyyvCtP9aURxpMyujZUvuXKrEVHyYYkqlI7EZGfsOjujT/HOd7XfpxDskt8guNnpsiKvV7HJEq4UhInBZzBX64aXxRz8imfSFFkwrjv+CViU3P6eHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390655; c=relaxed/simple;
	bh=Bm9fXJ8TEU0hUHPje8LmszjI/rEyDl9bcylkgPK+Nx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsOwrEckIIe9+91i8NlMeYtIiFZzTRSUt7nfxXobLc58cdkubH9fiFdXw79OweJDKoDtcr4vL10XvXm8abV/BXhNV+a2ltXkJflSPjuAgcRW0QkXwuirmxPH4nc0JSP+n05XtuNF6vOEkCjEwCkgI2JPphXWx4hY9Nj5w+3ivms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niLQGoi8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6AFC19421;
	Fri, 13 Mar 2026 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390654;
	bh=Bm9fXJ8TEU0hUHPje8LmszjI/rEyDl9bcylkgPK+Nx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niLQGoi8YpjUeq2GrbGuvvdLyJzg3iCWamjGr2A7wwPq9Qx7WZHRdo1GaQ05++++f
	 bMsICC34HOxLKgLtrkoNWlC8LHAmzF9FkVp5dBv6P/KK2FUh8GKQtARbO8uWHY0zxY
	 i/PLAECJkEHrAZY7lQ/nSGud+L/d/nujOxMdVJ9tOWorYT75C5hku8BDlkyB2zUNuF
	 dCq371OI2ZGQFdNHllRCfKvIyIpJTtcLaKsBCpKNTlp9xnviNL9CpU8VBzdv8PclDQ
	 HrVfKAYnG29VtXTkD8y+SR+z0PDQV1Pycwh/IOZApH+PAbIeJRf6qe+244QezrqgLJ
	 Bw1Uo3hJf/Z2w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0xv0-000000008Fw-1OVb;
	Fri, 13 Mar 2026 09:30:50 +0100
Date: Fri, 13 Mar 2026 09:30:50 +0100
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] usb: serial: add support for Rolling Wireless RW135R-GL
 (33f8:1003)
Message-ID: <abPLOj_6FSN4GgDF@hovoldconsulting.com>
References: <20260313023606.177760-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313023606.177760-1-zwq2226404116@163.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34728-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fibocom.com:email]
X-Rspamd-Queue-Id: D948827FB49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 10:36:05AM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
> which is used in laptop debug cards with MBIM interface for
> Linux/Chrome OS. The device supports mbim, diag, adb and AT command
> functionalities.
> 
> Here are the outputs of usb-devices:
> T:  Bus=04 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=33f8 ProdID=1003 Rev=05.15
> S:  Manufacturer=Rolling Wireless S.a.r.l.
> S:  Product=Rolling RW135R-GL Module
> S:  SerialNumber=12345678
> C:  #Ifs= 3 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=40 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

Can you include the other configurations as well? This one only as three
interfaces, which doesn't explain why you need to blacklist interface 5
(or which interfaces handle diag, adb, etc).

A few more comments below.

> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---

This is an updated patch which should be reflected in the patch summary
(Subject) (e.g. "[PATCH v2]: USB: ...").

Also include a short changelog here under the --- line when sending
updated patches.

>  drivers/usb/serial/option.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e349ed66d2ac..abeeb7c66977 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2449,6 +2449,9 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(4) | RSVD(5) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0115, 0xff),			/* Rolling RW135-GL (laptop MBIM) */
>  	  .driver_info = RSVD(5) },
> +	/* Rolling RW135R-GL (laptop MBIM) */
> +	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),
> +	  .driver_info = RSVD(5) },

Looks like you missed my comments about this entry not being in VID/PID
sort order, and that the comment should go after the entry (like the
other entries).

>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a2, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a3, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a4, 0xff),			/* Rolling RW101-GL (laptop MBIM) */

Johan

