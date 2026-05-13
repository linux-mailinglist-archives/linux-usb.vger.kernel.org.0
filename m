Return-Path: <linux-usb+bounces-37367-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJIyNq0rBGoSFAIAu9opvQ
	(envelope-from <linux-usb+bounces-37367-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 09:43:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E6152ED84
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 09:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5E8130160FC
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 07:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DC73D6CC4;
	Wed, 13 May 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le67x6za"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0793D45ED;
	Wed, 13 May 2026 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778658213; cv=none; b=GMz6Yp2o8zqlGrqxRW7FTnrCQBKerIn9oh8e77pGs9S/PsfXTtqSo9xHXh7y9Ov57XB1NIgqJtod8+MUrtfNIBEnUgsUqiwPqqJf4SnbuZiTAmR3FdiADnGQP+e3nGYzMPyG7L9hFr5irtsRy8Y+5hU/8ArAOQ0oaJma+6ROqmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778658213; c=relaxed/simple;
	bh=drzUglZvIxou/V62gyD8sxkdKjdJVINW2Ie5vMJLhI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uof3gfXHW56wo3iT7hwR68525Dbu0NIfXJ5BjN45rrnSBEXRpmTNMFNt3RcqCR9Mwj+r+SmpKcCYRkfUvf26CtlRu5UtU53ejuqGZNJNHTYjy4L14XEfs/dZYzGgjIUfqZ0DttFIVhvMz5e+3+HlOqCeAeYmT6ifKgJ9tye3bBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le67x6za; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FC7C2BCB7;
	Wed, 13 May 2026 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658212;
	bh=drzUglZvIxou/V62gyD8sxkdKjdJVINW2Ie5vMJLhI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=le67x6zag96tMvZ1uTOMj7YnmiDHDylGRPu6dsdG9dhX+oQf7ylBRNfC8wLtPE0g4
	 nEhlSHPVZMIAr43v3ADiWoAKN9BV60atMkVhAb/G8O+P3G/z0EXayJdddw/Jv6wddT
	 mkpSQRn9fWfZb1Lw4KlcJvYhb9pjJlaSTEMJ9BEqMSD5JMA0a2M9evxswJaeurYtxb
	 ARfCD1yH4XXVlSpHmRwvh5XLkZ0DG/YEuAKMxe6yaZwQc7107Kn7fCatjfQzSu7Xnd
	 vrAmP3mu1mjZoH3ttIrGkmvk8L8eNcc3gdc0w0y1hbNQi5V/VvfauT9zGadkCj4avz
	 qfxJ5B+2wMFrQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wN4Fe-00000004J1r-3E97;
	Wed, 13 May 2026 09:43:30 +0200
Date: Wed, 13 May 2026 09:43:30 +0200
From: Johan Hovold <johan@kernel.org>
To: zwq2226404116@163.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: Re: [PATCH] [PATCH v3] USB: serial: option: add missing RSVD(5) flag
 for Rolling RW135R-GL
Message-ID: <agQrohpk-MRSZfLf@hovoldconsulting.com>
References: <20260513072035.433068-1-zwq2226404116@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513072035.433068-1-zwq2226404116@163.com>
X-Rspamd-Queue-Id: 19E6152ED84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37367-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 03:20:34PM +0800, zwq2226404116@163.com wrote:
> From: Wanquan Zhong <wanquan.zhong@fibocom.com>
> 
> The RW135R-GL MBIM interface entry added in commit before was missing
> the .driver_info = RSVD(5) flag.
> 
> Without this flag, the option driver binds to the MBIM interface
> and conflicts with the cdc_mbim driver, causing AT/MBIM communication
> failures after switching to 43 mode. This matches the handling of
> other Rolling Wireless MBIM devices.

This description still makes no sense as I pointed out before.

> - VID:PID 33f8:1003, RW135R-GL for laptop debug M.2 cards(with MBIM
> interface for /Linux/Chrome OS)
> 0x1003: mbim, diag, AT, ADB, pipe
> Here are the outputs of usb-devices:
> T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=02 Dev#=  7 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=33f8 ProdID=1003 Rev= 5.15
> S:  Manufacturer=Rolling Wireless S.a.r.l.
> S:  Product=Rolling RW135R-GL Module
> S:  SerialNumber=12345678
> C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms:
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

> Fixes: 01e8d0f74222 ("usb: serial: add support for Rolling Wireless RW135R-GL (33f8:1003)")

The description in the Fixes tag still does not match the git log (I
edited it when applying).

> Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
> ---

Please also include a short changelog here below the --- line when
revising patches.

Johan

