Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810A22E36C1
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 12:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgL1Lsb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 06:48:31 -0500
Received: from ns3.fnarfbargle.com ([103.4.19.87]:45398 "EHLO
        ns3.fnarfbargle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgL1Lsb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Dec 2020 06:48:31 -0500
X-Greylist: delayed 1603 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Dec 2020 06:48:26 EST
Received: from srv.home ([10.8.0.1] ident=heh12855)
        by ns3.fnarfbargle.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <brad@fnarfbargle.com>)
        id 1ktqZ4-0004vM-Ni; Mon, 28 Dec 2020 19:19:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fnarfbargle.com; s=mail;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:To:Subject:From; bh=PK+9QvpzNR+co2uXPcqS5wgI1Ez4szFiUbV+TNJBRMw=;
        b=LT7/8HY3BJ0pagAYg5/9Ev/fmYHwPHu/qJYUMiNwSegWT1zBlPc310E1gUJ2Ow1TyRUPG3E/MYE/CQ9z/67pKtj/Gqp6fKJ2roCULGs9CV4D/srpZqRvp9YAas7REwmEw8srLQR4j8zOHFCrQGDW6cgFEkUR7Te7uhtGdmmzC1w=;
From:   Brad Campbell <brad@fnarfbargle.com>
Subject: Patch "usb: hcd: Try MSI interrupts on PCI devices" breaks usb-audio
 on my machine
To:     andriy.shevchenko@linux.intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Message-ID: <ad10644a-ac7f-d2e5-304c-edb5d2f0d0a0@fnarfbargle.com>
Date:   Mon, 28 Dec 2020 19:19:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

G'day Andy,

Commit 306c54d0edb6ba94d39877524dddebaad7770cf2 in kernel 5.9 breaks
usb-audio on my machine.

I have a 2011 iMac with a pair of Apple Thunderbolt displays. Both Thunderbolt
displays have internal usb-audio devices. This patch causes the audio to stutter
terribly. Reverting it resolves the issue on any kernel up to and
including 5.10.3.

Booting with pci=nomsi fixes the audio issues, but causes all sorts of
other problems (like broken Thunderbolt display routing), so that's a non-starter.

The usb audio devices would appear to be on the Pericom USB controllers in the displays.
It wouldn't be the first peculiarity I've had on this machine due to the early Thunderbolt
implementation.

The issue is pretty much identical with the sound card on both monitors.


