Return-Path: <linux-usb+bounces-7548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01A8720C9
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:49:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72AC1C220C1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA32E85C7B;
	Tue,  5 Mar 2024 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NN0i41kc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03498593E
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709646568; cv=none; b=YFOGjOVv9w6r4s31tRZihNcD9zarDh1Vu1fOi1fXP4pNyp17dCy3Z/x46jQU7caDWhhcTObSF7LD8JNdy8VHS1/PhQUcJ037FKzVeVZ4CqAPp2JvWRI/OoggrxYPL6Rg8h6PLIu+GlGKB74z2RmOPjhyZ9m7y0uPQg0nWu9o05I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709646568; c=relaxed/simple;
	bh=QZKW0+jdpGAX+WC1f7uaKq07IJNP+UdYSRDzZYrKWwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q3etjXCs9LWEEJhQdHoqcUuUayXA8G3KOOOPxGBfae1lRyC6GqkywaY0t259E8INqXGktj9XOnka3wjGAh1D9lSmcNGJPEb4T8XwCNu3FkvpEoOqE/s6KE5S/sF50tgliU39uxkpxyfRYhHtBpHA2JXfFQLMGF/iKNY76+vnGkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NN0i41kc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709646567; x=1741182567;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QZKW0+jdpGAX+WC1f7uaKq07IJNP+UdYSRDzZYrKWwk=;
  b=NN0i41kcb0VUYr+g06jgLVlbbAHPYa7XZP/TvAu9/6nPC+/yb4ZTtBFg
   VMdpGYifjieweWyZ0Dv1HsN0qbm/oSldY4WuMX81S8C+tcXKHrM8pmvp6
   XUNw+axfyi8ObFH66ORO7/jvkRdfz6szYarG2RVbi9Z8uBSsa3KZrj55r
   +lpwrP3kVMB/dHgi6KKThhC+wtCEJh0hLiZlt7hCt536mlxXnG/vTVkKL
   QkFSZk+KgD4fjf54SCZFIaZYdZtuJvYWRkiLiyY410qIppw9vnnunNUqV
   G3RYeBnK5HQvQxeEOX3IVFwguXmPexEOurs2rhbbrPSvQ20nqO6ceTDm7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4362690"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4362690"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:49:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937042334"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="937042334"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2024 05:49:24 -0800
Message-ID: <426e3327-9ed7-98d6-d9d0-bfaceb45164d@linux.intel.com>
Date: Tue, 5 Mar 2024 15:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3] xhci: Allow RPM on the USB controller (1022:43f7) by
 default
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>
 <2024030555-fervor-unlovely-98c5@gregkh>
 <f9f89ec1-6baf-4a61-e685-a0f311b5a298@linux.intel.com>
 <2024030509-reflected-reflux-c043@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2024030509-reflected-reflux-c043@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5.3.2024 15.43, Greg KH wrote:
> On Tue, Mar 05, 2024 at 03:08:58PM +0200, Mathias Nyman wrote:
>> On 5.3.2024 14.04, Greg KH wrote:
>>> On Mon, Mar 04, 2024 at 11:13:27AM +0530, Basavaraj Natikar wrote:
>>>> Enable runtime PM by default for older AMD 1022:43f7 xHCI 1.1 host as it
>>>> is proven to work.
>>>> Driver enables runtime PM by default for newer xHCI 1.2 host.
>>>>
>>>> Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>> ---
>>>> Changes in v3:
>>>> 	- Reworded the commit message.	
>>>> 	- Removed fixes and stable tags.
>>>
>>> Why?  Why doesn't this belong in a stable kernel?  It's a quirk fix,
>>> don't you want this on systems that are running 6.1 and 6.6?  Or are you
>>> willing to wait for 6.9?
>>
>> Might be better to add it to stable after it has been upstream for some time.
>>
>> Previous attempt to enable default runtime PM for AMD xHCI 1.1 hosts caused
>> regressions and had to be reverted from everywhere:
>>
>> https://lore.kernel.org/r/20231205090548.1377667-1-mathias.nyman@linux.intel.com
> 
> Ok, can you ack this so I can get it into -rc1?

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Thanks
Mathias



