Return-Path: <linux-usb+bounces-18634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F40789F61FF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C9D1626E5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E6E19B5AC;
	Wed, 18 Dec 2024 09:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djiPW3D4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5CA19993B;
	Wed, 18 Dec 2024 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514934; cv=none; b=dLO4x27SJChsSgyZ+A/5vtH6oBM1Z+v02lw5J2W+G2ClO1galmMMAmi/Mf4wj2cbQ3iLKl43lla9ERm5EyZOWdSxSEBssl+0PlN1fW4ne+hZ8bCo+YEXq+Gmy/fEPCguoqf0i7mQmUWu9e1VhINQr0tN3LO5fCiInO6pFQQxdn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514934; c=relaxed/simple;
	bh=ch8Kt9NE4qfwEY75oCn7lPZBEB0EG5D1Ri9UdcSlKco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oDzS0ZG2kUYcziA8IVz2vlYbbDpEtPkSwTRM2vBPHDQzZr3zoAZjKMU5UTBMXfeaf/riq+b8ALYzf+jSMDdy5tVdF4ziLumqD9jzPymzTxv0qZS8ouzJFH2qkXwGeERwbfD8UDDB94mGwBrioKrXUixo9vO/m0jRnA8C9plUI7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djiPW3D4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734514933; x=1766050933;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ch8Kt9NE4qfwEY75oCn7lPZBEB0EG5D1Ri9UdcSlKco=;
  b=djiPW3D4C23f/z2EVAR9N0aS5Q/YGA49doxQtRWtEJK7jvwZfKZM1v6F
   PTKpK0jQsAMrIDqPrdVWlXeTNv5ZbRFqMQC/ak9ccqHur16LuuRmM/wI7
   Ymbc6aZK5xR1eLMelZd1o3V3VTojOR/m1STsHTIc14cd1XmO90lCnfvj6
   XyGs1tTqGy7S5XryUQSfvo+5kIWS8F9o6tXEFYmzBVY2T63cALArMgNdo
   Ia+vWyZMJff83MBxYbx9V4U8Tid7lD7WDhPtU/I42hcVvZ58fZho5REOY
   9K7M445o5J8kdQTuv8esi3tJmPEM+6c3Su0U/h9DEiRQqgGubM8e0dND+
   A==;
X-CSE-ConnectionGUID: diPdOGdLQH6SOCjwJpFSLA==
X-CSE-MsgGUID: kth/EtZNQ6OuxJXc0SGJrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34863182"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="34863182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:42:12 -0800
X-CSE-ConnectionGUID: 8m5i32fTSy69kZkdng6/dA==
X-CSE-MsgGUID: YCqRDT3TRUm9QPcYTO2h4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="102644161"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2024 01:42:10 -0800
Message-ID: <6f057db9-b27a-45ee-98b5-08e979de0b26@linux.intel.com>
Date: Wed, 18 Dec 2024 11:43:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RIP: 0010:xhci_ring_expansion+0xbd/0x380 [xhci_hcd]
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <68e02165-e5a3-4751-bdf1-5b6671d42790@molgen.mpg.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <68e02165-e5a3-4751-bdf1-5b6671d42790@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.12.2024 23.57, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Attaching a 2 TB external disk to the right port of the Dell XPS 13 9360 and running `sudo mkfs.ext4 -L "Verbatim HD" /dev/sda1` the command does not complete and the system finally locks up and has to be hard reset:
> 
> ```
> [    0.000000] Linux version 6.13.0-rc3-00017-gf44d154d6e3d (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-8) 14.2.0, GNU ld (GNU Binutils for Debian) 2.43.50.20241210) #42 SMP PREEMPT_DYNAMIC Tue Dec 17 11:17:55 CET 2024
> […]
> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022

There was a regression in 6.13-rc1 xhci ring expansion.
Fix is now in Greg's usb tree on its way to 6.13.

Patch:
https://lore.kernel.org/linux-usb/20241217102122.2316814-3-mathias.nyman@linux.intel.com/

Gregs usb-linus branch:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=b9252f80b807801056e67e3a672fb1be0ecb81d

Does this patch solve your mkfs case as well?

Thanks
Mathias


