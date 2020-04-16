Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB9C1ABDC6
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 12:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504804AbgDPKTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 06:19:13 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:34772 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504682AbgDPKSj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 06:18:39 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 492wCy0Vjvz1qrf8;
        Thu, 16 Apr 2020 12:18:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 492wCx74Rzz1qql0;
        Thu, 16 Apr 2020 12:18:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id DPywE5ePCED0; Thu, 16 Apr 2020 12:18:20 +0200 (CEST)
X-Auth-Info: O3pNTXW607WpWSosjX/1HYCfQQStNtFwDIZuogAnkLk=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 16 Apr 2020 12:18:20 +0200 (CEST)
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
Date:   Thu, 16 Apr 2020 11:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/15/20 5:10 PM, Minas Harutyunyan wrote:
> Hi,

Hi,

> On 4/15/2020 6:55 PM, Marek Vasut wrote:
>> On 4/15/20 10:37 AM, Minas Harutyunyan wrote:
>>> Hi,
>>>
>>> On 4/14/2020 4:18 PM, Marek Vasut wrote:
>>>> On 4/14/20 9:14 AM, Minas Harutyunyan wrote:
>>>
>>>>
>>>>> 2. debug log
>>>>
>>>> What kind of debug log ?
>>>>
>>> Drivers debug log starting from dwc2 loading and connector connecting to
>>> device, where issue seen.
>>
>> How do I enable the one you need ?
>>
> To enable debug prints from dwc2 use 'make menuconfig':
> 
>   Symbol: USB_DWC2_DEBUG [=y]

Oh, this one, OK. There you go.

Note that there is no further output when I plug in the USB microB cable
from a PC.

 dwc2 49000000.usb-otg: supply vusb_d not found, using dummy regulator
 dwc2 49000000.usb-otg: supply vusb_a not found, using dummy regulator
 dwc2 49000000.usb-otg: EPs: 9, dedicated fifos, 952 entries in SPRAM
 dwc2 49000000.usb-otg: bound driver zero
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
DMA=0x79daaf9c
 dwc2 49000000.usb-otg: ep0-out: EPCTL=0x00008000, SIZ=0x00000000,
DMA=0xa167db6c
 dwc2 49000000.usb-otg: ep1-in: EPCTL=0x00001000, SIZ=0x00000000,
DMA=0x88ad1397
 dwc2 49000000.usb-otg: ep1-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x6c5b357c
 dwc2 49000000.usb-otg: ep2-in: EPCTL=0x00001800, SIZ=0x00000000,
DMA=0xb4639367
 dwc2 49000000.usb-otg: ep2-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x503148e2
 dwc2 49000000.usb-otg: ep3-in: EPCTL=0x00002000, SIZ=0x00000000,
DMA=0x7e275f85
 dwc2 49000000.usb-otg: ep3-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x9474575a
 dwc2 49000000.usb-otg: ep4-in: EPCTL=0x00002800, SIZ=0x00000000,
DMA=0xbe22b68d
 dwc2 49000000.usb-otg: ep4-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0xb89ae0de
 dwc2 49000000.usb-otg: ep5-in: EPCTL=0x00003000, SIZ=0x00000000,
DMA=0xa607065a
 dwc2 49000000.usb-otg: ep5-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0xa8bc774f
 dwc2 49000000.usb-otg: ep6-in: EPCTL=0x00003800, SIZ=0x00000000,
DMA=0xbabafaf5
 dwc2 49000000.usb-otg: ep6-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x58ddeb04
 dwc2 49000000.usb-otg: ep7-in: EPCTL=0x00004000, SIZ=0x00000000,
DMA=0x8b6b00f3
 dwc2 49000000.usb-otg: ep7-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x87baf0d9
 dwc2 49000000.usb-otg: ep8-in: EPCTL=0x00004800, SIZ=0x00000000,
DMA=0xa2c3caca
 dwc2 49000000.usb-otg: ep8-out: EPCTL=0x00000000, SIZ=0x00000000,
DMA=0x67b6afe2
 dwc2 49000000.usb-otg: DVBUSDIS=0x000017d7, DVBUSPULSE=000005b8
 dwc2 49000000.usb-otg: DWC OTG Controller
 dwc2 49000000.usb-otg: new USB bus registered, assigned bus number 1
 dwc2 49000000.usb-otg: irq 45, io mem 0x49000000
 dwc2 49000000.usb-otg: Mode Mismatch Interrupt: currently in Device mode
