Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F51429E07F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 02:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgJ1WEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42171 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729475AbgJ1WBK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 18:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603922468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d0E3QUw/g6o9o9JHCXUwGNfFscBzWeKeD7oM4X4IAdI=;
        b=BkKNwRWnv15qRNtDQxdk2OtA68NxD8zo84h/0eCiek5aDW8JzQL++DzDRq0FBrjRKZtwUW
        yV9gwPLPwCJe2f87SYa0LHYokrAdms09LEsV5YL24+KVxHDZhzp7htXMyqM31EwTZM3/G0
        qM5/J211+WiIEpF1754KKx+NIu5m+78=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-RfN3J01fOM-Uq_b06Q6n5g-1; Wed, 28 Oct 2020 06:57:58 -0400
X-MC-Unique: RfN3J01fOM-Uq_b06Q6n5g-1
Received: by mail-ed1-f69.google.com with SMTP id cb27so1936012edb.11
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 03:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d0E3QUw/g6o9o9JHCXUwGNfFscBzWeKeD7oM4X4IAdI=;
        b=DD5LK4j0CfVpK7QE0jh5eISNiMWB9BljGr00cjvh6gwzjYjpNTR8EtXXGpH42r9t7h
         AbWSgKNg88eLUOF/1PZh0Ddv/267YBlsfX4ihWGZyFyjC97oQFZK9IU9Z0ZQ7DRfYKWC
         AGU8dUqhoxPDP3WMPyIzUVGq0m2RwT8Tj0Um4eS37NlA8XynXsQChOXVwaBvN+9lRjaD
         WzicDhvMp2cXNhnX88k/XK8sBgd5QiZI2GonPSeu1EpP9mil7NNgAQWDsD/f71PmqtGa
         TmfpYdOecinGM8OIQGvfHXUiQJd+gW6FKHp+ohVFGlJStf9/KnW99okF+dXt1X0khxPH
         xjKg==
X-Gm-Message-State: AOAM533FveT6V/jbqVCBDB9Ns9pIQSrhIPUYL8VP1kxW8qIghfqpU48P
        SzOztS3Goy/A7ZfUzjFWtouWfjj9gsCk2l5693X4fLLV2KKUUqP64Auj64KY2AUMmk6UofQUFJK
        FgczOLGeitFNe3RyY57kU
X-Received: by 2002:a17:906:383:: with SMTP id b3mr6691379eja.351.1603882676672;
        Wed, 28 Oct 2020 03:57:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoy+8dhL7T+UNmiZujbif7PLj7gwOkFVBJB4HmU7l9iVL4YlYVwAaOYKiWFov751i5BNkJCQ==
X-Received: by 2002:a17:906:383:: with SMTP id b3mr6691360eja.351.1603882676412;
        Wed, 28 Oct 2020 03:57:56 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id s12sm2670372edu.28.2020.10.28.03.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 03:57:55 -0700 (PDT)
Subject: Re: New XHCI lockdep oops in 5.10-rc1
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Mike Galbraith <efault@gmx.de>, Li Jun <jun.li@nxp.com>
References: <01e273b8-beb9-ef8c-c2a4-925a11b07799@redhat.com>
 <46dc20eb-bc98-c0f9-e72d-dd2a28e993a1@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <39e135d7-34ac-1347-65f2-2306ed746f4c@redhat.com>
Date:   Wed, 28 Oct 2020 11:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <46dc20eb-bc98-c0f9-e72d-dd2a28e993a1@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 10/28/20 10:31 AM, Mathias Nyman wrote:
> On 27.10.2020 23.51, Hans de Goede wrote:
>> Hi,
>>
>> I standard run my local kernel builds with lockdep enabled, booting 5.10-rc1 with lockdep enabled results in:
>>
>> [    3.339982] =====================================================
>> [    3.339984] WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
>> [    3.339987] 5.10.0-rc1pdx86+ #8 Not tainted
>> [    3.339988] -----------------------------------------------------
>> [    3.339991] systemd-udevd/386 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
>> [    3.339993] ffffffffb1a94038 (pin_fs_lock){+.+.}-{2:2}, at: simple_pin_fs+0x22/0xa0
>> [    3.339999] 
>>                and this task is already holding:
>> [    3.340002] ffff9e7b87fbc430 (&xhci->lock){-.-.}-{2:2}, at: xhci_alloc_streams+0x5f9/0x810
>> [    3.340008] which would create a new lock dependency:
>> [    3.340009]  (&xhci->lock){-.-.}-{2:2} -> (pin_fs_lock){+.+.}-{2:2}
>> [    3.340013] 
>>                but this new dependency connects a HARDIRQ-irq-safe lock:
>> [    3.340016]  (&xhci->lock){-.-.}-{2:2}
> 
> Thanks, just read a similar report from Mike Galbraith <efault@gmx.de>
> 
> Looks like 673d74683627 ("usb: xhci: add debugfs support for ep with stream")
> creates the new xhci debugfs stream files while holding the xhci->lock,
> creating this dependency.
> 
> Below code should help, but I need to find my UAS drive to test it.
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 482fe8c5e3b4..d4a8d0efbbc4 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3533,11 +3533,14 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>  			 udev->slot_id, ep_index);
>  		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
> -		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>  	}
>  	xhci_free_command(xhci, config_cmd);
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>  
> +	for (i = 0; i < num_eps; i++) {
> +		ep_index = xhci_get_endpoint_index(&eps[i]->desc);
> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
> +	}
>  	/* Subtract 1 for stream 0, which drivers can't use */
>  	return num_streams - 1;
> 

I can confirm that this patch fixes the lockdep oops.

Regards,

Hans


