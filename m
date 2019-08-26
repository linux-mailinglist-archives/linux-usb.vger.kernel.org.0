Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15BC19CA4A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 09:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729981AbfHZH1G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Aug 2019 03:27:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:35634 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729962AbfHZH1F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Aug 2019 03:27:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Aug 2019 00:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,431,1559545200"; 
   d="scan'208";a="204471042"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 26 Aug 2019 00:27:02 -0700
Subject: Re: [Patch v5] usb: hcd: use managed device resources
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1566569488679.31808@mentor.com> <20190825082949.GA4583@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <975465c3-6ced-56f6-9115-a19248b370be@linux.intel.com>
Date:   Mon, 26 Aug 2019 10:28:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190825082949.GA4583@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.8.2019 11.29, Greg KH wrote:
> On Fri, Aug 23, 2019 at 02:11:28PM +0000, Schmid, Carsten wrote:
>> Using managed device resources in usb_hcd_pci_probe() allows devm usage for
>> resource subranges, such as the mmio resource for the platform device
>> created to control host/device mode mux, which is a xhci extended
>> capability, and sits inside the xhci mmio region.
>>
>> If managed device resources are not used then "parent" resource
>> is released before subrange at driver removal as .remove callback is
>> called before the devres list of resources for this device is walked
>> and released.
>>
>> This has been observed with the xhci extended capability driver causing a
>> use-after-free which is now fixed.
>>
>> An additional nice benefit is that error handling on driver initialisation
>> is simplified much.
>>
>> Signed-off-by: Carsten Schmid <carsten_schmid@mentor.com>
>> Tested-by: Carsten Schmid <carsten_schmid@mentor.com>
>> ---
>> Rationale:
>> Use-after-free was reproduced on 4.14.102 and 4.14.129 kernel
>> using unbind mechanism.
>> echo 0000:00:15.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
>>
>> Upstream version of driver is identical in the affected code.
>> Fix was tested successfully on 4.14.129.
>> Provided patch applies and compiles on v5.2.8 stable.
>> As this is also a bugfix, please consider it to go to stable trees too.
> 
> How far back should it go, just 4.14?  Was this caused by a specific
> commit that you happened to notice?
> 

To me it looks like the causing commit was added to 4.17:
fa31b3c xhci: Add Intel extended cap / otg phy mux handling

Carsten, was the issue reproduced on upstream linux stable 4.14.129,
or on some custom tree with backports?

-Mathias