brad@bkmac:/usr/src/linux$ git bisect log
git bisect start
# good: [bcf876870b95592b52519ed4aafcf9d95999bc9c] Linux 5.8
git bisect good bcf876870b95592b52519ed4aafcf9d95999bc9c
# bad: [bbf5c979011a099af5dc76498918ed7df445635b] Linux 5.9
git bisect bad bbf5c979011a099af5dc76498918ed7df445635b
# bad: [47ec5303d73ea344e84f46660fff693c57641386] Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad 47ec5303d73ea344e84f46660fff693c57641386
# bad: [8f7be6291529011a58856bf178f52ed5751c68ac] Merge tag 'mmc-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
git bisect bad 8f7be6291529011a58856bf178f52ed5751c68ac
# good: [822ef14e9dc73079c646d33aa77e2ac42361b39e] Merge tag 'arm-drivers-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 822ef14e9dc73079c646d33aa77e2ac42361b39e
# good: [e0fc99e21e6e299673f1640105ac0c1d829c2d93] Merge tag 'for-5.9/drivers-20200803' of git://git.kernel.dk/linux-block
git bisect good e0fc99e21e6e299673f1640105ac0c1d829c2d93
# good: [dd27111e32572fdd3aaae98ba2817df6d202357a] Merge tag 'driver-core-5.9-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect good dd27111e32572fdd3aaae98ba2817df6d202357a
# bad: [fa56dd9152ef955bd21082c5330e4dff8621bca6] Merge tag 'usb-serial-5.9-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
git bisect bad fa56dd9152ef955bd21082c5330e4dff8621bca6
# good: [313da01ad524771046beddb18faffc5b3caf930f] usb: misc: sisusbvga: Move static const tables out to different include file
git bisect good 313da01ad524771046beddb18faffc5b3caf930f
# bad: [a95bdfd22076497288868c028619bc5995f5cc7f] bdc: Fix bug causing crash after multiple disconnects
git bisect bad a95bdfd22076497288868c028619bc5995f5cc7f
# good: [ef7e12078ab832c72315adcfa05e7a9498a5e109] thunderbolt: Fix old style declaration warning
git bisect good ef7e12078ab832c72315adcfa05e7a9498a5e109
# bad: [abac8a85c8196c2a098048ad78552c8b1a236c4d] usb: gadget: udc: atmel: implement .pullup callback
git bisect bad abac8a85c8196c2a098048ad78552c8b1a236c4d
# bad: [ffeb1e9e897b8d36b197275592d121c96d3bdb95] USB: Replace HTTP links with HTTPS ones
git bisect bad ffeb1e9e897b8d36b197275592d121c96d3bdb95
# bad: [1401bfe058d3ccf8867e9faf77744900c305e74e] usb: typec: Comment correction for typec_partner_register_altmode
git bisect bad 1401bfe058d3ccf8867e9faf77744900c305e74e
# bad: [306c54d0edb6ba94d39877524dddebaad7770cf2] usb: hcd: Try MSI interrupts on PCI devices
git bisect bad 306c54d0edb6ba94d39877524dddebaad7770cf2
# good: [eed3c957dd8cb794d6010137266cd91e0502c86d] Merge 5.8-rc6 into usb-next
git bisect good eed3c957dd8cb794d6010137266cd91e0502c86d
# first bad commit: [306c54d0edb6ba94d39877524dddebaad7770cf2] usb: hcd: Try MSI interrupts on PCI devices


brad@bkmac:~$ lspci -tv
-[0000:00]-+-00.0  Intel Corporation 2nd Generation Core Processor Family DRAM Controller
            +-01.0-[01]--+-00.0  Advanced Micro Devices, Inc. [AMD/ATI] Blackcomb [Radeon HD 6970M/6990M]
            |            \-00.1  Advanced Micro Devices, Inc. [AMD/ATI] Barts HDMI Audio [Radeon HD 6790/6850/6870 / 7720 OEM]
            +-02.0  Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller
            +-16.0  Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1
            +-1a.0  Intel Corporation 6 Series/C200 Series Chipset Family USB Universal Host Controller #5
            +-1a.7  Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2
            +-1b.0  Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller
            +-1c.0-[02]----00.0  Broadcom Limited NetXtreme BCM57765 Gigabit Ethernet PCIe
            +-1c.1-[03]----00.0  Qualcomm Atheros AR93xx Wireless Network Adapter
            +-1c.2-[04]----00.0  LSI Corporation FW643 [TrueFire] PCIe 1394b Controller
            +-1c.4-[05-cb]----00.0-[06-cb]--+-00.0-[07]----00.0  Intel Corporation CV82524 Thunderbolt Controller [Light Ridge 4C 2010]
            |                               +-03.0-[08-38]--
            |                               +-04.0-[39-69]----00.0-[3a-44]--+-00.0-[3b-3d]----00.0-[3c-3d]----03.0-[3d]--+-00.0  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
            |                               |                               |                                            +-00.1  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
            |                               |                               |                                            \-00.2  Pericom Semiconductor PI7C9X442SL USB EHCI Controller
            |                               |                               +-01.0-[3e]----00.0  Broadcom Limited NetXtreme BCM57761 Gigabit Ethernet PCIe
            |                               |                               +-02.0-[3f]----00.0  LSI Corporation FW643 [TrueFire] PCIe 1394b Controller
            |                               |                               +-04.0-[40-43]----00.0-[41-43]--+-00.0-[42]----00.0  ASMedia Technology Inc. ASM1042A USB 3.0 Host Controller
            |                               |                               |                               \-01.0-[43]----00.0  ASMedia Technology Inc. ASM1062 Serial ATA Controller
            |                               |                               \-05.0-[44]--
            |                               +-05.0-[6a-9a]----00.0-[6b-72]--+-00.0-[6c-6e]----00.0-[6d-6e]----03.0-[6e]--+-00.0  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
            |                               |                               |                                            +-00.1  Pericom Semiconductor PI7C9X442SL USB OHCI Controller
            |                               |                               |                                            \-00.2  Pericom Semiconductor PI7C9X442SL USB EHCI Controller
            |                               |                               +-01.0-[6f]----00.0  Broadcom Limited NetXtreme BCM57761 Gigabit Ethernet PCIe
            |                               |                               +-02.0-[70]----00.0  LSI Corporation FW643 [TrueFire] PCIe 1394b Controller
            |                               |                               +-04.0-[71]--
            |                               |                               \-05.0-[72]--
            |                               \-06.0-[9b-cb]--
            +-1d.0  Intel Corporation 6 Series/C200 Series Chipset Family USB Universal Host Controller #1
            +-1d.7  Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1
            +-1f.0  Intel Corporation Z68 Express Chipset Family LPC Controller
            +-1f.2  Intel Corporation 6 Series/C200 Series Chipset Family SATA AHCI Controller
            \-1f.3  Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller


