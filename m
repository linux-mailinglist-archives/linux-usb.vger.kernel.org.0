Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3876FFB10F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Nov 2019 14:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfKMNHJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Nov 2019 08:07:09 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37388 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfKMNHI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Nov 2019 08:07:08 -0500
Received: by mail-wr1-f65.google.com with SMTP id t1so2294612wrv.4
        for <linux-usb@vger.kernel.org>; Wed, 13 Nov 2019 05:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=gQze+cWN/QjpSARc+b/KnAPpYfQGbT4/43/lm0mifs0=;
        b=UDoysn54C5XBiaim6yFDIJBWNgoo38azt9s75LkVcs8Mzoo4TgnIsz+zYxQiLDGEwv
         ZhwxIL9obYUBXZPNcMSFhokwrvFyFK3m6sd0xgKSto8SKj+dvvWjdN0EhI1l2LgF5tiC
         5oxVwv4+SYkmjWcJqLRDMdGfs0eRUfovpepzqfhbfmBdABvOKjY/cReA9K3RzFWkwgOW
         lKWbkgzWvP4z2+1tTxyMs9AKuzbXBkYJ3mDyTDq3Qv6y59+zwSFm8it+AUECZkd0bE8K
         hQx/Omo8z+qJwd5nq0kiHYYX4EShTzqvsSel9EKj82taxxkIv285sxVYRA2ZXhxDzPFd
         /a+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-transfer-encoding;
        bh=gQze+cWN/QjpSARc+b/KnAPpYfQGbT4/43/lm0mifs0=;
        b=LVqzsEBeUVrQbjp6JEHEv2ISBTcLmv2SPQmvI6D+p9BkqyO26/rHoBr2/gz9/nN+4Z
         clo/8BHvDn+mBqaERPqK8fSwX2hgzeYTU3Um1gbI2/zAaS4XtTudFUEmValmARzrFI09
         9taEDxllCnCT/S98zyQ9K4zEFN9lQAEVJjWASaYYFsIxj5/n5FQpS+Zhv3LTHz7DGepj
         +SV+b3m+shi+V9zibQrDVFdBYSW2OxlZygDnkhfVO3Hf37mLFn8JgBGRsmE0SjqLPa6I
         lTwIsZ+wf4KsGoM79k/S8WKXPmU9kvt7NelnS50Vq9ZHoeAXYDwgkAmULbcA356zoS91
         VORA==
X-Gm-Message-State: APjAAAU9XjlXCXrdVhWoRltGEQphEh48dtBAcmUDoGInzuBQlyrElHZx
        cL9tnmX78sOHtHUkfvJSGe/sHLtrwRU=
X-Google-Smtp-Source: APXvYqxi3/kbWvbyVFgPyS+95KG3ho1nHYKym5GqZ/9SrnD0hLAfCiu/PswGd7pnjn/DHISbl8NbtA==
X-Received: by 2002:a05:6000:110a:: with SMTP id z10mr2613248wrw.291.1573650424891;
        Wed, 13 Nov 2019 05:07:04 -0800 (PST)
Received: from [93.172.117.241] (93-172-117-241.bb.netvision.net.il. [93.172.117.241])
        by smtp.gmail.com with ESMTPSA id h15sm3084249wrb.44.2019.11.13.05.07.02
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 05:07:04 -0800 (PST)
Message-ID: <5DCBFFF4.1020300@gmail.com>
Date:   Wed, 13 Nov 2019 15:07:00 +0200
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: xhci-ring: "needs XHCI_TRUST_TX_LENGTH quirk" in kernel log
References: <5DCA343A.4000304@gmail.com> <553d3af1-dcd6-0db2-094d-64e7aa749e23@linux.intel.com> <5DCA9F82.1030204@gmail.com> <aa57ccb4-2d7e-f7c6-4bd6-e8411573c09d@linux.intel.com>
In-Reply-To: <aa57ccb4-2d7e-f7c6-4bd6-e8411573c09d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Yes, I'm aware that the event TRBs that follow a COMP_SHORT_PACKET 
should be COMP_SHORT_PACKET as well. That what I meant with "faulty 
event TRBs".

However I wasn't aware that these event TRBs were discarded on the basis 
that they didn't have a matching TD queued. Or more precisely, that the 
ep_seg would turn out NULL, and then it will turn out that !ep->skip && 
(xhci->quirks & XHCI_SPURIOUS_SUCCESS) will be true, as all recent xHCI 
controllers have XHCI_SPURIOUS_SUCCESS set.

So what I suggest is to move the XHCI_TRUST_TX_LENGTH fix and warning to 
a place where it won't be reached if the event TRB is ignored anyhow. 
This makes the code slightly uglier, but it's a catch-all solution for 
all future Renesas (and similar?) chipsets.

Plus it does XHCI_TRUST_TX_LENGTH some justice: I don't think it was 
meant as a way to silence warnings, but rather to handle controllers 
that submit a COMP_SUCCESS TRB with a non-zero length instead of a 
COMP_SHORT_PACKET.

