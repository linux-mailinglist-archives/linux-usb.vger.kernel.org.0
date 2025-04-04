Return-Path: <linux-usb+bounces-22580-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC1A7B786
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 08:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F14AD177717
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 06:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DF613BC35;
	Fri,  4 Apr 2025 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9JGK43Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248EC2E62D4
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743746527; cv=none; b=WpsGcnGv21xhBxDxO80xQ3PkxgJpauR4+AG1OpkdUnHvxbd6Pd+IcCdeBlfFYn9A5E4LppoGvTOFrAI7OsDG5it1PFOyCVSif8DIpe2ND5RqFNMCQqsZiRW5mm6QDXoSdGJFWyd74mqeQesv+0peLiC3OJYzGjhCB2QrwgAGZTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743746527; c=relaxed/simple;
	bh=LlOPlCqu0hmnUIYYc6SeiLMISX2Y13WCzX+6VspSgkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITGWnRF/WUzbm5razjCpSmXG9X8ut2YnUMs0ucCdvxWk8ZiXnGfy00/OghONsYnAEjvHMRLGBOM9nGRuHp86x6i+hDREMRvXTXq/OjPLyZiJdt2Fof7DW3oDn1IfzNp8pZEAmVu//PqTX1rWo1BR8ebhBWRoL08q3gWZG5mg6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9JGK43Z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743746526; x=1775282526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LlOPlCqu0hmnUIYYc6SeiLMISX2Y13WCzX+6VspSgkk=;
  b=l9JGK43Zy/WMuaXITW1LRc/sFoumEwxSRkAWFFy7i/7wK2dQyGTlreHY
   B8tib3TC39ZhV4DjC0uNybUWDB9sWtDp5RyJNJG+Lyq4hxIjTPAtpDUqV
   Kr9z6vOopUL+wekmKh6ZgbVEXBnsbJPCIQpnZ+1Ubt5R4j9AlM0WnOF4O
   X8mctC4BEqG0m/aF1GJ7y8FSHco7X4+DIsTB6mGyZddSb7tjS8AIWaXeP
   pQdjPOy421X4DWpa5R7uAgB+rp8YUCSVP8yVTRQ9TxXUp5VIQ3yByPJez
   obUlhhUo4PPOH2BIlqpMMdlbDeqKsJVzkY5g9m+rTr0WtwIvT5nk4XMVp
   Q==;
X-CSE-ConnectionGUID: dC6jSSetQWCanvrK1sh6YA==
X-CSE-MsgGUID: 2g+wq7b+Q3SocZO2vJqDiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62717754"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="62717754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 23:02:05 -0700
X-CSE-ConnectionGUID: it95BubFTc2xAyMDYOVPnw==
X-CSE-MsgGUID: +qUkE13XQ8eeJxdJseOqzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127199395"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2025 23:02:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5FE91141; Fri, 04 Apr 2025 09:02:03 +0300 (EEST)
Date: Fri, 4 Apr 2025 09:02:03 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	"Gong, Richard" <Richard.Gong@amd.com>
Subject: Re: Wake on connect / wake on disconnect
Message-ID: <20250404060203.GM3152277@black.fi.intel.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>

Hi Mario,

On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> Mika,
> 
> Recently there are some conversations about wake-up from connect/disconnect
> happening and I wanted to get some background from you about the current
> policy set in tb_switch_suspend().
> 
> Wake on connect and disconnect are only used for runtime, not for system
> suspend.  Would you be open to adding wake on connect as well for system
> suspend?  This should help enable use cases like plugging in a closed laptop
> to a dock (which works on Windows).

Don't we already have a similar for all usb4_portX devices? That does not
work for you?

