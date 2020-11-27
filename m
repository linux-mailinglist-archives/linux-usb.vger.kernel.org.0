Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DE82C6B6C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 19:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733086AbgK0SMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 13:12:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36880 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733032AbgK0SMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Nov 2020 13:12:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606500739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PvVVh2WZkbAnSX5t/B+zX/WRWvJt82nXnXEMvGPZevw=;
        b=giFanIrutDcu1FGfU8pimuM88kWile/M7o7KFbJO8ZoBRJIYtuki116/0Xk86IrpSpIOOx
        uV4eIb522KoWk6HGvR9Q0oLfCcdtFMPgs6x2CK0XEigo91Iv4wRudbrBEnvNAUJwFU9cjD
        3nc0Lbrf6gMtmT+h/ALqbVq9wirGjTY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Hr2_LcePMnejs1TLxKrjEA-1; Fri, 27 Nov 2020 13:12:16 -0500
X-MC-Unique: Hr2_LcePMnejs1TLxKrjEA-1
Received: by mail-ed1-f72.google.com with SMTP id f20so2723318edx.23
        for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2020 10:12:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PvVVh2WZkbAnSX5t/B+zX/WRWvJt82nXnXEMvGPZevw=;
        b=OO0IIiXi9U401xrZWHLrREqdzr/Z/qW0H/JuvRqK4RPDsD1Cavr9sCZ816tMx8dzUr
         GgiCej+3H/H4pR+ltbDGUvofk+76qNSVKrzF/gKyBi6jkHUWB/4IhKNCxhswT0grl8nX
         EDEo+DXZUtM7pAC1wFLZsFU0uvNZOSp4XZnVYJVrY2jama7+Zbuo05Z6/8ubB0fWSboR
         ohWOJhJf68TNqmBL+ez/ReQW9EjAkfkcuzdF6HmOM3STYjZpNm9x+NQ/HwQ127xVNitY
         oOkndCFEc7INwDvY+MKSfqRm1EPxmKppoAPdvSJafYL/Ia+PBqKlGB88W9P3eoYR4wQ/
         2uWg==
X-Gm-Message-State: AOAM5325EXKF8An5E4va9QXFocx4ZzD/f2VrFgwZKz5qVOIxmgF56V/b
        GtqJvrEbkIwCdg4SgT1wdep/u6qQvycplXFjhsUQfo32uQD91KvF/HuhPWmybxS207QC7waIIUF
        wBREgzcwhgQb1FSIY4P3a
X-Received: by 2002:a17:906:8617:: with SMTP id o23mr4696784ejx.274.1606500735283;
        Fri, 27 Nov 2020 10:12:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyZU3HmLRRmc6hevuC7dKusx9uLm+xbnlpO5CjCfhATeXbQ9o9xALNF+99u8lVyGz2dxLcYQ==
X-Received: by 2002:a17:906:8617:: with SMTP id o23mr4696763ejx.274.1606500735127;
        Fri, 27 Nov 2020 10:12:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id lc18sm1454700ejb.77.2020.11.27.10.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 10:12:14 -0800 (PST)
Subject: Re: 5.10 regression caused by: "uas: fix sdev->host->dma_dev": many
 XHCI swiotlb buffer is full / DMAR: Device bounce map failed errors on
 thunderbolt connected XHCI controller
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tom Yan <tom.ty89@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
 <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
 <20201124102715.GA16983@lst.de>
 <fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com>
 <8a52e868-0ca1-55b7-5ad2-ddb0cbb5e45d@redhat.com>
 <20201127161900.GA10986@lst.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <fded04e2-f2e9-de92-ab1f-5aa088904e90@redhat.com>
Date:   Fri, 27 Nov 2020 19:12:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127161900.GA10986@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/27/20 5:19 PM, Christoph Hellwig wrote:
> On Fri, Nov 27, 2020 at 01:32:16PM +0100, Hans de Goede wrote:
>> I ran some more tests, I can confirm that reverting:
>>
>> 5df7ef7d32fe "uas: bump hw_max_sectors to 2048 blocks for SS or faster drives"
>> 558033c2828f "uas: fix sdev->host->dma_dev"
>>
>> Makes the problem go away while running a 5.10 kernel. I also tried doubling
>> the swiotlb size by adding: swiotlb=65536 to the kernel commandline but that
>> does not help.
>>
>> Some more observations:
>>
>> 1. The usb-storage driver does not cause this issue, even though it has a
>> very similar change.
>>
>> 2. The problem does not happen until I plug an UAS decvice into the dock.
>>
>> 3. The problem continues to happen even after I unplug the UAS device and
>> rmmod the uas module
>>
>> 3. made me take a bit closer look to the troublesome commit, it passes:
>> udev->bus->sysdev, which I assume is the XHCI controller itself as device
>> to scsi_add_host_with_dma, which in turn seems to cause permanent changes
>> to the dma settings for the XHCI controller. I'm not all that familiar with
>> the DMA APIs but I'm getting the feeling that passing the actual XHCI-controller's
>> device as dma-device to scsi_add_host_with_dma is simply the wrong thing to
>> do; and that the intended effects (honor XHCI dma limits, but do not cause
>> any changes the XHCI dma settings) should be achieved differently.
>>
>> Note that if this is indeed wrong, the matching usb-storage change should
>> likely also be dropped.
> 
> One problem in this area is that the clamping of the DMA size through
> dma_max_mapping_size mentioned in the commit log doesn't work when
> swiotlb is called from intel-iommu. I think we need to wire up those
> calls there as well.

Ok, but that does not sound like a quick last minute fix for 5.10, so maybe
for 5.10 we should just revert the uas and usb-storage changes which trigger
this problem and then retry those for 5.11 ?

Regards,

Hans 

