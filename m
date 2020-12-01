Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005CA2CA0F7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 12:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbgLALL3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 06:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44898 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727664AbgLALL2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Dec 2020 06:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606821001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yTy5ikFc2zsm6wTyFWtS21qTEBAzaoPrYV+9gLrBVOs=;
        b=WGxA4FheCi9GZx7X7NaCadiNH3XD5/HAfH8BoL4qznWAH3fi4ucFEyBPWMR0QW1qLVeX2i
        Vwk93Bu5TguG7mllYXt0M73dwXRgaZEi8RX02TuNHgw3aE0ZRUFudLQaHq2+vrMbtiyMs8
        OLRK5R8hret8eoQN7HR99mzj2e+z/Nc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-TTCU05C-P7Ss8EpWINhhlg-1; Tue, 01 Dec 2020 06:09:57 -0500
X-MC-Unique: TTCU05C-P7Ss8EpWINhhlg-1
Received: by mail-ed1-f72.google.com with SMTP id f19so1019456edq.20
        for <linux-usb@vger.kernel.org>; Tue, 01 Dec 2020 03:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yTy5ikFc2zsm6wTyFWtS21qTEBAzaoPrYV+9gLrBVOs=;
        b=hH3dcmMs5qnmOq/O9LeUycfDNCvpOG1pv+2ZJQqoq25IQS/tSL/NVer1ZEkYOEJNAc
         Ln42NRMSW9Qew3/69NfgjmwCvT3/UOZ3QcrXuLczmlgmiDDzApHmN+XyzB7/tWRzZ+14
         jQ5zOqzp5p0AydBEl0PzGcIIbZeRcO7sgLSxrt6H3atwZ+1N/2z6AfvTEypNsm/kh884
         T6yvP+mHlkmvPEylTWaFMj4MzMglP+0GnYG//ddjYwhhzik6VYieyKT/dpNr2J33VRzu
         MK8OKjWX+X1hqeGiNwW8zk5kcVur8Wb8VkT2LNGtEldPlTJccE3RVhF0jqAdIgUGEqZC
         zBGg==
X-Gm-Message-State: AOAM533MpLEl3kRzX4YtHHuzDwCoWoHW4jo/no4oxyLu/kW2JzuN7koE
        2toiOVUKfjPFIP9o2QAKoSXrd2ghHRex6iFjWzPMZoUVnvobFR3RUIrj/vWRObPrDWgxRp0wtP4
        IUDqvUMQU+w7+Ckt9+jfn
X-Received: by 2002:a17:906:3ac2:: with SMTP id z2mr2392532ejd.26.1606820996655;
        Tue, 01 Dec 2020 03:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAkQ/VeqJ3Qh5aE9Bjxm8nmdibjlZ/IRReSZ6NSzZcdS46JCY3+Sv3qk+bsIONvSpxzPRVCA==
X-Received: by 2002:a17:906:3ac2:: with SMTP id z2mr2392514ejd.26.1606820996453;
        Tue, 01 Dec 2020 03:09:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id d9sm659968edk.86.2020.12.01.03.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 03:09:55 -0800 (PST)
Subject: Re: [PATCH 1/2] uas: revert from scsi_add_host_with_dma() to
 scsi_add_host()
To:     Tom Yan <tom.ty89@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@lst.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
References: <09992cec-65e4-2757-aae6-8fb02a42f961@redhat.com>
 <20201128154849.3193-1-tom.ty89@gmail.com>
 <62e0d5ea-e665-b913-5482-a75db0ac1368@redhat.com>
 <CAGnHSE=sS7tvttuTwE_s+QbCUVCfhmHnuXQp1g1AkZ=JEoxmQA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <899cea7f-b306-0ce4-06e9-aa5d083573cb@redhat.com>
