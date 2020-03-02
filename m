Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66B717667B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 22:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgCBV4G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 16:56:06 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34528 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725781AbgCBV4G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 16:56:06 -0500
Received: (qmail 6352 invoked by uid 2102); 2 Mar 2020 16:56:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Mar 2020 16:56:05 -0500
Date:   Mon, 2 Mar 2020 16:56:05 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Spurious EHCI  interrupts with 5.2 and later on shutdown / init
 6 reboot .
In-Reply-To: <F005B4A6-67E1-43EE-915F-F382208F6B32@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003021651590.1555-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2 Mar 2020, John Donnelly wrote:

> Hello linux-usb.
> 
> 
> I am seeing this message every time a server is rebooted, and it started around 5.2 release. It is benign behavior but it does not occur in prior 4.18 Linux kernels. 

What about 4.19?  4.20?  5.0?  And so on...

It still think your best bet for finding out what is happening is to do 
a bisection.

> Kernel 5.6.0-rc1.01.el8uek.rc1.x86_64 on an x86_64 
> 
> 
> [  836.063284] irq 18: nobody cared (try booting with the "irqpoll" option) 
> [  836.143498] CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not tainted 
> 5.3.6.jpd.01.+ #5 
> [  836.239310] Hardware name: Oracle Corporation ORACLE SERVER 
> X5-2/ASM,MOTHERBOARD,1U, BIOS 30140300 09/20/2018 
> [  836.358010] Call Trace: 
> [  836.387248]  <IRQ> 
> [  836.411298]  dump_stack+0x63/0x8a 
> [  836.450951]  __report_bad_irq+0x3c/0xb6 
> [  836.496830]  note_interrupt.cold.10+0xb/0x5d 
> [  836.547916]  handle_irq_event_percpu+0x6f/0x80 
> [  836.601077]  handle_irq_event+0x3b/0x5a 
> [  836.646962]  handle_fasteoi_irq+0x90/0x130 
> [  836.695968]  handle_irq+0x20/0x30 
> [  836.711139] megaraid_sas 0000:23:00.0: megasas_disable_intr_fusion is 
> called outbound_intr_mask:0x40000009 
> [  836.735612]  do_IRQ+0x4e/0xe0 
> [  836.735616]  common_interrupt+0xf/0xf 
> [  836.735619]  </IRQ>
> 
> [  336.622666] [<0000000010b50533>] usb_hcd_irq 
> [  336.673746] [<0000000010b50533>] usb_hcd_irq
> 
> 
> Device info :
> 
> 
> lsusb -t 
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M 
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M 
>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M 
> [root@ca-dev55 ~]#
> 
> 
> 
> PCI infö :
> 
> [root@ca-dev55 kernel]# lspci -s 00:1d.0 -k -vv
> 00:1d.0 USB controller: Intel Corporation C610/X99 series chipset USB Enhanced Host Controller #1 (rev 05) (prog-if 20 [EHCI])
> 	Subsystem: Oracle/SUN Device 4852
> 	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> 	Interrupt: pin C routed to IRQ 18
> 	NUMA node: 0
> 	Region 0: Memory at c7501000 (32-bit, non-prefetchable) [size=1K]
> 	Capabilities: [50] Power Management version 2
> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> 	Capabilities: [58] Debug port: BAR=1 offset=00a0
> 	Capabilities: [98] PCI Advanced Features
> 		AFCap: TP+ FLR+
> 		AFCtrl: FLR-
> 		AFStatus: TP-
> 	Kernel modules: ehci_pci
> 
> 
> # cat  /sys/kernel/irq/18/* 
> ehci_hcd:usb1,ehci_hcd:usb2 
> IR-IO-APIC 
> 18 
> fasteoi 
> 0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
> level
> 
> 
> 
> There are no USB devices attached to these ports ( like a keyboard or mouse ) so I am not sure why it would be producing spurious interrupts .
> 
> We have ehci_pci and echo_hcd  components compiled in the kernel ,but the behavior also occurs when those drivers are created as loadable  modules . 
> 
> If I removed the modules using rmmod  prior to Linux shutdown the issue does not occur .  

So at least you have a workaround, if nothing else.

> Any suggestions ?  

Since the messages are benign, you can simply ignore them.

Or you can try to track down the code that causes them to appear, as
described above.

Alan Stern

