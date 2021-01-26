Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71D4304CA7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 23:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730630AbhAZWvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 17:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387608AbhAZRte (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 12:49:34 -0500
Received: from mout0.freenet.de (mout0.freenet.de [IPv6:2001:748:100:40::2:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25649C061786
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 09:48:39 -0800 (PST)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
        by mout0.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l4SSB-0004iX-LS; Tue, 26 Jan 2021 18:48:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OzP4itTO16AvZnvr2urYsNT+T4IblfL/SLc5lkWulNc=; b=I5isZUg0RW2JESXPTaRAPUpCU1
        /T2vA2VPIcm73sTzHd6dudTWWSRI1g8FTmKmNu6R7BFHk3xUhpYBggFtn5i/hlYxziK68sRYC21BN
        o5E5oUIJl7oysx4b2Lk1ILD1n4zGB2RAo11PBUiZoGuZhmaxees7DhrOiRYxsicrBtzJ8tC0i9BBD
        um+ISD4QQMYBVMYZn0c77A0FGKdvIKIB2L6Xm03KBWbuVrBK6yH6/zvH6nYtjq1vJNmKg0KJnnfLx
        1k8ME5iF1ITS2qrOykRvMtoiI6JPIxeZWkLeCp3ZGVXneUU7jyYMbfEMva9soMXA6jXhT6AlBu4bA
        h3tFd3kw==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:44250 helo=mail.maya.org)
        by sub2.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l4SSB-0002SL-G8; Tue, 26 Jan 2021 18:48:35 +0100
Received: internal info suppressed
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
 <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
 <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
 <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
From:   Andreas Hartmann <andihartmann@01019freenet.de>
Message-ID: <98a22dee-259d-9246-3ca6-862af2bcf62d@01019freenet.de>
Date:   Tue, 26 Jan 2021 18:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!44250
X-FNSign: v=2 s=1ED5436809F8B8FAC5238C28A59F840AAB7718308A174E046D4F99F8A199EE0E
X-Scan-TS: Tue, 26 Jan 2021 18:48:35 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Mathias,

I'll test it ASAP!

Thanks
Andreas

On 26.01.21 at 18:29 Mathias Nyman wrote:
> 
>>> I'm not sure if it's important for you to know: The driver doesn't use struct scatterlist or num_mapped_sgs at all (if it's meant to be used by the sender at all).
>>>
>>> But it sets URB_NO_TRANSFER_DMA_MAP (for data transfer among others).
>>>
>>> Mlme packets are sent w/o bulk and w/o setting URB_NO_TRANSFER_DMA_MAP. All other packets are sent with URB_NO_TRANSFER_DMA_MAP turned on.
>>>
>>
>> Ok, thanks, I see what's going on here.
>>
>> Short recap of xhci alignment requirements.
>> 1. Data pointed to by a transfer request block (TRB) may not span 64k boundary
>> 2. If a transfer contains several TRBs, and spans over two TRB ringbuffer
>>    segments, then the sum of the TRB data in the first segment must be a 
>>    multiple of max packets in size.
>>  
>> Code assumes that if transfer is split into several blocks,(TRBs) and a block
>> in the middle of a transfer is smaller than max packet size, then it must be sg list.
>>
>> But this is not necessarily the case if data was already DMA mapped beforehand.
>> Data might start just before a 64k boundary, causing first TRB to be less than
>> packet size.
>>
>> I'll start implementing a fix for this.
> 
> Got a first iteration ready,
> any change you could try it out?
> 
> Thanks
> -Mathias
> 
> 8<---
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 5677b81c0915..8df30618aaf1 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -699,11 +699,16 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
>  	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
>  			 DMA_FROM_DEVICE);
>  	/* for in tranfers we need to copy the data from bounce to sg */
> -	len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
> -			     seg->bounce_len, seg->bounce_offs);
> -	if (len != seg->bounce_len)
> -		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
> -				len, seg->bounce_len);
> +	if (urb->num_sgs) {
> +		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
> +					   seg->bounce_len, seg->bounce_offs);
> +		if (len != seg->bounce_len)
> +			xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
> +				  len, seg->bounce_len);
> +	} else {
> +		memcpy(urb->transfer_buffer + seg->bounce_offs, seg->bounce_buf,
> +		       seg->bounce_len);
> +	}
>  	seg->bounce_len = 0;
>  	seg->bounce_offs = 0;
>  }
> @@ -3275,12 +3280,16 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
>  
>  	/* create a max max_pkt sized bounce buffer pointed to by last trb */
>  	if (usb_urb_dir_out(urb)) {
> -		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
> -				   seg->bounce_buf, new_buff_len, enqd_len);
> -		if (len != new_buff_len)
> -			xhci_warn(xhci,
> -				"WARN Wrong bounce buffer write length: %zu != %d\n",
> -				len, new_buff_len);
> +		if (urb->num_sgs) {
> +			len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
> +						 seg->bounce_buf, new_buff_len, enqd_len);
> +			if (len != new_buff_len)
> +				xhci_warn(xhci, "WARN Wrong bounce buffer write length: %zu != %d\n",
> +					  len, new_buff_len);
> +		} else {
> +			memcpy(seg->bounce_buf, urb->transfer_buffer + enqd_len, new_buff_len);
> +		}
> +
>  		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
>  						 max_pkt, DMA_TO_DEVICE);
>  	} else {
> 
