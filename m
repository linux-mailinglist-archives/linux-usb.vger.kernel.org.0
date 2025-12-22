Return-Path: <linux-usb+bounces-31691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC8CD7401
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 23:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A31673016EC8
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 22:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35D532A3FD;
	Mon, 22 Dec 2025 22:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9oHWubj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF001F91E3;
	Mon, 22 Dec 2025 22:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441730; cv=none; b=WDxbHbXbteg+Gi0BugQhV8MmodjdmpBOpkryvlvW8XJkZCf+15P0TmaOhZbw2Ng8g+0mqqhJHTePNJwjlRY79grKpA/ACj2jBh3ygBw7Ae/TyhFENkEumtzLvRlBirZlBkfSDMsBjh9b0n6xefViOMcIxOMTIhvziry8ESe8a1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441730; c=relaxed/simple;
	bh=HPFUtN+D5bBaC9p5jac1pGCJvV9KYH6tJamqjvzvwbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=biP4iiSpKPIft8ekNTJKyqCkYWvtgrZvpVGlpnO+jfal0OD1kOn5TghpOqeMdLk/JxEnE+E3KaFkjstrcBhChpzjrp+jz2bc5pROqcUgp0UYxXme/sp5r2PFgVz8eiy9WUc6pf5zvIElQd/r/5qt7/miwAD5WmRRCAsSQpikJD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9oHWubj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766441728; x=1797977728;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HPFUtN+D5bBaC9p5jac1pGCJvV9KYH6tJamqjvzvwbU=;
  b=b9oHWubjTmLX6mOzuLk3zX5VSd/kj1TPs7TlLUwmKNQ5QhvB4YFA0ACZ
   pTk1ZlDyLRVBjCGye5pT6NcR7mdQf4dgo/q9DjwXM88W+Ok+RcW+CHp3C
   x8kzwvlfqqs0ZnGNWNFRJwMvzqMs7FcsQbHPzu0zLJBpwy4jc45yHLnin
   8vsQmpds4XUwkvUVeV0FOrp35rDmyzVqcU10sDzHvXj6miVVa0rftcMcl
   fi4qNFN0kQaig/g3Svkypvwtfm6CZs/1X/XcU0BiUSKbf81HFLJ4DXkLH
   dDRpmLm94QvF0XX01nWSC0rkeJAZdG9oGhrdA2SUWlWugZH2MDJXe9DpW
   w==;
X-CSE-ConnectionGUID: YBRZV5IETnuZgC/kFWbwOw==
X-CSE-MsgGUID: ILQMDwtqTnGfAKIlOOhmqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="93769189"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="93769189"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:15:27 -0800
X-CSE-ConnectionGUID: QN8LlwQhTuqAxzavxPOD7A==
X-CSE-MsgGUID: Riy0h+QPSX+g/vX1Fz1WFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198766550"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.200.125]) ([10.121.200.125])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 14:15:26 -0800
Message-ID: <a6073f4f-edb3-470c-be63-4c3054d497a0@linux.intel.com>
Date: Mon, 22 Dec 2025 14:15:10 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] usb: typec: ucsi: revert broken buffer management
To: Johan Hovold <johan@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251222152204.2846-1-johan@kernel.org>
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <20251222152204.2846-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Jonah,

On Mon, Dec 22, 2025 at 07:22:00AM -0800, Johan Hovold wrote:
> The new buffer management code has not been tested or reviewed properly
> and breaks boot of machines like the Lenovo ThinkPad X13s.
> 
> Fixing this will require designing a proper interface for managing these
> transactions, something which most likely involves reverting most of the
> offending commit anyway.
> 	    
> Revert the broken code to fix the regression and let Intel come up with
> a properly tested implementation for a later kernel.
> 

Thanks! A fix patch addressing the race condition has been identified and
is being tested right now. It will be submitted for review shortly.

Here’s the discussion on same - 
https://lore.kernel.org/all/349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com/

> Johan
> 
> 
> Johan Hovold (4):
>   Revert "usb: typec: ucsi: Add support for SET_PDOS command"
>   Revert "usb: typec: ucsi: Enable debugfs for message_out data
>     structure"
>   Revert "usb: typec: ucsi: Add support for message out data structure"
>   Revert "usb: typec: ucsi: Update UCSI structure to have message in and
>     message out fields"
> 
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c   |   5 +-
>  drivers/usb/typec/ucsi/debugfs.c        |  36 +-------
>  drivers/usb/typec/ucsi/displayport.c    |  11 +--
>  drivers/usb/typec/ucsi/ucsi.c           | 118 ++++++++----------------
>  drivers/usb/typec/ucsi/ucsi.h           |  22 ++---
>  drivers/usb/typec/ucsi/ucsi_acpi.c      |  25 +----
>  drivers/usb/typec/ucsi/ucsi_ccg.c       |  11 ++-
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  15 +--
>  8 files changed, 71 insertions(+), 172 deletions(-)
> 

Regards,
Pooja

