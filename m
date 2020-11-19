Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25DA2B9B6D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 20:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbgKSTW4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 14:22:56 -0500
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net ([184.168.200.145]:52978
        "EHLO p3nlsmtpcp01-04.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgKSTWz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 14:22:55 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id fpVBkCXdaFpAefpVBkH1Un; Thu, 19 Nov 2020 12:21:53 -0700
X-CMAE-Analysis: v=2.4 cv=aJs1FZxm c=1 sm=1 tr=0 ts=5fb6c5d1
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=FgKXPTSolQVMY9Te7oQA:9 a=Fcx9E6-97ggQ2lLZ:21 a=nM-Zg28veNzLNHND:21
 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:46200 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kfpVB-00FDnr-AW; Thu, 19 Nov 2020 12:21:53 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <427818cf-aa35-54d3-83cf-02529a0ab5aa@tripolho.com>
Date:   Thu, 19 Nov 2020 14:21:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119172250.GC576844@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0564.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tripolho.com
X-Get-Message-Sender-Via: p3plcpnl0564.prod.phx3.secureserver.net: authenticated_id: a1@tripolho.com
X-Authenticated-Sender: p3plcpnl0564.prod.phx3.secureserver.net: a1@tripolho.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfDgy9cjy4Pt/eyDJLEkAyPzBJeLS+QfxCljT814OH27KGaGbY6B95WJ6RaJwIvw9b9OJuMSLpPF+yLB8AbnyZKtz3xCIwzBraTqEIBHGvkDV94P2Kyhc
 8pHXZP2YYdC4gVzfiMJHbX76QcFscEjDxutNuWjiGONq80PvtL6fIWAmSR4gKIYxteMQ09zHv7p3HZToospcTZxq7DltnpLX4PPCSw0RBSfjrSUo/jw2Fy36
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

lsusb -t in a similar configuration I use for development (it has just 6 
device, and not 36):

$ lsusb -t
/:  Bus 16.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 15.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 14.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 13.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 12.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 11.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 10.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 09.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 08.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
     |__ Port 8: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
/:  Bus 07.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
     |__ Port 6: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
/:  Bus 06.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/2p, 12M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=ohci-pci/3p, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
     |__ Port 3: Dev 5, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 1: Dev 6, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 8, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
         |__ Port 2: Dev 7, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 10, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
         |__ Port 4: Dev 9, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 12, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
         |__ Port 5: Dev 11, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 6: Dev 13, If 0, Class=Hub, Driver=hub/7p, 480M
             |__ Port 6: Dev 15, If 0, Class=Hub, Driver=hub/2p, 480M
                 |__ Port 1: Dev 17, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
             |__ Port 7: Dev 16, If 0, Class=Hub, Driver=hub/2p, 480M
                 |__ Port 1: Dev 18, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
         |__ Port 7: Dev 14, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M

/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/5p, 480M

And lspci (I believe we are using the VIA Technologies, Inc controller 
at the site where we are having locks):

$ lspci
00:00.0 Host bridge: Intel Corporation Sky Lake-E DMI3 Registers (rev 04)
00:04.0 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.1 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.2 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.3 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.4 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.5 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.6 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:04.7 System peripheral: Intel Corporation Sky Lake-E CBDMA Registers 
(rev 04)
00:05.0 System peripheral: Intel Corporation Sky Lake-E MM/Vt-d 
Configuration Registers (rev 04)
00:05.2 System peripheral: Intel Corporation Sky Lake-E RAS (rev 04)
00:05.4 PIC: Intel Corporation Sky Lake-E IOAPIC (rev 04)
00:08.0 System peripheral: Intel Corporation Sky Lake-E Ubox Registers 
(rev 04)
00:08.1 Performance counters: Intel Corporation Sky Lake-E Ubox 
Registers (rev 04)
00:08.2 System peripheral: Intel Corporation Sky Lake-E Ubox Registers 
(rev 04)
00:14.0 USB controller: Intel Corporation 200 Series/Z370 Chipset Family 
USB 3.0 xHCI Controller
00:14.2 Signal processing controller: Intel Corporation 200 Series PCH 
Thermal Subsystem
00:17.0 RAID bus controller: Intel Corporation C600/X79 series chipset 
SATA RAID Controller
00:1b.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #21 (rev f0)
00:1c.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #3 (rev f0)
00:1c.4 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #5 (rev f0)
00:1d.0 PCI bridge: Intel Corporation 200 Series PCH PCI Express Root 
Port #9 (rev f0)
00:1f.0 ISA bridge: Intel Corporation C422 Chipset LPC/eSPI Controller
00:1f.2 Memory controller: Intel Corporation 200 Series/Z370 Chipset 
Family Power Management Controller
00:1f.3 Audio device: Intel Corporation 200 Series PCH HD Audio
00:1f.4 SMBus: Intel Corporation 200 Series/Z370 Chipset Family SMBus 
Controller
00:1f.5 Non-VGA unclassified device: Intel Corporation 200 Series/Z370 
Chipset Family SPI Controller
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) 
I219-LM
01:00.0 PCI bridge: Texas Instruments XIO2000(A)/XIO2200A PCI 
Express-to-PCI Bridge (rev 03)
02:01.0 USB controller: NEC Corporation OHCI USB Controller (rev 43)
02:01.1 USB controller: NEC Corporation OHCI USB Controller (rev 43)
02:01.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller 
(rev 04)
03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network 
Connection (rev 03)
05:00.0 PCI bridge: PLX Technology, Inc. PEX 8609 8-lane, 8-Port PCI 
Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
05:00.1 System peripheral: PLX Technology, Inc. PEX 8609 8-lane, 8-Port 
PCI Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
06:01.0 PCI bridge: PLX Technology, Inc. PEX 8609 8-lane, 8-Port PCI 
Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
06:05.0 PCI bridge: PLX Technology, Inc. PEX 8609 8-lane, 8-Port PCI 
Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
06:07.0 PCI bridge: PLX Technology, Inc. PEX 8609 8-lane, 8-Port PCI 
Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
06:09.0 PCI bridge: PLX Technology, Inc. PEX 8609 8-lane, 8-Port PCI 
Express Gen 2 (5.0 GT/s) Switch with DMA (rev ba)
07:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host 
Controller
08:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host 
Controller
09:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host 
Controller
0a:00.0 USB controller: ASMedia Technology Inc. ASM1042A USB 3.0 Host 
Controller
14:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
14:05.0 System peripheral: Intel Corporation Sky Lake-E VT-d (rev 04)
14:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
14:05.4 PIC: Intel Corporation Sky Lake-E IOxAPIC Configuration 
Registers (rev 04)
14:08.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.4 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.5 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.6 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:08.7 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:09.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:09.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.4 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.5 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.6 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0e.7 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0f.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:0f.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.0 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.1 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.2 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1d.3 System peripheral: Intel Corporation Sky Lake-E CHA Registers 
(rev 04)
14:1e.0 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.1 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.2 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.3 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.4 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.5 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
14:1e.6 System peripheral: Intel Corporation Sky Lake-E PCU Registers 
(rev 04)
15:00.0 PCI bridge: Pericom Semiconductor PI7C9X111SL PCIe-to-PCI 
Reversible Bridge (rev 02)
16:04.0 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
16:04.1 USB controller: VIA Technologies, Inc. VT82xx/62xx UHCI USB 1.1 
Controller (rev 62)
16:04.2 USB controller: VIA Technologies, Inc. USB 2.0 (rev 65)
20:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
20:05.0 System peripheral: Intel Corporation Sky Lake-E VT-d (rev 04)
20:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
20:05.4 PIC: Intel Corporation Sky Lake-E IOxAPIC Configuration 
Registers (rev 04)
20:08.0 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:09.0 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.0 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.1 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.2 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.3 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.4 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0a.5 System peripheral: Intel Corporation Sky Lake-E LM Channel 1 
(rev 04)
20:0a.6 System peripheral: Intel Corporation Sky Lake-E LMS Channel 1 
(rev 04)
20:0a.7 System peripheral: Intel Corporation Sky Lake-E LMDP Channel 1 
(rev 04)
20:0b.0 System peripheral: Intel Corporation Sky Lake-E DECS Channel 2 
(rev 04)
20:0b.1 System peripheral: Intel Corporation Sky Lake-E LM Channel 2 
(rev 04)
20:0b.2 System peripheral: Intel Corporation Sky Lake-E LMS Channel 2 
(rev 04)
20:0b.3 System peripheral: Intel Corporation Sky Lake-E LMDP Channel 2 
(rev 04)
20:0c.0 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0c.1 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0c.2 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0c.3 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0c.4 System peripheral: Intel Corporation Sky Lake-E Integrated 
Memory Controller (rev 04)
20:0c.5 System peripheral: Intel Corporation Sky Lake-E LM Channel 1 
(rev 04)
20:0c.6 System peripheral: Intel Corporation Sky Lake-E LMS Channel 1 
(rev 04)
20:0c.7 System peripheral: Intel Corporation Sky Lake-E LMDP Channel 1 
(rev 04)
20:0d.0 System peripheral: Intel Corporation Sky Lake-E DECS Channel 2 
(rev 04)
20:0d.1 System peripheral: Intel Corporation Sky Lake-E LM Channel 2 
(rev 04)
20:0d.2 System peripheral: Intel Corporation Sky Lake-E LMS Channel 2 
(rev 04)
20:0d.3 System peripheral: Intel Corporation Sky Lake-E LMDP Channel 2 
(rev 04)
21:00.0 VGA compatible controller: NVIDIA Corporation GP107GL [Quadro 
P400] (rev a1)
21:00.1 Audio device: NVIDIA Corporation GP107GL High Definition Audio 
Controller (rev a1)
2c:00.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port A 
(rev 04)
2c:02.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port C 
(rev 04)
2c:03.0 PCI bridge: Intel Corporation Sky Lake-E PCI Express Root Port D 
(rev 04)
2c:05.0 System peripheral: Intel Corporation Sky Lake-E VT-d (rev 04)
2c:05.2 System peripheral: Intel Corporation Sky Lake-E RAS 
Configuration Registers (rev 04)
2c:05.4 PIC: Intel Corporation Sky Lake-E IOxAPIC Configuration 
Registers (rev 04)
2c:12.0 Performance counters: Intel Corporation Sky Lake-E M3KTI 
Registers (rev 04)
2c:12.1 Performance counters: Intel Corporation Sky Lake-E M3KTI 
Registers (rev 04)
2c:12.2 System peripheral: Intel Corporation Sky Lake-E M3KTI Registers 
(rev 04)
2c:15.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:16.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:16.4 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)
2c:17.0 System peripheral: Intel Corporation Sky Lake-E M2PCI Registers 
(rev 04)


