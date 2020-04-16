Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38861AC621
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 16:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503491AbgDPOeF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 10:34:05 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:38661 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502815AbgDPOdx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 10:33:53 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4931tL1bz8z1r573;
        Thu, 16 Apr 2020 16:33:30 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4931tL167wz1qr43;
        Thu, 16 Apr 2020 16:33:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id yjo0PsrqO4eH; Thu, 16 Apr 2020 16:33:26 +0200 (CEST)
X-Auth-Info: 05LDI5BkOsRIVajmzrVIIkgYcyJt/pTi7lxK3Pu2Tks=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 16 Apr 2020 16:33:26 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
Date:   Thu, 16 Apr 2020 16:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/16/20 3:37 PM, Minas Harutyunyan wrote:
> Hi,

Hi,

[...]

>>>>>>> 2. debug log
>>>>>>
>>>>>> What kind of debug log ?
>>>>>>
>>>>> Drivers debug log starting from dwc2 loading and connector connecting to
>>>>> device, where issue seen.
>>>>
>>>> How do I enable the one you need ?
>>>>
>>> To enable debug prints from dwc2 use 'make menuconfig':
>>>
>>>    Symbol: USB_DWC2_DEBUG [=y]
>>
>> Oh, this one, OK. There you go.
>>
>> Note that there is no further output when I plug in the USB microB cable
>> from a PC.
>>
> 1. Are you sure that you provided full debug log for dwc2? Actually 
> first debug prints of dwc2 should be:
> 
> [72891.088917] dwc2 dwc2.1.auto: mapped PA ef100000 to VA 00000000ca45f000
> [72891.088924] dwc2 dwc2.1.auto: registering common handler for irq16
> [72891.088963] dwc2 dwc2.1.auto: Core Release: 4.00a (snpsid=4f54400a)
> [72891.088974] dwc2 dwc2.1.auto: Forcing mode to host
> [72891.100285] dwc2 dwc2.1.auto: Forcing mode to device
> [72891.112307] dwc2 dwc2.1.auto: Clearing force mode bits
> [72891.215275] dwc2 dwc2.1.auto: NonPeriodic TXFIFO size: 1024
> [72891.215278] dwc2 dwc2.1.auto: RXFIFO size: 2048
> ...

So what you really want from me is to boot the kernel with loglevel >= 7
, right ? See at the end.

> 2. Does your driver built for 'dual role device' or 'device only'?

Dual-role

> 3. First observation from register dumps: core in SOFT disconnect state, 
> which can be reason of observed issue. Could you please update your 
> patch and add only core_connect function call:
> 
> +	dwc2_hsotg_core_connect(hsotg);

Does not help.

>   	return 0;
> 
>   error4:
> 
> Or instead of patch, if you have any utility in system which will allow 
> from command line clear soft disconnect bit from DCTL register? Offset 
> of DCTL register is 0x804. SoftDiscon bit number is 1. Clear this bit 
> and then plug cable.

Clearing that bit with devmem allows the host PC to detect some
high-speed device got connected, but that's it, it does not detect it as
a gadget and no communication really happens.

> Unfortunately, currently I'm working from home and can't remotely 
> connect/disconnect cable in lab to try to reproduce observed by you issue.

Maybe you should consider using something like this in the lab:
https://www.ti.com/product/TS3USB30