brad@bkmac:~$ lsusb -t
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/2p, 12M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/2p, 12M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/2p, 12M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/2p, 12M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 4: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 3, Class=Human Interface Device, Driver=usbhid, 12M
         |__ Port 5: Dev 4, If 2, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 5: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
         |__ Port 5: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M
         |__ Port 7: Dev 5, If 0, Class=Human Interface Device, Driver=usbhid, 12M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 4: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 2, Class=Audio, Driver=snd-usb-audio, 12M
         |__ Port 4: Dev 3, If 3, Class=Human Interface Device, Driver=usbhid, 12M
         |__ Port 5: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M
         |__ Port 5: Dev 4, If 2, Class=Vendor Specific Class, Driver=, 480M
         |__ Port 5: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
         |__ Port 7: Dev 5, If 0, Class=Human Interface Device, Driver=usbhid, 12M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
         |__ Port 3: Dev 3, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/8p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 480M
         |__ Port 2: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 3: Dev 3, If 0, Class=Hub, Driver=hub/4p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/3p, 480M
         |__ Port 1: Dev 4, If 0, Class=Hub, Driver=hub/3p, 12M
             |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class, Driver=btusb, 12M
             |__ Port 1: Dev 6, If 3, Class=Application Specific Interface, Driver=, 12M
             |__ Port 1: Dev 6, If 1, Class=Wireless, Driver=btusb, 12M
             |__ Port 1: Dev 6, If 2, Class=Vendor Specific Class, Driver=btusb, 12M
         |__ Port 2: Dev 5, If 0, Class=Hub, Driver=hub/3p, 480M
             |__ Port 2: Dev 8, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
             |__ Port 2: Dev 8, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
         |__ Port 3: Dev 7, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
     |__ Port 2: Dev 3, If 2, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 2: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
     |__ Port 2: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M


