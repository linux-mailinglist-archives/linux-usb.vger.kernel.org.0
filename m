Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B18729D7ED
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 23:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732872AbgJ1W2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32241 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733273AbgJ1W11 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 18:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603924045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fQ/qw+rpiAp4eyZfrSsyasyM1nQM1jdNbFppYd7vqPs=;
        b=SZDYNoXKTNxbPENU1JFZW+XhTIyjJ83QF6Vdb5cWVlLiBnom2Lima+m6WLEof+3bspItOY
        28AydZKSw7B3k8dTTfsSYcTr5a7RCwGhW9Pc0v6sQGhA0sOHmMA5kxeMvR9CA8jL9DtaKn
        IIno9wwHs5zeTOtetGflKiHeZop2ikI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-mLbVNdTAMBSjOl0PESJvIw-1; Wed, 28 Oct 2020 08:25:23 -0400
X-MC-Unique: mLbVNdTAMBSjOl0PESJvIw-1
Received: by mail-ed1-f70.google.com with SMTP id bc27so823233edb.18
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 05:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fQ/qw+rpiAp4eyZfrSsyasyM1nQM1jdNbFppYd7vqPs=;
        b=hr0C0ioRQb2STFB/dbbUV1gArgfO+0WINPpM6cFq5BHlSmrJagqGbJdnQLuM6cFLn8
         cs94pYbaEW5Ga7dGljgbjpgaUpBiNfs5++zbyTiC5A6hxqIIT5uqSJOka6wttvBv1sBi
         /x/Y0fHHv9xfquaaCqyQ8lexDQ+B81mj2gl/D9n5RatNuT/afChBwxLAw1my4mhX9lge
         6rqPIDEq1h0+jtuX9GuIDO4kY1rlxZy9d2cSe4qUMfT/Q+YbV7vZ3u4FXf8aI3ynI26M
         cC8EqSNl5LxII7wNpVy1LHWWUcPLOjhOH82/TLMZw1U6EuK9Ek49X5AGKBQUeRBqel/u
         DYtg==
X-Gm-Message-State: AOAM532J9Q3xrRXthBFZ7RmEH6Rzp9XBOzjLcXs/w6SnyCSIwyaaqFsj
        rUFxPLSz/1aXYI35KOADL/x70CBHBzfoJavhg12ZctWoZIKfpwwwPU4F8gHcYEJlgduFUfZAH4w
        IWxQiiMivDYOTc8v9npuk
X-Received: by 2002:aa7:d550:: with SMTP id u16mr2687426edr.147.1603887922525;
        Wed, 28 Oct 2020 05:25:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3zS5a/7wd/Ixqrqur5/2TKJC4vFsWgenFuMVv5p6kleXO+dhizGOhkyFM4C6d5T8z4c6Tkg==
X-Received: by 2002:aa7:d550:: with SMTP id u16mr2687408edr.147.1603887922333;
        Wed, 28 Oct 2020 05:25:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id c17sm2764287edv.19.2020.10.28.05.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 05:25:21 -0700 (PDT)
Subject: Re: New XHCI lockdep oops in 5.10-rc1
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Mike Galbraith <efault@gmx.de>, Li Jun <jun.li@nxp.com>
References: <01e273b8-beb9-ef8c-c2a4-925a11b07799@redhat.com>
 <46dc20eb-bc98-c0f9-e72d-dd2a28e993a1@linux.intel.com>
 <39e135d7-34ac-1347-65f2-2306ed746f4c@redhat.com>
 <ac6ce4a6-4250-27eb-8d7e-0a48b9adf5e5@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4fbf02bb-7fd5-e792-ae4f-8bd50fa8e201@redhat.com>
Date:   Wed, 28 Oct 2020 13:25:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ac6ce4a6-4250-27eb-8d7e-0a48b9adf5e5@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/28/20 1:22 PM, Mathias Nyman wrote:
> On 28.10.2020 12.57, Hans de Goede wrote:
>> Hi,
>>
>> On 10/28/20 10:31 AM, Mathias Nyman wrote:
>>> On 27.10.2020 23.51, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> I standard run my local kernel builds with lockdep enabled, booting 5.10-rc1 with lockdep enabled results in:
>>>>
>>>> [    3.339982] =====================================================
>>>> [    3.339984] WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
>>>> [    3.339987] 5.10.0-rc1pdx86+ #8 Not tainted
>>>> [    3.339988] -----------------------------------------------------
>>>> [    3.339991] systemd-udevd/386 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
>>>> [    3.339993] ffffffffb1a94038 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x22/0xa0
>>>> [    3.339999] 
>>>>                and this task is already holding:
>>>> [    3.340002] ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at: xhci_alloc_streams+0x5f9/0x810
>>>> [    3.340008] which would create a new lock dependency:
>>>> [    3.340009]  (&xhci->lock){-.-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}
>>>> [    3.340013] 
>>>>                but this new dependency connects a HARDIRQ-irq-safe lock:
>>>> [    3.340016]  (&xhci->lock){-.-.}-{2:2}
>>>
>>> Thanks, just read a similar report from Mike Galbraith <efault@gmx.de>
>>>
>>> Looks like 673d74683627 ("usb: xhci: add debugfs support for ep with stream")
>>> creates the new xhci debugfs stream files while holding the xhci->lock,
>>> creating this dependency.
>>>
>>> Below code should help, but I need to find my UAS drive to test it.
>>>
>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>> index 482fe8c5e3b4..d4a8d0efbbc4 100644
>>> --- a/drivers/usb/host/xhci.c
>>> +++ b/drivers/usb/host/xhci.c
>>> @@ -3533,11 +3533,14 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
>>>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>>>  			 udev->slot_id, ep_index);
>>>  		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
>>> -		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>>>  	}
>>>  	xhci_free_command(xhci, config_cmd);
>>>  	spin_unlock_irqrestore(&xhci->lock, flags);
>>>  
>>> +	for (i = 0; i < num_eps; i++) {
>>> +		ep_index = xhci_get_endpoint_index(&eps[i]->desc);
>>> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>>> +	}
>>>  	/* Subtract 1 for stream 0, which drivers can't use */
>>>  	return num_streams - 1;
>>>
>>
>> I can confirm that this patch fixes the lockdep oops.
> 
> Thanks, can I add your Tested-by: tag to it?

Yes please do:

Tested-by: Hans de Goede <hdegoede@redhat.com>

> I found a UAS device and could reproduce the original issue, and verify that the patch
> resolves it for me as well.

Great :)

Regards,

Hans


