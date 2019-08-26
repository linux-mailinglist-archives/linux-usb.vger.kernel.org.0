Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF829CBC1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 10:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730755AbfHZIjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 04:39:09 -0400
Received: from mga06.intel.com ([134.134.136.31]:55890 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729737AbfHZIjJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 04:39:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 01:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="204503563"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 01:39:07 -0700
Subject: Re: AW: [Patch v5] usb: hcd: use managed device resources
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1566569488679.31808@mentor.com> <20190825082949.GA4583@kroah.com>
 <975465c3-6ced-56f6-9115-a19248b370be@linux.intel.com>
 <1566806970031.45477@mentor.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <bdb2e92b-2bd8-f88f-d593-59532c9b7c2c@linux.intel.com>
Date:   Mon, 26 Aug 2019 11:41:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566806970031.45477@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 26.8.2019 11.09, Schmid, Carsten wrote:
>>>> Upstream version of driver is identical in the affected code.
>>>> Fix was tested successfully on 4.14.129.
>>>> Provided patch applies and compiles on v5.2.8 stable.
>>>> As this is also a bugfix, please consider it to go to stable trees too.
>>>
>>> How far back should it go, just 4.14?  Was this caused by a specific
>>> commit that you happened to notice?
>>>
>>
>> To me it looks like the causing commit was added to 4.17:
>> fa31b3c xhci: Add Intel extended cap / otg phy mux handling
>>
>> Carsten, was the issue reproduced on upstream linux stable 4.14.129,
>> or on some custom tree with backports?
>>
>> -Mathias
>>
> The issue was reproduced on a custom kernel.
> The commit you give "xhci: Add Intel extended cap / otg phy mux handling"
> is part of a merge from 4.14/usb to 4.14/yocto in this custom kernel.
> Hard to tell exactly where it came in.
> 
> Anyway, you are right, looks like upstream 4.14 doesn't have it.
> So 4.19 seems to be the oldest one, indeed.
> 
> For me, i am fine to know that the patch will go upstream and avoid curious
> crashes through this use-after-free in the future. I'm pretty sure that this
> could be reproduced with the upstream kernel as the mechanism is deterministic.
> 
> In our project, due to a crash that happened short before SOP and
> i did not have time to figure out where the problem originally came from,
> i did a really dirty hack setting the num_resource=0 of the platform device
> prior to platform removal code. Helps but is really, really dirty.
> And now as you accept the patch for upstream i can replace the dirty hack
> by the official patch for next SOP.
> 

Thanks for fixing this, it solves a real upstream xhci related issue since 4.19.
Fix is outside xhci so accepting this is no longer up to me, but for Greg:

Reviewed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Fixes: fa31b3cb2ae1 ("xhci: Add Intel extended cap / otg phy mux handling")
Cc: <stable@vger.kernel.org> # v4.19+

