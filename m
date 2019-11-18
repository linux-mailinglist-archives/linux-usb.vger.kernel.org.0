Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501C01000FB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 10:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfKRJNG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 04:13:06 -0500
Received: from mga18.intel.com ([134.134.136.126]:45959 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726442AbfKRJNG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 04:13:06 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Nov 2019 01:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; 
   d="scan'208";a="407327695"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2019 01:13:04 -0800
Subject: Re: [PATCH 4/4] xhci-pci: Allow host runtime PM as default also for
 Intel Ice Lake xHCI
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <1573836603-10871-1-git-send-email-mathias.nyman@linux.intel.com>
 <1573836603-10871-5-git-send-email-mathias.nyman@linux.intel.com>
 <20191116092552.GA390155@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <f7b3a8c2-73c4-6c2d-497a-94ac6a879103@linux.intel.com>
Date:   Mon, 18 Nov 2019 11:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191116092552.GA390155@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.11.2019 11.25, Greg KH wrote:
> On Fri, Nov 15, 2019 at 06:50:03PM +0200, Mathias Nyman wrote:
>> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>>
>> Intel Ice Lake has two xHCI controllers one on PCH and the other as part
>> of the CPU itself. The latter is also part of the so called Type C
>> Subsystem (TCSS) sharing ACPI power resources with the PCIe root ports
>> and the Thunderbolt controllers. In order to put the whole TCSS block
>> into D3cold the xHCI needs to be runtime suspended as well when idle.
>>
>> For this reason allow runtime PM as default for Ice Lake TCSS xHCI
>> controller.
>>
>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-pci.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Can this also be queued up for the stable tree (or at least for 5.4.y?)
> 

Yes, please, 5.4.y
Ice Lake Thunderbolt support [1] was accepted to 5.4-rc1 so 5.4.y makes sense.
Patch is not that useful for older stable versions on its own.
  
[1] 3cdb9446a117 thunderbolt: Add support for Intel Ice Lake

-Mathias
