Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9C735171B9
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 16:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237952AbiEBOly (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 10:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238024AbiEBOlx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 10:41:53 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0359B120BA
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 07:38:23 -0700 (PDT)
Received: (qmail 1049656 invoked by uid 1000); 2 May 2022 10:38:23 -0400
Date:   Mon, 2 May 2022 10:38:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?utf-8?B?5bCk5pmT5p2w?= <yxj790222@163.com>
Cc:     weissg@vienna.at, USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: BUG report: ohci-pci ehci-pci , newer nec chip failed
Message-ID: <Ym/s33/hFybb2JfH@rowland.harvard.edu>
References: <2b564264.1963.18084f0e7a6.Coremail.yxj790222@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b564264.1963.18084f0e7a6.Coremail.yxj790222@163.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 02, 2022 at 09:23:42PM +0800, 尤晓杰 wrote:
> dear friend, if I want to report bugs,how to do? where to subsribe email lists?

You should report bugs to the linux-usb@vger.kernel.org mailing list 
(CC'ed).  You can post on the mailing list without subscribing.

> the fact is I am using richo 475ii pci-card bus bridge,
> when I plug into two different version of nec cardbus usb2 cards:
> as following:
> 
> 05:06.0 CardBus bridge: Ricoh Co Ltd RL5c475 (rev 80)
> 06:00.0 USB controller: NEC Corporation OHCI USB Controller (rev 44)
> 06:00.1 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 05)
> this newer one panic
> 
> 06:00.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
> 06:00.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
> 06:00.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 04)
> this one ok
> so what's wrong?
> the dmesg:
> /////////////////////////////////////old version chip////////////////////////////////////////////

This is the new version of the chip, not the old version.

> [  203.672411] pcmcia_socket pcmcia_socket0: pccard: CardBus card inserted into slot 0
> [  203.672460] pci 0000:06:00.0: [1033:0035] type 00 class 0x0c0310
> [  203.672491] pci 0000:06:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
> [  203.672818] pci 0000:06:00.1: [1033:00e0] type 00 class 0x0c0320
> [  203.672847] pci 0000:06:00.1: reg 0x10: [mem 0x00000000-0x000000ff]
> [  203.672957] pci 0000:06:00.1: supports D1 D2
> [  203.672963] pci 0000:06:00.1: PME# supported from D0 D1 D2 D3hot
> [  203.673146] pci 0000:06:00.0: BAR 0: assigned [mem 0xa0000000-0xa0000fff]
> [  203.673161] pci 0000:06:00.1: BAR 0: assigned [mem 0xa0001000-0xa00010ff]
> [  203.673206] pci 0000:06:00.0: enabling device (0000 -> 0002)
> [  203.713249] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [  203.717571] ohci-pci: OHCI PCI platform driver
> [  204.684594] pci 0000:06:00.0: OHCI: BIOS handoff failed (BIOS bug?) ffffffff
> [  204.684882] pci 0000:06:00.0: quirk_usb_early_handoff+0x0/0x740 took 987793 usecs
> [  204.685160] ohci-pci 0000:06:00.0: OHCI PCI host controller
> [  204.685178] ohci-pci 0000:06:00.0: new USB bus registered, assigned bus number 6
> [  215.022336] ohci-pci 0000:06:00.0: USB HC takeover failed!  (BIOS/SMM bug)
> [  215.022352] ohci-pci 0000:06:00.0: can't setup: -16
> [  215.022364] ohci-pci 0000:06:00.0: USB bus 6 deregistered
> [  215.022569] ohci-pci 0000:06:00.0: init 0000:06:00.0 fail, -16
> [  215.022578] ohci-pci: probe of 0000:06:00.0 failed with error -16

There is no panic.  The driver failed because the firmware (BIOS) did 
not behave the way it is supposed to.

> [  215.022620] pci 0000:06:00.1: enabling device (0000 -> 0002)
> [  215.022787] pci 0000:06:00.1: EHCI: unrecognized capability 31
> [  215.022993] ehci-pci 0000:06:00.1: enabling device (0000 -> 0002)
> [  215.023177] ehci-pci 0000:06:00.1: EHCI Host Controller
> [  215.023193] ehci-pci 0000:06:00.1: new USB bus registered, assigned bus number 6
> [  215.023270] ehci-pci 0000:06:00.1: can't setup: -19
> [  215.023278] ehci-pci 0000:06:00.1: USB bus 6 deregistered
> [  215.023435] ehci-pci 0000:06:00.1: init 0000:06:00.1 fail, -19

There is no panic.  The driver failed, because the chip has an extended 
capability bit set which the driver doesn't recognize.

If you can provide documentation (that is, the datasheet) for this new 
chip, I will try to update the driver.

> /////////////////////////////////////////////new version chip////////////////////////////////

This is the old version, not the new version.

