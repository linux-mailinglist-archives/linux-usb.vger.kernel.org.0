Return-Path: <linux-usb+bounces-5983-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9221184C5BC
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 08:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35ED71F2521A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 07:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5061F932;
	Wed,  7 Feb 2024 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AzEYKvKO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20A2200A4
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707292056; cv=none; b=hPOqlYBYk9UhwpmZ2Rjz1U4R91g0DwVGzgXBCzTH6wwNDHWlj5NouCPg/e31W50vZG+SmcoOGxi+wzg6e6Z4nyYpuEDj2fCb2VRiDcXLU3WTybEyW87XhR6Awxm4x1KWIBHc65exPVHELfwGg3mh4tCkMpSV38O2JRHPMonLrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707292056; c=relaxed/simple;
	bh=4xayYUXh0t13H1KOnYmMsPTGwcOnRhw9wZLfwwzj1TQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=eBSFvSwBY1jYTL0HubvAJji6Bo6Lpg3+qsNi9Y0mbTHMok1RwAGp/TeJchT1GdsmtpZdtOaIJKbbaj0lZ1j/wykvkneheCJ8doTLPtVtghV+2CC/lMB+PAHALeqrUrVVkznza7zocRpLKPASHjos3H4lHdJBtmrJnfGxMq6VtII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AzEYKvKO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707292055; x=1738828055;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=4xayYUXh0t13H1KOnYmMsPTGwcOnRhw9wZLfwwzj1TQ=;
  b=AzEYKvKOQ6YueigwXvp7goDVUCUgeAmH7oedeVRKUev0Sk2ffTRGYVYG
   GSrinebOcgBIB8HfSdQX02lVKEAZWCjbxySnQUBuUZQAafSF5zZ0MHxVL
   RVx0nZay+lJlDUZerbwJFidnjWhwV+izfF4ZGYFm0LrHk6Lx1M7bqdPHM
   pak+fkyiH811Xl6z/yjcDb/J66knMAHSnHM11CMnX3AA6w1dbibEk3Xyw
   3praA8Bk/8XrI2yDVdjI8Jnc44suNPx4TQydih/94R+N3Yd1f9uVVnapf
   IbNtFHMnWkPKLCKb1MBz9ByRVm9N0K7D/ldWzAmMFKewDL0aKSKHjuBhX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="23410625"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="23410625"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 23:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="824421763"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="824421763"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2024 23:47:23 -0800
Message-ID: <8c9d7456-8c0c-04e1-0ae6-dbd5032c8a06@linux.intel.com>
Date: Wed, 7 Feb 2024 09:48:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
 <2024020641-relation-embattled-1fb5@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
In-Reply-To: <2024020641-relation-embattled-1fb5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> I'm not going to actually review this patch, as you didn't follow the
> rules that all Intel kernel developers need to follow, sorry.  Please
> work with your Linux kernel team to do this correctly, otherwise I have
> can't do anything with it even if I did want to merge it :(
> 

Sorry about this.

I should at least have added my tags as we did do internal review rounds
of this patch, and told Niklas that it now looks upstream ready and can be
submitted.

Thanks
Mathias

