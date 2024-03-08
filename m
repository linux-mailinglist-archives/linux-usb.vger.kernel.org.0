Return-Path: <linux-usb+bounces-7724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E01087635A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 12:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC495282564
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 11:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D5355C3A;
	Fri,  8 Mar 2024 11:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWEX1VLg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047555E4F
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 11:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709897295; cv=none; b=bgSbpEBCeveRtCbR5RJf95gsFdcuig9iKANPTcmJ4zT07+c8HV8MaYf6sbcVR9/VitI2PHyaLaMaexvq4C0R+SYy+4j+q78bp+docYIDXq1xFHNf5t4NaSW2kGX7UZ2IpCH6vzacABzZZMxBemT5st7zc5YCN9oL9tITfuzInQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709897295; c=relaxed/simple;
	bh=OGAW3xKAf5qsjiPStm6r2YCpcBv1hZtYGEww0LBAe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/9TrDclcAnuX37kL7XBK9s0NJ7u49fp74FNqxfnOq57oaQLD473y0Dea7hbzmWBYDbcF0s39cx+AuWqKO4/pIm/xL4maH+C5FknFdNctssuvYQPodFRhf8z7Hn27PvDNS0mmVIoDHrx0rfpciXUYJBpqyTfJWJzDBkEa5CH87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWEX1VLg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709897293; x=1741433293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OGAW3xKAf5qsjiPStm6r2YCpcBv1hZtYGEww0LBAe+k=;
  b=gWEX1VLgPizB8FT9ypgmj+rHI3ureDSFW7O9Hkt9tpXF2pqbjUCkwxJe
   2OXfknF41PEQOk8BEJTi1MI7X7BPJq9OCuLX+GrhhZO6j/97C5CvgdY6q
   MP27Mpm18jJmchgQA+u0x727AVJJAVqWPyfUC3N9NUjUQdirNXpPW9jVo
   YxGAHaKU9puUOKYqptLcZAx+5KfMV2ITtr31IB4jnJPZA7pmdzXShqK0Q
   oDqkI5zi1VNbG2C1sSJW4Ve/BqBolGHCkII8IyFsLA2jR1+r+xA2emvoc
   tE9bEHff+JcDmqCCNlFTqoh2IOKAwCCKP1W7/HPno0hrolu7JKxv2Omvx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15179965"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15179965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="937047497"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="937047497"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2024 03:28:11 -0800
Message-ID: <653d5a58-4a76-f93d-6b4b-36e5a44475a5@linux.intel.com>
Date: Fri, 8 Mar 2024 13:29:53 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
Content-Language: en-US
To: Klara Modin <klarasmodin@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
 <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>
 <78fb735f-3279-40a3-8d12-201a62b13942@gmail.com>
 <7095a67d-b82d-6411-a9b9-ece40d572ad1@linux.intel.com>
 <1cdfff7e-a63e-4618-b07e-e071187a3f14@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <1cdfff7e-a63e-4618-b07e-e071187a3f14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>> Looks like *pld might never get set in some error cases, and we end up
>> freeing some random pointer.
>> i.e if status = acpi_get_physical_device_location(handle, &pld) fails
>>
>> Could you try if this helps:
>>
>> diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
>> index f250dfc3b14d..7f8a912d4fe2 100644
>> --- a/drivers/usb/core/usb-acpi.c
>> +++ b/drivers/usb/core/usb-acpi.c
>> @@ -154,7 +154,7 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
>>          enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
>>          struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>>          union acpi_object *upc = NULL;
>> -       struct acpi_pld_info *pld;
>> +       struct acpi_pld_info *pld = NULL;
>>          acpi_status status;
>>
>>          /*
>>
>> Thanks
>> Mathias
> 
> That indeed looks to be the case, this fixes the issue for me.
> 
> Thanks,
> Tested-by: Klara Modin <klarasmodin@gmail.com>

Thanks, I'll send a proper patch

-Mathias

