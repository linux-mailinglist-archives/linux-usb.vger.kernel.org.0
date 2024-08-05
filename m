Return-Path: <linux-usb+bounces-13076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD13194758E
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 08:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48A60B20A07
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 06:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E5913F43B;
	Mon,  5 Aug 2024 06:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtY+tD3O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61281422D8
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722840472; cv=none; b=mSMneGTJj0q/oyzientKjm8b4cu3Sjy4Vscz1yZfMdPgR+/bb9VTVv1R/7MBPdQPbGLt57geEV2eG5c5P7G/J3QMH6Ayxzyz6ba5J8ucIr9gZWfoLHXu00Zl71JEbStguzzSmLa5yEWLHRli99J/n58Y0s1W9u3CjQnc7j5Mht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722840472; c=relaxed/simple;
	bh=P0KR6mYALOpSYqhh9VceWNxneuD7zTni6YQ4TALZTNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rnc3Cg2W6p8elk1KYDx4xRa3g73HLOM6KKioS1J1gcQZxOZnRXJlouMi86ZHPY62uf9kbgJdqLVIi0Ir0Zghw9+OCjgAKoaVQufqNoFvxcbv4FrCxzfPopFua0c0t0AalkI/UCRHNV/z5qsTBt6/2smgD14A65P859Ar+oQhGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtY+tD3O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722840471; x=1754376471;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P0KR6mYALOpSYqhh9VceWNxneuD7zTni6YQ4TALZTNg=;
  b=jtY+tD3OGQ+tIGQCTEKPscQi9cbpLj0lr6sBWwUgC6PlpKh8UAAEzWXD
   7V9j1P/kfNorw2Ij70QObLaK8WjJklSYu3T7PYzRIK4YA1JJP45WBj5hB
   QdkZcF+zX74vTvrl91/0EDUWC0kVhxaPu5huRKuE4IomqtVKGOJrsXqkZ
   QovOsSzBhrFUE8qODmrSsmRN4qrKMAQsFeKWAEWMeJkII9KPnDQiLY6xp
   /DmO1yRv8OoBdKmVKmmW0FJT12Vm2USS3Hx7hOSWTEkvi7cdhh+CbakDQ
   pomqoQOlxKdm15nFnvJVLzT2HJmm+RTqVlryP6HeLXALZoq+6YYkmmZOn
   A==;
X-CSE-ConnectionGUID: ZciUwk0ZTuKluQ2gzjhVqA==
X-CSE-MsgGUID: KeD/PloBTP+7MDn/81eLwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="24577395"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="24577395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 23:47:48 -0700
X-CSE-ConnectionGUID: RUXeBKbATje/2JZp0dDHUg==
X-CSE-MsgGUID: XpdFm9dgTqyEW13S+zEI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="87012326"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2024 23:47:46 -0700
Message-ID: <f803fe92-5b52-4c11-a35b-8cc4759f9a7e@linux.intel.com>
Date: Mon, 5 Aug 2024 09:49:49 +0300
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
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CALwA+NbLZ7cm_pSc7Bgh-q7YOr3Ez5_AsG-dyqSzoDyOF=E_JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4.8.2024 0.51, Łukasz Bartosik wrote:
> On Thu, Aug 1, 2024 at 5:02 PM Łukasz Bartosik <ukaszb@chromium.org> wrote:
>>
>> [  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB
>> 1943ad000, remaining 1024, ep deq 1943ad001
>>
>>
>>> DbC should respond with STALL packets to host if HIT or HOT is set.
>>> Host side should react to this by sending a ClearFeature(HALT) request to DbC,
>>> which should clear the halted endpoint and HIT/HOT flags.
>>>
>>
>> I would like to ask you about it again because I wonder when the DbC
>> endpoint is not halted and it
>> receives the ClearFeature(Halt) request whether this is correct
>> behavior for the DbC endpoint to report a
>> STALL error in such a case ?
>>

Ok, Setup was unclear to me, I assumed the STALL transfer error was due to an
actual transfer issue on a bulk endpoint.

I don't think xHCI DbC should send STALL error transfer events for non existing
bulk transfers as a response to ClearFeature(ENDPOINT_HALT) control request.

Especially as it seems not a single byte was transferred on either bulk endpoint.

But we need to handle it in the driver properly


>> Thanks,
>> Lukasz
>>
> 
> Hi Mathias,
> 
> One more thing which I would like to add to the previous is the observation
> which I made during debugging the issue. Looking at the above trace
> there is stall
> on IN endpoint:
> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Stall
> Error' len 1024 slot 1 ep 3 type 'Transfer Event' flags e:C
> 
> And then when 24 bytes packet arrives
> xhci_dbc_handle_event: EVENT: TRB 00000001943ad000 status 'Short
> Packet' len 1000 slot 1 ep 3 type 'Transfer Event' flags e:C
> 
> the same TRB is being used 00000001943ad000 but the DbC driver already
> moved forward and the IN endpoint's pending list does not include a
> dbc_request pointing
> to the TRB 00000001943ad000 which results in "no matched request"
> error and dropping
> of the packet.
> 

I noticed yes, this is why the patch compared the TRB pointed to by the
STALL transfer event with the one in the endpoint context.
If they match the patch attempts to turn that TRB to no-op, forcing xHC
hardware to move to the next TRB.

The check did however not work as it didn't mask out the cycle bit.
Lops show we compare  1943ad000 with 1943ad001

[  103.707882] xhci_hcd 0000:00:0d.0: Stall error at bulk TRB 1943ad000, remaining 1024, ep deq 1943ad001

Code in patch:
+if (ep_ctx->deq == event->trans_event.buffer) { // FIXME do we need to worry about cycle bit?
+			dev_warn(dbc->dev, "Stall error TRB matches ep_ctx->deq, clear it\n");
+			trb_to_noop(req->trb);

With the new information that the STALL transfer event can be completely
spurious and not related to any actual bytes being transmitted on bulk
endpoints I think we shouldn't give back he transfer req in those cases.

I'll make another patch

Thanks
Mathias

