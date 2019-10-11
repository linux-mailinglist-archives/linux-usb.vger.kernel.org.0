Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A76D3FDC
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfJKMpp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 08:45:45 -0400
Received: from mga06.intel.com ([134.134.136.31]:62385 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728147AbfJKMpp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 08:45:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 05:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="219380772"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2019 05:45:43 -0700
Subject: Re: [PATCH 8/8] xhci: Fix NULL pointer dereference in
 xhci_clear_tt_buffer_complete()
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     gregkh@linuxfoundation.org, USB <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <1570190373-30684-1-git-send-email-mathias.nyman@linux.intel.com>
 <1570190373-30684-9-git-send-email-mathias.nyman@linux.intel.com>
 <20191007140245.GD13531@localhost>
 <c0b1f81f-db1a-8f12-6880-a686cb9c35a7@linux.intel.com>
Message-ID: <1c4b7107-f5e1-4a69-2a73-0e339c7e1072@linux.intel.com>
Date:   Fri, 11 Oct 2019 15:47:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0b1f81f-db1a-8f12-6880-a686cb9c35a7@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8.10.2019 11.15, Mathias Nyman wrote:
> On 7.10.2019 17.02, Johan Hovold wrote:
>>
>> I didn't have time to look into this myself last week, or comment on the
>> patch before Greg picked it up, but this clearly isn't the right fix.
>>
>> As your comment suggests, ep->hcpriv may indeed be NULL here if USB core
>> have allocated a new udev. But this only happens after USB has freed the
>> old usb_device and the new one happens to get the same address.
>>
> 
> You're right, that fix doesn't solve the actual issue, it avoids a few specific
> null pointer dereference cases, but leaves both root cause and several other
> use-after-free cases open.
> 
>> Note that even the usb_host_endpoint itself (ep) has then been freed and
>> reallocated since it is member of struct usb_device, and it is the
>> use-after-free that needs fixing.
>>
>> I've even been able to trigger another NULL-deref in this function
>> before a new udev has been allocated, due to the virt dev having been
>> freed by xhci_free_dev as part of usb_release_dev:
>>
>> It seems the xhci clear-tt implementation was incomplete since it did
>> not take care to wait for any ongoing work before disabling the
>> endpoint. EHCI does this in ehci_endpoint_disable(), but xhci doesn't
>> even implement that callback.
>>
> 
> So it seems, it might be possible to remove pending clear_tt work for
> most endpoints in the .drop_endpoint callbacks, but ep0 is different,
> it isn't dropped, we might need to implement the endpoint_disable()
> callback for this.
> 

I was able to reproduce the use-after-free issue by faking a endpoint halt,
and resetting the endpoint early in enumeration at Get device descriptor request.

To fix this I added the endpoint_disable() callback that will wait for
clear_tt_work to finish before returning, similar to the ehci solution.
It works in my case.

the endpoint_disable() callback is called by usb core both before dropping
xhci endpoints belonging to a interface, and separately for ep0 before udev is
freed during enumeration retry.

Both the hack that triggers the issue (LS/FS behind HS bug won't ever enumerate with this)
and the fix to prevent use after free can be found in  clear_tt_fix branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git clear_tt_fix

I'll send the fix out to the list as well, any chance you could try that out?

-Mathias