[...]

 dwc2 49000000.usb-otg: mapped PA 49000000 to VA 473352f1
 dwc2 49000000.usb-otg: mapped PA 49000000 to VA 923761cb
 dwc2 49000000.usb-otg: supply vusb_d not found, using dummy regulator
 dwc2 49000000.usb-otg: supply vusb_a not found, using dummy regulator
 dwc2 49000000.usb-otg: registering common handler for irq48
 dwc2 49000000.usb-otg: dwc2_core_reset()
 dwc2 49000000.usb-otg: Core Release: 3.30a (snpsid=4f54330a)
 dwc2 49000000.usb-otg: Forcing mode to host
 dwc2 49000000.usb-otg: Waiting for host mode
 dwc2 49000000.usb-otg: Host mode set
 dwc2 49000000.usb-otg: Forcing mode to device
 dwc2 49000000.usb-otg: Waiting for device mode
 dwc2 49000000.usb-otg: Device mode set
 dwc2 49000000.usb-otg: Clearing force mode bits
 dwc2 49000000.usb-otg: NonPeriodic TXFIFO size: 32
 dwc2 49000000.usb-otg: RXFIFO size: 256
 dwc2 49000000.usb-otg: EPs: 9, dedicated fifos, 952 entries in SPRAM
 dwc2 49000000.usb-otg: bound driver zero
 dwc2 49000000.usb-otg: dwc2_hsotg_pullup: is_on: 1 op_state: 0
 dwc2 49000000.usb-otg: DCFG=0x08100000, DCTL=0x00000002, DIEPMSK=00000000
 dwc2 49000000.usb-otg: GAHBCFG=0x00000000, GHWCFG1=0x00000000
 dwc2 49000000.usb-otg: GRXFSIZ=0x00000400, GNPTXFSIZ=0x04000400
 dwc2 49000000.usb-otg: DPTx[1] FSize=1024, StAddr=0x00000800
 dwc2 49000000.usb-otg: DPTx[2] FSize=1024, StAddr=0x00000c00
 dwc2 49000000.usb-otg: DPTx[3] FSize=1024, StAddr=0x00001000
 dwc2 49000000.usb-otg: DPTx[4] FSize=1024, StAddr=0x00001400
 dwc2 49000000.usb-otg: DPTx[5] FSize=1024, StAddr=0x00001800
 dwc2 49000000.usb-otg: DPTx[6] FSize=1024, StAddr=0x00001c00
 dwc2 49000000.usb-otg: DPTx[7] FSize=1024, StAddr=0x00002000
 dwc2 49000000.usb-otg: DPTx[8] FSize=1024, StAddr=0x00002400
 dwc2 49000000.usb-otg: ep0-in: EPCTL=0x00008800, SIZ=0x00000000,
DMA=0x79daaf9d
 dwc2 49000000.usb-otg: ep0-out: EPCTL=0x00008000, SIZ=0x00000000,
DMA=0xa167db6c
 dwc2 49000000.usb-otg: ep1-in: EPCTL=0x00001000, SIZ=0x00000000,
DMA=0xccad1197
 dwc2 49000000.usb-otg: ep1-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x6c5b347c
 dwc2 49000000.usb-otg: ep2-in: EPCTL=0x00001800, SIZ=0x00000000,
DMA=0xf57293e7
 dwc2 49000000.usb-otg: ep2-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x503148ea
 dwc2 49000000.usb-otg: ep3-in: EPCTL=0x00002000, SIZ=0x00000000,
DMA=0x3c274fc5
 dwc2 49000000.usb-otg: ep3-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x9436577a
 dwc2 49000000.usb-otg: ep4-in: EPCTL=0x00002800, SIZ=0x00000000,
DMA=0xbe22b68d
 dwc2 49000000.usb-otg: ep4-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0xb09ae0de
 dwc2 49000000.usb-otg: ep5-in: EPCTL=0x00003000, SIZ=0x00000000,
DMA=0xa607065a
 dwc2 49000000.usb-otg: ep5-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0xa8b8774f
 dwc2 49000000.usb-otg: ep6-in: EPCTL=0x00003800, SIZ=0x00000000,
DMA=0xbabafad5
 dwc2 49000000.usb-otg: ep6-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x58d5e904
 dwc2 49000000.usb-otg: ep7-in: EPCTL=0x00004000, SIZ=0x00000000,
DMA=0x0b6900f3
 dwc2 49000000.usb-otg: ep7-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x8fbae0d9
 dwc2 49000000.usb-otg: ep8-in: EPCTL=0x00004800, SIZ=0x00000000,
DMA=0xa2c39aca
 dwc2 49000000.usb-otg: ep8-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0xe7b6ab62
 dwc2 49000000.usb-otg: DVBUSDIS=0x000017d7, DVBUSPULSE=000005b8
 dwc2 49000000.usb-otg: DWC OTG HCD INIT
 dwc2 49000000.usb-otg: hcfg=00100000
 dwc2 49000000.usb-otg: dwc2_core_init(370c19f5)
 dwc2 49000000.usb-otg: HS UTMI+ PHY selected
 dwc2 49000000.usb-otg: dwc2_core_reset()
 dwc2 49000000.usb-otg: Internal DMA Mode
 dwc2 49000000.usb-otg: Device Mode
 dwc2 49000000.usb-otg: DWC OTG Controller
 dwc2 49000000.usb-otg: new USB bus registered, assigned bus number 1
 dwc2 49000000.usb-otg: irq 48, io mem 0x49000000
 dwc2 49000000.usb-otg: DWC OTG HCD START
 dwc2 49000000.usb-otg: DWC OTG HCD EP RESET: bEndpointAddress=0x81
 dwc2 49000000.usb-otg: GetHubDescriptor
 dwc2 49000000.usb-otg: GetHubStatus
 dwc2 49000000.usb-otg: SetPortFeature
 dwc2 49000000.usb-otg:
 dwc2 49000000.usb-otg:
