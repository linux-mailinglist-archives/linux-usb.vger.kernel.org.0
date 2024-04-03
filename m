Return-Path: <linux-usb+bounces-8813-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE452896882
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 10:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63FD51F22C42
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 08:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDBC811F7;
	Wed,  3 Apr 2024 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPnQP6tW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494D6D1BC
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712132239; cv=none; b=k+uPI/JtVVj8KGlpbKSn2CP7U2lhrZybnAIs2Nt1IhowUfu/PEZFzZ2TNck4LiHoiqWpw4DbQjvUop/o69wPqZ7KN84eV0ay53NzZFCGOdLxUyJAYJhjjb3vMK4nTR5ux3OgwM+3FalVhgCAdERRXmIlbZocilyGlYIqpU5VFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712132239; c=relaxed/simple;
	bh=Ye+i/FfZE9pCJ9TvhMprGJIpmDSYa8oJEzHGJHGlEIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+Fvu8K4hWathOGY5UkGz8puYFZe8kzUbd8uM8SNh0mQaW7Kydbn42Ygjb6QhLwE8W8FoijuYeoKEZs9aZHasWGPlbxA1uuHGnAqgxdMczoOor/+9SwF6bwbg2tkx7PY37qApEBUDEiREDGNS1qhdfKdOrFoCF8wdV4Q7VfE6SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPnQP6tW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712132237; x=1743668237;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ye+i/FfZE9pCJ9TvhMprGJIpmDSYa8oJEzHGJHGlEIk=;
  b=GPnQP6tWOk+6syi81LbVsPpZx5qZnXkum2B/2z7H2pU8AQbl/RquvCFh
   2If4zybbf7OWnQZPYb+QR5EHJGHFh1Hy1bK1uL2S/CeSjP1SkiCe5dGaU
   w1ck/ACuJ74ymkQHYdJBQZQTYrQrw0e2cekVKs33eyoiso3swU750bq1v
   1lyFV0QqGJFBATQfEKjSjG6D35wGb6p8xQX7uUWm0iPNC0kbStU1CEHva
   yC0QecOyiB85gi4jbxf4uaRSwf6brpGqz2fzDxUknxICKDafyMlELvq/S
   M2hsQ0F2m7iZyIljcE/Oi5IULb08ZFaGuU2LE3q3o2Mtw5Kx9hWd1VYYk
   g==;
X-CSE-ConnectionGUID: AorA02ozQT2lPIjwmlPkiQ==
X-CSE-MsgGUID: +/65H3k/SSaawpQRXqflKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7217135"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7217135"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 01:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="937084554"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="937084554"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2024 01:17:15 -0700
Message-ID: <f4426285-9ca5-fc66-3d24-fd826dcbd21d@linux.intel.com>
Date: Wed, 3 Apr 2024 11:19:02 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 2/9] xhci: replace real & fake port with pointer to root
 hub port
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Niklas Neronin <niklas.neronin@intel.com>
References: <20240229141438.619372-1-mathias.nyman@linux.intel.com>
 <20240229141438.619372-3-mathias.nyman@linux.intel.com>
 <20240402005007.klv2ij727fkz7rpd@synopsys.com>
 <7726873f-940f-fe88-f065-2ef23edd3ab1@linux.intel.com>
 <20240402231333.6cqttc34udx5nzhu@synopsys.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240402231333.6cqttc34udx5nzhu@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3.4.2024 2.13, Thinh Nguyen wrote:
> On Tue, Apr 02, 2024, Mathias Nyman wrote:
>> Hi Thinh
>>
>> On 2.4.2024 3.50, Thinh Nguyen wrote:
>>> Hi Mathias,
>>>
>>> We're getting a NULL pointer dereference bug for this patch. To
>>> reproduce this, just unload and reload the xhci driver while a device is
>>> connected. It may take a few times to hit the issue.
>>>
>> how about this:
>>
>> diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
>> index 1740000d54c2..5762564b9d73 100644
>> --- a/drivers/usb/host/xhci-trace.h
>> +++ b/drivers/usb/host/xhci-trace.h
>> @@ -172,8 +172,7 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
>>                  __field(void *, vdev)
>>                  __field(unsigned long long, out_ctx)
>>                  __field(unsigned long long, in_ctx)
>> -               __field(int, hcd_portnum)
>> -               __field(int, hw_portnum)
>> +               __field(int, slot_id)
>>                  __field(u16, current_mel)
>>          ),
>> @@ -181,13 +180,12 @@ DECLARE_EVENT_CLASS(xhci_log_free_virt_dev,
>>                  __entry->vdev = vdev;
>>                  __entry->in_ctx = (unsigned long long) vdev->in_ctx->dma;
>>                  __entry->out_ctx = (unsigned long long) vdev->out_ctx->dma;
>> -               __entry->hcd_portnum = (int) vdev->rhub_port->hcd_portnum;
>> -               __entry->hw_portnum = (int) vdev->rhub_port->hw_portnum;
>> +               __entry->slot_id = (int) vdev->slot_id;
>>                  __entry->current_mel = (u16) vdev->current_mel;
>>                  ),
>> -       TP_printk("vdev %p ctx %llx | %llx hcd_portnum %d hw_portnum %d current_mel %d",
>> -               __entry->vdev, __entry->in_ctx, __entry->out_ctx,
>> -               __entry->hcd_portnum, __entry->hw_portnum, __entry->current_mel
>> +       TP_printk("vdev %p slot %d ctx %llx | %llx current_mel %d",
>> +               __entry->vdev, __entry->slot_id, __entry->in_ctx,
>> +               __entry->out_ctx, __entry->current_mel
>>          )
>>   );
> 
> That looks good to me. Can you submit the change?

yes, I'll submit the change

> 
> On an unrelated note, often we have to debug xHCI driver on a system
> with multiple xHCI controllers. I'm not sure if there's a good way to
> filter the xHCI tracepoints to a specific controller? I needed to print
> the devname for each tracepoint just to get around this, which doesn't
> seem like a great solution. Any idea?

I'm facing similar debugging issues, I'll look into it.

Thanks
Mathias


