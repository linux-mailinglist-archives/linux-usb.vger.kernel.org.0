Return-Path: <linux-usb+bounces-4071-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347E80F3B8
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 17:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6C22816BE
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 16:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89FB7B3AF;
	Tue, 12 Dec 2023 16:56:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AF6B7
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 08:56:45 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6E4552205B;
	Tue, 12 Dec 2023 17:56:43 +0100 (CET)
Date: Tue, 12 Dec 2023 17:56:39 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-usb@vger.kernel.org,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: kernel warning in usb_ep_queue() during suspend/resume
Message-ID: <ZXiQx8onEA1YEWHD@francesco-nb.int.toradex.com>
References: <ZXiL/tXS5/xSV+aP@francesco-nb.int.toradex.com>
 <2023121206-ventricle-partly-63ea@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023121206-ventricle-partly-63ea@gregkh>

Hello Greg,

On Tue, Dec 12, 2023 at 05:44:43PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 12, 2023 at 05:36:14PM +0100, Francesco Dolcini wrote:
> >   ------------[ cut here ]------------
> >   WARNING: CPU: 0 PID: 1385 at drivers/usb/gadget/udc/core.c:295 usb_ep_queue+0x58/0x6c
> >   Modules linked in: 8021q bnep mcp251x mwifiex_sdio mwifiex cfg80211 btmrvl_sdio btmrvl imx_sdma fuse
> >   CPU: 0 PID: 1385 Comm: analogclock Not tainted 6.1.66-6.5.0-devel+git.6c6a6c7e211c #1
> >   Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> >    unwind_backtrace from show_stack+0x10/0x14
> >    show_stack from dump_stack_lvl+0x40/0x4c
> >    dump_stack_lvl from __warn+0x88/0xc0
> >    __warn from warn_slowpath_fmt+0x10c/0x1a0
> >    warn_slowpath_fmt from usb_ep_queue+0x58/0x6c
> >    usb_ep_queue from eth_start_xmit+0x1ec/0x330
> >    eth_start_xmit from dev_hard_start_xmit+0x7c/0xf8
> >    dev_hard_start_xmit from sch_direct_xmit+0x110/0x310
> >    sch_direct_xmit from __qdisc_run+0x110/0x5d8
> >    __qdisc_run from net_tx_action+0x170/0x20c
> >    net_tx_action from __do_softirq+0xc0/0x234
> >    __do_softirq from __irq_exit_rcu+0x8c/0xb8
> >    __irq_exit_rcu from irq_exit+0x8/0x10
> >    irq_exit from call_with_stack+0x18/0x20
> >    call_with_stack from __irq_usr+0x7c/0xa0
> >   Exception stack(0xe0fcdfb0 to 0xe0fcdff8)
> >   dfa0:                                     b2f9e000 b30775a0 0002edf8 00000000
> >   dfc0: 01493268 014fdd00 0002edf8 0002edf8 000185b8 be8d9734 b3f6f811 0000000c
> >   dfe0: b2fb4580 be8d95f4 b3f6f7d3 b64006a8 20070010 ffffffff
> >   ---[ end trace 0000000000000000 ]---
> > 
> > 
> > The warning is happening during a suspend/resume test (not sure which
> > one of the twos), I cannot really tell if this is a regression (and from
> > which version, eventually), but this is happening since a while with
> > multiple 6.1 kernel version (this last log is from a recent 6.1.66).
> > 
> > I cannot really tell the current status with mainline or v6.6 given that
> > it does not seems so trivial to reproduce.
> > 
> > It happened on various arm and arm64 machine.
> 
> After the warning happens, does the machine still work?
yes, the machine keeps working. I cannot tell much more since this is
happening sporadically while doing some automated test and a few seconds
after it is just switched off.


Thanks,
Francesco


