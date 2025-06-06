Return-Path: <linux-usb+bounces-24539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C05ACFEB5
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 11:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51C0C188AEC3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jun 2025 09:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF56286405;
	Fri,  6 Jun 2025 09:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNZi1Zxl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05851FECDD
	for <linux-usb@vger.kernel.org>; Fri,  6 Jun 2025 09:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200674; cv=none; b=phxvCXLLWycsPUOAd9+AE5dkmMI/ojDqn5Q7bAeJ0VKRPbG9fdeqDMW5IZQ/13rXSNqlnZS8gccc6oOc3in9LIQ5hJHlVcN1TgRxoY+lce0uo4SCtBbkDHfSvUE1wnIQg+Vu7kEh+aopgAnPHxAUphITVq7Lu9P5IyIFVN3pMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200674; c=relaxed/simple;
	bh=dowZAHyU/1JzGMhPupx7+xzSlNcAvgxWj8ecPOpmWxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtjuEiSXl8WpNcUGSTljHca1DpXbTHDhPHRie3cTeGXEMtMXTzpAaPhXGCd5MJc670OiLesN/zvL5R495BVSOelbxxND1brsB5S/dQ2Y7IxQPiou/B0e/9ksDEkIgqqeWIrUeUfR3jLGUYbVK81hMdiNNB5XR7PUg6WA8M8FuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNZi1Zxl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749200673; x=1780736673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dowZAHyU/1JzGMhPupx7+xzSlNcAvgxWj8ecPOpmWxw=;
  b=aNZi1ZxlzIR/vvfwlfykoz8SA8yoOt4QjjVLIrMoGX1ZeggQdjaGrN9a
   1O/5HQ5YrCWRVHIAexaTxHKGV0uU5q+PlJ9Hveeuof0mUiEam9+E/gJ1Y
   aXFePr9M2fhXXsWzsi2fhRbq28JZgEqeL2jsshorrE6k2RyGcsz5ZdvC/
   esydUcQxuLBSsbXGBWINY9ZRvUI+VJqnEAOfWiyiO+KA8+91TdtaGaacn
   Rt+8SYJsTQU2WsT4/1E0velOKtoU+AxkM5a5BGygDBsUWOam+y2ZUbzGI
   +Wrr1wtOhiT5s+zvyGkg50cy19jziCBe8CnlzYvGtUz3Yfx/WrmmHfOXS
   A==;
X-CSE-ConnectionGUID: pi1+JBhvQC+LNTuNnE3S6Q==
X-CSE-MsgGUID: +oSv1VNVSYqI5voSoL92JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51491338"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="51491338"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 02:03:32 -0700
X-CSE-ConnectionGUID: 43TxCsTXRlWiKRU4JMGxbg==
X-CSE-MsgGUID: kF/t06bgR+eN14O9lmk8hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="146361015"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 02:03:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uNSz0-000000048kw-27ym;
	Fri, 06 Jun 2025 12:03:26 +0300
Date: Fri, 6 Jun 2025 12:03:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 2/3] usb: typec: ucsi: Enable debugfs for message_out
 data structure
Message-ID: <aEKu3qgoRvJvyxxe@smile.fi.intel.com>
References: <cover.1749142912.git.pooja.katiyar@intel.com>
 <faff193e6dbe86ed3076d425f0cb91e28e5739fc.1749142912.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <faff193e6dbe86ed3076d425f0cb91e28e5739fc.1749142912.git.pooja.katiyar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 05, 2025 at 06:38:14PM -0700, Pooja Katiyar wrote:
> Add debugfs entry for writing message_out data structure to handle
> UCSI 2.1 and 3.0 commands through debugfs interface.
> 
> Users writing to the message_out debugfs file should ensure the input
> data adheres to the following format:
> 1. Input must be a non-empty valid hexadecimal string.
> 2. Input length of hexadecimal string must not exceed 256 bytes of
>    length to be in alignment with the message out data structure size
>    as per the UCSI specification v2.1.
> 3. If the input string length is odd, then user needs to prepend a
>    '0' to the first character for proper hex conversion.
> 
> Below are examples of valid hex strings. Note that these values are
> just examples. The exact values depend on specific command use case.
> 
> 	#echo 1A2B3C4D > message_out
> 	#echo 01234567 > message_out

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


-- 
With Best Regards,
Andy Shevchenko



