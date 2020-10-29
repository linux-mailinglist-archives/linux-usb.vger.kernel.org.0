Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6ED29EC74
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 14:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgJ2NGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 09:06:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:44850 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725798AbgJ2NGi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 09:06:38 -0400
IronPort-SDR: GZBPg7XHoF2ZxwcC5RmsniUVYZ2HtZ45Vv/dAL3eFgK988VqG7IVHXcGRfCNi8qzStisepNE2T
 /HsmTC2w+FaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="165842568"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="165842568"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2020 06:06:38 -0700
IronPort-SDR: bPeCk+16lu5x5zLw+OhOSYjZhOdaE5kCA2LzaOoxHU4d7V4iG2mNnWY6kj1GkE2U4jGD+WuS2S
 ikK+3/mrh9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="351438187"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2020 06:06:36 -0700
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock
 held.
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Mike Galbraith <efault@gmx.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
 <20201028203124.375344-4-mathias.nyman@linux.intel.com>
 <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
 <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
 <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
 <a5d5a21c-d6ff-1097-b9ca-e0147658c8c6@linux.intel.com>
 <20201029113805.tdsissnjq4acemle@linutronix.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <29cf8ca3-0fe7-da51-c8ae-ad5c67af4dde@linux.intel.com>
Date:   Thu, 29 Oct 2020 15:08:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029113805.tdsissnjq4acemle@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 29.10.2020 13.38, Sebastian Andrzej Siewior wrote:
> On 2020-10-29 13:22:20 [+0200], Mathias Nyman wrote:
>> On 29.10.2020 13.11, Mike Galbraith wrote:
>>> On Thu, 2020-10-29 at 11:41 +0200, Mathias Nyman wrote:
>>>> Can you check if this can be reproduced with 5.9 kernel?
>>>
>>> Nope, 5.9.2 didn't reproduce.
>>>
>>
>> Very odd.
>> It might be hard to reproduce as it requires xhci ring expansion to trigger it,
>> meaning at some point there is so much data queued to a device the current ring buffer
>> can't fit it.
>>
>> Other possibility is that there were some radix tree changes in 5.10-rc1, haven't looked into those.
> 
> This came with commit
>    673d74683627b ("usb: xhci: add debugfs support for ep with stream")
> 
> which is appeared in v5.10-rc1. This hunk below works around it:
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 482fe8c5e3b47..699777fb523b6 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -3533,11 +3533,13 @@ static int xhci_alloc_streams(struct usb_hcd *hcd, struct usb_device *udev,
>  		xhci_dbg(xhci, "Slot %u ep ctx %u now has streams.\n",
>  			 udev->slot_id, ep_index);
>  		vdev->eps[ep_index].ep_state |= EP_HAS_STREAMS;
> -		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
>  	}
>  	xhci_free_command(xhci, config_cmd);
>  	spin_unlock_irqrestore(&xhci->lock, flags);
>  
> +	for (i = 0; i < num_eps; i++)
> +		xhci_debugfs_create_stream_files(xhci, vdev, ep_index);
> +
>  	/* Subtract 1 for stream 0, which drivers can't use */
>  	return num_streams - 1;
>  

Sebastian, I think you might be missing the first mail in this thread. 

https://lore.kernel.org/linux-usb/20201028203124.375344-4-mathias.nyman@linux.intel.com/

Let me do a quick recap to avoid confusion here. So far we have 2 issues.

1. Lockdep issue #1, stream debugfs entry created with local interrupts disabled and xhci->lock held
   Cause: 673d74683627b ("usb: xhci: add debugfs support for ep with stream") in v5.10-rc1
   Fix:  [PATCH 3/3] xhci: Don't create stream debugfs files with spinlock held. (i.e. the mail we are replying to)
   Comment: easily reproduced, enable lockdep and uas, mount debugfs and connect a UAS device.
            discovered by both Hans and Mike
.
2. Lockdep issue #2, adding entries to radix tree during (stream) ring expansion with interrupts disabled and xhci->lock held.
   Cause: unknown, probably a patch since we started using radix trees for finding streams
   Fix: unknown.
   Comment: Discovered by Mike when testing fix for issue#1. I suspect it can be reproduced on 5.9 but is 
   probably really hard as it involves ring expansion.

-Mathias


