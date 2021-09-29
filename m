Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0713941C692
	for <lists+linux-usb@lfdr.de>; Wed, 29 Sep 2021 16:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344135AbhI2OXv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Sep 2021 10:23:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:35542 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244491AbhI2OXu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Sep 2021 10:23:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212205808"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="212205808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2021 07:21:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; 
   d="scan'208";a="486933959"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga008.jf.intel.com with ESMTP; 29 Sep 2021 07:21:46 -0700
To:     =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
References: <87h7hdf5dy.fsf@miraculix.mork.no>
 <87tuj4jot3.fsf@miraculix.mork.no> <87zgrxq3ay.fsf@miraculix.mork.no>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 RESEND] xhci: add quirk for host controllers that don't
 update endpoint DCS
Message-ID: <b23d5b4b-5c55-5f59-0cc3-41c633570c06@linux.intel.com>
Date:   Wed, 29 Sep 2021 17:24:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87zgrxq3ay.fsf@miraculix.mork.no>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.9.2021 21.30, Bjørn Mork wrote:
> Bjørn Mork <bjorn@mork.no> writes:
> 
>> From: Jonathan Bell <jonathan@raspberrypi.org>
>>
>> Seen on a VLI VL805 PCIe to USB controller. For non-stream endpoints
>> at least, if the xHC halts on a particular TRB due to an error then
>> the DCS field in the Out Endpoint Context maintained by the hardware
>> is not updated with the current cycle state.
>>
>> Using the quirk XHCI_EP_CTX_BROKEN_DCS and instead fetch the DCS bit
>> from the TRB that the xHC stopped on.
>>
>> [ bjorn: rebased to v5.14-rc2 ]
>> Cc: stable@vger.kernel.org
>> Link: https://github.com/raspberrypi/linux/issues/3060
>> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.org>
>> Signed-off-by: Bjørn Mork <bjorn@mork.no>
>> ---
>> [ resending this as I haven't seen any ack/nak and wonder if it might
>>   have gotten lost in a large pile of vacation backlog ]
> 
> ping?
> 

Sorry about the delay, looks good to me.
I'll let it go through some testing, then add it.

As this goes to stable it makes sense to add it as is, but
this again shows I really need to write a xhci_dma_to_trb(ring, dma) helper

Thanks
-Mathias 
