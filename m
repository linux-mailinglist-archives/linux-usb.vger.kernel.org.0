Return-Path: <linux-usb+bounces-3020-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1E7F175C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 16:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADAE282783
	for <lists+linux-usb@lfdr.de>; Mon, 20 Nov 2023 15:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4923F1DA24;
	Mon, 20 Nov 2023 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuYOW1vF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9495DC8;
	Mon, 20 Nov 2023 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700494330; x=1732030330;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=yzidrUEMCUcbFArGAxx+rdrshE4gppTFAhlR8SrrLjA=;
  b=WuYOW1vF4qVKdsSZjGzkvpRblDOvmfnXcqQ+1UkGPpqkyEByuConDx+0
   TF3oDQmGijhPLKd15tejBVH8cIV7F1LgPmjLZ8rnNkqD5QlkjTD0jvpnI
   XYMOa8w9jQMf2Jrbuh8NgcgxLcEK56660NY+sL55twSBqgg9tkUoOeua1
   DjdiSonQV52VCzbpLw1VeNlaUlTNCYujoVnOVk2VG5ETSLHL+fGO4Yjbd
   pR+aGNxLau5AEKZktP7cbHS1foZMIvPq/ssZZ6BcQW/6/sG9t9I0kZ7Uh
   q1woaSffJhe4R4x6eEqxmluuWWrub+mXvb8MKuJN+wvJYMzGQPdxhMD8A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371815232"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="371815232"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:32:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="836760404"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="836760404"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2023 07:32:08 -0800
Message-ID: <a970f296-da67-9a80-ab2f-a94fd16e0fd9@linux.intel.com>
Date: Mon, 20 Nov 2023 17:33:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Kuen-Han Tsai <khtsai@google.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alan Stern <stern@rowland.harvard.edu>
References: <20231117072131.2886406-1-khtsai@google.com>
 <a4a129a3-e271-acbb-949c-534a8e1627ee@linux.intel.com>
 <CAKzKK0rnx+tSFAj6N-U_vcAZ_5P=Hx_Kb97NFkdPMHs8dR3Ukw@mail.gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] xhci: fix null pointer deref for xhci_urb_enqueue
In-Reply-To: <CAKzKK0rnx+tSFAj6N-U_vcAZ_5P=Hx_Kb97NFkdPMHs8dR3Ukw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.11.2023 12.19, Kuen-Han Tsai wrote:
> Hi Mathias
> 
>>>        if (usb_endpoint_xfer_isoc(&urb->ep->desc))
>>> @@ -1552,8 +1561,10 @@ static int xhci_urb_enqueue(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flag
>>>                num_tds = 1;
>>>
>>>        urb_priv = kzalloc(struct_size(urb_priv, td, num_tds), mem_flags);
>> kzalloc with spinlock held, should preferably be moved outside lock, otherwise should use GFP_ATOMIC
> 
> Thanks for pointing this out. I realize this patch is incorrect and it
> is non-ideal to include many codes unrelated to xhci->devs[slot_id]
> within the lock.
> 
>> xhci_check_maxpacket() called here can't be called with spinlock held
> 
> It appears that xhci_check_maxpacket() might potentially lead to a
> deadlock later if a spinlock is held. Is this the concern you were
> referring to? If not, please let me know if there are any other
> potential issues that I may have missed, thanks!

xhci_check_maxpacket() will allocate memory, wait for completion, and use the same lock,
so there are several issues here.

I actually think we shouldn't call xhci_check_maxpacket() at all while queuing urbs.

usb core knows when there was max packet size mismatch during enumeration.
I think we should add a hook to the hcd that usb core can call in these cases

Thanks
Mathias


