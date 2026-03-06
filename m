Return-Path: <linux-usb+bounces-34150-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMNvLKy2qml9VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34150-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:12:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB66C21F78F
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 12:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DC1DA300C7EB
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 11:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F69382F0E;
	Fri,  6 Mar 2026 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASLxa+Wy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B62359A9A;
	Fri,  6 Mar 2026 11:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795541; cv=none; b=DImk+ggY6/bIxPOxX9B7hL4U/lhyRL36O250Wb74D7wh3BH7vEER3lalQIeVpeUD4HmPBHFV5giO3PDJFRqVuz+5DBKfm+KL9G2vujF8Vgqvis6jlN9Lyii11C8WjYcBMfXNrje+GKOG61wb6TMXCVIzzGhdNMLU8HYS5qkGk+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795541; c=relaxed/simple;
	bh=HqHuaXb1yS+P3FhwF3Ot3Aq/2egVC0y0ucS3j2H3NKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwPWCVXyMFl/6yE9+hTontKzbvx1jADN6lgcpaDK/gQnbLQhwzsFrBQwv/SkcrNMlM+udZufL+ud/8iUnKZSY5yF/iDLvrdjX0tcH5gguPU/iiOM/a0jMF1XJnJPruFTp8V+c5R3qjrgJFghXHp4AIc8HBHJvLqcOP9YW+2h9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASLxa+Wy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772795538; x=1804331538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HqHuaXb1yS+P3FhwF3Ot3Aq/2egVC0y0ucS3j2H3NKU=;
  b=ASLxa+WyVUgsuXVfakp28olVYYUtAEf/QzbABElRR5xsOuywv+TKugqt
   q8JY8cgeXQQ9pAP50DszL7RDTN42qFWKtnO/PjnfTnNkLkgtYJ24f/AV4
   88I2nVholFum8VmPkRblq24HSDgrLpEdMqaDeIhRrQT6WZNgAPCcaqyfA
   RnokW5+3LWTVY3rjvr7Bdnc60j+3MtkDwe4zxpeXa7jrleVDtWecKJ2bW
   B+9rSehSMYK5PJYjhRcfwxJHiYX/NcEGsxLkll5ecgiDtPzSuhh6Vg2An
   NkvPRHHq8PGR527ZO/08URpSnil5muphm1x4ezQXwWgN0kYv8zrnzCcQC
   Q==;
X-CSE-ConnectionGUID: XKqgXSy8SmGzkdyzYdBQyQ==
X-CSE-MsgGUID: zMHxoQ7IQ4m1t8P0LiEZ5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="76504465"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="76504465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:12:17 -0800
X-CSE-ConnectionGUID: y6FeFP6YQwSS/7mHlErGPA==
X-CSE-MsgGUID: rS2JfW4PR9al14Dg17Lzjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218931490"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2026 03:12:16 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6EE9395; Fri, 06 Mar 2026 12:12:14 +0100 (CET)
Date: Fri, 6 Mar 2026 12:12:14 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove bouncing maintaner, mark thunderbold
 DMA test as orphan
Message-ID: <20260306111214.GF2275908@black.igk.intel.com>
References: <20260305171837.3114157-1-dave.hansen@linux.intel.com>
 <61f7f7a3-4e7e-48b7-bc12-5f92f9cf18bf@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61f7f7a3-4e7e-48b7-bc12-5f92f9cf18bf@intel.com>
X-Rspamd-Queue-Id: AB66C21F78F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-34150-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,black.igk.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:33:24AM -0800, Dave Hansen wrote:
> On 3/5/26 09:18, Dave Hansen wrote:
> > This maintainer's email is now bouncing. Remove them and mark
> > the code as an orphan for now.
> 
> ... and I'm a doofus. I'm not sending things via my normal workflow and
> I missed:
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

Thanks Dave!

I will take over this one. Added your SoB and pushed:

https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/commit/?h=next&id=f791145abcb83faa6ba580f2b7a6cefef37b9cf3

