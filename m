Return-Path: <linux-usb+bounces-6892-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E485FB7F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0B76288286
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E17D14691D;
	Thu, 22 Feb 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYoTLZUH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6283DB9A
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 14:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708613080; cv=none; b=H7nowkD2A8bbYJ5V6V8DcoymU2n/vXsF/E0yrUPEJdJpBL1nLlw+VyqF4P62QiWVGO5/a37KnXT2HMTqX/s7YHj570353LpAKnuenXRp9+BUERtE5G+EF1MTmt7N+ZHYbLnL/N0KEgJudEsn5H1iJynXz87hIhy7x+RTwoPJVnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708613080; c=relaxed/simple;
	bh=JBaS5Ws6bDQp/8Y+hXFaDxXYt3QOSsRMcwFd4JyEreg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=LPewqMQu+LBDED2nn+0UYP/yv1LSaurWA08wLgDVG2haoRGS0lZa8oZPFAFEAQEOT3m3W2eWhL+gHRc9aTptNKHqN37BzNtHd6a2ULy3y6HLkmSy1bkwW7jNhMSQZ0VCmMIbL5cE4MKvhnGBTGgUE4M0w6bjjkGPdZ+4GUs22tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYoTLZUH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708613079; x=1740149079;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=JBaS5Ws6bDQp/8Y+hXFaDxXYt3QOSsRMcwFd4JyEreg=;
  b=nYoTLZUHL2jGBYM3AFpKuHqpWFbgTXgIaPqvg9zwxMqThzxMzBabBi+G
   oQbg/t2/bZH9168HrFxYO0O5fJy3gNFtRyrXEDPLQowwW4EYFQ+ijLd5+
   I0UeqCeblteBMFRb3dsIWSuoDfgtSo/1jdYqQQV/4Avl9K72kHlYQyO0s
   C9MZXOqpuvrukqQRpKqS6G24jm/NSo1P1wBgtZZ+MiEFuCho7KHIiTQhJ
   OPmjDhtNeRq8LJoysmM8FrSLGz8IjFiIGmSazxG3Y31wFkpWucacJRsqR
   JboI7YTVwlQojC61CDvJwwQKTCp713/hH1OJPPU6nL21m1TUpSHWuilP5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13970973"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13970973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 06:44:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936857216"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="936857216"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 06:44:37 -0800
Message-ID: <fc15052f-c5de-0136-484e-c3ac735ae799@linux.intel.com>
Date: Thu, 22 Feb 2024 16:46:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
 <2024022238-caddie-fanning-8ab5@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
In-Reply-To: <2024022238-caddie-fanning-8ab5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.2.2024 16.06, Greg KH wrote:
> On Thu, Feb 22, 2024 at 03:38:18PM +0200, Mathias Nyman wrote:
>> Ports with  _UPC (USB Port Capability) ACPI objects stating they are
>> "not connectable" are not wired to any connector or internal device.
>> They only exist inside the host controller.
>>
>> These ports may not have an ACPI _PLD (Physical Location of Device)
>> object.
>>
>> Rework the code so that _UPC is read even if _PLD does not exist, and
>> make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
>> of "USB_PORT_CONNECT_TYPE_UNKNOWN".
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> Does patch 2/2 need this?  If so, why isn't it marked for stable?

2/2 alone fixes the real world port peering problem seen.

This is something I stumbled upon while debugging that issue.
This patch just makes sure we don't skip marking some unused ports as
unused due to how we parse ACPI tables.

Thanks
Mathias

  