/proc/interrupts - Vanilla 5.10.3 - Audio stutters terribly

            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7
   0:          5          0          0          0          0          0          0          0   IO-APIC   2-edge      timer
   9:          0          1          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
  16:          0          0          0          0        367          0          0          0   IO-APIC  16-fasteoi   pciehp, pciehp
  17:          0          0          0          0          0     100000          0          0   IO-APIC  17-fasteoi   pciehp, pciehp, pciehp
  18:          0          0          0          0          0          0     100000          0   IO-APIC  18-fasteoi   pciehp, pciehp
  19:          0          0          0        613          0          0          0          0   IO-APIC  19-fasteoi   pciehp, uhci_hcd:usb6
  21:          0          0          0          0          0          0          0          0   IO-APIC  21-fasteoi   uhci_hcd:usb2
  22:          0          0        460          0          0          0          0          0   IO-APIC  22-fasteoi   ehci_hcd:usb4
  23:          0          0          0          0          0          0        600          0   IO-APIC  23-fasteoi   ehci_hcd:usb1
  24:          0          0      11282          0          0          0          0          0   PCI-MSI 3670016-edge      thunderbolt
  25:          0          0          0      11282          0          0          0          0   PCI-MSI 3670017-edge      thunderbolt
  60:          0          0          0          0          3          0          0          0   PCI-MSI 2097152-edge      firewire_ohci
  61:          0          0          0          0          0       8525          0          0   PCI-MSI 512000-edge      ahci[0000:00:1f.2]
  62:          0          0          0          0          0          0          0          0   PCI-MSI 35127296-edge      ahci[0000:43:00.0]
  63:          0          3          0          0          0          0          0          0   PCI-MSI 33030144-edge      firewire_ohci
  64:          0          0        205          0          0          0          0          0   PCI-MSI 34603008-edge      xhci_hcd
  65:          0          0          0          0          0          0          0          0   PCI-MSI 34603009-edge      xhci_hcd
  66:          0          0          0          0          0          0          0          0   PCI-MSI 34603010-edge      xhci_hcd
  67:          0          0          0          0          0          0          0          0   PCI-MSI 34603011-edge      xhci_hcd
  68:          0          0          0          0          0          0          0          0   PCI-MSI 34603012-edge      xhci_hcd
  69:          0          0          0          0          0          0          0          0   PCI-MSI 34603013-edge      xhci_hcd
  70:          0          0          0          0          0          0          0          0   PCI-MSI 34603014-edge      xhci_hcd
  71:          0          0          0          0          0          0          0          0   PCI-MSI 34603015-edge      xhci_hcd
  72:          0          0          0          0          0          0          0          0   PCI-MSI 31985664-edge      ehci_hcd:usb7
  73:          0          0          0          0          3          0          0          0   PCI-MSI 58720256-edge      firewire_ohci
  74:          0          0          0          0          0          0          0          0   PCI-MSI 57675776-edge      ehci_hcd:usb8
  75:          0          0          0          0          0          0          0          0   PCI-MSI 31981568-edge      ohci_hcd:usb9
  76:          0          0          0          0          0          0          0          0   PCI-MSI 31983616-edge      ohci_hcd:usb10
  77:          0          0          0          0          0          0          0          0   PCI-MSI 57671680-edge      ohci_hcd:usb11
  78:          0          0          0          0          0          0          0          0   PCI-MSI 57673728-edge      ohci_hcd:usb12
  79:          0          0        181          0          0          0          0          0   PCI-MSI 524288-edge      radeon
  80:          0          0          0        585          0          0          0          0   PCI-MSI 442368-edge      snd_hda_intel:card0
  81:          0          0          0          0        131          0          0          0   PCI-MSI 526336-edge      snd_hda_intel:card1
  82:          0          0          0          0          0        528          0          0   PCI-MSI 1048576-edge      eth0-tx-0
  83:          0          0          0          0          0          0         86          0   PCI-MSI 1048577-edge      eth0-rx-1
  84:          0          0          0          0          0          0          0         25   PCI-MSI 1048578-edge      eth0-rx-2
  85:        403          0          0          0          0          0          0          0   PCI-MSI 1048579-edge      eth0-rx-3
  86:          0         36          0          0          0          0          0          0   PCI-MSI 1048580-edge      eth0-rx-4
NMI:          0          0          0          0          0          0          0          0   Non-maskable interrupts
LOC:       3314       5358       3365       7696       2759       3210       6456       5404   Local timer interrupts
SPU:          0          0          0          0          0          0          0          0   Spurious interrupts
PMI:          0          0          0          0          0          0          0          0   Performance monitoring interrupts
IWI:          0          0          0          0          0          0          0          0   IRQ work interrupts
RTR:          0          0          0          0          0          0          0          0   APIC ICR read retries
RES:        255        211        230        234        274        247        170        194   Rescheduling interrupts
CAL:       1419       1100       1487       1193       1536       1318       1197       1424   Function call interrupts
TLB:        355        181        392        118        641        583        549        445   TLB shootdowns
ERR:          0
MIS:          0
PIN:          0          0          0          0          0          0          0          0   Posted-interrupt notification event
NPI:          0          0          0          0          0          0          0          0   Nested posted-interrupt event
PIW:          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event


