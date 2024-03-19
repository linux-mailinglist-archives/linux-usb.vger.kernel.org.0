Return-Path: <linux-usb+bounces-8066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03E87F861
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 08:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5470C1C21A89
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 07:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4BB7C0B8;
	Tue, 19 Mar 2024 07:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nf9CZLta"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3965190
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710833262; cv=none; b=TWJy9UMVBLqFaBlNb+GCsSDiDS0Umza/5Wp2n6AfVYzLNAGrTX5qyWY+qqgJhLLy/RLjGS155+hdROzKcJpS3oXyd1fRhh2bvEssXt7wCfKfOyGLDBCMyRQI1Tgj/E6TVnfnTbXmezQ8Z8y6T6+6eBfRknU2E3bth47LWDE7EAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710833262; c=relaxed/simple;
	bh=yMhmssTCrvSGLNBQarP8MFfCaZAUosgc9Lq6h0dBCsI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=XfmICMdTotPnLcc8AjWj738kHa4Y4S267KYbxngOWcqO5Tk1up5IKnu9aRE+LjCjaQ86wXnsrkYULVfnlsxCqzk6ePDuHMSBunncRcmh/WQzebQTmcyqsTxxaYGcjvJGybGONg+Dw/vQ3kd5cZdzJTHbuwk7rP2dbc4qWAy6NGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nf9CZLta; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710833260; x=1742369260;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=yMhmssTCrvSGLNBQarP8MFfCaZAUosgc9Lq6h0dBCsI=;
  b=Nf9CZLtaRWtFZOHG5/Sxf+4xxit3JNYdYRokGORM8XKg5NfXL29e54vI
   J2H3KFYYytYrxscf7JpjQ74gaag/JdGgeCpgaHCX6ns2CZjIjTwX9tPrP
   ewagw8poTRpWaxSTEcZU7vg4aLRX6tnpicdd7xvjFswQpHbWWR2haEuDJ
   MF9Zmy1v4ty2WCY4AXccHvUVEuPfwx6SnSZgV9ItYMVh1U7UlVhqTHcZq
   GuuJ7w4DXmMj0INkipta8ZJ0yP2i3juoeptALq0cnlMKpPEf2gfVua96i
   lFrToIL9PGJDUS2Cnkc9ga9C8kFrRwGUkMOcq9WEjOUFmpHoIvcA8IxgR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23188444"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="23188444"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 00:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="937061264"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="937061264"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 19 Mar 2024 00:27:37 -0700
Message-ID: <0f633317-4996-83a7-7b77-cca2868c762d@linux.intel.com>
Date: Tue, 19 Mar 2024 09:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: Aishwarya TCV <aishwarya.tcv@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Klara Modin <klarasmodin@gmail.com>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
 <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
 <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>
 <19ec72e2-8273-43a0-bbeb-706565e926f2@rowland.harvard.edu>
 <1ef6601b-bdb3-41f1-b3ce-07418dd9c031@sirena.org.uk>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
In-Reply-To: <1ef6601b-bdb3-41f1-b3ce-07418dd9c031@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.3.2024 17.10, Mark Brown wrote:
> On Mon, Mar 18, 2024 at 10:55:54AM -0400, Alan Stern wrote:
>> On Mon, Mar 18, 2024 at 02:40:31PM +0000, Mark Brown wrote:
>>> On Mon, Mar 18, 2024 at 04:36:24PM +0200, Mathias Nyman wrote:
> 
>>>> We are already mid merge window.
>>>> Not sure if there's some way Greg can still get this in, otherwise I'm
>>>> afraid we need wait for rc1, and try to get this into rc2.
> 
>>> Given that it's a bug fix for a fairly serious issue (it's causing boot
>>> failures) it should be perfectly fine to apply during the merge window?
> 
>> Greg is away on vacation until this weekend.  If the bug is all that
>> serious, you could consider sending the fix directly to Linus.
> 
> I can do that, or Mathias do you want to resend it?  Boot breaks in -rc1
> tend to be pretty miserable for testing since a lot of people use it as
> a base for their branches.

Linus hasn't pulled usb-next yet so it won't apply.
I'll send it directly to Linus if usb-next is pulled before Greg notices this.

Thanks
Mathias

