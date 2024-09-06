Return-Path: <linux-usb+bounces-14786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E196F58A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 15:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C461C28461F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 13:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999201C9EA2;
	Fri,  6 Sep 2024 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O/BY2/VB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFA1E49B
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725629961; cv=none; b=LfUTiH5W84rfKpN+kBLx0JQmlKiJwq0gf1ZHvJ/wndqHNC4Kuet4+9CLKiXXkESq4a7vBWfF9vTyf1XRzdIbXi+UEZVjxD2tX5kuw4eG1U09t/pGpKe610GMlOZiGVY+FXMs36THYP6I7EK2hrLIAeS6Yl3G4LRyBbBGXg3lOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725629961; c=relaxed/simple;
	bh=4+7n8ZIPLyFUFSkFZ2QdnIclQut94O/MuKpjXWgNZgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djZUzcoIapT0eTFL7jsOHxQkz9yJMSXeHpvP5E5YIdVpXQ4mYAc8Fc4rmbCfkjaPLM3bGRJGpa7GKNOyt/iOYk+P3YjFQLV+DFnNothwC4PRpgh2/Q2pbmrzhToi4dqk+2qPO3oZzzVM1GalymQwO4ev22nnQcN7Ea8fz4sz/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O/BY2/VB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725629960; x=1757165960;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4+7n8ZIPLyFUFSkFZ2QdnIclQut94O/MuKpjXWgNZgs=;
  b=O/BY2/VBIjk7RH4XtjdY7Xg+DBPYAXL0v3LzDBYuw4Uk9RQcGv0jj/jK
   2/DWPA2nBl5ejdVC9oo71crrpFo5IdbGuhaiDUw/DK9GW4mZcV+Xkc9LC
   YBqRRtF/eOR/Ph1qUGOGHo4CzYGJnYbgstzIdg6PRjTE2uAIbaicYiQr+
   qf40//6Sq+T5F6EKyAjSyd7rvHY9IvFlm4M/KzbYD39Zgkk+2cHrD4ob/
   n8xBgnxjmFYzE7cj6fPazres3B7CsIqCq063JC5AHGehGGzceohoss3jn
   6QFzwP2cLdF3QLMpu8n5vY6hRiw3LMlkraIXYtbTBVER13Tymm/sBgvv6
   Q==;
X-CSE-ConnectionGUID: 380oJJyhToe5fC21qWothg==
X-CSE-MsgGUID: jUfTeCweRaa3Zo11JHOZRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28176439"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="28176439"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 06:39:19 -0700
X-CSE-ConnectionGUID: peFE1sk+S+mpO1MuwzC4dw==
X-CSE-MsgGUID: k6Q/br/cRMeZVWI1o1lnXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70899518"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa004.jf.intel.com with ESMTP; 06 Sep 2024 06:39:16 -0700
Message-ID: <27bdf845-9cbf-406e-b156-472ca79c94a8@linux.intel.com>
Date: Fri, 6 Sep 2024 16:41:22 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add device links between tunneled USB3 devices and
 USB4 Host
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, "Rangoju, Raju" <Raju.Rangoju@amd.com>,
 Sanath S <Sanath.S@amd.com>, gregkh@linuxfoundation.org
References: <20240830152630.3943215-1-mathias.nyman@linux.intel.com>
 <321cf204-cf74-4f51-8ed3-8c5738444359@amd.com>
 <20240904050013.GZ1532424@black.fi.intel.com>
 <7a3fc5cd-1705-40ab-8d93-d9f286009aa7@amd.com>
 <20240905055330.GH1532424@black.fi.intel.com>
 <830cc833-24a7-4e19-8804-6b4135e122d1@amd.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <830cc833-24a7-4e19-8804-6b4135e122d1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5.9.2024 21.57, Mario Limonciello wrote:
> On 9/5/2024 00:53, Mika Westerberg wrote:
>> On Wed, Sep 04, 2024 at 12:38:15PM -0500, Mario Limonciello wrote:
>>> ❯ ls -l /sys/bus/pci/drivers/thunderbolt/*/consumer*
>>> lrwxrwxrwx 1 root root 0 Sep  4 12:33
>>> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.5/consumer:pci:0000:00:03.1 ->
>>> ../../../virtual/devlink/pci:0000:c4:00.5--pci:0000:00:03.1/
>>> lrwxrwxrwx 1 root root 0 Sep  4 12:33
>>> /sys/bus/pci/drivers/thunderbolt/0000:c4:00.6/consumer:pci:0000:00:04.1 ->
>>> ../../../virtual/devlink/pci:0000:c4:00.6--pci:0000:00:04.1/
>>> ❯ cat /sys/bus/pci/drivers/thunderbolt/*/power/runtime_status
>>> suspended
>>> active
>>>
>>> I would have expected the USB4 host router to go back into runtime PM, but
>>> it doesn't anymore until I reboot the system.
>>
>> Yes, it should enter runtime suspend after a while. Would you mind
>> sharing dmesg around this?
> 
> I was capturing artifacts when all of a sudden it started to work.  Then I remembered I updated the BIOS on this system very recently.  This is a pre-production BIOS.
> 
> I downgraded back to old BIOS and everything works as you expect, so there is some BIOS bug at play.  I'll see if others can reproduce my result and drive a BIOS solution.
> 
> Sorry for the noise on the patch, all is great!
> 
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> 

Thanks for testing it

-Mathias