I shall submit a patch with my suggested shortly after this mail. It 
silences the warnings on my machine (without the XHCI_TRUST_TX_LENGTH 
you sent to me yesterday). Please take a look.

Thanks and regards,
    Eli

On 12/11/19 16:33, Mathias Nyman wrote:
> On 12.11.2019 14.03, Eli Billauer wrote:
>> Hello,
>>
>> Thanks, this patch solves the issue, as one would expect.
>>
>> However I'm under the impression that the underlying problem is only 
>> in the Event TRBs that arrive after the Event TRB of 
>> COMP_SHORT_PACKET type. In other words, the quirky behavior is only 
>> when the xHC flushes the Data TRBs that are left after the short 
>> packet has arrived, and sends faulty Event TRBs on their behalf.
>>
>
> Specs say that the completion code of event TRBs following a 
> COMP_SHORT_PACKET should
> also be COMP_SHORT_PACKET for a TD, so we don't expect success 
> completion codes.
>
> xhci 4.10.1.1.2
>
> "If the Short Packet occurred while processing a Transfer TRB with 
> only an ISP
> flag set, then two events shall be generated for the transfer; one for 
> the Transfer
> TRB that the Short Packet occurred on, and a second for the last TRB 
> with the
> IOC flag set. Table 6-38 defines the Completion Code and TRB Transfer 
> Length
> for the first event. In the second event, the Completion Code shall be 
> set to
> Short Packet, and the TRB Transfer Length should be set to the same 
> value that
> was reported by the initial Short Packet Event."
>
>> So maybe ignore any Event TRB on behalf of a TD for which a 
>> COMP_SHORT_PACKET has been received? I mean, what information could 
>> it possibly contain?
>
> We kind of do. The TD is removed from list and possibly given back 
> after first short packet.
>
> If a event TRB doesn't match the next queued TD on list, and the 
> previous TD was short,
> then the event is silently ignored.
> Or well, if its completion code is success you will see the warning 
> message you mentioned.
>
> -Mathias
>
>
>>
>> This would also have solved the "Event TRB with no TDs queued" issue, 
>> just in a more generalized manner.
>>
>> Regards,
>>     Eli
>>
>> On 12/11/19 11:36, Mathias Nyman wrote:
>>> On 12.11.2019 6.25, Eli Billauer wrote:
>>>> Hello,
>>>>
>>>> Connecting a custom designed (on FPGA) USB 3.0 device to a Renesas 
>>>> uPD720202 (1912:0015) and kernel v5.3.0, I get a lot of messages in 
>>>> the kernel log, while transmitting data at a high bandwidth through 
>>>> a BULK IN endpoint:
>>>>
>>>> handle_tx_event: 36590 callbacks suppressed
>>>> xhci_hcd 0000:03:00.0: WARN Successful completion on short TX for 
>>>> slot 1 ep 18: needs XHCI_TRUST_TX_LENGTH quirk?
>>>> (last message repeated several times)
>>>>
>>>> The driver in charge, as reported by lspci, is xhci_hcd.
>>>>
>>>> Probably relevant details:
>>>>
>>>> * The buffer size of the USB transactions is 32 kiB and up (with 
>>>> libusb). With e.g. 16 kiB buffers these log messages don't appear.
>>>> * The device produces short packets occasionally. When only 
>>>> full-length packets are sent, these log messages don't appear.
>>>> * Other than these log messages, everything works fine. In 
>>>> particular, there are no errors in the data exchange in either 
>>>> situation.
>>>> * This problem doesn't happen when running the same test on an 
>>>> Intel B150 chipset’s USB 3.0 xHCI controller (8086:a12f).
>>>>
>>>> I don't really know what this warning means, but this whole thing 
>>>> kind-of reminds the "WARN Event TRB for slot x ep y with no TDs 
>>>> queued" issue that was solved recently. Just a wild guess.
>>>>
>>>
>>> It just means that we got an event from the xHC host saying the 
>>> transfer was
>>> completed with completion code "Success" even if we didn't get as 
>>> many bytes as was requested.
>>> Driver is expecting a completion code of Short Packet.
>>>
>>>> Any idea how this can be fixed?
>>>>
>>>
>>> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
>>> index 1e0236e90687..687182afc59b 100644
>>> --- a/drivers/usb/host/xhci-pci.c
>>> +++ b/drivers/usb/host/xhci-pci.c
>>> @@ -228,6 +228,7 @@ static void xhci_pci_quirks(struct device *dev, 
>>> struct xhci_hcd *xhci)
>>>         }
>>>         if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
>>>             pdev->device == 0x0015) {
>>> +               xhci->quirks |= XHCI_TRUST_TX_LENGTH;
>>>                 xhci->quirks |= XHCI_RESET_ON_RESUME;
>>>                 xhci->quirks |= XHCI_ZERO_64B_REGS;
>>>         }
>>>
>>> You could give it a try and see if everything works normally.
>>>
>>> But this quirk is now quite common.
>>> Could make sense to get rid of it completely and just handle this 
>>> case as default driver behavior.
>>>
>>> -Mathias
>>>
>>
>


