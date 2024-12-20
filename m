Return-Path: <linux-usb+bounces-18698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6738A9F927F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 13:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFA7116C8B7
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 12:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7B72156F5;
	Fri, 20 Dec 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cc0gb8cb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A462046A3;
	Fri, 20 Dec 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698817; cv=none; b=bDbxds7tqf+VQTJcMXzaSSZ+Lybp8CtvsUOBce6r+uXdwLcS9MKht/zyY6ajeHQmRvVmKKQ/yN0vGpVzm60JHSkrhS+XWODYZ9ZPHw0UgsFIKqYm2BKjKrfrqWuzSvLx0PNXBb+KFvXIK8AFOu2l6ymkqrfBVYWFNI9UI6ARHoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698817; c=relaxed/simple;
	bh=cdrA5Bflo7RoNfB5cNlHcIEUyoHjzneejbJVkN/M1yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=adYQg8lOoyxQYiDSDjn63YEYG3fT8vtmXQvhmYcj9yzAWPKQd5XFGz8SFCyOuafrKwV/DJqncdXerX0Dh2P4NvLdEydr9QcF7h8+OWj2rywqzod9/qAIWAfePBY9firt4r4AEOrzmZzvJabO1dt8IlUlg/Fxl9fhAre6LUTPtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cc0gb8cb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734698817; x=1766234817;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cdrA5Bflo7RoNfB5cNlHcIEUyoHjzneejbJVkN/M1yc=;
  b=cc0gb8cbuUSqjd7vnsg/YZS+5zNSrVVkAh6k8wLeRsPxR7MFMbn9/vjH
   cQcyEiMbz8adCa5by7wKWHGKttCxAyN96AGf4HoazqySQanC2wIOZDwJa
   NYMkmzZUC3+eaupqZ+oY0TPTdrZVs3vuWG0DNlJz/RU63VTvQq8s/s4MH
   lOnmnvREifD7Efe977HTayfgI5ae8YPIxK/CO2jOYzSrl+UqLnRLOlgQ2
   l36z5bzB07bFaGtv4XC2/6IAZkZZDXgeIATTfU8VG2evtXw8YuAZwbhh0
   37sCaER9s1mDjg2E6LMNIwQ/g2EOiv4b5APof907sB4djAW9iWV1q43Fo
   A==;
X-CSE-ConnectionGUID: nts8RKAUQe+jdv86/QScRg==
X-CSE-MsgGUID: iZpYxuu+QziGNK8L1ra8+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39029631"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="39029631"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 04:46:56 -0800
X-CSE-ConnectionGUID: DMruheO7QdCCWHtJ6LM+1A==
X-CSE-MsgGUID: jGt/sqAdS++LrfKcaDE2yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121782383"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2024 04:46:54 -0800
Message-ID: <48283487-cbd6-4869-b5ca-70a30d6190e7@linux.intel.com>
Date: Fri, 20 Dec 2024 14:47:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: xhci: Fix NULL pointer dereference on certain
 command aborts
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241203205123.05b32413@foxbook>
 <20241219215519.273c5c41@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20241219215519.273c5c41@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.12.2024 22.55, Michal Pecio wrote:
> If a command is queued to the final usable TRB of a ring segment, the
> enqueue pointer is advanced to the subsequent link TRB and no further.
> If the command is later aborted, when the abort completion is handled
> the dequeue pointer is advanced to the first TRB of the next segment.
> 
> If no further commands are queued, xhci_handle_stopped_cmd_ring() sees
> the ring pointers unequal and assumes that there is a pending command,
> so it calls xhci_mod_cmd_timer() which crashes if cur_cmd was NULL.

Nice catch.

That enqueue-dequeue pointer comparison should probably be changed to
checking cmd_list directly. We do use list_empty() and list_is_singular()
in other places

But that would be a separate cleanup later.

> 
> Don't attempt timer setup if cur_cmd is NULL. The subsequent doorbell
> ring likely is unnecessary too, but it's harmless. Leave it alone.
> 
> This is probably Bug 219532, but no confirmation has been received.
> 
> The issue has been independently reproduced and confirmed fixed using
> a USB MCU programmed to NAK the Status stage of SET_ADDRESS forever.
> Everything continued working normally after several prevented crashes.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=219532
> Fixes: c311e391a7ef ("xhci: rework command timeout and cancellation,")
> CC: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

Adding to queue

Thanks
-Mathias


