Return-Path: <linux-usb+bounces-14785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E56196F549
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C0281C21B42
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD941CE6E8;
	Fri,  6 Sep 2024 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUkr3q4T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DDF1CB152
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 13:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725629134; cv=none; b=WXmrPNrtcZB754VHoPvfxKxaH9w97Bqi8f0W+r6SVU7thc4yzdcWHqnHECKcaIcTwlrNduRIToggmDlEzQGDLpskuz7J380oNMqmUwrBRgYJdnIhS8ZiF0oueLS1ozhbRYAQTjwi5k1sZ/Yp7fM8dKN+RIfn0D50KXHljyr8ze4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725629134; c=relaxed/simple;
	bh=BNB3Zqm1b+nQ2v1A6MGBNP0ydTCNdXTu4ohBpGV3WPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1rwkGIDvXRKe9NMph6TKvHNo43GN+hUMNLsDxGsGgcA1MchT/eRzfgGAxmJAZDpRxcLGQ2Fxsq4oSFOxmETSzHpWKURwP2XmZmqRh+c1V1mK8by0C6AT6TezJDujnCq/K2fVRzSGZRMaVV9xQC/ZwO/TkwFqh4oAUZQTIjn72Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUkr3q4T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725629133; x=1757165133;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BNB3Zqm1b+nQ2v1A6MGBNP0ydTCNdXTu4ohBpGV3WPA=;
  b=JUkr3q4TxX62Hoq5EHTIsw5HFxPRjl4TTnDMn10HPDSx0QOAZDxdsmF7
   8gERYYvUCo3EqF0ddrbeh3Gzpo58q8jkQQDl0RuDCHRWCZh/0HoJpQPyk
   6LSZt8XSWntvvJN+vPhrMMGn9XJSpCoU+S6moixxf/xNNHknQDtzzJztN
   XGqZZdTCFLg78K4qbH++yNPrKDkqsYVtlMYZI5kq/Z0P/hiIau4nODWgB
   G6YTWt5Z44r3vCvqq/VdwY8eDmTz6LSUuCxxMqGV1+GjUtBRp47QaLzk6
   u+wfTNzQnH2I+nmPJLnyQWfo2C8AhFOZqXQUkFnq1INaNRNk1LB808BS5
   w==;
X-CSE-ConnectionGUID: 6UsAYXrYRPS3FR17OFvNtg==
X-CSE-MsgGUID: sIaydLTaR+6hmbFY+NXMLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35055215"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="35055215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:25:32 -0700
X-CSE-ConnectionGUID: K1oxxuYBRY25nKcEuXuIPQ==
X-CSE-MsgGUID: wYVXCRAvRamouI8uillqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="65648865"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa007.fm.intel.com with ESMTP; 06 Sep 2024 06:25:30 -0700
Message-ID: <45be598b-eb23-4f8b-aeb0-5893945c105b@linux.intel.com>
Date: Fri, 6 Sep 2024 16:27:36 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] usb: xhci: remove excessive isoc frame debug
 message spam
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20240905143300.1959279-1-mathias.nyman@linux.intel.com>
 <20240905143300.1959279-5-mathias.nyman@linux.intel.com>
 <20240905213030.hvk2rucvrhlvkczq@synopsys.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240905213030.hvk2rucvrhlvkczq@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6.9.2024 0.30, Thinh Nguyen wrote:
