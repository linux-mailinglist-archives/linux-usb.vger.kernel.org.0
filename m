Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF481EF6F8
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jun 2020 14:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgFEMDc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Jun 2020 08:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgFEMDc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Jun 2020 08:03:32 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646E5C08C5C2
        for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2020 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=y9ittHD8YGkkU5m8rej1IvZl7iF631YkkM7rL3cbOmo=; b=N3dmvrDSvACLFkXDo0XEdH5ECv
        5S92bmVvwop0EGyMT2H2ivIpjEL1Kme+o1x2U7JpxQ0561FIlzDxrB0oai0SwmzntTmlGXvU75f6O
        2Qi1LIEhomZ/bo0ZvVWrfd21PIcY4w6xTWoIW8Pb7KBy72LCFpzJ6QqSFaORCLG1/ZKMfMBb/9fIe
        dh+CP1CuBE4Q/ErXvEcd420XOfRDgB0eQLf5qNEgv67eJBDqy0dcZyuMgy2C9rcSgdFxx8EFD8tQX
        KZ7oNSV/Moei6fe6opg17pViybRsd/sdewkm72viu/jsPmRm1EoB3Y+3rD8HrmPxlFrNgdqdQFiBO
        2Q4uXPtQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:63447 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jhB4K-0003C5-RJ; Fri, 05 Jun 2020 14:03:28 +0200
Subject: Re: [PATCH v3 4/6] drm: Add Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200529175643.46094-5-noralf@tronnes.org>
 <20200529224531.22261.qmail@stuge.se>
 <614b0b0d-44d7-22e5-339d-cb8a13b426ac@tronnes.org>
 <20200602001207.17171.qmail@stuge.se>
 <20200602023254.GB15540@rowland.harvard.edu>
 <20200602052150.1505.qmail@stuge.se>
 <20200602152700.GB31640@rowland.harvard.edu>
 <20200602183838.29988.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <d3d047a1-8e71-e937-36a3-f1f458b7edf5@tronnes.org>
Date:   Fri, 5 Jun 2020 14:03:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602183838.29988.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Den 02.06.2020 20.38, skrev Peter Stuge:
> Alan Stern wrote:
>>>> A gadget driver can STALL in response to a control-OUT data packet,
>>>> but only before it has seen the packet.
>>>
>>> How can it do that for OUT, and IN if possible there too?
>>
>> In the way described just above: The gadget driver's SETUP handler tells 
>> the UDC to stall the data packet.
>>
>>> Is it related to f->setup() returning < 0 ?
>>
>> Yes; the composite core interprets such a value as meaning to STALL 
>> endpoint 0.
> 
> Thanks a lot for confirming this.
> 
> 
>>> The spec also allows NAK, but the gadget code seems to not (need to?)
>>> explicitly support that. Can you comment on this as well?
>>
>> If the gadget driver doesn't submit a usb_request then the UDC will 
>> reply with NAK.
> 
> And thanks for this as well.
> 
> 
>>> a status request so I can know the result of the operation the device has
>>> performed.
> ..
>> There are two reasonable approaches you could use.  One is to have a 
>> vendor-specific control request to get the result of the preceding 
>> operation.
> ..
>> The other approach is to send the status data over a bulk-IN endpoint.
> 
> I've tried to explain a third approach, which I think fits well because the
> status is only a "Ready" flag - ie. a memory barrier or flow control,
> to make the host not send data OUT.
> 
> I'm proposing that the gadget should NAK on data OUT when it isn't Ready, and
> that the host driver shouldn't query status but simply send data when it has.
> 
> Per Alans description the NAK happens automatically if the gadget driver has
> no usb_request pending while it is processing previously received data.
> 
> On the host that NAK makes the host controller retry automatically until
> transfer success, timeout or fatal error.
> 
> 
>> It would have to be formatted in such a way that the host could 
>> recognize it as a status packet and not some other sort of data packet.
> 
> For host notification of status changes other than Ready I really like
> such an IN endpoint, but preferably an interrupt endpoint.
> 
> To avoid the formatting problem each data packet could be one full status
> message. That way the host would always receive a known data structure.
> Interrupt packets can be max 64 byte. Noralf, do you think that's enough
> for everyone in the first version?
> 

I'm going through some treatment that turned out to be worse than
expected, so sadly I have to put this project on hold until my body
recovers.

Noralf.
