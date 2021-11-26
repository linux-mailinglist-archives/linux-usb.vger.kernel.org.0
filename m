Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B08C45E9B6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 09:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353737AbhKZI6u (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 03:58:50 -0500
Received: from cable.insite.cz ([84.242.75.189]:40944 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1359647AbhKZI4u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 03:56:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 27EA3A1A3D401;
        Fri, 26 Nov 2021 09:53:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637916816; bh=1oc2o/RqPq5O5K6LXQps+Ixo5+kQcVERmSYd38YKpBs=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=saO0mraQxD8xdIyLgjimcGRZeco+miQ/bDIxg1kojLaNeMCmu+qGRGM9PWyb9A+v4
         PcUL5GsLACz3BAQmSTIiEcKRuWMYeLG0MhU4eg2MXnWBzt+EHHSEmPn9B/BibevhgM
         3xAnUKFezMsaYVFHVYkVzdHHeDv8LoZEyW0Sw0UY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oTzwXzJu1qSQ; Fri, 26 Nov 2021 09:53:36 +0100 (CET)
Received: from [192.168.100.21] (unknown [192.168.100.21])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id F12D7A1A3D400;
        Fri, 26 Nov 2021 09:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1637916815; bh=1oc2o/RqPq5O5K6LXQps+Ixo5+kQcVERmSYd38YKpBs=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=o4XmFvdU78vZ/L53ssjWi1nCdCcXV5nMPWaYqZIvsr9PegX389NRXnnuN75YWhTxd
         KRiNK9dGdAAbBstscdeqMOZtBZAX2am9XsBXiyrsK5VyezrqZPc9IMwpeZT2LOdbW8
         HQLauJRl+zhq4jC9eNGmbx23BF4J4CDFpNviNsV8=
Subject: Re: usb: dwc2: gadget: high-bandwidth (mc > 1) status?
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <ea4697fd-8911-3f79-540b-a03214678ccd@ivitera.com>
 <d129d6de-3447-f51f-356a-0589971f9cae@synopsys.com>
 <125ee133-be26-7591-7111-5e945fe4a411@ivitera.com>
 <61f1aa1e-89c0-2f11-1619-becac6f41997@synopsys.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <7254ba8c-af76-2d6a-c896-ac2a3509630c@ivitera.com>
Date:   Fri, 26 Nov 2021 09:53:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <61f1aa1e-89c0-2f11-1619-becac6f41997@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: cs-CZ
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 26. 11. 21 v 7:35 Minas Harutyunyan napsal(a):
> Hi Pavel,
> 
> On 11/25/2021 12:47 PM, Pavel Hofman wrote:
>>
>>
>> Dne 24. 11. 21 v 15:04 Minas Harutyunyan napsal(a):
>>> Hi Pavel,
>>>
>>> On 11/24/2021 11:39 AM, Pavel Hofman wrote:
>>>> Hi Minas at all,
>>>>
>>>> Please does dwc2 (specifically in BCM2835/RPi) support HS ISOC multiple
>>>> transactions mc > 1 reliably? I found this condition
>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/usb/dwc2/gadget.c*L4041__;Iw!!A4F2R9G_pg!MMNE6CYvWEFeWt8W9pImwNA-N4_04U8UsBWQmu9O9Bwq1HalCAupyb9kzGBAOOMlKmt6xefz$
>>>>
>>>>
>>>>        /* High bandwidth ISOC OUT in DDMA not supported */
>>>>        if (using_desc_dma(hsotg) && ep_type == USB_ENDPOINT_XFER_ISOC &&
>>>>            !dir_in && mc > 1) {
>>>>            dev_err(hsotg->dev,
>>>>                "%s: ISOC OUT, DDMA: HB not supported!\n", __func__);
>>>>            return -EINVAL;
>>>>        }
>>>>
>>>> But I do not know how the Descriptor DMA is critical and whether
>>>> disabling it will affect gadget performance seriously.
>>>>
>>>> I know about the RX FIFO sizing requirement (and TX FIFO too I guess),
>>>> the current default values can be increased for that particular use case
>>>> if needed.
>>>>
>>>> I am trying to learn if it made sense to spend time on adding support
>>>> for high-bandwidth to the UAC2 audio gadget  to allow using larger
>>>> bInterval and mc=2,3 at high samplerates/channel counts (sort of "burst
>>>> mode" similar to UAC3). When doing some CPU-demanding DSP it would help
>>>> to avoid the time-critical handling every 125us microframe. Both OUT and
>>>> IN are important.
>>>>
>>>
>>> According programming guide:
>>>
>>> "Isochronous OUT Transfers
>>> The application programming for isochronous out transfers is in the same
>>> manner as Bulk OUT transfer sequence, except that the application
>>> creates only 1 packet per descriptor for an isochronous OUT endpoint.
>>> The controller handles isochronous OUT transfers internally in the same
>>> way it handles Bulk OUT transfers, and as depicted in Figure 10-28.
>>> If the transfers are for a high-bandwidth endpoint (more than one MPS
>>> per μframe ), create as many descriptors as the number of packets in a
>>> μframe (number of descriptors = number of packets per μframe).
>>> Maximum number of descriptors per μframe per endpoint is three."
>>>
>>> To program descriptors to start HB ISOC OUT there are no any problem.
>>> Problem occurs on completions. If, for example mc > 1, driver will
>>> allocate and program mc * (request count) descriptors. If host send mc
>>> packets per frame then every mc descriptor perform request completion is
>>> not big problem. But if host will send less than mc packets in frame
>>> then not clear how to exclude unused descriptors from desc chain which
>>> already fetched by core - by stop transfers (disable EP) and re-start
>>> transfers (fill again desc chain) from next frame? Or purge unused descs
>>> and shifting descriptors "up" in a chain? You can try to implement.
>>
>> Hi Minas, thanks for your hints. Unfortunately I am pretty new to dwc2,
>> please can you point me to particular parts of the dwc2 code?
>>
>> I found some dwc2 description which reads your quote in
>> https://urldefense.com/v3/__https://www.mouser.cn/datasheet/2/196/Infineon-xmc4500_rm_v1.6_2016-UM-v01_06-EN-598157.pdf__;!!A4F2R9G_pg!Jg2wfkRUfyO2jrnLXmO7zO5W0Esw-TTgETCTe5mqtpub1mAmDY7QnixT8HmYyTp0rb_ac7Ot$
>> (not for BCM2835 but hopefully the principle is similar). IIUC by
>> descriptor the struct dwc2_dma_decs is meant.
>>
> Yes, descriptors declared in dwc2 as dwc2_dma_desc.
> 
>> I found a function gadget.c:dwc2_gadget_fill_isoc_desc which is called
>> in dwc2_gadget_start_isoc_ddma and dwc2_hsotg_ep_queue. Is the code
>> after the /* High bandwidth ISOC OUT in DDMA not supported */ comment in
>> gadget.c:dwc2_hsotg_ep_enable() because the dwc2 core (the hardware)
>> does not support HB in DDMA, or because the linux dwc2 driver does not
>> implement the HB support in DDMA yet (which is what we are talking about)?
> HW supports HB ISOC OUT in DDMA, driver doesn't support. In mentioned by
> you databook, see chapter "16.11.3.2 Isochronous OUT".
>>
>> I am asking because if the HW did not support DDMA, the method
>> dwc2_gadget_start_isoc_ddma would be out of game for my analysis, right?
>> If the latter is the case, should the HB support implementation change
>> dwc2_gadget_start_isoc_ddma?
>>
> To support HB ISOC OUT should be updated dwc2_gadget_fill_isoc_desc()
> and dwc2_gadget_complete_isoc_request_ddma() functions.
> 
>> Please can you explain a bit more the issue about the unused
>> descriptors? This is how I understand it (poorly). The driver prepares
>> descriptors for all mc required by the transfer (and reported by
>> wMaxPacketSize to the host) so that the core (HW) can fill it via DMA.
>> However, if the host does not need the whole packet size, it will send
>> fewer packets per frame, and some of the dwc2_dma_decs descriptors would
>> not be filled with data = unused. The core (HW) somehow marks the
>> descriptors whether they were used or not, and the unused descriptors
>> (i.e. containing old/bogus data) should not undergo completion somehow.
> Core doesn't mark unused descriptors.
> Driver can detect that it is last packet in frame by checking DPID. If
> DPID is DATA0 then it's last packet in frame and need to complete
> appropriate usb request.
> After completion of descriptor, core will process next descriptor which
> is prepared for just completed usb request but not for next request (at
> least from "buffer addresses" point of view).
> In case if packet count sent by host in frame less than mc, driver
> should exclude remaining descs for completed usb request from descriptor
> list by "shifting up" descs in descriptor list. But I'm not sure that
> driver have enough time to do that before core fetch next descriptor,
> which should be already updated (at least "buffer address" should be
> point to address for next usb request).
> 
>> But this sounds too simple, not what you described in your post :-)
>>
>> Also, please when are completion interrupt requests thrown at ISOC OUT?
>> After every packet=desc, or after the whole USB frame (i.e. after all 3
>> packets in case of mc=3)? If after every packet, the HB mode with larger
>> bInterval (less frequent frames with multiple packets) would not spare
>> any interrupts/CPU load compared to more frequent frames with single
>> packets (no HB mode) and adding the HB ISOC support would "only" allow
>> higher ISOC bandwidth, not CPU load reduction. What is the case, please?
> Completion interrupt asserted on the end of descriptor processing, if
> IOC (Interrupt on completion) bit is set. For HB ISOC OUT this bit
> should be set on all descriptors.
>>

Minas, thanks for your expert answer. Just a quick question regarding 
your previous paragraph - does it mean that ISOC OUT with mc=2 at 
bInterval=2 yields 8k completion IRQs, just like with mc=1 at 
bInterval=1? If so, no real CPU workload would be spared by implementing 
the HB support.

Is there any chance to complete all descriptors filled in one frame with 
one IRQ, by setting the IOC bit only to the last descriptor? IIUC that 
would cause issues when the host does not send data for all descriptors 
"prepared" by the gadget (as discussed above) but IMO that could be 
handled somehow (host would likely not change the number of transactions 
within one continuous stream, gadget could "estimate" how many 
transactions would be used by the host for the particular altsetting). 
Just trying to find if any way to reduce the IRQs is possible :-)

Thanks a lot! Best regards,

Pavel.
