Return-Path: <linux-usb+bounces-21499-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFAFA56A3A
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 15:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE03E16C4F1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 14:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8D021B909;
	Fri,  7 Mar 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UgZE5PIu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDCD2185BC
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 14:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741357338; cv=none; b=b8hZs4VEymAES/tv3URY94KrHni4Ue/Mb378RdFzlFWPT22dI+pygawYcU4B/JTBAHEg3JyiBth7DTDedlmK6AqspTmga+jKr7Lv4oJPkHnjsEud40/sY5Msqpfg8wxis/YyPG72yv9hKGqAmbtqWCds5fJV4EPaJkzf1pMSzkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741357338; c=relaxed/simple;
	bh=M6rDqG64KWShndH2QzixSAB737/UaxkzKp13gGxgOZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0rNc+b840UtCJzIer8nii3TJq6HvM5oRgwur4YfPHQXOKLRzRXFLMqLTiavFikz+N8sizmal5bHDEZWA+y/qXAtnjm+EiIScgOYa1bKvE+m0ePwPPVYvq211Xu9vmtWabFScLieTScxsUrQbONvbD1roH64Zw+dgyLRJQqKB04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UgZE5PIu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741357337; x=1772893337;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M6rDqG64KWShndH2QzixSAB737/UaxkzKp13gGxgOZA=;
  b=UgZE5PIukwfRKKlwHO8so+uSMsj7wxXoXKErGCYNof82fTKMy13+WP8K
   7otwZTThiO1HscxOfMWSlOCzGxkyKUMat2N4uXJMUfdF6ex5cqDl3c8yW
   yhpcb6prW8HrIr0xXMXottcqPUDiyKmLg8muHVMb1fPfjbOylqbS66zOu
   fPP1vio5QUfxVOWbK6f638c55CjZ9bLZ/0biFHc0yqDhtSsgWEsxSthT4
   duMaxhS9VNRJb+64PCZNlcssqW1IMtBYwPXJr/x8e/3n4gBfoD9OXpeBM
   tm0UJBvZCgsMTKPNPo6DWJpNNqoMolcPHIKs0ngEnzidCt/Hq4XXdiB42
   g==;
