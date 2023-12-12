Return-Path: <linux-usb+bounces-4070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B8280F371
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 17:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FD3D281C06
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8727A228;
	Tue, 12 Dec 2023 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oJtogVEq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2B47A20E
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 16:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2C1C433C8;
	Tue, 12 Dec 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702399487;
	bh=mPG5tRlnIyTph1rIf9Itr+rz1nD1fcoRQ7koDUrwyEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJtogVEqSfuv/exqEwt1RpymjJB0q86fM3n05psaZz+Biqv3KaK3QQmWW1UaEsoEv
	 11hvqTwUb5Ba/w/f3j8OxIu8KNSIEp64EinjW3Xftyo1Q1lLGRMLPzWKkLoxu5Ru0h
	 2LyBUYd1WyVQyGmnPXeF2auKvZp4tCxRIXxHeZJw=
Date: Tue, 12 Dec 2023 17:44:43 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-usb@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: kernel warning in usb_ep_queue() during suspend/resume
Message-ID: <2023121206-ventricle-partly-63ea@gregkh>
References: <ZXiL/tXS5/xSV+aP@francesco-nb.int.toradex.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXiL/tXS5/xSV+aP@francesco-nb.int.toradex.com>

On Tue, Dec 12, 2023 at 05:36:14PM +0100, Francesco Dolcini wrote:
> Hello all,
> while doing some tests on kernel 6.1 the following warning is hit
> sporadically:
> 
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 1385 at drivers/usb/gadget/udc/core.c:295 usb_ep_queue+0x58/0x6c
>   Modules linked in: 8021q bnep mcp251x mwifiex_sdio mwifiex cfg80211 btmrvl_sdio btmrvl imx_sdma fuse
>   CPU: 0 PID: 1385 Comm: analogclock Not tainted 6.1.66-6.5.0-devel+git.6c6a6c7e211c #1
>   Hardware name: Freescale i.MX6 Ultralite (Device Tree)
>    unwind_backtrace from show_stack+0x10/0x14
>    show_stack from dump_stack_lvl+0x40/0x4c
>    dump_stack_lvl from __warn+0x88/0xc0
>    __warn from warn_slowpath_fmt+0x10c/0x1a0
>    warn_slowpath_fmt from usb_ep_queue+0x58/0x6c
>    usb_ep_queue from eth_start_xmit+0x1ec/0x330
>    eth_start_xmit from dev_hard_start_xmit+0x7c/0xf8
>    dev_hard_start_xmit from sch_direct_xmit+0x110/0x310
>    sch_direct_xmit from __qdisc_run+0x110/0x5d8
>    __qdisc_run from net_tx_action+0x170/0x20c
>    net_tx_action from __do_softirq+0xc0/0x234
>    __do_softirq from __irq_exit_rcu+0x8c/0xb8
>    __irq_exit_rcu from irq_exit+0x8/0x10
>    irq_exit from call_with_stack+0x18/0x20
>    call_with_stack from __irq_usr+0x7c/0xa0
>   Exception stack(0xe0fcdfb0 to 0xe0fcdff8)
>   dfa0:                                     b2f9e000 b30775a0 0002edf8 00000000
>   dfc0: 01493268 014fdd00 0002edf8 0002edf8 000185b8 be8d9734 b3f6f811 0000000c
>   dfe0: b2fb4580 be8d95f4 b3f6f7d3 b64006a8 20070010 ffffffff
>   ---[ end trace 0000000000000000 ]---
> 
> 
> The warning is happening during a suspend/resume test (not sure which
> one of the twos), I cannot really tell if this is a regression (and from
> which version, eventually), but this is happening since a while with
> multiple 6.1 kernel version (this last log is from a recent 6.1.66).
> 
> I cannot really tell the current status with mainline or v6.6 given that
> it does not seems so trivial to reproduce.
> 
> It happened on various arm and arm64 machine.

After the warning happens, does the machine still work?  That warning is
a big "something went wrong" but it should still recover and keep on
going.

thanks,

greg k-h

