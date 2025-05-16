Return-Path: <linux-usb+bounces-24043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6E7AB9EA8
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 16:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB099E0AC6
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 14:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A70218C03F;
	Fri, 16 May 2025 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ib0nE5Bk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E350216F8E9
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747405987; cv=none; b=bvGXyS4tKu4HNa82Rxy0kKIH2lGhwYLLM+/tAXRpaIpwhNWLU79Ycv0PwLAyR4rnyGsyAwd7GoU8h+bVfVQfMLb+sDmHcAlwcbFX6WGotivzGxeDFsYJ964B1+HhXojHme09IDec7/T+SZ6b7Kk7WD84fI5ofcVezDZYctkAqzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747405987; c=relaxed/simple;
	bh=7/j13nJR2Kakih/RHUllSV1ilEL+u9QciiQCL805t2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNcxtHkA+a0rk4DZsUlyXGmtUnDJTkdgv5Ys0ywvPmuAoohPq8BNUSoQ1hVrija9VRFBRF/u02Y5OT2ynRPAWZocCZPDjBIHxgB9Gd29n9kVCavrxdo2NqD+x64ktQxIaECTLY0vVXpoAPRSLGvgjp7bVQzYRZiX0CrxnGBXXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ib0nE5Bk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747405986; x=1778941986;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7/j13nJR2Kakih/RHUllSV1ilEL+u9QciiQCL805t2Y=;
  b=Ib0nE5Bkv5QJCC+pOCbuXt34T6G9GdqYqafb6Hgn+duTG+nPi04dWJMp
   S7ucdFOHxO3u3QEJIb1Zgz/BpjsHCLB2rruImnfiiQpmEqpuwBYuIWMGD
   6l/YeZGorU6TdZ2h9AMSEU2RRrB/rd1ibl6Jx4MGajKtkepPFW0To75FR
   uoajMPr235QKRREJKPPMIa8hP25c9A5H3EtCXnGq8FGttkwZ+Dbqn3UJH
   K+vW8FXEaCpdaLbtWrH34pOxfUjPg7iFswX/o3aZOSs542F+Kwbp+qb3d
   d5KZtF3Lro9AO3eYkjKoHMW/LHSIf0eUKi7zm/7G4aPVhS0zhRQ2uoQVq
   A==;
X-CSE-ConnectionGUID: XAIO4wo0S+22BkMcoMfS7g==
X-CSE-MsgGUID: lD5d6lGfRMK0rNsyNp2omA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49519767"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49519767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:33:05 -0700
X-CSE-ConnectionGUID: yyba99wJRiKAGlkwfGAl9Q==
X-CSE-MsgGUID: M3iys2HzSK6VldYQkFLwQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="143827098"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.120.28]) ([10.245.120.28])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:33:00 -0700
Message-ID: <2f38bb7e-d9d3-49a4-a5ea-c42f98be07ee@linux.intel.com>
Date: Fri, 16 May 2025 17:32:35 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] usb: xhci: add warning message specifying which Set
 TR Deq failed
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-24-mathias.nyman@linux.intel.com>
 <20250516144310.12b4f072@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250516144310.12b4f072@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16/05/2025 15.43, Michał Pecio wrote:
> On Thu, 15 May 2025 16:56:20 +0300, Mathias Nyman wrote:
>> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>>
>> Currently, errors from the Set TR Deq command are not handled.
>> Add a warning message to specify the slot, endpoint, and TRB address
>> when a Set TR Deq command fails. This additional information will aid
>> in debugging such failures.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>  drivers/usb/host/xhci-ring.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c
>> b/drivers/usb/host/xhci-ring.c index e3c823e1caee..eff6b84dc915 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -1448,6 +1448,11 @@ static void xhci_handle_cmd_set_deq(struct
>> xhci_hcd *xhci, int slot_id, unsigned int ep_state;
>>  		unsigned int slot_state;
>>  
>> +		xhci_warn(xhci, "Set TR Deq error for TRB 0x%llx in slot %d ep %u\n",
>> +			  (unsigned long long)xhci_trb_virt_to_dma(ep->queued_deq_seg,
>> +						ep->queued_deq_ptr),
> 
> Is printing this pointer actually useful? It doesn't tell why
> the error happened. It will not relate to other messages - the
> command failed, so dequeue stays at its old position.
> 

Apologies, I should have retracted this patch as part of the Set TR Deq series.

I still plan on trying to add the "Set TR Deq Error Handling" series in the future,
with a few tweaks (infinite re-try loop). Then each case will have its own
tailored warning, while this warning will print general error info.

Best Regards,
Niklas


