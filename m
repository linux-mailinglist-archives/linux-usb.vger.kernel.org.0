Return-Path: <linux-usb+bounces-6921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB548605CF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 23:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F80EB21780
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 22:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE7C18036;
	Thu, 22 Feb 2024 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxrM7Xz6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A61182A1
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 22:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708641706; cv=none; b=gxcbhfu9aotDCnjsj4zjt6MH8+FwKsecUDMiosTt8SbvCnmts6IVLb6CAWOCZEObHMjZekIoyom9wwZHS0/3/m5lLykC0GsvcT/UKe3qbvPANKaL0GUHMdcY02Amn3Y7c5XHgMGkU2ZB3mghtAAAoTGsuHF9oz24nAXo3jD5pB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708641706; c=relaxed/simple;
	bh=jl4dfi7f/+U1uTXkqmdNtPQDUdB9gDTnPCJGoVeFPUY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XraqP6AIGSNo6i+R2OS6gcP3ucFZ/Dfu87KbQF81YQO16UxFLn2afMnDUhMlgwvK8tiTuBhLucY38QjMydvj09D3Ek5JfYAo3fTAPRZlLJVFTceGO4iL49SaYdCrVvp2KJRYErSJ9EbesOTj23mpziKGogczF4i/Usxa9E4fgyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxrM7Xz6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708641705; x=1740177705;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=jl4dfi7f/+U1uTXkqmdNtPQDUdB9gDTnPCJGoVeFPUY=;
  b=dxrM7Xz623c5Tw8ERam1h6If8dCDS8+DJPv1KpWPO1sQqkqVZ3HaitgG
   d/ahA+McLdK1SkkhQUMs/JeJvI1R2l2tC4te/8V3IkJmltQ8tJdOFm7oM
   0j+0Ak835fprxi45n6zMC/cr39b4qqW/SbLB/YrltVOu02xGXqIxn9qZM
   56Fj9+6jsF81g8PQlOPt1sON1nhHzJE+1YApjKyFbR9Wy/Idlziu6aXM+
   7HJVggDdevig5vKisOpvMj+Hh9jCO2ue4cQU1lY0qcZcmY0ELOhWECb51
   A3crMO3CfRqtghvSmisk3Ix/9fW5Rcw2LTOKvM8yqpEq7gUc+qnUqCwNX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6686464"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6686464"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 14:41:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="936914678"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="936914678"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 14:41:42 -0800
Message-ID: <268b0758-b815-da67-21fe-7de7d65b9cef@linux.intel.com>
Date: Fri, 23 Feb 2024 00:43:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
References: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
 <2024022238-caddie-fanning-8ab5@gregkh>
 <fc15052f-c5de-0136-484e-c3ac735ae799@linux.intel.com>
 <2024022230-gusty-tactics-34d1@gregkh>
 <0c5f5512-d015-c77f-4e1e-281f95c04197@linux.intel.com>
In-Reply-To: <0c5f5512-d015-c77f-4e1e-281f95c04197@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> Ok, so should patch 1/2 go to usb-next and patch 2/2 go to usb-linus?
> 
> That works as well.

I'll tune up those tags, split the patches, and resend

-Mathias
  