X-CSE-ConnectionGUID: bZ87XkEaT/6H4JHxM8+sWA==
X-CSE-MsgGUID: sHN1N1InRLChYT+D9wtYhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42317195"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42317195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 06:22:15 -0800
X-CSE-ConnectionGUID: 9txyjnUCRuq0Vg9j8qxw4g==
X-CSE-MsgGUID: mlc16D68QGKmRzdpcDgeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119861628"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 06:22:15 -0800
Message-ID: <1c369ecc-a935-4c3e-ba8a-80e7d8894a92@linux.intel.com>
Date: Fri, 7 Mar 2025 16:23:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/15] xhci: Prevent early endpoint restart when handling
 STALL errors.
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20250307075429.5f9d1d4e@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250307075429.5f9d1d4e@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7.3.2025 8.54, Michał Pecio wrote:
>> Ensure that an endpoint halted due to device STALL is not
>> restarted before a Clear_Feature(ENDPOINT_HALT) request is sent to
>> the device.
>>
>> The host side of the endpoint may otherwise be started early by the
>> 'Set TR Deq' command completion handler which is called if dequeue
>> is moved past a cancelled or halted TD.
>>
>> Prevent this with a new flag set for bulk and interrupt endpoints
>> when a Stall Error is received. Clear it in hcd->endpoint_reset()
>> which is called after Clear_Feature(ENDPOINT_HALT) is sent.
>>
>> Also add a debug message if a class driver queues a new URB after
>> the STALL. Note that class driver might not be aware of the STALL
>> yet when it submits the URB as URBs are given back in BH.
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Sorry for coming this late, but I haven't looked closely at some
> of those xhci/for-next patches before.
> 
> This one is unfortunately incomplete, as follows:
> 
>> drivers/usb/host/xhci-ring.c | 7 +++++--
>> drivers/usb/host/xhci.c      | 6 ++++++
>> drivers/usb/host/xhci.h      | 3 ++-
>> 3 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index c2e15a27338b..7643ab9ec3b4 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -556,8 +556,8 @@ void xhci_ring_ep_doorbell(struct xhci_hcd *xhci,
>> 	 * pointer command pending because the device can choose to start any
>> 	 * stream once the endpoint is on the HW schedule.
>> 	 */
>> -	if ((ep_state & EP_STOP_CMD_PENDING) || (ep_state & SET_DEQ_PENDING) ||
>> -	    (ep_state & EP_HALTED) || (ep_state & EP_CLEARING_TT))
>> +	if (ep_state & (EP_STOP_CMD_PENDING | SET_DEQ_PENDING | EP_HALTED |
>> +			EP_CLEARING_TT | EP_STALLED))
>> 		return;
> 
> Any flag added to this list needs to be added to xhci_urb_dequeue() too
> so it knowns that the endpoint is held in Stopped state and URBs can be
> unlinked without trying to stop it again.

In this case it's intentional.

If we prevent xhci_urb_dequeue() from queuing a stop endpoint command due to a flag,
then we must make sure the cancelled URB is given back in the same place we clear
the flag, like we do in the command completion handlers that clear EP_HALTED and
  SET_DEQ_PENDING.

The EP_STALLED flag is cleared after a ClearFeature(ENDPOINT_HALT) control transfer
request is (successfully?) sent to the device.
If we only give back those cancelled URBs after this then we create a situation where
cancelled urb giveback is blocked and depend on the completion of another transfer
on a different endpoint.
I don't want this dependency.

It's possible that this could create some type of deadlock where class driver ends
up waiting for cancelled URBs to be given back before it sends the request to clear
the halt, and  xhci won't give back the cancelld URBs before the
ClearFeature(ENDPOINT_HALT) request completes..

Lets look at the cases where xhci_urb_dequeue() is called between setting and clearing
this new EP_STALLED flag.

The EP_HALTED is set during same spinlock as EP_STALLED, so urbs dequeued during this time
will be added to cancelled list, and given back in xhci_handle_cmd_reset_ep() completion
handler where also EP_HALTED is cleared. If dequeue needs to be moved then SET_DEQ_PENDING
is set, and cancelled urbs will be given back in xhci_handle_cmd_set_deq() completion handler.

At this stage we know endpoint is in stopped state. and will remauin so until EP_STALLED is cleared.
if xhci_urb_dequeue() is called now then a stop endpoint command will ne queued,
it will complete with a context state error due to endpoint already being stopped, but
URB will be given back in one of the completion handlers. mentioned before.

We could improve this codepath a bit by adding:

iff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 0f8acbb9cd21..c8d1651c9703 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1244,7 +1244,7 @@ static void xhci_handle_cmd_stop_ep(struct xhci_hcd *xhci, int slot_id,
                          * Endpoint later. EP state is now Stopped and EP_HALTED
                          * still set because Reset EP handler will run after us.
                          */
-                       if (ep->ep_state & EP_HALTED)
+                       if (ep->ep_state & (EP_HALTED | EP_STALLED)
                                 break;
                         /*
                          * On some HCs EP state remains Stopped for some tens of

>>   	case USB_ENDPOINT_XFER_CONTROL:
>> @@ -3202,6 +3207,7 @@ static void xhci_endpoint_reset(struct usb_hcd *hcd,
>>   		return;
>>   
>>   	ep = &vdev->eps[ep_index];
>> +	ep->ep_state &= ~EP_STALLED;
> 
> ... and clearing any of those flags has always been followed by calling
> xhci_ring_ep_doorbell() again, to ensure that the endpoint is restarted
> if it has URBs on it but restart was held off due to the flag.
> 

Probably no harm in ringing the doorbell here. Should not be needed as there
shouldn't be any pending URBs, see usb core message.c comment for usb_clear_halt():

  * This is used to clear halt conditions for bulk and interrupt endpoints,
  * as reported by URB completion status.  Endpoints that are halted are
  * sometimes referred to as being "stalled".  Such endpoints are unable
  * to transmit or receive data until the halt status is cleared.  Any URBs
  * queued for such an endpoint should normally be unlinked by the driver
  * before clearing the halt condition, as described in sections 5.7.5
  * and 5.8.5 of the USB 2.0 spec.

But I don't see any harm in ringing the doorbell here either.

Thanks
Mathias