> [  246.203555] pcmcia_socket pcmcia_socket0: pccard: card ejected from slot 0
> [  281.945950] pcmcia_socket pcmcia_socket0: pccard: CardBus card inserted into slot 0
> [  281.945991] pci 0000:06:00.0: [1033:0035] type 00 class 0x0c0310
> [  281.946022] pci 0000:06:00.0: reg 0x10: [mem 0x00000000-0x00000fff]
> [  281.946147] pci 0000:06:00.0: supports D1 D2
> [  281.946153] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot
> [  281.946353] pci 0000:06:00.1: [1033:0035] type 00 class 0x0c0310
> [  281.946384] pci 0000:06:00.1: reg 0x10: [mem 0x00000000-0x00000fff]
> [  281.946494] pci 0000:06:00.1: supports D1 D2
> [  281.946500] pci 0000:06:00.1: PME# supported from D0 D1 D2 D3hot
> [  281.946654] pci 0000:06:00.2: [1033:00e0] type 00 class 0x0c0320
> [  281.946682] pci 0000:06:00.2: reg 0x10: [mem 0x00000000-0x000000ff]
> [  281.946791] pci 0000:06:00.2: supports D1 D2
> [  281.946797] pci 0000:06:00.2: PME# supported from D0 D1 D2 D3hot
> [  281.946940] pci 0000:06:00.0: BAR 0: assigned [mem 0xa0000000-0xa0000fff]
> [  281.946955] pci 0000:06:00.1: BAR 0: assigned [mem 0xa0001000-0xa0001fff]
> [  281.946966] pci 0000:06:00.2: BAR 0: assigned [mem 0xa0002000-0xa00020ff]
> [  281.947015] pci 0000:06:00.0: enabling device (0000 -> 0002)
> [  281.947602] ohci-pci 0000:06:00.0: OHCI PCI host controller
> [  281.947620] ohci-pci 0000:06:00.0: new USB bus registered, assigned bus number 6
> [  281.947671] ohci-pci 0000:06:00.0: irq 22, io mem 0xa0000000
> [  282.035868] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.17
> [  282.035884] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [  282.035890] usb usb6: Product: OHCI PCI host controller
> [  282.035894] usb usb6: Manufacturer: Linux 5.17.0-1-686-pae ohci_hcd
> [  282.035898] usb usb6: SerialNumber: 0000:06:00.0
> [  282.036770] hub 6-0:1.0: USB hub found
> [  282.036803] hub 6-0:1.0: 3 ports detected
> [  282.037202] pci 0000:06:00.1: enabling device (0000 -> 0002)
> [  282.037729] ohci-pci 0000:06:00.1: OHCI PCI host controller
> [  282.037743] ohci-pci 0000:06:00.1: new USB bus registered, assigned bus number 7
> [  282.037785] ohci-pci 0000:06:00.1: irq 22, io mem 0xa0001000
> [  282.123823] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001, bcdDevice= 5.17
> [  282.123834] usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [  282.123837] usb usb7: Product: OHCI PCI host controller
> [  282.123840] usb usb7: Manufacturer: Linux 5.17.0-1-686-pae ohci_hcd
> [  282.123843] usb usb7: SerialNumber: 0000:06:00.1
> [  282.124083] hub 7-0:1.0: USB hub found
> [  282.124097] hub 7-0:1.0: 2 ports detected
> [  282.124322] pci 0000:06:00.2: enabling device (0000 -> 0002)
> [  282.274237] ehci-pci 0000:06:00.2: EHCI Host Controller
> [  282.274264] ehci-pci 0000:06:00.2: new USB bus registered, assigned bus number 8
> [  282.274352] ehci-pci 0000:06:00.2: irq 22, io mem 0xa0002000
> [  282.289879] ehci-pci 0000:06:00.2: USB 2.0 started, EHCI 1.00
> [  282.290070] usb usb8: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.17
> [  282.290082] usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [  282.290089] usb usb8: Product: EHCI Host Controller
> [  282.290095] usb usb8: Manufacturer: Linux 5.17.0-1-686-pae ehci_hcd
> [  282.290100] usb usb8: SerialNumber: 0000:06:00.2
> [  282.290433] hub 8-0:1.0: USB hub found
> [  282.290459] hub 8-0:1.0: 5 ports detected
> [  282.369991] hub 6-0:1.0: USB hub found
> [  282.370034] hub 6-0:1.0: 3 ports detected
> [  282.446002] hub 7-0:1.0: USB hub found
> [  282.446039] hub 7-0:1.0: 2 ports detected
> 
> 06:00.0 USB controller: NEC Corporation OHCI USB Controller (rev 44)
> 06:00.1 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 05)
> 
> 05:06.0 CardBus bridge: Ricoh Co Ltd RL5c475 (rev 80)
> 06:00.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
> 06:00.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
> 06:00.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 04)

What does "lspci -vv -s 6:00.1" for the new version chip show?

Alan Stern
