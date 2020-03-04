Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC196179011
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 13:09:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgCDMJV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 07:09:21 -0500
Received: from mga14.intel.com ([192.55.52.115]:4720 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgCDMJU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 07:09:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 04:09:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; 
   d="scan'208";a="229310678"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 04:09:18 -0800
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
To:     Jonas Karlsson <jonas.karlsson@actia.se>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
Date:   Wed, 4 Mar 2020 14:11:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3.3.2020 22.08, Jonas Karlsson wrote:
>>
>> On Tue, Mar 03, 2020 at 03:05:50PM +0000, Jonas Karlsson wrote:
>>> Hi,
>>>
>>> We have a board with an NXP i.MX8 SoC. We are running Linux 4.19.35 from
>> NXP on the SoC.
>>>
>>> There is a modem connected to the SoC via USB through a USB hub.
>>> The modem presents it self as a cdc-acm device with 4 tty:s.
>>>
>>> Sometimes we end up in a situation where all transfers over USB generetes
>> 'USB transaction Errors".
>>> It is likely that the modem is misbehaving. When this happens we get a lot of
>> "xhci-cdns3: ERROR unknown event type 37"
>>> in the terminal indicating that the xhci event ring is full. This often leads to RCU
>> stalls and sometimes Kernel panics.
>>>
>>> If I enable dynamic debug on xhci_hcd and cdc-acm I can see that all
>>> transfers have error code -71 (-EPROTO which in xhci translates to
>>> 'USB transaction error"). When this happens it seems like xhci resets
>>> the ep, sets TR Deq Ptr to unstall the ep and then a new transfer is
>>> started which also fails.

Note that these are all xhci internal endpoint state operations, the device
(modem) is not seeing any of these changes on its side of the endpoint.

In 4.19  kernel xhci will give back the URB with transaction error with a
-EPROTO status Immediately in the interrupt handler.
A Transaction error, just like a stall error will cause the xHC internal
endpoint state to go to halted, xhci driver needs to reset the "xhci internal"
endpoint state to move it to a stopped state, and move tell xHC controller to
move past that URB in the ring buffer with a Set TR Deq ptr command
(clears xHC controller internal cache as well)

If the ring is not empty when Set TR Deq ptr completes, then driver restarts it.
In this case it appears cdc_acm managed to queue back the URB before this,
restarting the ring. This was repeated over and over again.

>>> This behavior generates a lot of events on
>>> the event ring which causes 'ERROR unknown event type 37'. This loop
>>> of failing transfers seems to continue until we either unbind the USB driver or
>> get a kernel panic. The SoC almost becomes unresponsive since it spends most
>> of the time executing usb interrupts.
>>>
>>> If I pull the reset pin of the USB hub and keep it in reset state at
>>> this point, the event loop of failing transfers continues despite
>>> there is nothing on the USB bus any longer. The only way to get out of that
>> loop is to either unbind the usb driver or power cycle the board.
>>>
>>> Is this the expected behavior when USB transaction error happens for all
>> transfers when using cdc-acm class driver?
>>> Or could there be something wrong in the low level USB driver (Cadence
>>> in our case)? We need to figure out why we get all the transaction errors but
>> we also need to make sure the kernel does not die on us when we have a
>> misbehaving USB device.
>>> Does anyone have a suggestion on what we could do to improve the stability
>> of the kernel in this situation?
>>
>> I would blame the xhci-cdns driver as it is the one controlling all of this.
>>
>> I don't see this driver in the 4.19 tree, so I think you are going to have to get
>> support from the company that provided you with that driver as you are already
>> paying for that support from them :)
>>
>> good luck!
>>
>> greg k-h
> 
> Thanks for the feedback! If the cadence driver is the main suspect I totally agree with you.
> 
> The reason I posted on this mailing list was that I was afraid that the cdc-acm driver could
> be causing new transfers to be started when the previous fails due to USB transaction errors and
> then trigger this event storm.
> The acm_ctrl_irq() function seems to submit a new urb directly if the previous fails, but I cannot 
> say that I understand that code very well yet. The acm_read_bulk_callback() function also seem
> to submit a new read urb on USB transaction Errors. But If you think this could not cause this
> behavior I will ask our supplier to fix the cdns driver.
> 
> BR,
> Jonas
> 

I recently got a report about a bit similar issue on a 4.4 stable kernel, so this
might not be xhci-cdns specific.

That case involved autosuspend of the cdc-acm, and there was only a short burst of
transaction erros and resubmitted URBs even if the device was supposed to be suspended.
It looks like cdc_acm autosuspended even if it had URBs pending.

I'm guessing that in that case the transfer ring restarted even if link was already "suspeded",
causing transaction errors. Ring could be restarted if URBs were resubmitted
by the class driver when usb core suspends all interfaces, flushing all pending URBs which
calls the URB completion handler.

-Mathias