On 11/19/20 12:22 PM, Alan Stern wrote:
> On Mon, Nov 16, 2020 at 01:42:46PM -0500, Alberto Sentieri wrote:
>> Alan,
>>
>> I am not sure if that would give you any clue, but I enabled usbfs_snoop in
>> the kernel and I got URB error -108 (endpoint shutdown) just before the
>> kernel lock.
>>
>> Just after starting the program, I got something like that:
>>
>> [  174.325977] usb 1-1.1.1: opened by process 2961: ate
>> [  174.326006] usb 1-1.1.1: usbdev_do_ioctl: GETDRIVER
>> [  174.326015] usb 1-1.1.1: usbdev_do_ioctl: IOCTL
>> [  174.326334] usb 1-1.1.1: usbdev_do_ioctl: CLAIMINTERFACE
>> [  174.326371] usb 1-1.1.1: usbdev_do_ioctl: SETINTERFACE
>> [  174.326582] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326592] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326617] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326623] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326629] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326635] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326640] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326645] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326652] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326657] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326663] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326668] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326674] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326679] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326685] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326691] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326696] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326702] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326708] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326713] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326718] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326723] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326729] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326734] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326740] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326745] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326751] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326756] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326762] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326767] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326773] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326783] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.327565] usb 1-1.3.1: opened by process 2961: ate
>> [  174.327584] usb 1-1.3.1: usbdev_do_ioctl: GETDRIVER
>> [  174.327593] usb 1-1.3.1: usbdev_do_ioctl: IOCTL
>> [  174.327855] usb 1-1.3.1: usbdev_do_ioctl: CLAIMINTERFACE
>> [  174.327881] usb 1-1.3.1: usbdev_do_ioctl: SETINTERFACE
>> [  174.328180] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
>> [  174.328188] usb 1-1.3.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.328205] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
> Can you post the output from "lsusb -t" for your test system?  The
> device numbers aren't what I expected to see.  Not wrong, just
> unexpected.

