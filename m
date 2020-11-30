Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC3B2C8512
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 14:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgK3NZY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 08:25:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30243 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726463AbgK3NZX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 08:25:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606742636;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZsiKz3Xb8yRkj2RReFaObIjO2mMfX4sg9c9Ok14EKbg=;
        b=BC/wuVuVxSHKagdTrkZO/kfqtlUfS/7xVXegMx9lqvEoM0xsieh6+lf8m0XhSCVDdPEYLS
        r8PnsETafODLqb0HECOmtucBR/McLTZr4u6v7ivklUhYuTc+cROYLplrAEV1ydob7IIsHu
        wtgtntrOY7JwUEK9AriPZEX38GWnmxY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-QVrziA2JNFGQoCrVvIuxgw-1; Mon, 30 Nov 2020 08:23:51 -0500
X-MC-Unique: QVrziA2JNFGQoCrVvIuxgw-1
Received: by mail-ed1-f70.google.com with SMTP id i89so6747354edd.15
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 05:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZsiKz3Xb8yRkj2RReFaObIjO2mMfX4sg9c9Ok14EKbg=;
        b=lOMfsOMLyAaDJR8gTg+8+D2wLsz5P1d5RtOXN0NeHusGnqov1UmEA2cSgVUV9sgxJs
         ynLXUjIolCF/Dg4fA+GqawqiKXYhgfS7P1U4KuQe64RDJwjZxyhiFZmbdkoqKCGM3kVS
         qiWI8odV7LgwiwEeYP3Tjpct4ar+H1NNXJxU/8tql1/wQzGUPrsma029b9ykTKIYWutv
         syN07c3687TaGYW55UeDHe3ufIt2sBarmyoUNxjtftqMAWPP9/LDZaeGElSzoGJGcqvs
         jWzHatY0jr2Pi0zihvDS6HgjLG3eE0NHZXi05i/baslPqLW1J4HjHd6gD9XAk3UDtL25
         cl5w==
X-Gm-Message-State: AOAM5328M+3f4jCrSxrVBk//PFVsr80YlLyI9WJOJnfZ28MLaCDQkBza
        PZko74XyW11P1nLkIlSqnYiGv0VCRyn7CuQPqNvbBwHwSyz9u6yBHi2i+EFDpwTICICZ+KDKCfS
        sTJ6IiSHcnX/oTiYRtPgY
X-Received: by 2002:a17:906:268c:: with SMTP id t12mr19940776ejc.377.1606742630061;
        Mon, 30 Nov 2020 05:23:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0mhUguurWclQROXLkEBg+lQAvc3kUqgpjbQwR2khKLUk11zC6+rWkh31c/R7eBzaFpfgDzg==
X-Received: by 2002:a17:906:268c:: with SMTP id t12mr19940744ejc.377.1606742629777;
        Mon, 30 Nov 2020 05:23:49 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id zn5sm1696069ejb.111.2020.11.30.05.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:23:49 -0800 (PST)
Subject: Re: [PATCH 2/2] usb-storage: revert from scsi_add_host_with_dma() to
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
 <20201128154849.3193-2-tom.ty89@gmail.com>
 <5e62c383-22ea-6df6-5acc-5e9f381d4632@redhat.com>
 <CAGnHSEnetAJNqUEW-iuq7eVyU6VnP84cv9+OVL4C5Z2ZK_eM0A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <186eb035-4bc4-ff72-ee41-aeb6d81888e3@redhat.com>
Date:   Mon, 30 Nov 2020 14:23:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGnHSEnetAJNqUEW-iuq7eVyU6VnP84cv9+OVL4C5Z2ZK_eM0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/30/20 1:58 PM, Tom Yan wrote:
> It's merely a moving of comment moving for/and a no-behavioral-change
> adaptation for the reversion.>

IMHO the revert of the troublesome commit and the other/new changes really
should be 2 separate commits. But I will let Alan and Greg have the final
verdict on this.

p.s. Why did you not send this patch-series to Alan Stern, the maintainer of
the usb-storage driver?

> Similar has been done in the equivalent
> patch for the UAS driver (and the reason is stated there).

In the UAS driver the code setting max-hw-sectors was already moved to its
new place and another patch was added on top, so that is different.

Regards,

Hans


