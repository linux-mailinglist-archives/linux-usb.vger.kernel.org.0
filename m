Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F32F517780
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 21:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbiEBTn2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 15:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbiEBTn1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 15:43:27 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0BF6765CF
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 12:39:56 -0700 (PDT)
Received: (qmail 1061109 invoked by uid 1000); 2 May 2022 15:39:56 -0400
Date:   Mon, 2 May 2022 15:39:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?utf-8?B?5bCk5pmT5p2w?= <yxj790222@163.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Re: BUG report: ohci-pci ehci-pci , newer nec chip failed
Message-ID: <YnAzjG+wU0yCI29O@rowland.harvard.edu>
References: <2b564264.1963.18084f0e7a6.Coremail.yxj790222@163.com>
 <Ym/s33/hFybb2JfH@rowland.harvard.edu>
 <1582a60e.34.1808632ac75.Coremail.yxj790222@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1582a60e.34.1808632ac75.Coremail.yxj790222@163.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 03, 2022 at 03:15:09AM +0800, 尤晓杰 wrote:

Please use Reply-To-All so that your messages get sent to the mailing 
list as well as to me.

> [33628.797708] pci 0000:06:00.1: EHCI: unrecognized capability 95
> [33628.797713] pci 0000:06:00.1: EHCI: unrecognized capability 95
> [33628.797718] pci 0000:06:00.1: EHCI: unrecognized capability 95
> [33628.797723] pci 0000:06:00.1: EHCI: capability loop?
> [33628.798098] ehci-pci 0000:06:00.1: EHCI Host Controller
> [33628.798115] ehci-pci 0000:06:00.1: new USB bus registered, assigned bus number 6
> [33628.798195] ehci-pci 0000:06:00.1: can't setup: -19
> [33628.798203] ehci-pci 0000:06:00.1: USB bus 6 deregistered
> [33628.798358] ehci-pci 0000:06:00.1: init 0000:06:00.1 fail, -19
> 
> 
> 
> 
> each time, capability is random.

That sounds like a bug in the chip.

> allan@debian:~$ sudo lspci -vv -s 6:00.1
> 06:00.1 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 05) (prog-if 20 [EHCI])
>     Subsystem: NEC Corporation uPD72010x USB 2.0 Controller
>     Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-

That line looks very peculiar.  Do you get the same thing for the older 
chip version?

>     Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>     Interrupt: pin A routed to IRQ 22
>     Region 0: Memory at a0001000 (32-bit, non-prefetchable) [virtual] [size=256]
>     Capabilities: [fc] Null
>     Kernel modules: ehci_pci

Compare this with similar output on my system:

05:04.2 USB controller: VIA Technologies, Inc. USB 2.0 EHCI-Compliant Host-Controller (rev 65) (prog-if 20 [EHCI])
	Subsystem: VIA Technologies, Inc. USB 2.0 Controller
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 16
	Region 0: Memory at f7c00000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: ehci-pci

> by the way, because I use cardbus, is it possible the fault of ricoh cardbus pci bridge's fault?

That's possible.  But then why does it work okay for the earlier version 
of the chip?

> thanks!!

Alan Stern
