Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4493077BD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 15:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhA1OOa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 09:14:30 -0500
Received: from mga05.intel.com ([192.55.52.43]:64119 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231160AbhA1OO1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 09:14:27 -0500
IronPort-SDR: YuAE+pQmA0Q05L345qsGL0IpuuL4d8sNaJVogEGXTFYkwz4ORO/ZmGSPfzzIb1Pw/aG+6d1U3j
 m+Mw0Zuv276A==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="265070140"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="265070140"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 06:12:41 -0800
IronPort-SDR: SBOYILtEwBDz2zoAPH1EhIlSMU9vgwA85A7VPp0UJZdPwTOk47MkUajuyTh2zgssCzBNM1yg9Y
 76v/+aptn/Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="354185391"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2021 06:12:40 -0800
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
To:     Andreas Hartmann <andihartmann@01019freenet.de>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
 <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
 <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
 <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
 <de0cab7e-6e25-fe80-b1d7-d50f63d6e54c@01019freenet.de>
 <9c3c9dd7-bcfb-785c-8c11-39f78a7fca01@01019freenet.de>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <ab675d28-d80f-ed72-5db0-943cb26819f1@linux.intel.com>
Date:   Thu, 28 Jan 2021 16:14:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9c3c9dd7-bcfb-785c-8c11-39f78a7fca01@01019freenet.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> If I'm understanding it correctly, you're always creating a bounce
>> buffer though it is not necessary (at least in my case - my test patch
>> proofed, that no changes at all are necessary). Why aren't you checking
>> for URB_NO_TRANSFER_DMA_MAP at the very beginning? Or is it your purpose
>> to first basically test your new code path? That would be ok.

Bounce buffer is only used when there is no other way of meeting the xHCI
alignment requirements. Worst case is once every 255 TRB, and for maximum 1024bytes.
Each TRB can point to 64K of data.

I can't go against the spec just because it doesn't cause issues in your
two usecases. The overhead of the bounce buffer usage is so small there's no
point in that kind of optimization.

URB_NO_TRANSFER_DMA_MAP only indicates the data was DMA mapped before driver 
submitted the URB, so usb core does not need to map it.

I was speculating that it could be a cause why data is so oddly aligned
(urbs with data starting at less than 512 bytes from 64k boundary), and
thus not meeting the xHC boundary and aligment requirements even if data
is otherwise contiguous.

xHC controller doesn't care who mapped the data, or if data is in a sg list
or already contiguous in urb->transfer_buffer as long as we follow
the aligment and boudary rules.

Bug was that driver assumed the data that needed to be bounce
buffered was in a sg list. Your cased proved it could be in
urb->tranfer_buffer instead.

>>
>> I tested with the notebook (in both directions) - it seems to work - I
>> didn't get any problems though I used 24 kB bulk packets. Throughput was
>> unaltered high.
>>
>> I'm doing the same test tomorrow with the other USB 3.1 controller!
> 
> Successfully tested on the other USB 3.1 host.
> 

Thank you, much appreciated.

I think I'll submit this patch as it is (with a proper commit message)
can I add reported-by: Andreas Hartmann <andihartmann@01019freenet.de>, and
tested-by: Andreas Hartmann <andihartmann@01019freenet.de> tags to the patch?

-Mathias
