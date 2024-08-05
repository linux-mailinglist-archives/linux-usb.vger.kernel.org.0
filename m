Return-Path: <linux-usb+bounces-13106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7026B947EB6
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 17:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 922C21C21D0E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 15:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4E915B12C;
	Mon,  5 Aug 2024 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvzIGlaC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B8E15B968
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722873057; cv=none; b=IRdYque3SNH3yCaohDgB9mkfvsy2eSFT3DZfImpoKWfMt/yFQnfNQQQgHiJoUyL8HuqbDoD1Otat6dQcr102hkYDRlFKbpa8ODBITp3SdyTLOguA6u6JfjENOqVc0DL6pXcSD40sc0WmTrGWWYdLIlKuUC6NZ+iAJzQoTSxMZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722873057; c=relaxed/simple;
	bh=M8+QXK0zo6gXL6aT1odvfqIEDwOniAjjUljAwPqcljg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJO0gKnBhTb8YIEoDLIFTgnQ4C9fUFGkxRduY4qi5TSuTF+GN0oq9dQWuqkUkiKMJKj7YFV8a2DdB90Pj26vHWUYu7quM/SMwOlCiavjrEAm4oDW13wXxSTGN9VNvAYBJCNyJQd+/rAYzXJbH28S+w7rGlZGP1WlYILnhWSiJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvzIGlaC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722873056; x=1754409056;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M8+QXK0zo6gXL6aT1odvfqIEDwOniAjjUljAwPqcljg=;
  b=jvzIGlaC3WKJGxuueJZIuHE1NlCmXa8JVZJqqRU+GJN/2LK0mQnb+xM2
   4zNe76HBCiAUuQVFcQncwp1MSiQ1Awh3U1MxTU1jH2VeIf60X0EfRRWV3
   GUkGNxybSe8M9FbtFHZF21BCD3ogc/77z0lNj8ls0wWU2wc96MzlN1R1a
   sTibqNvMOIvbX4wKXGCqJ4EPsVPYiEYG3IJR8IHCRfhOZ4d4xRiQ8XD0f
   hNMpiDJXUq7v8nVCjFJ3utKz4fC++FhBqerIphxEleQoggcSU+OhA/uU7
   qZeSuisl6sZpIiWw22p7MglEAOTBeYCeKgrE+Fa0QMvJ8t0ExoJE5mrh8
   g==;
X-CSE-ConnectionGUID: jay7HkucTQiEUVM1c8Pq0g==
X-CSE-MsgGUID: 2aDMmbtrQRmyY7bLqhQj3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20700046"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20700046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 08:50:56 -0700
X-CSE-ConnectionGUID: SYxB0vV3S6yYZ8Ng+dvKBg==
X-CSE-MsgGUID: SJte8O5mTLSh45l5CIG3MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="55876206"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2024 08:50:55 -0700
Message-ID: <0f1a54a6-7a7c-429e-8134-88ea3e1e67ec@linux.intel.com>
Date: Mon, 5 Aug 2024 18:52:57 +0300
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <f803fe92-5b52-4c11-a35b-8cc4759f9a7e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5.8.2024 9.49, Mathias Nyman wrote:
> On 4.8.2024 0.51, Łukasz Bartosik wrote:
>> On Thu, Aug 1, 2024 at 5:02 PM Łukasz Bartosik <ukaszb@chromium.org> wrote:
>>>
>>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
>>> 1943ad000, remaining 1024, ep deq 1943ad001
>>>
>>>
>>>> DbC should respond with STALL packets to host if HIT or HOT is set.
>>>> Host side should react to this by sending a ClearFeature(HALT) request to DbC,
>>>> which should clear the halted endpoint and HIT/HOT flags.
>>>>
>>>
>>> I would like to ask you about it again because I wonder when the DbC
>>> endpoint is not halted and it
>>> receives the ClearFeature(Halt) request whether this is correct
>>> behavior for the DbC endpoint to report a
>>> STALL error in such a case ?
>>>
> 
> Ok, Setup was unclear to me, I assumed the STALL transfer error was due to an
> actual transfer issue on a bulk endpoint.
> 
> I don't think xHCI DbC should send STALL error transfer events for non existing
> bulk transfers as a response to ClearFeature(ENDPOINT_HALT) control request.
> 
> Especially as it seems not a single byte was transferred on either bulk endpoint.
> 
> But we need to handle it in the driver properly
> 
> 
>>> Thanks,
>>> Lukasz
>>>
>>
>> Hi Mathias,
>>
>> One more thing which I would like to add to the previous is the observation
>> which I made during debugging the issue. Looking at the above trace
>> there is stall
>> on IN endpoint:
>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
>> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
>>
>> And then when 24 bytes packet arrives
>> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
>> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
>>
>> the same TRB is being used 00000001943ad000 but the DbC driver already
>> moved forward and the IN endpoint's pending list does not include a
>> dbc_request pointing
>> to the TRB 00000001943ad000 which results in "no matched request"
>> error and dropping
>> of the packet.
>>
> 
> I noticed yes, this is why the patch compared the TRB pointed to by the
> STALL transfer event with the one in the endpoint context.
> If they match the patch attempts to turn that TRB to no-op, forcing xHC
> hardware to move to the next TRB.
> 
> The check did however not work as it didn't mask out the cycle bit.
> Lops show we compare  1943ad000 with 1943ad001
> 
> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB 1943ad000, remaining 1024, ep deq 1943ad001
> 
> Code in patch:
> +if (ep_ctx->deq == event->trans_event.buffer) { // FIXME do we need to worry about cycle bit?
> +            dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq, clear it\n");
> +            trb_to_noop(req->trb);
> 
> With the new information that the STALL transfer event can be completely
> spurious and not related to any actual bytes being transmitted on bulk
> endpoints I think we shouldn't give back he transfer req in those cases.
> 
> I'll make another patch

New patch ready for testing:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=fix_dbc_halted_ep&id=96cd909cc8115b3d2dff1bdcf265171bb0fdab18

Thanks
Mathias

