Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7EF305366
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 07:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbhA0GrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 01:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbhA0Gok (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 01:44:40 -0500
Received: from mout2.freenet.de (mout2.freenet.de [IPv6:2001:748:100:40::2:4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8079CC061574
        for <linux-usb@vger.kernel.org>; Tue, 26 Jan 2021 22:43:44 -0800 (PST)
Received: from [195.4.92.121] (helo=sub2.freenet.de)
        by mout2.freenet.de with esmtpa (ID andihartmann@freenet.de) (port 25) (Exim 4.92 #3)
        id 1l4eYI-0006O4-AU; Wed, 27 Jan 2021 07:43:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=01019freenet.de; s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HTdOL3bffWSCKVGN3xfeR2xKG1neUy9MUHw1rP6F/gM=; b=Gir1i7NvJX9aEvboOm+7mDJHmx
        aWkz/Ujyl+SN2Nj927rUfA/+HBodj7eUaSc9kApYrcCftAy5ZLKYcmLB6dHn6x10/7nlgb+6+7Aj9
        K5E6FDf1oXAAEM44HB2zJzpqPQEHC1dvLgn0pDOWxBzXE47Y2N7qdtQwHnVbHad16oH+PAdLUSY7w
        WNwyeZws6uLrFJZb0aU7yqe3a9Hcqep1dqEpfBMWPovXk/pa24/+aCqpLfo2cbGxrMV7kMGMo3dFR
        aDhIQAUtR+Hpo2YGHKbP13Aj54gtyMY9TBbaQ3V8q6k9wrjwm0walMhELmbDdIRdHgv+TSPvx7qYN
        ab6ozq3Q==;
Received: from p200300de573c8400505400fffe15ac42.dip0.t-ipconnect.de ([2003:de:573c:8400:5054:ff:fe15:ac42]:43206 helo=mail.maya.org)
        by sub2.freenet.de with esmtpsa (ID andihartmann@freenet.de) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (port 465) (Exim 4.92 #3)
        id 1l4eYI-0004WV-6b; Wed, 27 Jan 2021 07:43:42 +0100
Received: internal info suppressed
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
From:   Andreas Hartmann <andihartmann@01019freenet.de>
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
 <de0cab7e-6e25-fe80-b1d7-d50f63d6e54c@01019freenet.de>
Message-ID: <9c3c9dd7-bcfb-785c-8c11-39f78a7fca01@01019freenet.de>
Date:   Wed, 27 Jan 2021 07:43:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <de0cab7e-6e25-fe80-b1d7-d50f63d6e54c@01019freenet.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originated-At: 2003:de:573c:8400:5054:ff:fe15:ac42!43206
X-FNSign: v=2 s=FA0D006599A184899097A525CFB72AA9AF1F6638F0CD7AD4933D210D432B3447
X-Scan-TS: Wed, 27 Jan 2021 07:43:42 +0100
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.01.21 at 22:16 Andreas Hartmann wrote:
> Hello Mathias!
> 
> On 26.01.21 at 18:29 Mathias Nyman wrote:
>> Got a first iteration ready,
>> any change you could try it out?
>>
>> Thanks
>> -Mathias
>>
>> 8<---
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 5677b81c0915..8df30618aaf1 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -699,11 +699,16 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
>>  	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
>>  			 DMA_FROM_DEVICE);
>>  	/* for in tranfers we need to copy the data from bounce to sg */
>> -	len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
>> -			     seg->bounce_len, seg->bounce_offs);
>> -	if (len != seg->bounce_len)
>> -		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
>> -				len, seg->bounce_len);
>> +	if (urb->num_sgs) {
>> +		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
>> +					   seg->bounce_len, seg->bounce_offs);
>> +		if (len != seg->bounce_len)
>> +			xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
>> +				  len, seg->bounce_len);
>> +	} else {
>> +		memcpy(urb->transfer_buffer + seg->bounce_offs, seg->bounce_buf,
>> +		       seg->bounce_len);
>> +	}
>>  	seg->bounce_len = 0;
>>  	seg->bounce_offs = 0;
>>  }
>> @@ -3275,12 +3280,16 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
>>  
>>  	/* create a max max_pkt sized bounce buffer pointed to by last trb */
>>  	if (usb_urb_dir_out(urb)) {
>> -		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
>> -				   seg->bounce_buf, new_buff_len, enqd_len);
>> -		if (len != new_buff_len)
>> -			xhci_warn(xhci,
>> -				"WARN Wrong bounce buffer write length: %zu != %d\n",
>> -				len, new_buff_len);
>> +		if (urb->num_sgs) {
>> +			len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
>> +						 seg->bounce_buf, new_buff_len, enqd_len);
>> +			if (len != new_buff_len)
>> +				xhci_warn(xhci, "WARN Wrong bounce buffer write length: %zu != %d\n",
>> +					  len, new_buff_len);
>> +		} else {
>> +			memcpy(seg->bounce_buf, urb->transfer_buffer + enqd_len, new_buff_len);
>> +		}
>> +
> 
> If I'm understanding it correctly, you're always creating a bounce
> buffer though it is not necessary (at least in my case - my test patch
> proofed, that no changes at all are necessary). Why aren't you checking
> for URB_NO_TRANSFER_DMA_MAP at the very beginning? Or is it your purpose
> to first basically test your new code path? That would be ok.
> 
> I tested with the notebook (in both directions) - it seems to work - I
> didn't get any problems though I used 24 kB bulk packets. Throughput was
> unaltered high.
> 
> I'm doing the same test tomorrow with the other USB 3.1 controller!

Successfully tested on the other USB 3.1 host.

> 
>>  		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
>>  						 max_pkt, DMA_TO_DEVICE);
>>  	} else {
>>
> 
> Thanks
> Andreas
> 

