Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4F218926
	for <lists+linux-usb@lfdr.de>; Thu,  9 May 2019 13:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbfEILhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 May 2019 07:37:43 -0400
Received: from mga09.intel.com ([134.134.136.24]:21246 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfEILhn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 May 2019 07:37:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2019 04:37:42 -0700
X-ExtLoop1: 1
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2019 04:37:41 -0700
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
 <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
 <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
 <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
Date:   Thu, 9 May 2019 14:40:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9.5.2019 13.32, Marek Szyprowski wrote:
> Dear All,
> 
> On 2019-04-26 15:23, Mathias Nyman wrote:
>> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>
>> Immediate data transfers (IDT) allow the HCD to copy small chunks of
>> data (up to 8bytes) directly into its output transfer TRBs. This avoids
>> the somewhat expensive DMA mappings that are performed by default on
>> most URBs submissions.
>>
>> In the case an URB was suitable for IDT. The data is directly copied
>> into the "Data Buffer Pointer" region of the TRB and the IDT flag is
>> set. Instead of triggering memory accesses the HC will use the data
>> directly.
>>
>> The implementation could cover all kind of output endpoints. Yet
>> Isochronous endpoints are bypassed as I was unable to find one that
>> matched IDT's constraints. As we try to bypass the default DMA mappings
>> on URB buffers we'd need to find a Isochronous device with an
>> urb->transfer_buffer_length <= 8 bytes.
>>
>> The implementation takes into account that the 8 byte buffers provided
>> by the URB will never cross a 64KB boundary.
>>
>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>> Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> I've noticed that this patch causes regression on various Samsung Exynos
> 5420/5422/5800 boards, which have USB3.0 host ports provided by
> DWC3/XHCI hardware module. The regression can be observed with ASIX USB
> 2.0 ethernet dongle, which stops working after applying this patch (eth0
> interface is registered, but no packets are transmitted/received). I can
> provide more debugging information or do some tests, just let me know
> what do you need. Reverting this commit makes ASIX USB ethernet dongle
> operational again.
> 

Thanks for reporting.

Would it be possible to check if your ASIX ethernet dongle works on some
desktop/laptop setup with this same IDT patch?

Also Exynos xhci traces could help, they would show the content of the TRBs using IDT.
Maybe byte order gets messed up?

Take traces with:

mount -t debugfs none /sys/kernel/debug
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable

<connect ASIX eth dongle, try to use it>

send /sys/kernel/debug/tracing/trace content to me

If we can't get this fixed I'll revert the IDT patch

Thanks
Mathias
