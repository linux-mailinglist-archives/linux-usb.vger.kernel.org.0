Return-Path: <linux-usb+bounces-13730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A82D8958623
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 13:52:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CD4A1F23124
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 11:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B4B189F5D;
	Tue, 20 Aug 2024 11:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lftDUej8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9802418E77A;
	Tue, 20 Aug 2024 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154713; cv=none; b=OEJK6WNXDaMCsRG6y5DF7ckaGmTcdVYgSteYgNTKbaqQgHeJBdlnmy/w0nAw3m4gW417so6OT8CrrNYenW3jfSYnmYYSeOr8h3rM836l0y29NK7sBAnzkNJfRQwrWdSM/Jx4A1VRSuOPZcntjzDQY3Mn0oAwjUiQp7zAZ6FB4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154713; c=relaxed/simple;
	bh=uXYnqERWtwmLH07CK1Re0yqHBQav8D/twadyItlJGaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h86M3KxegnaWlUZ/8QIkxhar2AA3r/6SEA/3y06am6WxM4tmqmqY0aahbnDat84JOZdtV/lTykPxnjRwNyPt/Axp+oBQlDWBLaPujvfqISyzu5GReGTZsQg2GmUGgVNwtI4FoCobdRE8S6Hs0JCieO+xyR0kzCKNrQKtZ23teUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lftDUej8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D7AC4AF0F;
	Tue, 20 Aug 2024 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724154713;
	bh=uXYnqERWtwmLH07CK1Re0yqHBQav8D/twadyItlJGaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lftDUej8gD5FKvHkStP0ksxq/BYMOPf3gGRVOKhO7iNDwpUP48PKbvx0HPh0zb0BO
	 U2QvlusihgOmRc9K5Hb8iT90MIblUabvYTN4b/ucXZi2s/gqdzJsoZQU1CP5KdtCPH
	 7WA5+FTM7KkMrgewVqCEdk7H0/zvNJHmmS6MvEY8=
Date: Tue, 20 Aug 2024 13:51:50 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: "quic_prashk@quicinc.com" <quic_prashk@quicinc.com>,
	"quic_jjohnson@quicinc.com" <quic_jjohnson@quicinc.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"opensource.kernel" <opensource.kernel@vivo.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v1] usb: gadget:
 u_serial: check Null pointer in EP callback
Message-ID: <2024082038-tidbit-broken-14b6@gregkh>
References: <PUZPR06MB622403392E76A64749D068F6D28D2@PUZPR06MB6224.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PUZPR06MB622403392E76A64749D068F6D28D2@PUZPR06MB6224.apcprd06.prod.outlook.com>

On Tue, Aug 20, 2024 at 09:13:36AM +0000, 胡连勤 wrote:
> Hello linux community expert:
> 
> >> Added null pointer check to avoid system crash.
> >> 
> >> Unable to handle kernel NULL pointer dereference at
> >> virtual address 00000000000001a8
> >> pc : gs_read_complete+0x58/0x240
> >> lr : usb_gadget_giveback_request+0x40/0x160
> >> sp : ffffffc00f1539c0
> >> x29: ffffffc00f1539c0 x28: ffffff8002a30000 x27: 0000000000000000
> >> x26: ffffff8002a30000 x25: 0000000000000000 x24: ffffff8002a30000
> >> x23: ffffff8002ff9a70 x22: ffffff898e7a7b00 x21: ffffff803c9af9d8
> >> x20: ffffff898e7a7b00 x19: 00000000000001a8 x18: ffffffc0099fd098
> >> x17: 0000000000001000 x16: 0000000080000000 x15: 0000000ac1200000
> >> x14: 0000000000000003 x13: 000000000000d5e8 x12: 0000000355c314ac
> >> x11: 0000000000000015 x10: 0000000000000012 x9 : 0000000000000008
> >> x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffffff887cd12000
> >> x5 : 0000000000000002 x4 : ffffffc00f9b07f0 x3 : ffffffc00f1538d0
> >> x2 : 0000000000000001 x1 : 0000000000000000 x0 : 00000000000001a8
> >> Call trace:
> >> gs_read_complete+0x58/0x240
> >> usb_gadget_giveback_request+0x40/0x160
> >> dwc3_remove_requests+0x170/0x484
> >> dwc3_ep0_out_start+0xb0/0x1d4
> >> __dwc3_gadget_start+0x25c/0x720
> >> kretprobe_trampoline.cfi_jt+0x0/0x8
> >> kretprobe_trampoline.cfi_jt+0x0/0x8
> >> udc_bind_to_driver+0x1d8/0x300
> >> usb_gadget_probe_driver+0xa8/0x1dc
> >> gadget_dev_desc_UDC_store+0x13c/0x188
> >> configfs_write_iter+0x160/0x1f4
> >> vfs_write+0x2d0/0x40c
> >> ksys_write+0x7c/0xf0
> >> __arm64_sys_write+0x20/0x30
> >> invoke_syscall+0x60/0x150
> >> el0_svc_common+0x8c/0xf8
> >> do_el0_svc+0x28/0xa0
> >> el0_svc+0x24/0x84
> >> el0t_64_sync_handler+0x88/0xec
> >> el0t_64_sync+0x1b4/0x1b8
> >> Code: aa1f03e1 aa1303e0 52800022 2a0103e8 (88e87e62)
> >> ---[ end trace 938847327a739172 ]---
> >> Kernel panic - not syncing: Oops: Fatal exception
> >> 
> >> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> >> ---
> >> v1:
> >   - Optimize code comments, delete log printing
> 
> >Also, same comment as before, what:
> >  - causes port to be NULL
>    When unbind, the gser_unbind function call gserial_disconnect to set gser->ioport = NULL, and struct gs_port *port = gser->ioport, resulting in port being NULL.
>    It seems that there is a potential competition between the gs_read_complete function and the gserial_disconnect function.

Then fix that properly please.


