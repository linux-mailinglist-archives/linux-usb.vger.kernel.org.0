Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CA32C65C4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 13:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbgK0McY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 07:32:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28470 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725865AbgK0McX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 07:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606480341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vgD9plq621YFrh/85hD2gFfX5Qu42WsynNUQn9WpglY=;
        b=SFnEEyNd7fPP1Jt3r+VwqBNbL74mIvmA6sm/h9XgoTxxtjt4IMrbLUsXCwBOdbkM1yFIXV
        +rsBXBDhYYw6K3OpnHk4zbWr5nWFN2qGGEGfoiT5dy8bM7R4HZKoi7yiUTiL5J5cGm4BMG
        +qDdyQDQqdX2pwJrSlTo8G8pH2lwhvI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-MaD0SipeNE6BNe1gxcX5dg-1; Fri, 27 Nov 2020 07:32:20 -0500
X-MC-Unique: MaD0SipeNE6BNe1gxcX5dg-1
Received: by mail-ed1-f70.google.com with SMTP id i89so2371589edd.15
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2020 04:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vgD9plq621YFrh/85hD2gFfX5Qu42WsynNUQn9WpglY=;
        b=SIUbCm4HzkM7hJgbIJlWmM7s5IQS/IgOx7gqMph2qwBVPVDN0/8KgUfbzwCMiuQUYo
         iRji26D+Lxn7bWgnBNGjIY3CKJXZuB/WUPRiJCSCXb0LJvjsIpf1RMdkOn/VDl2I8z9s
         dsyI6M3yXshjhti78mk9J3o6qqmCj/p81hhlUdeDSSLi36PxvVxp5pujO92EGigiOmG6
         OOjZWt+gDgJA67r7TwD30swVK02BbHkAIOOM5wqLCV9yCbFTZof2VTiIW21UQfKZfhug
         7lJS+5+VbcRYbvOlB90OLv0T1p5ZX3lFGEM5XBS0GvuDEyqgK/HrJyPeJh7D30Mm68pe
         BE1w==
X-Gm-Message-State: AOAM533Io9YKnUVJbMugdSvp5n0W+b/p3k56o/AV3nHalxzfl5rXKXMO
        zSlzyI4BM9UU8u4otQ0fKbCh+u8/hQkb9Ua7gf8n1O+lYMPAvUr2luSZf4iVdxDu2N74riglqSZ
        ypWp4EvpZMcCvLoWA4k4c
X-Received: by 2002:a17:906:d72:: with SMTP id s18mr7550988ejh.110.1606480338746;
        Fri, 27 Nov 2020 04:32:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzswkthL+dVODt3r5/cel2hWYn3+uxZ8H99F6VkwkE9DWi/svHvotLzBV3F5wAtGt/CKP78EA==
X-Received: by 2002:a17:906:d72:: with SMTP id s18mr7550966ejh.110.1606480338504;
        Fri, 27 Nov 2020 04:32:18 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h9sm4763517ejk.118.2020.11.27.04.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 04:32:17 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.10 regression caused by: "uas: fix sdev->host->dma_dev": many
 XHCI swiotlb buffer is full / DMAR: Device bounce map failed errors on
 thunderbolt connected XHCI controller
To:     Christoph Hellwig <hch@lst.de>, Tom Yan <tom.ty89@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
 <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
 <20201124102715.GA16983@lst.de>
 <fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com>
Message-ID: <8a52e868-0ca1-55b7-5ad2-ddb0cbb5e45d@redhat.com>
Date:   Fri, 27 Nov 2020 13:32:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/27/20 12:41 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/24/20 11:27 AM, Christoph Hellwig wrote:
>> On Mon, Nov 23, 2020 at 03:49:09PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> +Cc Christoph Hellwig <hch@lst.de>
>>>
>>> Christoph, this is still an issue, so I've been looking around a bit and think this
>>> might have something to do with the dma-mapping-5.10 changes.
>>>
>>> Do you have any suggestions to debug this, or is it time to do a git bisect
>>> on this before 5.10 ships with regression?
>>
>> Given that DMAR prefix this seems to be about using intel-iommu + bounce
>> buffering for external devices.  I can't really think of anything specific
>> in 5.10 related to that, so maybe you'll need to bisect.
>>
>> I doub this means we are actually leaking swiotlb buffers, so while
>> I'm pretty sure we broke something in lower layers this also means
>> xhci doesn't handle swiotlb operation very gracefully in general.
> 
> I've done a git bisect, and the result is somewhat surprising. The git-bisect
> points to:
> 
> commit 558033c2828f ("uas: fix sdev->host->dma_dev")
> 
>     Use scsi_add_host_with_dma() instead of scsi_add_host().
>     
>     When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
>     to the dma max mapping size. Therefore, the correct device that should be used
>     for the clamping needs to be set.
>     
>     The same clamping is still needed in uas as hw_max_sectors could be changed
>     there. The original clamping would be invalidated in such cases.
> 
> I do have an UAS drive connected to the thunderbolt-dock, so I guess that this
> change is causing the UAS driver to gobble all all available swiotlb space.

I ran some more tests, I can confirm that reverting:

5df7ef7d32fe "uas: bump hw_max_sectors to 2048 blocks for SS or faster drives"
558033c2828f "uas: fix sdev->host->dma_dev"

Makes the problem go away while running a 5.10 kernel. I also tried doubling
the swiotlb size by adding: swiotlb=65536 to the kernel commandline but that
does not help.

Some more observations:

1. The usb-storage driver does not cause this issue, even though it has a
very similar change.

2. The problem does not happen until I plug an UAS decvice into the dock.

3. The problem continues to happen even after I unplug the UAS device and
rmmod the uas module

3. made me take a bit closer look to the troublesome commit, it passes:
udev->bus->sysdev, which I assume is the XHCI controller itself as device
to scsi_add_host_with_dma, which in turn seems to cause permanent changes
to the dma settings for the XHCI controller. I'm not all that familiar with
the DMA APIs but I'm getting the feeling that passing the actual XHCI-controller's
device as dma-device to scsi_add_host_with_dma is simply the wrong thing to
do; and that the intended effects (honor XHCI dma limits, but do not cause
any changes the XHCI dma settings) should be achieved differently.

Note that if this is indeed wrong, the matching usb-storage change should
likely also be dropped.

Regards,

Hans