> On Thu, Sep 05, 2024, Mathias Nyman wrote:
>> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>>
>> The removed debug messages trigger each time an isoc frame is handled.
>> In case of an error, a dedicated debug message exists.
>>
>> For example, a 60fps USB camera will trigger the debug message every 0.6s.
>>
>> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci-ring.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 4ea2c3e072a9..e1c9838084bf 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -3941,10 +3941,6 @@ static int xhci_get_isoc_frame_id(struct xhci_hcd *xhci,
>>   	start_frame_id = (start_frame_id >> 3) & 0x7ff;
>>   	end_frame_id = (end_frame_id >> 3) & 0x7ff;
>>   
>> -	xhci_dbg(xhci, "%s: index %d, reg 0x%x start_frame_id 0x%x, end_frame_id 0x%x, start_frame 0x%x\n",
>> -		 __func__, index, readl(&xhci->run_regs->microframe_index),
>> -		 start_frame_id, end_frame_id, start_frame);
>> -
>>   	if (start_frame_id < end_frame_id) {
>>   		if (start_frame > end_frame_id ||
>>   				start_frame < start_frame_id)
>> -- 
>> 2.25.1
>>
> 
> Please capture this info in the tracepoint instead. Otherwise we have no
> idea if the isoc is scheduled as SIA or CFI. If it's CFI, I want to know
> the start frame value. Currently, I don't think you're decoding this in
> the TRB tracepoints.

Good point

Added TBC, TLBPC, frame_id, as SIA enabled 'S' or disabled 's' flag to Isoch TRB tracing.
76.383778: xhci_queue_trb: ISOC: Buffer 0000000118dfa000 length 3 TD size/TBC 0 intr 0 type 'Isoch' TBC 0 TLBPC 0 frame_id 610 flags s:b:i:I:c:s:I:e:C

code:

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1f6ca0231c84..48b643ae8a40 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1023,9 +1023,6 @@ enum xhci_setup_dev {
  /* Interrupter Target - which MSI-X vector to target the completion event at */
  #define TRB_INTR_TARGET(p)     (((p) & 0x3ff) << 22)
  #define GET_INTR_TARGET(p)     (((p) >> 22) & 0x3ff)
-/* Total burst count field, Rsvdz on xhci 1.1 with Extended TBC enabled (ETE) */
-#define TRB_TBC(p)             (((p) & 0x3) << 7)
-#define TRB_TLBPC(p)           (((p) & 0xf) << 16)
  
  /* Cycle bit - indicates TRB ownership by HC or HCD */
  #define TRB_CYCLE              (1<<0)
@@ -1059,6 +1056,12 @@ enum xhci_setup_dev {
  /* Isochronous TRB specific fields */
  #define TRB_SIA                        (1<<31)
  #define TRB_FRAME_ID(p)                (((p) & 0x7ff) << 20)
+#define GET_FRAME_ID(p)                (((p) >> 20) & 0x7ff)
+/* Total burst count field, Rsvdz on xhci 1.1 with Extended TBC enabled (ETE) */
+#define TRB_TBC(p)             (((p) & 0x3) << 7)
+#define GET_TBC(p)             (((p) >> 7) & 0x3)
+#define TRB_TLBPC(p)           (((p) & 0xf) << 16)
+#define GET_TLBPC(p)           (((p) >> 16) & 0xf)
  
  /* TRB cache size for xHC with TRB cache */
  #define TRB_CACHE_SIZE_HS      8
@@ -2068,7 +2071,6 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
                                 field3 & TRB_CYCLE ? 'C' : 'c');
                 break;
         case TRB_NORMAL:
-       case TRB_ISOC:
         case TRB_EVENT_DATA:
         case TRB_TR_NOOP:
                 snprintf(str, size,
@@ -2085,7 +2087,25 @@ static inline const char *xhci_decode_trb(char *str, size_t size,
                         field3 & TRB_ENT ? 'E' : 'e',
                         field3 & TRB_CYCLE ? 'C' : 'c');
                 break;
-
+       case TRB_ISOC:
+               snprintf(str, size,
+                       "Buffer %08x%08x length %d TD size/TBC %d intr %d type '%s' TBC %u TLBPC %u frame_id %u flags %c:%c:%c:%c:%c:%c:%c:%c:%c",
+                       field1, field0, TRB_LEN(field2), GET_TD_SIZE(field2),
+                       GET_INTR_TARGET(field2),
+                       xhci_trb_type_string(type),
+                       GET_TBC(field3),
+                       GET_TLBPC(field3),
+                       GET_FRAME_ID(field3),
+                       field3 & TRB_SIA ? 'S' : 's',
+                       field3 & TRB_BEI ? 'B' : 'b',
+                       field3 & TRB_IDT ? 'I' : 'i',
+                       field3 & TRB_IOC ? 'I' : 'i',
+                       field3 & TRB_CHAIN ? 'C' : 'c',
+                       field3 & TRB_NO_SNOOP ? 'S' : 's',
+                       field3 & TRB_ISP ? 'I' : 'i',
+                       field3 & TRB_ENT ? 'E' : 'e',
+                       field3 & TRB_CYCLE ? 'C' : 'c');
+               break;



Does this look good to you?

Patch on top of my for-usb-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-next

Thanks
Mathias