Date:   Tue, 1 Dec 2020 12:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGnHSE=sS7tvttuTwE_s+QbCUVCfhmHnuXQp1g1AkZ=JEoxmQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/30/20 8:30 PM, Tom Yan wrote:
> Hmm, I wonder if I/we wrongly assumed that the dma_dev used for the
> hw_max_sectors clamping in __scsi_init_queue() is wrong.
> 
> So instead of adding a fallback else-clause here or using "sysdev" as
> dma_dev like in the current upstream code, maybe we should actually do
> a three-way min: the "changed" hw_max_sectors, dma_max_mapping_size of
> dma_dev("dev") and dma_max_mapping_size of sysdev...?

So both here and in the 2/2 patch thread there are lots of open questions,
which to me suggests that for 5.10 we really should just go with the 3 reverts
which I suggested earlier.

Regards,

Hans



> 
> On Mon, 30 Nov 2020 at 17:48, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/28/20 4:48 PM, Tom Yan wrote:
>>> Apparently the former (with the chosen dma_dev) may cause problem in certain
>>> case (e.g. where thunderbolt dock and intel iommu are involved). The error
>>> observed was:
>>>
>>> XHCI swiotlb buffer is full / DMAR: Device bounce map failed
>>>
>>> For now we retain the clamp for hw_max_sectors against the dma_max_mapping_size.
>>> Since the device/size for the clamp that is applied when the scsi request queue
>>> is initialized/allocated is different than the one used here, we invalidate the
>>> early clamping by making a fallback blk_queue_max_hw_sectors() call.
>>>
>>> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
>>
>> I can confirm that this fixes the network performance on a Lenovo Thunderbolt
>> dock generation 2, which uses an USB attach NIC.
>>
>> With this patch added on top of 5.10-rc5 scp performance to another machine
>> on the local gbit LAN goes back from the regressed 1 MB/s to its original 100MB/s
>> as it should be:
>>
>> Tested-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Regards,
>>
>> Hans
>>
>>
>>> ---
>>>  drivers/usb/storage/uas.c | 11 +++++++----
>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
>>> index c8a577309e8f..5db1325cea20 100644
>>> --- a/drivers/usb/storage/uas.c
>>> +++ b/drivers/usb/storage/uas.c
>>> @@ -843,18 +843,21 @@ static int uas_slave_alloc(struct scsi_device *sdev)
>>>  static int uas_slave_configure(struct scsi_device *sdev)
>>>  {
>>>       struct uas_dev_info *devinfo = sdev->hostdata;
>>> -     struct device *dev = sdev->host->dma_dev;
>>> +     struct usb_device *udev = devinfo->udev;
>>>
>>>       if (devinfo->flags & US_FL_MAX_SECTORS_64)
>>>               blk_queue_max_hw_sectors(sdev->request_queue, 64);
>>>       else if (devinfo->flags & US_FL_MAX_SECTORS_240)
>>>               blk_queue_max_hw_sectors(sdev->request_queue, 240);
>>> -     else if (devinfo->udev->speed >= USB_SPEED_SUPER)
>>> +     else if (udev->speed >= USB_SPEED_SUPER)
>>>               blk_queue_max_hw_sectors(sdev->request_queue, 2048);
>>> +     else
>>> +             blk_queue_max_hw_sectors(sdev->request_queue,
>>> +                                      SCSI_DEFAULT_MAX_SECTORS);
>>>
>>>       blk_queue_max_hw_sectors(sdev->request_queue,
>>>               min_t(size_t, queue_max_hw_sectors(sdev->request_queue),
>>> -                   dma_max_mapping_size(dev) >> SECTOR_SHIFT));
>>> +                   dma_max_mapping_size(udev->bus->sysdev) >> SECTOR_SHIFT));
>>>
>>>       if (devinfo->flags & US_FL_NO_REPORT_OPCODES)
>>>               sdev->no_report_opcodes = 1;
>>> @@ -1040,7 +1043,7 @@ static int uas_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>>       shost->can_queue = devinfo->qdepth - 2;
>>>
>>>       usb_set_intfdata(intf, shost);
>>> -     result = scsi_add_host_with_dma(shost, &intf->dev, udev->bus->sysdev);
>>> +     result = scsi_add_host(shost, &intf->dev);
>>>       if (result)
>>>               goto free_streams;
>>>
>>>
>>
> 

