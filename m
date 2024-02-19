Return-Path: <linux-usb+bounces-6731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98549859D2B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 08:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543E92810A2
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 07:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BFB20DC1;
	Mon, 19 Feb 2024 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FolWSSs5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ADE208DF
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 07:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328566; cv=none; b=ILCBvpC17T+9GL1SiEz5WRk2l773CCy8RP+Rj+0NrFKz5Ge3X9cKS6OgcOr1wlev0VZe2Ws/aP4ezggpZ/YKK4wTYO5IBbenGpgSfB1YAUKh038IbXdlyHubtcfBVAu7oN8SjmeH30QXEIeMWCuTNVKI/cU/5NCXOmNjzZTUYFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328566; c=relaxed/simple;
	bh=DTBpji9YvTRgky54RoqikA4L7QxdWmk/32ar5ohkYis=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=KpbXaSRK77BMP942If/qdA75EB3fAROo5Zdy5T5CgxYSblCffltcuaZJtw61uahh9AqNjhYm9A6NmSR7SGHt6DVKpAiibDoBqfmRfr9oxQamSgjuqeINyLU7VNNirb1ZGURkuuCBWZ/yWvswZWN1/5MWzAA6Wvfc3vY8+VjfYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FolWSSs5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708328564; x=1739864564;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=DTBpji9YvTRgky54RoqikA4L7QxdWmk/32ar5ohkYis=;
  b=FolWSSs5IUqnMeKaggdyLNqBgCIaMA+bKDRXghYaWG5SBvhgoVIurojn
   0xi/B/CnfBi4rcFQqy8h9LSl6kffDI2Y58uC+3VAcQ/khY3O4ZXYJen3i
   nCh6CALUx/7Z4KHIItUTaWzIJy+89QBYSn4wha4wqoZ+ziG6L5iN/nT6S
   pIATA9vMdFKcGHDGS5coWEodAWcpz5h9xFRymgepV6ztsxBACthmFye2m
   1v2slCBPDMV39cz1F4c/C1APdcBXqxdeKcDOB2hwwa5SBiaqcTHcmUzut
   8OedSJB0ubVvXIVvZik9RgM4C+uuDHrZR3guRzQKBWJ2+5rVz/rm3wobn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="6217944"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="6217944"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 23:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="936245123"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="936245123"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2024 23:42:42 -0800
Message-ID: <1075b61e-d380-8e45-61e2-33d181444594@linux.intel.com>
Date: Mon, 19 Feb 2024 09:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: pmenzel@molgen.mpg.de, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, aros@gmx.com
References: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
 <20240216141230.3924677-1-mathias.nyman@linux.intel.com>
 <20240216141230.3924677-2-mathias.nyman@linux.intel.com>
 <0fd81580-a01d-48a1-8265-337cfd843dfe@rowland.harvard.edu>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH 2/2] usb: port: Don't block port power-off on false
 peer failures
In-Reply-To: <0fd81580-a01d-48a1-8265-337cfd843dfe@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.2.2024 17.20, Alan Stern wrote:
> On Fri, Feb 16, 2024 at 04:12:30PM +0200, Mathias Nyman wrote:
>> Several unused ports may share the same bogus location data in ACPI
>> PLD tables. This causes port peering failures as these several unused
>> USB2 and USB3 ports suddenly match based on their location.
>>
>> Don't print the "usb: port power management may be unreliable" warning,
>> or block port power-off in case peering failed for two ports with
>> connect type set to USB_PORT_NOT_USED.
> 
> What if one port is marked USB_PORT_NOT_USED but its bogus location data
> causes the system to think it should peer with a port that _is_ in use
> (and maybe is already peered with a different port)?
> 

This could happen, but based on the DELL case it seems unlikely.

The bogus location entries are filled with zeroes, while the usable ports
start their location group position with a "1".

If neither is peered and one is marked USB_PORT_NOT_USED, and their location match,
then they will peer successfully. No change due to this patch.

If one port is already peered to some other port then peering will fail,
warning message is printed and usb_port_block_power_off = 1; is set.
No change here either.

Also two USB_PORT_NOT_USED ports with bogus matching location will
peer successfully as long as neither one is peered with some other port.
No change here either.

Could make sense to skip both peering and matching with ports that are
not used.

Thanks
Mathias
  
  

