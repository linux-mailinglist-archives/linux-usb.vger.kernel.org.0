Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D2E1794E4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 17:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbgCDQTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 11:19:16 -0500
Received: from mga06.intel.com ([134.134.136.31]:64663 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgCDQTQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 11:19:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 08:19:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; 
   d="scan'208";a="229379016"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga007.jf.intel.com with ESMTP; 04 Mar 2020 08:19:13 -0800
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
To:     Oliver Neukum <oneukum@suse.com>,
        Jonas Karlsson <jonas.karlsson@actia.se>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
 <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
 <1583331173.12738.26.camel@suse.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
Date:   Wed, 4 Mar 2020 18:21:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1583331173.12738.26.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4.3.2020 16.12, Oliver Neukum wrote:
> Am Mittwoch, den 04.03.2020, 14:11 +0200 schrieb Mathias Nyman:
>> On 3.3.2020 22.08, Jonas Karlsson wrote:
> 
>>
>> I recently got a report about a bit similar issue on a 4.4 stable kernel, so this
>> might not be xhci-cdns specific.
>>
>> That case involved autosuspend of the cdc-acm, and there was only a short burst of
>> transaction erros and resubmitted URBs even if the device was supposed to be suspended.
>> It looks like cdc_acm autosuspended even if it had URBs pending.
> 
> That must not happen. Do you have details?

Shared what I got in:
https://drive.google.com/open?id=1PjwmIK97bIfugWL697lJCe65yuDVOZhx

cdc-acm is unfortunately not traced, but usb core and xhci is.
grep for "MATTU" to find the relevant places. 

> 
>> I'm guessing that in that case the transfer ring restarted even if link was already "suspeded",
>> causing transaction errors. Ring could be restarted if URBs were resubmitted
>> by the class driver when usb core suspends all interfaces, flushing all pending URBs which
>> calls the URB completion handler.
> 
> How should a class driver do that? It gets -EPROTO and that's it,
> 
> 	Regards
> 		Oliver
> 

This is just my speculation, I haven't checked details yet.

It's not just the class driver that causes this, but a combination of
the following gaps in xhci, cdc-acm, and usb core.

A class driver autosuspending with URBs pending,
and not killing all URBs synchronously when usb core calls suspend for the interface drivers.

xhci restarting an endpoint ring due to a race between xhci_stop_device(), handling 
a Transaction error, and having pending URB (unhandled trb) on the ring. [1]

Sleeping between setting port to U3 link state, and clearing udev->can_submit.
allowing URBs to be submitted during that gap when link is in U3 already.
URBs will complete with -EPROTO, and resubmitted until udev->can_submit is cleared.

usb_runtime_suspend()      
  usb_suspend_both() // suspend a device and its interfaces
    for (each udev->actconfig->interface)
      usb_suspend_interface(udev, intf, msg);
	driver = to_usb_driver(intf->dev.driver);
	status = driver->suspend(intf, msg);  // URBs shuold be killed, sync, miss one??
    usb_suspend_device()
      generic_suspend()
        usb_port_suspend()
          hub_set_port_link_state(USB_SS_PORT_LS_U3)
            xhci_stop_device()
            xhci_set_link_state(USB_SS_PORT_LS_U3)  // port link is in U3
            msleep()       // during this URBs can be resubmitteded and complete with -EPROTO loop       
    udev->can_submit = 0;  // we can submit URBs until here (except the killed ones, they are flagged).
    for (each endpoint)
      usb_hcd_flush_endpoint(udev, udev->ep_out[i]);
      usb_hcd_flush_endpoint(udev, udev->ep_in[i]);

[1]
xhci_stop_device()
  xhci_queue_stop_endpoint()
-> interrupt (transfer event, ring has not stopped yet)
  handle_tx_event()  // bulk transfer with Transaction error
    process_bulk_intr_td()
      finish_td()
	xhci_cleanup_halted_endpoint()
          xhci_queue_reset_ep()
          xhci_queue_new_dequeue_state()
-> interupt, command completion event for stop endpoint, 
-> interrupt handle reset_ep command, xhci_handle_cmd_stop_ep()
-> interrupt handle new deq state
      xhci_handle_cmd_set_deq()
	ring_doorbell_for_active_rings(xhci, slot_id, ep_index)  - this restarts the ring.

-Mathias