************************************************************
 dwc2 49000000.usb-otg: HCD State:
 dwc2 49000000.usb-otg:   Num channels: 16
 dwc2 49000000.usb-otg:   Channel 0:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 1:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 2:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 3:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 4:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 5:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 6:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 7:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 8:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 9:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 10:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 11:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 12:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 13:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 14:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   Channel 15:
 dwc2 49000000.usb-otg:     dev_addr: 0, ep_num: 0, ep_is_in: 0
 dwc2 49000000.usb-otg:     speed: 0
 dwc2 49000000.usb-otg:     ep_type: 0
 dwc2 49000000.usb-otg:     max_packet: 0
 dwc2 49000000.usb-otg:     data_pid_start: 0
 dwc2 49000000.usb-otg:     multi_count: 0
 dwc2 49000000.usb-otg:     xfer_started: 0
 dwc2 49000000.usb-otg:     xfer_buf: beb5cc16
 dwc2 49000000.usb-otg:     xfer_dma: 00000000
 dwc2 49000000.usb-otg:     xfer_len: 0
 dwc2 49000000.usb-otg:     xfer_count: 0
 dwc2 49000000.usb-otg:     halt_on_queue: 0
 dwc2 49000000.usb-otg:     halt_pending: 0
 dwc2 49000000.usb-otg:     halt_status: 0
 dwc2 49000000.usb-otg:     do_split: 0
 dwc2 49000000.usb-otg:     complete_split: 0
 dwc2 49000000.usb-otg:     hub_addr: 0
 dwc2 49000000.usb-otg:     hub_port: 0
 dwc2 49000000.usb-otg:     xact_pos: 0
 dwc2 49000000.usb-otg:     requests: 0
 dwc2 49000000.usb-otg:     qh: beb5cc16
 dwc2 49000000.usb-otg:   non_periodic_channels: 0
 dwc2 49000000.usb-otg:   periodic_channels: 0
 dwc2 49000000.usb-otg:   periodic_usecs: 0
 dwc2 49000000.usb-otg:   NP Tx Req Queue Space Avail: 8
 dwc2 49000000.usb-otg:   NP Tx FIFO Space Avail: 1024
 dwc2 49000000.usb-otg:   P Tx Req Queue Space Avail: 8
 dwc2 49000000.usb-otg:   P Tx FIFO Space Avail: 1024
 dwc2 49000000.usb-otg: Core Global Registers
 dwc2 49000000.usb-otg: GOTGCTL  @0xF0960000 : 0x00010000
 dwc2 49000000.usb-otg: GOTGINT  @0xF0960004 : 0x00000000
 dwc2 49000000.usb-otg: GAHBCFG  @0xF0960008 : 0x00000022
 dwc2 49000000.usb-otg: GUSBCFG  @0xF096000C : 0x00001400
 dwc2 49000000.usb-otg: GRSTCTL  @0xF0960010 : 0x80000000
 dwc2 49000000.usb-otg: GINTSTS  @0xF0960014 : 0x04000022
 dwc2 49000000.usb-otg: GINTMSK  @0xF0960018 : 0xD8000806
 dwc2 49000000.usb-otg: GRXSTSR  @0xF096001C : 0x00000000
 dwc2 49000000.usb-otg: GRXFSIZ  @0xF0960024 : 0x00000400
 dwc2 49000000.usb-otg: GNPTXFSIZ        @0xF0960028 : 0x04000400
 dwc2 49000000.usb-otg: GNPTXSTS         @0xF096002C : 0x00080400
 dwc2 49000000.usb-otg: GI2CCTL  @0xF0960030 : 0x00000000
 dwc2 49000000.usb-otg: GPVNDCTL         @0xF0960034 : 0x00000000
 dwc2 49000000.usb-otg: GGPIO    @0xF0960038 : 0x00600000
 dwc2 49000000.usb-otg: GUID     @0xF096003C : 0x00004000
 dwc2 49000000.usb-otg: GSNPSID  @0xF0960040 : 0x4F54330A
 dwc2 49000000.usb-otg: GHWCFG1  @0xF0960044 : 0x00000000
 dwc2 49000000.usb-otg: GHWCFG2  @0xF0960048 : 0x228FE150
 dwc2 49000000.usb-otg: GHWCFG3  @0xF096004C : 0x03B892E8
 dwc2 49000000.usb-otg: GHWCFG4  @0xF0960050 : 0xE3F00030
 dwc2 49000000.usb-otg: GLPMCFG  @0xF0960054 : 0x00000000
 dwc2 49000000.usb-otg: GPWRDN   @0xF0960058 : 0x00200010
 dwc2 49000000.usb-otg: GDFIFOCFG        @0xF096005C : 0x03B80400
 dwc2 49000000.usb-otg: HPTXFSIZ         @0xF0960100 : 0x00000000
 dwc2 49000000.usb-otg: PCGCTL   @0xF0960E00 : 0x00000000
 dwc2 49000000.usb-otg: Host Global Registers
 dwc2 49000000.usb-otg: HCFG     @0xF0960400 : 0x00100000
 dwc2 49000000.usb-otg: HFIR     @0xF0960404 : 0x000017D7
 dwc2 49000000.usb-otg: HFNUM    @0xF0960408 : 0x00000000
 dwc2 49000000.usb-otg: HPTXSTS  @0xF0960410 : 0x00080400
 dwc2 49000000.usb-otg: HAINT    @0xF0960414 : 0x00000000
 dwc2 49000000.usb-otg: HAINTMSK         @0xF0960418 : 0x00000000
 dwc2 49000000.usb-otg: HPRT0    @0xF0960440 : 0x00000000
 dwc2 49000000.usb-otg: Host Channel 0 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960500 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960504 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960508 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096050C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960510 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960514 : 0xA167DB6C
 dwc2 49000000.usb-otg: Host Channel 1 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960520 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960524 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960528 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096052C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960530 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960534 : 0x6C5B347C
 dwc2 49000000.usb-otg: Host Channel 2 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960540 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960544 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960548 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096054C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960550 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960554 : 0x503148EA
 dwc2 49000000.usb-otg: Host Channel 3 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960560 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960564 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960568 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096056C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960570 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960574 : 0x9436577A
 dwc2 49000000.usb-otg: Host Channel 4 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960580 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960584 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960588 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096058C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960590 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960594 : 0xB09AE0DE
 dwc2 49000000.usb-otg: Host Channel 5 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09605A0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09605A4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09605A8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09605AC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09605B0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09605B4 : 0xA8B8774F
 dwc2 49000000.usb-otg: Host Channel 6 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09605C0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09605C4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09605C8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09605CC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09605D0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09605D4 : 0x58D5E904
 dwc2 49000000.usb-otg: Host Channel 7 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09605E0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09605E4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09605E8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09605EC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09605F0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09605F4 : 0x8FBAE0D9
 dwc2 49000000.usb-otg: Host Channel 8 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960600 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960604 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960608 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096060C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960610 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960614 : 0xE7B6AB62
 dwc2 49000000.usb-otg: Host Channel 9 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960620 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960624 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960628 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096062C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960630 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960634 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 10 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960640 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960644 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960648 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096064C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960650 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960654 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 11 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960660 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960664 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960668 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096066C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960670 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960674 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 12 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF0960680 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF0960684 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF0960688 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF096068C : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF0960690 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF0960694 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 13 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09606A0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09606A4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09606A8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09606AC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09606B0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09606B4 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 14 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09606C0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09606C4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09606C8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09606CC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09606D0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09606D4 : 0x22F87FC6
 dwc2 49000000.usb-otg: Host Channel 15 Specific Registers
 dwc2 49000000.usb-otg: HCCHAR   @0xF09606E0 : 0x00000000
 dwc2 49000000.usb-otg: HCSPLT   @0xF09606E4 : 0x00000000
 dwc2 49000000.usb-otg: HCINT    @0xF09606E8 : 0x00000000
 dwc2 49000000.usb-otg: HCINTMSK         @0xF09606EC : 0x00000000
 dwc2 49000000.usb-otg: HCTSIZ   @0xF09606F0 : 0x00000000
 dwc2 49000000.usb-otg: HCDMA    @0xF09606F4 : 0x22F87FC6
 dwc2 49000000.usb-otg:
************************************************************
 dwc2 49000000.usb-otg:
 dwc2 49000000.usb-otg: gintsts=04000022  gintmsk=d8000806
 dwc2 49000000.usb-otg: GetPortStatus wIndex=0x0001 flags=0x00000000
 dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently in Device mode
 dwc2 49000000.usb-otg: dwc2_hsotg_irq: 04000020 00000000 (d8000806) retry 8