/proc/interrupts - Vanilla 5.10.3 pci=nomsi - Audio fine

            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7
   0:          5          0          0          0          0          0          0          0   IO-APIC   2-edge      timer
   9:          0          1          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
  16:          0          0          0       2172          0          0          0          0   IO-APIC  16-fasteoi   pciehp, pciehp, xhci-hcd:usb2, radeon, ohci_hcd:usb10, ohci_hcd:usb11, eth0
  17:          0          0          0          0       1287          0          0          0   IO-APIC  17-fasteoi   pciehp, pciehp, pciehp, ahci[0000:43:00.0], ehci_hcd:usb7, ohci_hcd:usb12, snd_hda_intel:card1
  18:          0          0          0          0          0       2352          0          0   IO-APIC  18-fasteoi   pciehp, pciehp, firewire_ohci, firewire_ohci, ehci_hcd:usb8
  19:          0          0       9967          0          0          0          0          0   IO-APIC  19-fasteoi   pciehp, uhci_hcd:usb3, ahci[0000:00:1f.2], firewire_ohci, ohci_hcd:usb9
  21:          0          0          0          0          0          0          0          0   IO-APIC  21-fasteoi   uhci_hcd:usb1
  22:       1028          0          0          0          0          0          0          0   IO-APIC  22-fasteoi   ehci_hcd:usb6, snd_hda_intel:card0
  23:          0          0          0          0          0          0          0        640   IO-APIC  23-fasteoi   ehci_hcd:usb4
NMI:          0          0          0          0          0          0          0          0   Non-maskable interrupts
LOC:       4120       4186       4248       3799       3538       6653       4684       7473   Local timer interrupts
SPU:          0          0          0          0          0          0          0          0   Spurious interrupts
PMI:          0          0          0          0          0          0          0          0   Performance monitoring interrupts
IWI:          0          0          0          0          0          0          0          0   IRQ work interrupts
RTR:          0          0          0          0          0          0          0          0   APIC ICR read retries
RES:        325        211        238        249        209        301        166        202   Rescheduling interrupts
CAL:       1823       1277       1256       1434       1234       1452       1595       1437   Function call interrupts
TLB:       1069        509        566        757        254        886        887        596   TLB shootdowns
ERR:          0
MIS:          0
PIN:          0          0          0          0          0          0          0          0   Posted-interrupt notification event
NPI:          0          0          0          0          0          0          0          0   Nested posted-interrupt event
PIW:          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event

