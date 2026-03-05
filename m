Return-Path: <linux-usb+bounces-34091-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDJ6EcyDqWkd9gAAu9opvQ
	(envelope-from <linux-usb+bounces-34091-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:23:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F42128FF
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80B213193357
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F23285418;
	Thu,  5 Mar 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+ZLtNt4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8546225775;
	Thu,  5 Mar 2026 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772716690; cv=none; b=ZhSntisNqzg/S0RwvYXKza8gii+JHPIPwMXqwK6iQSQeQ4+aHVcm94hC25B96qJ+6jcqkH2Uqz1fvo4K472tOQsZ9MOSATokckELB8awUrqXIuY69RyI2yr8CgZLfgLzdTOxN9nllB2Xav7HOSDHGu3CN4W34w5bLJIJwq3C7TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772716690; c=relaxed/simple;
	bh=CSMiTZH5FWPShTq4+YfcCCi1vnmOhOAM2fRwuLoLO7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYlf9O08QTP/Yd5Bb7RL1ZThnotH3ZI6rD6RYH6jPZBji7laxVeBBC02BN4rl60zJ7C0KkB3qavJ19OOpCs29jyV4TnCSYnYhbJwdvrgEQ+sjEJ4R72XvM1/Gi5mOxS3RUwqp9ncildTiJvLiaJqosgV+tzsqMF+oYgwIgYm0tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+ZLtNt4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772716689; x=1804252689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CSMiTZH5FWPShTq4+YfcCCi1vnmOhOAM2fRwuLoLO7c=;
  b=a+ZLtNt4CKXac+X2fWNbci10/pJXbIiJDiQ/TTLwHIIjYZVQx4JcijeL
   a+ePH/yE9eCVHykUaV4OBjYV44D10b0WgENfKsggQDbtxHX6M6N3ft+yw
   aE375inPgteN3+q4W3q2+ubvnt8CRB3jfdojmO93hSNUSGt+AiMrQl29B
   HD6D9s0/akRTdGs9unAXAKDTwHuIw/K6nm08oDjeBXGr0Cb3kgZZfRtH/
   ks6520+AidKouoD0MofAbzv+FrpqolDjQtOIvwM1qo9+nY+Uq9JRNHS4u
   CxzXaQyucTJObDlY5tvHo4iTRe+yjHSPES8MxomCPJdvgx1Bh72OCGxqq
   A==;
X-CSE-ConnectionGUID: WbNHcJokRtasaf20CRmPCw==
X-CSE-MsgGUID: br15wN9LSHuzA/+YPqKuVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91375597"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="91375597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:18:08 -0800
X-CSE-ConnectionGUID: Z/DA67zQTBKG8/xWBgiMfA==
X-CSE-MsgGUID: thLuJ1spRayUSLxbvjQfdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="223171044"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 05:18:07 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1D44A12033A;
	Thu, 05 Mar 2026 15:18:35 +0200 (EET)
Date: Thu, 5 Mar 2026 15:18:35 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lixu Zhang <lixu.zhang@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] USB: ljca: drop redundant interface reference
Message-ID: <aamCq4wEprHMX56a@kekkonen.localdomain>
References: <20260305111511.18386-1-johan@kernel.org>
 <20260305111511.18386-4-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305111511.18386-4-johan@kernel.org>
X-Rspamd-Queue-Id: A97F42128FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34091-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Hi Johan,

Thanks for the patch.

On Thu, Mar 05, 2026 at 12:15:09PM +0100, Johan Hovold wrote:
> Driver core holds a reference to the USB interface while it is bound to
> a driver and there is no need to take another reference unless the
> interface is needed after disconnect.
> 
> Drop the redundant interface reference to reduce cargo culting, make it
> easier to spot drivers where an extra reference is needed, and reduce
> the risk of memory leaks when drivers fail to release it.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

