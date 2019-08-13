Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7958B9A8
	for <lists+linux-usb@lfdr.de>; Tue, 13 Aug 2019 15:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728937AbfHMNKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Aug 2019 09:10:36 -0400
Received: from mga05.intel.com ([192.55.52.43]:12752 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728886AbfHMNKg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Aug 2019 09:10:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 06:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="177796897"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga007.fm.intel.com with ESMTP; 13 Aug 2019 06:10:34 -0700
Subject: Re: [PATCH] xhci: wait CNR when doing xhci resume
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Rick Tseng <rtseng@nvidia.com>,
        Oliver Neukum <oneukum@suse.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1565594692-23683-1-git-send-email-rtseng@nvidia.com>
 <1565597989.14671.3.camel@suse.com>
 <47f0e5d6-145c-4542-362f-dbb4cccb514d@linux.intel.com>
 <MN2PR12MB3215AA4B411231FC2D67E81FB1D20@MN2PR12MB3215.namprd12.prod.outlook.com>
 <87ef1pz1hl.fsf@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <649d09b8-5d60-03f2-c695-b093706fe51e@linux.intel.com>
Date:   Tue, 13 Aug 2019 16:12:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ef1pz1hl.fsf@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Hi,
> 
> Rick Tseng <rtseng@nvidia.com> writes:
> 
>> Hi Mathias,
>>
>> Thanks for suggestion.
>> The reason I do not use xhci_handshake() is we get build fail when configuring below as module:
>> USB_XHCI_HCD = m
>> USB_XHCI_PCI = m
>>
>> Fail message as below:
>> ERROR: "xhci_handshake" [drivers/usb/host/xhci-pci.ko] undefined!
>>
>> So I write my own function to check CNR.

Adding EXPORT_SYMBOL_GPL(xhci_handshake) after the xhci_handshake() function in xhci.c
should solve that.

But I agree with Felipe that checking for Controller Not Ready (CNR)
is useful for any xHCI host, not just PCI xHCI hosts,
so move the CNR check to xhci_resume()

> 
> yeah, move that code to xhci_suspend(). It's valid for any XHCI host.
> 

xhci_resume()

-Mathias