/proc/interrupts - v5.10.3 Patch reverted - Audio fine

            CPU0       CPU1       CPU2       CPU3       CPU4       CPU5       CPU6       CPU7
   0:          5          0          0          0          0          0          0          0   IO-APIC   2-edge      timer
   9:          0          1          0          0          0          0          0          0   IO-APIC   9-fasteoi   acpi
  16:          0          0          0          0          2          0          0          0   IO-APIC  16-fasteoi   pciehp, pciehp, ohci_hcd:usb10, ohci_hcd:usb11
  17:          0          0          0          0          0       1136          0          0   IO-APIC  17-fasteoi   pciehp, pciehp, pciehp, ehci_hcd:usb7, ohci_hcd:usb12
  18:          0          0          0          0          0          0       3231          0   IO-APIC  18-fasteoi   pciehp, pciehp, ehci_hcd:usb8
  19:          0          0          0          1          0          0          0          0   IO-APIC  19-fasteoi   pciehp, uhci_hcd:usb4, ohci_hcd:usb9
  21:          0          0          0          0          0          0          0          0   IO-APIC  21-fasteoi   uhci_hcd:usb3
  22:          0          0      19474          0          0          0          0          0   IO-APIC  22-fasteoi   ehci_hcd:usb6
  23:          0          0          0          0          0          0      31797          0   IO-APIC  23-fasteoi   ehci_hcd:usb1
  24:          0          0      11282          0          0          0          0          0   PCI-MSI 3670016-edge      thunderbolt
  25:          0          0          0      11282          0          0          0          0   PCI-MSI 3670017-edge      thunderbolt
  60:          0          0          0          0          3          0          0          0   PCI-MSI 2097152-edge      firewire_ohci
  61:          0          0          0          0          0      42120          0          0   PCI-MSI 512000-edge      ahci[0000:00:1f.2]
  62:          0          0          0          0          0          0          0          0   PCI-MSI 35127296-edge      ahci[0000:43:00.0]
  63:          0          3          0          0          0          0          0          0   PCI-MSI 33030144-edge      firewire_ohci
  64:          0          0        202          0          0          0          0          0   PCI-MSI 34603008-edge      xhci_hcd
  65:          0          0          0          0          0          0          0          0   PCI-MSI 34603009-edge      xhci_hcd
  66:          0          0          0          0          0          0          0          0   PCI-MSI 34603010-edge      xhci_hcd
  67:          0          0          0          0          0          0          0          0   PCI-MSI 34603011-edge      xhci_hcd
  68:          0          0          0          0          0          0          0          0   PCI-MSI 34603012-edge      xhci_hcd
  69:          0          0          0          0          0          0          0          0   PCI-MSI 34603013-edge      xhci_hcd
  70:          0          0          0          0          0          0          0          0   PCI-MSI 34603014-edge      xhci_hcd
  71:          0          0          0          0          0          0          0          0   PCI-MSI 34603015-edge      xhci_hcd
  72:          0          0          0          3          0          0          0          0   PCI-MSI 58720256-edge      firewire_ohci
  73:          0          0          0          0        933          0          0          0   PCI-MSI 524288-edge      radeon
  74:          0          0          0          0          0        587          0          0   PCI-MSI 442368-edge      snd_hda_intel:card0
  75:          0          0          0          0          0          0        259          0   PCI-MSI 526336-edge      snd_hda_intel:card1
  76:          0          0          0          0          0          0          0      51117   PCI-MSI 1048576-edge      eth0-tx-0
  77:      12265          0          0          0          0          0          0          0   PCI-MSI 1048577-edge      eth0-rx-1
  78:          0       7326          0          0          0          0          0          0   PCI-MSI 1048578-edge      eth0-rx-2
  79:          0          0      11955          0          0          0          0          0   PCI-MSI 1048579-edge      eth0-rx-3
  80:          0          0          0      60380          0          0          0          0   PCI-MSI 1048580-edge      eth0-rx-4
NMI:          0          0          0          0          0          0          0          0   Non-maskable interrupts
LOC:     241817     314428     255056     260560     227955     232806     359864     235546   Local timer interrupts
SPU:          0          0          0          0          0          0          0          0   Spurious interrupts
PMI:          0          0          0          0          0          0          0          0   Performance monitoring interrupts
IWI:          0          0          0          0          0          0          0          0   IRQ work interrupts
RTR:          0          0          0          0          0          0          0          0   APIC ICR read retries
RES:       5187       5757       5852       6308       5333       5703       5789       5615   Rescheduling interrupts
CAL:      36945      39369      35857      35669      45833      36944      37615      34973   Function call interrupts
TLB:      43347      49477      53728      46389      62760      48046      51556      46292   TLB shootdowns
ERR:          0
MIS:          0
PIN:          0          0          0          0          0          0          0          0   Posted-interrupt notification event
NPI:          0          0          0          0          0          0          0          0   Nested posted-interrupt event
PIW:          0          0          0          0          0          0          0          0   Posted-interrupt wakeup event

Regards,
Brad
-- 
An expert is a person who has found out by his own painful
experience all the mistakes that one can make in a very
narrow field. - Niels Bohr
