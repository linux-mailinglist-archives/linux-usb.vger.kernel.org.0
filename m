Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C2E45D676
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 09:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352435AbhKYIwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 03:52:36 -0500
Received: from cable.insite.cz ([84.242.75.189]:60097 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349273AbhKYIuf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 03:50:35 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 757AFA1A3D401;
        Thu, 25 Nov 2021 09:47:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637830041; bh=ofzEnBBD7XdEQglPJfEBtqTsDUtQAf/xbcjJC/dwHxE=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=Yr6+iizCxW1OR/PJn+YTvn4pzySXfgNg62Ob4rTeywXXx2AUC5hEDnwYcQ78527SZ
         12wTZPjWupULl1mqeBN1wtnhzd8CZC0kwRRf/4KWd9c/ttWpjuxBs92ADz0vqjOSe8
         PxbtAMVS51NA8+bgZ+NsgBct7vflBYa6ZQQDoeZU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cWBZkl1iaKW0; Thu, 25 Nov 2021 09:47:15 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 69DA5A1A3D400;
        Thu, 25 Nov 2021 09:47:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637830035; bh=ofzEnBBD7XdEQglPJfEBtqTsDUtQAf/xbcjJC/dwHxE=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=R2Yv2XuBUGjE9YArOluaM2wgQIDKxpBSW3qrJqmkbgKX4uf3S2wsLt4hRhGEJEP/R
         OVGG5kj51d/Xky2OTGM9fTAXShH6M3ilrLN84Iju4gxSU6kWIGiGNFo3fUQj76sw18
         f4E2n3ir3Nz+JEOxmO4zNyj0NOnMaAtds+zQ1XSI=
Subject: Re: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
 <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <125ee133-be26-7591-7111-5e945fe4a411@ivitera.com>
Date:   Thu, 25 Nov 2021 09:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Dne 24. 11. 21 v 15:04 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> On 11/24/2021 11:39 AM, Pavel Hofman wrote:
>> Hi Minas at all,
>>
>> Please does dwc2 (specifically in BCM2835/RPi) support HS ISOC multiple
>> transactions mc > 1 reliably? I found this condition
>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/usb/dwc2/gadget.c*L4041__;Iw!!A4F2R9G_pg!MMNE6CYvWEFeWt8W9pImwNA-N4_04U8UsBWQmu9O9Bwq1HalCAupyb9kzGBAOOMlKmt6xefz$
>>
>>       /* High bandwidth ISOC OUT in DDMA not supported */
>>       if (using_desc_dma(hsotg) && ep_type == USB_ENDPOINT_XFER_ISOC &&
>>           !dir_in && mc > 1) {
>>           dev_err(hsotg->dev,
>>               "%s: ISOC OUT, DDMA: HB not supported!\n", __func__);
>>           return -EINVAL;
>>       }
>>
>> But I do not know how the Descriptor DMA is critical and whether
>> disabling it will affect gadget performance seriously.
>>
>> I know about the RX FIFO sizing requirement (and TX FIFO too I guess),
>> the current default values can be increased for that particular use case
>> if needed.
>>
>> I am trying to learn if it made sense to spend time on adding support
>> for high-bandwidth to the UAC2 audio gadget  to allow using larger
>> bInterval and mc=2,3 at high samplerates/channel counts (sort of "burst
>> mode" similar to UAC3). When doing some CPU-demanding DSP it would help
>> to avoid the time-critical handling every 125us microframe. Both OUT and
>> IN are important.
>>
> 
> According programming guide:
> 
> "Isochronous OUT Transfers
> The application programming for isochronous out transfers is in the same
> manner as Bulk OUT transfer sequence, except that the application
> creates only 1 packet per descriptor for an isochronous OUT endpoint.
> The controller handles isochronous OUT transfers internally in the same
> way it handles Bulk OUT transfers, and as depicted in Figure 10-28.
> If the transfers are for a high-bandwidth endpoint (more than one MPS
> per μframe ), create as many descriptors as the number of packets in a
> μframe (number of descriptors = number of packets per μframe).
> Maximum number of descriptors per μframe per endpoint is three."
> 
> To program descriptors to start HB ISOC OUT there are no any problem.
> Problem occurs on completions. If, for example mc > 1, driver will
> allocate and program mc * (request count) descriptors. If host send mc
> packets per frame then every mc descriptor perform request completion is
> not big problem. But if host will send less than mc packets in frame
> then not clear how to exclude unused descriptors from desc chain which
> already fetched by core - by stop transfers (disable EP) and re-start
> transfers (fill again desc chain) from next frame? Or purge unused descs
> and shifting descriptors "up" in a chain? You can try to implement.

Hi Minas, thanks for your hints. Unfortunately I am pretty new to dwc2, 
please can you point me to particular parts of the dwc2 code?

I found some dwc2 description which reads your quote in 
https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf 
(not for BCM2835 but hopefully the principle is similar). IIUC by 
descriptor the struct dwc2_dma_decs is meant.

I found a function gadget.c:dwc2_gadget_fill_isoc_desc which is called 
in dwc2_gadget_start_isoc_ddma and dwc2_hsotg_ep_queue. Is the code 
after the /* High bandwidth ISOC OUT in DDMA not supported */ comment in 
gadget.c:dwc2_hsotg_ep_enable() because the dwc2 core (the hardware) 
does not support HB in DDMA, or because the linux dwc2 driver does not 
implement the HB support in DDMA yet (which is what we are talking about)?

I am asking because if the HW did not support DDMA, the method 
dwc2_gadget_start_isoc_ddma would be out of game for my analysis, right? 
If the latter is the case, should the HB support implementation change 
dwc2_gadget_start_isoc_ddma?

Please can you explain a bit more the issue about the unused 
descriptors? This is how I understand it (poorly). The driver prepares 
descriptors for all mc required by the transfer (and reported by 
wMaxPacketSize to the host) so that the core (HW) can fill it via DMA. 
However, if the host does not need the whole packet size, it will send 
fewer packets per frame, and some of the dwc2_dma_decs descriptors would 
not be filled with data = unused. The core (HW) somehow marks the 
descriptors whether they were used or not, and the unused descriptors 
(i.e. containing old/bogus data) should not undergo completion somehow. 
But this sounds too simple, not what you described in your post :-)

Also, please when are completion interrupt requests thrown at ISOC OUT? 
After every packet=desc, or after the whole USB frame (i.e. after all 3 
packets in case of mc=3)? If after every packet, the HB mode with larger 
bInterval (less frequent frames with multiple packets) would not spare 
any interrupts/CPU load compared to more frequent frames with single 
packets (no HB mode) and adding the HB ISOC support would "only" allow 
higher ISOC bandwidth, not CPU load reduction. What is the case, please?

Thanks a lot,

Pavel.