> 
> On Mon, 30 Nov 2020 at 17:50, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 11/28/20 4:48 PM, Tom Yan wrote:
>>> While the change only seemed to have caused issue on uas drives, we
>>> probably want to avoid it in the usb-storage driver as well, until
>>> we are sure it is the right thing to do.
>>>
>>> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
>>
>> This seems to do a whole lot more then just dropping back from
>>  scsi_add_host_with_dma() to scsi_add_host(). This has way more
>> lines then the orginal commit.
>>
>> IMHO it would be best to just revert commit 0154012f8018bba4d9971d1007c12ffd48539ddb
>> and then submit these changes as a separate patch (which would be
>> 5.11 material then).
>>
>> That separate patch could then also have a proper commit message
>> explaining the other changes you are making, which is also not
>> unimportant.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> ---
>>>  drivers/usb/storage/scsiglue.c | 40 +++++++++++++++++-----------------
>>>  drivers/usb/storage/usb.c      |  3 +--
>>>  2 files changed, 21 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/usb/storage/scsiglue.c b/drivers/usb/storage/scsiglue.c
>>> index 560efd1479ba..6539bae1c188 100644
>>> --- a/drivers/usb/storage/scsiglue.c
>>> +++ b/drivers/usb/storage/scsiglue.c
>>> @@ -92,7 +92,7 @@ static int slave_alloc (struct scsi_device *sdev)
>>>  static int slave_configure(struct scsi_device *sdev)
>>>  {
>>>       struct us_data *us = host_to_us(sdev->host);
>>> -     struct device *dev = sdev->host->dma_dev;
>>> +     struct device *dev = us->pusb_dev->bus->sysdev;
>>>
>>>       /*
>>>        * Many devices have trouble transferring more than 32KB at a time,
>>> @@ -120,6 +120,25 @@ static int slave_configure(struct scsi_device *sdev)
>>>                * better throughput on most devices.
>>>                */
>>>               blk_queue_max_hw_sectors(sdev->request_queue, 2048);
>>> +     } else {
>>> +             /*
>>> +              * Limit the total size of a transfer to 120 KB.
>>> +              *
>>> +              * Some devices are known to choke with anything larger. It seems like
>>> +              * the problem stems from the fact that original IDE controllers had
>>> +              * only an 8-bit register to hold the number of sectors in one transfer
>>> +              * and even those couldn't handle a full 256 sectors.
>>> +              *
>>> +              * Because we want to make sure we interoperate with as many devices as
>>> +              * possible, we will maintain a 240 sector transfer size limit for USB
>>> +              * Mass Storage devices.
>>> +              *
>>> +              * Tests show that other operating have similar limits with Microsoft
>>> +              * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
>>> +              * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
>>> +              * and 2048 for USB3 devices.
>>> +              */
>>> +             blk_queue_max_hw_sectors(sdev->request_queue, 240);
>>>       }
>>>
>>>       /*
>>> @@ -627,25 +646,6 @@ static const struct scsi_host_template usb_stor_host_template = {
>>>       .sg_tablesize =                 SG_MAX_SEGMENTS,
>>>
>>>
>>> -     /*
>>> -      * Limit the total size of a transfer to 120 KB.
>>> -      *
>>> -      * Some devices are known to choke with anything larger. It seems like
>>> -      * the problem stems from the fact that original IDE controllers had
>>> -      * only an 8-bit register to hold the number of sectors in one transfer
>>> -      * and even those couldn't handle a full 256 sectors.
>>> -      *
>>> -      * Because we want to make sure we interoperate with as many devices as
>>> -      * possible, we will maintain a 240 sector transfer size limit for USB
>>> -      * Mass Storage devices.
>>> -      *
>>> -      * Tests show that other operating have similar limits with Microsoft
>>> -      * Windows 7 limiting transfers to 128 sectors for both USB2 and USB3
>>> -      * and Apple Mac OS X 10.11 limiting transfers to 256 sectors for USB2
>>> -      * and 2048 for USB3 devices.
>>> -      */
>>> -     .max_sectors =                  240,
>>> -
>>>       /* emulated HBA */
>>>       .emulated =                     1,
>>>
>>> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
>>> index c2ef367cf257..f177da4ff1bc 100644
>>> --- a/drivers/usb/storage/usb.c
>>> +++ b/drivers/usb/storage/usb.c
>>> @@ -1050,8 +1050,7 @@ int usb_stor_probe2(struct us_data *us)
>>>       usb_autopm_get_interface_no_resume(us->pusb_intf);
>>>       snprintf(us->scsi_name, sizeof(us->scsi_name), "usb-storage %s",
>>>                                       dev_name(dev));
>>> -     result = scsi_add_host_with_dma(us_to_host(us), dev,
>>> -                                     us->pusb_dev->bus->sysdev);
>>> +     result = scsi_add_host(us_to_host(us), dev);
>>>       if (result) {
>>>               dev_warn(dev,
>>>                               "Unable to add the scsi host\n");
>>>
>>
> 

