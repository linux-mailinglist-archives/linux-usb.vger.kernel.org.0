Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB972C860C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 14:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgK3N5R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 08:57:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47847 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726402AbgK3N5Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 08:57:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606744549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kP+OnMMfwCYha6jfQErDj7Kdqzdm8kEcy6O31gcM7yg=;
        b=NwfcowsgYUcN5XnxK1H5NRWHAgLGViwM+9Eew5STM23SX0dmCj/Sf0Uwjax6UCp1qXk55Q
        eFQmUN3KaqES2zQ/CIMhAKn0TXkXUkpQ9wG7Ls9ihb/SyuEuUh/Sq90/0aPrDRQqU3h239
        10kasJXcqvEGodWY79YJH1Mzgm+nmb8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-sOqdZ2BlO_STqFFYoqSjyg-1; Mon, 30 Nov 2020 08:55:47 -0500
X-MC-Unique: sOqdZ2BlO_STqFFYoqSjyg-1
Received: by mail-ej1-f69.google.com with SMTP id q2so5777642ejj.16
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 05:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kP+OnMMfwCYha6jfQErDj7Kdqzdm8kEcy6O31gcM7yg=;
        b=IktazzbsnciAu7undYkoAhoVKB2J5U4fPV9GGUazvTr3JgQyoRI0YLmsMO3llZHLQ+
         765Rx2msZn2SLXOvRK+aLaRUOZtTedCn1xD7+kb7gU0u3xvUFz4TxGkQrhuExXcsrCNQ
         IPCMe5PRUjy36IVGV4ISQncCRZlZ+zHPgSP0ZbDRHzFywSdlwbcHuyeZL39O7RU0AFGj
         /yUGp53TOS5/COPqZcnCLOHX9vrT+a0SYfje5FCll06vURu9V1ttOTLkWqhZgGsSs+Fq
         Km3Fo5UNvUO1YrLSlNmEBs9wjemrzfZlR1lk7sDYQ84Ld+xYc9nO7qvhzVsESY21YMeg
         t8Ow==
X-Gm-Message-State: AOAM530rW5dwG/v31Jzl4SRX2Fp17fhO6qHaRzjxJsmTrWTQiiS+iQsM
        u8ZlKfVIPUa3XGypisk9eL5JsZHpAdmpkVXo2j/0LniwhVoNYwvUYjkd+sNIp3q+ZFR9Vb+3Kg0
        2pmCmlmlzLDl25i6Pv6DN
X-Received: by 2002:a05:6402:b02:: with SMTP id bm2mr22293773edb.299.1606744546555;
        Mon, 30 Nov 2020 05:55:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAwRx/R3Ll/Tra5z0u2xtZhGReQjQnb/SSeDITRxmssslhLhF/h7RSpDJ32T6Kq1hSSew7fA==
X-Received: by 2002:a05:6402:b02:: with SMTP id bm2mr22293752edb.299.1606744546367;
        Mon, 30 Nov 2020 05:55:46 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q26sm8605198ejt.73.2020.11.30.05.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 05:55:45 -0800 (PST)
Subject: Re: [PATCH 2/2] usb-storage: revert from scsi_add_host_with_dma() to
 scsi_add_host()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Tom Yan <tom.ty89@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Christoph Hellwig <hch@lst.de>,
        linux-usb <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
References: <09992cec-65e4-2757-aae6-8fb02a42f961@redhat.com>
 <20201128154849.3193-1-tom.ty89@gmail.com>
 <20201128154849.3193-2-tom.ty89@gmail.com>
 <5e62c383-22ea-6df6-5acc-5e9f381d4632@redhat.com>
 <CAGnHSEnetAJNqUEW-iuq7eVyU6VnP84cv9+OVL4C5Z2ZK_eM0A@mail.gmail.com>
 <186eb035-4bc4-ff72-ee41-aeb6d81888e3@redhat.com>
 <X8T0E2qvF2cgADl+@kroah.com>
 <dd557c38-a919-5e5e-ab3b-17a235f17139@redhat.com>
 <X8T5bimon2oaUUqI@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <70ca74c2-4a80-e25b-eca9-a63a75516673@redhat.com>
Date:   Mon, 30 Nov 2020 14:55:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <X8T5bimon2oaUUqI@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 11/30/20 2:53 PM, Greg KH wrote:
> On Mon, Nov 30, 2020 at 02:36:38PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/30/20 2:30 PM, Greg KH wrote:
>>> On Mon, Nov 30, 2020 at 02:23:48PM +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 11/30/20 1:58 PM, Tom Yan wrote:
>>>>> It's merely a moving of comment moving for/and a no-behavioral-change
>>>>> adaptation for the reversion.>
>>>>
>>>> IMHO the revert of the troublesome commit and the other/new changes really
>>>> should be 2 separate commits. But I will let Alan and Greg have the final
>>>> verdict on this.
>>>
>>> I would prefer to just revert the commits and not do anything
>>> different/special here so late in the release cycle.
>>>
>>> So, if Alan agrees, I'll be glad to do them on my end, I just need the
>>> commit ids for them.
>>
>> The troublesome commit are (in reverse, so revert, order):
>>
>> 5df7ef7d32fe ("uas: bump hw_max_sectors to 2048 blocks for SS or faster drives")
>> 558033c2828f ("uas: fix sdev->host->dma_dev")
>> 0154012f8018 ("usb-storage: fix sdev->host->dma_dev")
>>
>> Alan, the reason for reverting these is that using scsi_add_host_with_dma() as the
>> last 2 patches do, with the dmadev argument of that call pointing to the device
>> for the XHCI controller is causing changes to the DMA settings of the XHCI controller
>> itself which is causing regressions in 5.10, see this email thread:
>>
>> https://lore.kernel.org/linux-usb/fde7e11f-5dfc-8348-c134-a21cb1116285@redhat.com/T/#t
> 
> Thanks, I'll wait for Alan to respond, but I think just reverting these
> is the best solution at this point in time.  You have tested those
> reverts, solve this, right?  If so, can I get a "Tested-by:"? 

Yes that was my first solution to this problem and I can confirm that that fixes
the regression:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

