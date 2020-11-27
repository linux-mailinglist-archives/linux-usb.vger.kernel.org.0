Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1668F2C6404
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 12:42:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729402AbgK0Lll (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 06:41:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21443 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729164AbgK0Lll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 06:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606477300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RtEobGtqHaZXW8kfAUMTsFDrmfzCrlTs0I1/wp2P9N4=;
        b=eJY2OqKPq8FZuKNfasHxybfZbYits3saIVnmQW/GhlgHN7OTy7dvxZZXMwTiLOJVVqsUTv
        aVrCqAORdjIVkjsRDlMfjO4QlL5ZHY45tvxYJ3mgfxHCumWn5dcsHhsMdjNqUuOvqI7GXz
        qUly+ULcrC2d/4/Rq3788pxoW90/Juw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-I95AOe3rO2iUqz372BO6Gg-1; Fri, 27 Nov 2020 06:41:38 -0500
X-MC-Unique: I95AOe3rO2iUqz372BO6Gg-1
Received: by mail-ed1-f71.google.com with SMTP id d3so2322794eds.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2020 03:41:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RtEobGtqHaZXW8kfAUMTsFDrmfzCrlTs0I1/wp2P9N4=;
        b=mrCQ7ivX4omElNGFW5g6BawiDyH5OvDoNFiqdVtpUlHAQ3BrIKKDeIiDkuu1LLuU8X
         xD22yC4rpoVn6dBuGPvoTLN0oSpoIuhi8jVsq/w480RtrWq8maf+N1Uz0aiAkOUhy83o
         TatFcl/27WlD9G7X6cHLERAE17itwsZhbSjUMdAPUgNL37qxpnRVngrlz4z5bMdsu4mM
         Y/SKNS3bARMTzxbhAvdVNyZMdcBw3TB4phINLEaFJ0N5LDVIvCprmwN9KDpZz+Kwp3Tq
         N9vb+5OQrE40zSXcP/BVArZa8pEnSoiLEyZJUoKxHHe3dO08zQrglgBtN9dlaNzRtq4u
         FHWw==
X-Gm-Message-State: AOAM5335+zv9AFH17OoTKHXKfLsruZtwKHO5FFzTia1h3OqfyJo8sSfO
        ZKHuD5VrvfzZvemIvEXbm8mnQNe+fK3hqWddEMJHpj+44KCZvAFNo+O/FeBxYOU5T00+GgjgJuV
        AQjv9HAw3sbyQs+C44aeM
X-Received: by 2002:a17:906:ce35:: with SMTP id sd21mr2430621ejb.19.1606477296987;
        Fri, 27 Nov 2020 03:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0CF58ldOw1Re1xwxNnk/C9JbJuM6LC7w/pRZZScsZYrqcQ25EOLluSp6iCP+x6B95cg1gCQ==
X-Received: by 2002:a17:906:ce35:: with SMTP id sd21mr2430606ejb.19.1606477296788;
        Fri, 27 Nov 2020 03:41:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id e12sm4850748edm.48.2020.11.27.03.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 03:41:36 -0800 (PST)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: 5.10 regression, many XHCI swiotlb buffer is full / DMAR: Device
 bounce map failed errors on thunderbolt connected XHCI controller
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
 <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
 <20201124102715.GA16983@lst.de>
Message-ID: <fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com>
Date:   Fri, 27 Nov 2020 12:41:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124102715.GA16983@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/24/20 11:27 AM, Christoph Hellwig wrote:
> On Mon, Nov 23, 2020 at 03:49:09PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> +Cc Christoph Hellwig <hch@lst.de>
>>
>> Christoph, this is still an issue, so I've been looking around a bit and think this
>> might have something to do with the dma-mapping-5.10 changes.
>>
>> Do you have any suggestions to debug this, or is it time to do a git bisect
>> on this before 5.10 ships with regression?
> 
> Given that DMAR prefix this seems to be about using intel-iommu + bounce
> buffering for external devices.  I can't really think of anything specific
> in 5.10 related to that, so maybe you'll need to bisect.
> 
> I doub this means we are actually leaking swiotlb buffers, so while
> I'm pretty sure we broke something in lower layers this also means
> xhci doesn't handle swiotlb operation very gracefully in general.

I've done a git bisect, and the result is somewhat surprising. The git-bisect
points to:

commit 558033c2828f ("uas: fix sdev->host->dma_dev")

    Use scsi_add_host_with_dma() instead of scsi_add_host().
    
    When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
    to the dma max mapping size. Therefore, the correct device that should be used
    for the clamping needs to be set.
    
    The same clamping is still needed in uas as hw_max_sectors could be changed
    there. The original clamping would be invalidated in such cases.

I do have an UAS drive connected to the thunderbolt-dock, so I guess that this
change is causing the UAS driver to gobble all all available swiotlb space.

Regards,

Hans

