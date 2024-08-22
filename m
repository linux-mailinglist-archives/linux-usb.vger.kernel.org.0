Return-Path: <linux-usb+bounces-13869-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CFA95B569
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 14:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E251E1F24CEA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 12:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8811C9DE4;
	Thu, 22 Aug 2024 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Otn0M57H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D111181B87
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724330886; cv=none; b=rxgkA89aoJ7vdIhKsI0dL3O0k6XI4y1+8W0dwAYdZakvRZgY0LavVwJmmqYTEAQTzPXyTSD2zePjhDD9DnX0hhBSj3gTMIV5YXq4VLQBlehUkHCfZPE2zvSf46OduhiZIjYC+4rNiY98nsDD1mvtRYA9WhCDyWgKbKCFYW/JnfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724330886; c=relaxed/simple;
	bh=BZiB5Pc3cQCV3Mu3+qQ12ezr664u0/maNCQCu9F8nQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNzWkHd2aTBppcdzaLqu27FOyGCcz507MkQw2IqAGj5f5+Rb3vMeof6C+Im1XlKq6LBIyx6YCAX5gRzfflBEiiyFZ9BAi49kH44RH6UficJaBnTAsASOAATT9THQKVEMCJDM2E/rg6ZTd9o6O1KQv4YUHZZtxFZZd4+pEKSwWR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Otn0M57H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724330885; x=1755866885;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BZiB5Pc3cQCV3Mu3+qQ12ezr664u0/maNCQCu9F8nQM=;
  b=Otn0M57HynjkKXrdQophirVnZs+GAveu8qYpUpA1LOUlbbCnkbW7eTiB
   /u8mcQcrZqgUKPRi7yQkInlrGYWNMks4GjKoW4Z2ewmb79gNOoH9kAMe/
   Kkrjv2bglQpPiD0vt6TS8DWPu3T0JMjv8f0zWA/Zc7NePNNeaSUqflNXO
   11UbtBd2hDoCVFh/hnqUsP34G0uJphOYTbDLGwSCTq/iTJ73rclhPVGIh
   fwQWyvwHFaY1Mxnl6UfQd2ApRTXOnfp5R/qlHHWVGQMcxr+3yDuy7ogth
   L31OQxZBey8RKKOhJy83uuC6OwnJQctHCdFxsj7OIPurM8PHuBx+csvnP
   g==;
X-CSE-ConnectionGUID: +XopvFJXSlmn2fkcO816CA==
X-CSE-MsgGUID: oqcvFIaWQOK0c1cmd5OFgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22708460"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22708460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 05:48:04 -0700
X-CSE-ConnectionGUID: 6fYf48tmR0Sp62qhAiPTMQ==
X-CSE-MsgGUID: eIvWq4KwQcyt/nKzxui0Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="66258251"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2024 05:48:01 -0700
Message-ID: <9373388b-01e1-49b1-8fab-7724aa6454ab@linux.intel.com>
Date: Thu, 22 Aug 2024 15:50:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org
References: <20240725074857.623299-1-ukaszb@chromium.org>
 <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
 <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com>
 <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
 <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com>
 <CALwA+Na_SORXHFr-GZJtPu_HySd9dwo+UAUsv0sYanrH501o4Q@mail.gmail.com>
 <CALwA+NbUJowv3yKnSoY5e4MBi1kZg=ezE0btB5xnTC=k9+VaQg@mail.gmail.com>
 <CALwA+NbLZ7cm_pSc7Bgh-q7YOr3Ez5_AsG-dyqSzoDyOF=E_JQ@mail.gmail.com>
 <f803fe92-5b52-4c11-a35b-8cc4759f9a7e@linux.intel.com>
 <0f1a54a6-7a7c-429e-8134-88ea3e1e67ec@linux.intel.com>
 <CALwA+NaH7VC5SjnbQRyXt2NXugZkXyZJa70u9Cw7vdPYe53KqQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NaH7VC5SjnbQRyXt2NXugZkXyZJa70u9Cw7vdPYe53KqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.8.2024 6.35, Łukasz Bartosik wrote:
