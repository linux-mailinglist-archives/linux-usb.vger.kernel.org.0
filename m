Return-Path: <linux-usb+bounces-21268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6EAA4BF81
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 12:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCAB17A2A24
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD3720D514;
	Mon,  3 Mar 2025 11:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtAj89xn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD7A20CCED
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 11:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002962; cv=none; b=Ltfw+tNlaLZaPwtW2KpeT38QaKhhsaM2HDelya9YGKNtYssp76IqjOQBzTb59BWLmudpxHJKOqeBbDFvzOotP804mWro4bPlLAmzL4idQDtRcneW3+LqpOfxIuy6ZGqsxl7a1l6Fz68E2tiPlc5RM2Hny/J7UKLy35Uj5R1RTzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002962; c=relaxed/simple;
	bh=2DLZlHi262Gp+DV8kz2Be4owyRzsZII7Ao6/rutFACw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVuyB2kRmXq2Gx6iJGN+IrUebsLtjOWt5Q7EMeJiJqFoVRNZUaB89xoDzzVHZECSgfC3PaOP26lCSuOUiDZngQeXFmqpDw1O9MKcm9gj58suBi5D54T4ncefFhGcVc+WepEBaxfBkrMs/zKrLfKpxF9SzJObUwTDfVAS3CW/KMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtAj89xn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741002961; x=1772538961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DLZlHi262Gp+DV8kz2Be4owyRzsZII7Ao6/rutFACw=;
  b=BtAj89xnRQAyt9+GuYsIl9064Ki7R/nmydpC7piE73UFThA21bKpbhP/
   QPfftIs914AHbA8bNw9estbs6PFiwj0IlQO4YBVksS9oG6V+ACDRR/5on
   c7D9kM+DH1bysP1Lx9U1JquurAwyFFcwI1H8tY0DuT2hFlzQy51LAK93A
   iJZOGfam87/ylXzG1h1lBKZ/FehTa6ArvmR3UrlLv+135p8cqlZawtH3C
   SBlZVKXixMhbjH6eXK5gXw855UPrI55BbCv/TiO+x4HQLiD0MQJHAghZ/
   C9qGZEkmg8iHzTUmf1HpxC6NyoXrV2rXRcHD0u3OG94C6AHAg2BglbyzH
   A==;
X-CSE-ConnectionGUID: rkwfQpcYSPaJQCTrlRMGOg==
X-CSE-MsgGUID: R3hGa4mlTwaNY4Di6tBhkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29460639"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="29460639"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 03:56:00 -0800
X-CSE-ConnectionGUID: Jb4UWm+kQ5iHRzPXTh7Hcw==
X-CSE-MsgGUID: o+YlGrPFTQWYXIKjlWLaZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="122585949"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 03 Mar 2025 03:55:59 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id F3CEE125; Mon, 03 Mar 2025 13:55:57 +0200 (EET)
Date: Mon, 3 Mar 2025 13:55:57 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250303115557.GU3713119@black.fi.intel.com>
References: <8e175721-806f-45d6-892a-bd3356af80c9@panix.com>
 <bd731ba2-5509-44e6-a419-814ef5329bbd@panix.com>
 <992dba2a-4919-4f76-ac48-986792d5843c@panix.com>
 <2b55ab09-8389-4916-8acc-abc73f234d21@panix.com>
 <20250303104618.GP3713119@black.fi.intel.com>
 <f31309e4-6ce5-48cf-910e-cd74f818aac8@panix.com>
 <20250303112149.GS3713119@black.fi.intel.com>
 <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <e557db09-2fe8-4a85-8d0a-4493aaa4f198@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e557db09-2fe8-4a85-8d0a-4493aaa4f198@panix.com>

On Mon, Mar 03, 2025 at 03:45:36AM -0800, Kenneth Crudup wrote:
> 
> 
> On 3/3/25 03:38, Kenneth Crudup wrote:
> 
> > It'll have to be more pstore dumps, as resume doesn't (usually) complete
> > with d6d458d42e1.
> 
> I should clarify this to read "... as resume doesn't usually complete with
> d6d... if an external USB-C DP tunneled monitor is connected."

Okay and this "external USB-C DP tunneled" monitor you have it connected to
the TBT dock during the suspend? So you don't unplug plug or anything like
that, just suspend the system and then resume?

