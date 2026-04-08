Return-Path: <linux-usb+bounces-36074-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHuiA20s1mm2BggAu9opvQ
	(envelope-from <linux-usb+bounces-36074-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 12:22:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD73BA771
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 12:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FDC330A89ED
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 10:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A30E3B4EA1;
	Wed,  8 Apr 2026 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikaNz49S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9753AB272;
	Wed,  8 Apr 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643035; cv=none; b=VrWeLhPnw+rh4nD3bBBOKV1p2Vk9+L4yGwHaypGYuaoXL6huCHhE1ySXu0ixfuALS2HVIx86Zw2gv/cWzvuNDg2V+wiogjLtgEEeTKEKMDAVGoBG+AJ8rJKbAEsNaxqCuY5xohjYjGsGxILkfAZvW0fwBV8H8thOKgdWZuaBXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643035; c=relaxed/simple;
	bh=Ji/3+jEu1qHxnpmvfrZN4C3ixmDphE/3xNX6mvUyEjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxxLYy2UdxVYmFVh2jevbQX8MB/7jgyCgODtKJ7dtddYMc4d1LE3WvlSYJHwOm6KBjKaCfvRvEL54o1nXpcTjG92qJStdo8d5GeVkCJIojnjHoilb4g0NZVyBrSjvG9b5svPyM7wGqDF0xhktuJ71ik9y1wB1G3/SGDwruB6BwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikaNz49S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775643029; x=1807179029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ji/3+jEu1qHxnpmvfrZN4C3ixmDphE/3xNX6mvUyEjM=;
  b=ikaNz49SjOR4yqDMHoH3BZlsxd5Oq1PQWkCfEc5l+2z8Gby5W636NqqH
   NYJRFHCv/NVtJ0dhrAfXmvm4G3hDFdXXS0iEpSbjOVgcKI39oSszRTKt3
   f232Vuh/T6BK0Gu2PTcSNOAhWGrj3lzERBe+3fhsJ6BjAVPgQCUR4j1kB
   6VFq/vqkh0+lAQ6ZDvoHaeecuUQBPQBQePdNC0lKED72EsxJ089VisWFY
   7+hewB6h9fO982ULiWp8AJn8+j2dqxernYScSMslf8cytQmu+y1+9BQgm
   c1iw6w6NFYbfa+O0GzIvr+E2rS/RiCbINf4kR+cJOzHdpvUqMMRDOhAvk
   g==;
X-CSE-ConnectionGUID: U7zHWfzQRjSGqUvwmdBf8g==
X-CSE-MsgGUID: th0iJqpQS1qxtVv5z6V1pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="75791841"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="75791841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 03:10:28 -0700
X-CSE-ConnectionGUID: iV75VRzMQh6recoMeGafJg==
X-CSE-MsgGUID: 7tdVOcX0TImffUp0213upw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="223667634"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2026 03:10:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5AD5398; Wed, 08 Apr 2026 12:10:24 +0200 (CEST)
Date: Wed, 8 Apr 2026 13:09:32 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>,
	=?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <adYpXLWAeYOoeo8-@kuha>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
 <2026021124-badly-emit-e90f@gregkh>
 <ffzdbsfxugeoca3csa56t3ieh5laxdyra3kx6mh646eokezhkr@v6xqqbjtn42m>
 <abF00-Squp-tEOKS@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abF00-Squp-tEOKS@kuha>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36074-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: 68BD73BA771
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+François

On Wed, Mar 11, 2026 at 03:57:41PM +0200, Heikki Krogerus wrote:
> Thu, Mar 05, 2026 at 04:58:02PM +0200, Dmitry Baryshkov kirjoitti:
> > On Wed, Feb 11, 2026 at 06:37:41AM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> > > > A gentle ping.
> > > > Please help to review these patches, thanks.
> > > 
> > > Wait, no, we rejected this series and said "fix the firmware".
> > > 
> > > What happened to doing that?
> > 
> > Having a similar problem with other platforms. It's not always possible
> > to fix the firmware. I have one platform with a similar issue, but that
> > laptop is EOLed long ago (Lenovo Yoga C630, the issue has been worked
> > around in the EC driver, but I'd be really happy to switch to the
> > generic fixup). At this point it really feels that there might
> > be more UCSI implemetations having this issue. 
> 
> I would still like to get an answer from Dell for this (if this was
> the Dell case). It looks like they are using the GET_ALTMODES_COMMAND
> in some custom way. It's almost like they are first returning all the
> SVIDs without the modes, followed by something else.
> 
> So even if these products are EOL, and we will never get the firmware
> fixed, we still need to understand what exactly is being returned to
> the command, and is it returned like that intentionally or not.

François is now seeing the same issue. I guess nobody has had any
luck contacting Dell?

Chia-Lin, could you rebase and resend this?

thanks,

-- 
heikki