> On Mon, Aug 5, 2024 at 5:50 PM Mathias Nyman
> <mathias.nyman@linux.intel.com> wrote:
>>
>> On 5.8.2024 9.49, Mathias Nyman wrote:
>>> On 4.8.2024 0.51, Łukasz Bartosik wrote:
>>>> On Thu, Aug 1, 2024 at 5:02 PM Łukasz Bartosik <ukaszb@chromium.org> wrote:
>>>>>
>>>>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
>>>>> 1943ad000, remaining 1024, ep deq 1943ad001
>>>>>
>>>>>
>>>>>> DbC should respond with STALL packets to host if HIT or HOT is set.
>>>>>> Host side should react to this by sending a ClearFeature(HALT) request to DbC,
>>>>>> which should clear the halted endpoint and HIT/HOT flags.
>>>>>>
>>>>>
>>>>> I would like to ask you about it again because I wonder when the DbC
>>>>> endpoint is not halted and it
>>>>> receives the ClearFeature(Halt) request whether this is correct
>>>>> behavior for the DbC endpoint to report a
>>>>> STALL error in such a case ?
>>>>>
>>>
>>> Ok, Setup was unclear to me, I assumed the STALL transfer error was due to an
>>> actual transfer issue on a bulk endpoint.
>>>
>>> I don't think xHCI DbC should send STALL error transfer events for non existing
>>> bulk transfers as a response to ClearFeature(ENDPOINT_HALT) control request.
>>>
>>> Especially as it seems not a single byte was transferred on either bulk endpoint.
>>>
>>> But we need to handle it in the driver properly
>>>
>>>
>>>>> Thanks,
>>>>> Lukasz
>>>>>
>>>>
>>>> Hi Mathias,
>>>>
>>>> One more thing which I would like to add to the previous is the observation
>>>> which I made during debugging the issue. Looking at the above trace
>>>> there is stall
>>>> on IN endpoint:
>>>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
>>>> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
>>>>
>>>> And then when 24 bytes packet arrives
>>>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
>>>> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
>>>>
>>>> the same TRB is being used 00000001943ad000 but the DbC driver already
>>>> moved forward and the IN endpoint's pending list does not include a
>>>> dbc_request pointing
>>>> to the TRB 00000001943ad000 which results in "no matched request"
>>>> error and dropping
>>>> of the packet.
>>>>
>>>
>>> I noticed yes, this is why the patch compared the TRB pointed to by the
>>> STALL transfer event with the one in the endpoint context.
>>> If they match the patch attempts to turn that TRB to no-op, forcing xHC
>>> hardware to move to the next TRB.
>>>
>>> The check did however not work as it didn't mask out the cycle bit.
>>> Lops show we compare  1943ad000 with 1943ad001
>>>
>>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB 1943ad000, remaining 1024, ep deq 1943ad001
>>>
>>> Code in patch:
>>> +if (ep_ctx->deq == event->trans_event.buffer) { // FIXME do we need to worry about cycle bit?
>>> +            dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq, clear it\n");
>>> +            trb_to_noop(req->trb);
>>>
>>> With the new information that the STALL transfer event can be completely
>>> spurious and not related to any actual bytes being transmitted on bulk
>>> endpoints I think we shouldn't give back he transfer req in those cases.
>>>
>>> I'll make another patch
>>
>> New patch ready for testing:
>> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_dbc_halted_ep&id=96cd909cc8115b3d2dff1bdcf265171bb0fdab18
>>
> 
> Hi Mathias,
> 
> I finally tested your latest patch 96cd909cc8115b3d2dff1bdcf265171bb0fdab18.
> It resolves the issue.

Thanks for testing.

I did some minor additional cleanups to it.
I'll post it as a proper patch. can I ask you to give it one last run,
just to make sure everything still works.

Thanks
Mathias


