Return-Path: <linux-usb+bounces-7719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67B876102
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 10:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD9CDB21CF1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 09:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677B3535A4;
	Fri,  8 Mar 2024 09:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1/2veTW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6253392
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890541; cv=none; b=BY12F/RabH0+jNhRgyMI2RD51NlfpXcdtSzvf5neQ+rSy0uMQyBF+QptKZbVvxUdS7NwHPAW/rkYIjPZEENhedfcOq4RhFLnlztir6vLgkRPBbuPDJNkAYwQvtOikxfRaWd06gnK7BK3JDqjVD0WsfeKmMcn5tcprlppcN/p9s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890541; c=relaxed/simple;
	bh=d6VTP7SSwgjjZ+hfdiPCDnp2ZccPRm9uatDuPLrCHkE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=W5ZKxILGELDZIaDyV0gZlHsR8hsCtUwEVcJn0qFL//TIlJFgBI+t0X2IxpO7h9jpwcD4rdaCFrUmWr00AYMce3P0C3ovZTaVAZ8JoVWtBDICBqMvlrhPkNLXeFCQh6hWqRg1bwKzLEyA99pgDYoePeFvEUSDwzM7uSIVEqgvhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1/2veTW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709890539; x=1741426539;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=d6VTP7SSwgjjZ+hfdiPCDnp2ZccPRm9uatDuPLrCHkE=;
  b=N1/2veTWZ+GXhF6wCSiKXNc8qRb7OB4+cbNQTdFWAR7SYUP87+If02s1
   q+uDE1KGpz+EizwvTbQMiDiSE7vt7fEvdMqlCJzS4xOP/TTN2rW8cfMeE
   5bAI2lHce/BM01rU2I7afuefOVYbitf8lPwPz4wn8LNc7udT/8Eo23+jt
   ykXNMqQutWvrhH7qujopyUrLBSnKU++8EpSsf2JQhzb4/dyEqLQmo9JkC
   QsJDQd2/4aRTXg06EzfN2LfewZKSm21oJKJC2AVIx3LQ4N1blBaZa5YrR
   MJ8qfbt2zFi4VOnguuiDCF67HMJoxgE0h91fTLebdbUcvrwK9CHeRlDEW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4457573"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4457573"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 01:35:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="937047413"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="937047413"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2024 01:35:36 -0800
Message-ID: <7095a67d-b82d-6411-a9b9-ece40d572ad1@linux.intel.com>
Date: Fri, 8 Mar 2024 11:37:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Klara Modin <klarasmodin@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240223140305.185182-1-mathias.nyman@linux.intel.com>
 <7e92369a-3197-4883-9988-3c93452704f5@gmail.com>
 <78fb735f-3279-40a3-8d12-201a62b13942@gmail.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
In-Reply-To: <78fb735f-3279-40a3-8d12-201a62b13942@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7.3.2024 19.28, Klara Modin wrote:
> On 2024-03-07 17:04, Klara Modin wrote:
>> Hi,
>>
>> On 2024-02-23 15:03, Mathias Nyman wrote:
>>> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
>>> "not connectable" are not wired to any connector or internal device.
>>> They only exist inside the host controller.
>>>
>>> These ports may not have an ACPI _PLD (Physical Location of Device)
>>> object.
>>>
>>> Rework the code so that _UPC is read even if _PLD does not exist, and
>>> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
>>> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
>>>
>>> No bugs or known issues are reported due to possibly not parsing _UPC,
>>> and thus leaving the port connect type as "unknown" instead of
>>> "not used". Nice to have this fixed but no need to add it to stable
>>> kernels, or urgency to get it upstream.
>>
>> With this patch (f3ac348e6e04501479fecf55250b25ff2092540b in next-20240307), my machine fails to boot. I was able to get some kernel console output from the pstore when compiling USB support as a module instead of built in. Reverting it on top of next-20240307 resolves the issue for me.
> 
> Correction, it does boot when building USB support as a module. Got more logs from the unhealthy system and lspci. lsusb shows a single USB 2.0 root hub and nothing else. Calling it with `-v` hangs and produces nothing useful, the same happens with lshw.
> 
>>
>> Please tell me if there's anything else you need.

Thanks for reporting this.

Looks like *pld might never get set in some error cases, and we end up
freeing some random pointer.
i.e if status = acpi_get_physical_device_location(handle, &pld) fails

Could you try if this helps:

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index f250dfc3b14d..7f8a912d4fe2 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -154,7 +154,7 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
         enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
         struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
         union acpi_object *upc = NULL;
-       struct acpi_pld_info *pld;
+       struct acpi_pld_info *pld = NULL;
         acpi_status status;
  
         /*

Thanks
Mathias

