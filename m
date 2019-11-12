Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6C87F9294
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 15:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfKLObk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Nov 2019 09:31:40 -0500
Received: from mga12.intel.com ([192.55.52.136]:56687 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbfKLObk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Nov 2019 09:31:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 06:31:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,296,1569308400"; 
   d="scan'208";a="229409125"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga004.fm.intel.com with ESMTP; 12 Nov 2019 06:31:38 -0800
Subject: Re: xhci-ring: "needs XHCI_TRUST_TX_LENGTH quirk" in kernel log
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
References: <5DCA343A.4000304@gmail.com>
 <553d3af1-dcd6-0db2-094d-64e7aa749e23@linux.intel.com>
 <5DCA9F82.1030204@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <aa57ccb4-2d7e-f7c6-4bd6-e8411573c09d@linux.intel.com>
Date:   Tue, 12 Nov 2019 16:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5DCA9F82.1030204@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12.11.2019 14.03, Eli Billauer wrote:
> Hello,
> 
> Thanks, this patch solves the issue, as one would expect.
> 
> However I'm under the impression that the underlying problem is only in the Event TRBs that arrive after the Event TRB of COMP_SHORT_PACKET type. In other words, the quirky behavior is only when the xHC flushes the Data TRBs that are left after the short packet has arrived, and sends faulty Event TRBs on their behalf.
> 

Specs say that the completion code of event TRBs following a COMP_SHORT_PACKET should
also be COMP_SHORT_PACKET for a TD, so we don't expect success completion codes.

xhci 4.10.1.1.2

"If the Short Packet occurred while processing a Transfer TRB with only an ISP
flag set, then two events shall be generated for the transfer; one for the Transfer
TRB that the Short Packet occurred on, and a second for the last TRB with the
IOC flag set. Table 6-38 defines the Completion Code and TRB Transfer Length
for the first event. In the second event, the Completion Code shall be set to
Short Packet, and the TRB Transfer Length should be set to the same value that
was reported by the initial Short Packet Event."

> So maybe ignore any Event TRB on behalf of a TD for which a COMP_SHORT_PACKET has been received? I mean, what information could it possibly contain?

We kind of do. The TD is removed from list and possibly given back after first short packet.

If a event TRB doesn't match the next queued TD on list, and the previous TD was short,
then the event is silently ignored.
Or well, if its completion code is success you will see the warning message you mentioned.

-Mathias


> 
> This would also have solved the "Event TRB with no TDs queued" issue, just in a more generalized manner.
> 
> Regards,
>     Eli
> 
> On 12/11/19 11:36, Mathias Nyman wrote:
>> On 12.11.2019 6.25, Eli Billauer wrote:
>>> Hello,
>>>
>>> Connecting a custom designed (on FPGA) USB 3.0 device to a Renesas uPD720202 (1912:0015) and kernel v5.3.0, I get a lot of messages in the kernel log, while transmitting data at a high bandwidth through a BULK IN endpoint:
>>>
>>> handle_tx_event: 36590 callbacks suppressed
>>> xhci_hcd 0000:03:00.0: WARN Successful completion on short TX for slot 1 ep 18: needs XHCI_TRUST_TX_LENGTH quirk?
>>> (last message repeated several times)
>>>
>>> The driver in charge, as reported by lspci, is xhci_hcd.
>>>
>>> Probably relevant details:
>>>
>>> * The buffer size of the USB transactions is 32 kiB and up (with libusb). With e.g. 16 kiB buffers these log messages don't appear.
>>> * The device produces short packets occasionally. When only full-length packets are sent, these log messages don't appear.
>>> * Other than these log messages, everything works fine. In particular, there are no errors in the data exchange in either situation.
>>> * This problem doesn't happen when running the same test on an Intel B150 chipset’s USB 3.0 xHCI controller (8086:a12f).
>>>
>>> I don't really know what this warning means, but this whole thing kind-of reminds the "WARN Event TRB for slot x ep y with no TDs queued" issue that was solved recently. Just a wild guess.
>>>
>>
>> It just means that we got an event from the xHC host saying the transfer was
>> completed with completion code "Success" even if we didn't get as many bytes as was requested.
>> Driver is expecting a completion code of Short Packet.
>>
>>> Any idea how this can be fixed?
>>>
>>
>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>> index 1e0236e90687..687182afc59b 100644
>> --- a/drivers/usb/host/xhci-pci.c
>> +++ b/drivers/usb/host/xhci-pci.c
>> @@ -228,6 +228,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>>         }
>>         if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
>>             pdev->device == 0x0015) {
>> +               xhci->quirks |= XHCI_TRUST_TX_LENGTH;
>>                 xhci->quirks |= XHCI_RESET_ON_RESUME;
>>                 xhci->quirks |= XHCI_ZERO_64B_REGS;
>>         }
>>
>> You could give it a try and see if everything works normally.
>>
>> But this quirk is now quite common.
>> Could make sense to get rid of it completely and just handle this case as default driver behavior.
>>
>> -Mathias
>>
> 

