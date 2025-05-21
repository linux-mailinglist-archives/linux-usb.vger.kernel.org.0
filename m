Return-Path: <linux-usb+bounces-24175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73147ABF5FD
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70AA4E7924
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890364CB5B;
	Wed, 21 May 2025 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LszFY8oJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B089268689
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833759; cv=none; b=VzxrOWZh2SDVODcGy1AFN8S5SYVUJA5+WH7XKKL8w24wM3CgQtsMjiWl2n2vq52m+vNtlOj3ow6Mk1lMHYEwSdBmenew2jidxkzKE3tHse3HyqgFsAOWQ7Ah2sprjS8J22xUjek4JZxUzOv+827qGMgVJWQBoRJRBmzxG3y1XN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833759; c=relaxed/simple;
	bh=mqt2wEA2ryKSIas63vcqW1UJSiSb0m6udCx+JndkO8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBYGtGAiIUfv6LIFnVtQ4WeHzuftpzQql3H7zL7ROy95YsclsH8T9iZyFmM8JJ/WB+5SkoJqEHFuFg/3i+OiiFfUpWEk+AuoVb6d7GUPDccj7HEamEAhjEpHnES+g8nCK3bmsDxgJEO2HItfpgGOFzC9A+C0z4+pJzKJmDyEx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LszFY8oJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747833757; x=1779369757;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mqt2wEA2ryKSIas63vcqW1UJSiSb0m6udCx+JndkO8Q=;
  b=LszFY8oJUA9DPZB4NK9IlR1xX4Q4vsTwXQHzmtxYha9bg7tgd2O92znu
   aRqG9nTngr9iriO1ju7OL3E8ou9PkxmWnizoUrtLhoClTmEtGuSPw3n/g
   LhC3goUncQ7RqNN7dIy0mEwZuv/iFBwmEUUHcnkiY1EDGzdJ01lZYknSh
   6LTcoWkdts6ac2DNuNbvaYdWx1iNgw7xYRFcoFAwFjIJ7bE8pbfF/ceAv
   HFEaAMdJ9kKu4W1YbTiOdm3oW0QIF5XLKI1PBzfzmA3kC/Fahjd8oU+LI
   TeP7U89heLU/ZF+pXNLF5zniT5TExbU+jco/LHcwUh0UW7DG5GhJeEx+K
   g==;
X-CSE-ConnectionGUID: 4lfydmFFQB6tcxZm1srGUQ==
X-CSE-MsgGUID: y4ZCJO+HSLCUV4NRrbqREA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61150474"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61150474"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:22:36 -0700
X-CSE-ConnectionGUID: T5YPkKz9Qn21NT4iKQW+eg==
X-CSE-MsgGUID: o9L04FLRSRaxXGuUn3ql/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141007745"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2025 06:22:36 -0700
Message-ID: <6d0c69a6-1349-469d-9f7f-6731aa77f28f@linux.intel.com>
Date: Wed, 21 May 2025 16:22:34 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/24] usb: xhci: add warning message specifying which Set
 TR Deq failed
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org, Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-24-mathias.nyman@linux.intel.com>
 <20250516144310.12b4f072@foxbook>
 <c6c2a7f6-35fb-4f92-9d07-b0a2fa703223@linux.intel.com>
 <2025052136-apostle-floral-9c23@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025052136-apostle-floral-9c23@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>
>>> Is printing this pointer actually useful? It doesn't tell why
>>> the error happened. It will not relate to other messages - the
>>> command failed, so dequeue stays at its old position.
>> Printing the DMA address has turned out to be quite useful, quickly shows corner
>> cases like end or beginning of ring segment, or address missing upper 32 bits.
> 
> Printing kernel addresses is not allowed.  If you really want to do
> this, use the proper printk flag for it (%p I think).

These are all DMA bus addresses used by the device.
Wasn't aware those are bad as well

> 
>> Comparable with the "trb not in TD" error messages
> 
> Should that be fixed too?  Again, don't print kernel addresses please,
> people consider that an information leak.

Yes, there are several places that print DMA addresses using  %llx in the xhci driver
We can change those to %pad, or some index

Thanks
Mathias


