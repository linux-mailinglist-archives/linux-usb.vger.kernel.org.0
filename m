Return-Path: <linux-usb+bounces-37715-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mML5LXdsDGpKhgUAu9opvQ
	(envelope-from <linux-usb+bounces-37715-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 15:58:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB175801DD
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 15:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 888E63006809
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D313ED3B3;
	Tue, 19 May 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7zqt+04"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073D369D5D;
	Tue, 19 May 2026 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199035; cv=none; b=NhUANRB6EQyhKEqxbkcYZUURcHh/8n8LzJQmSU3b5YK7BsiBN8GXdDQPd+VEwWgdwF7QkS6padrzWZMqdnhNvNqh2ordAsYyj4e3FsyogHtcrkKyo7dXQT9+2UWStq2/xn/Zo1pySX4sXN8TzLjWRZVvw+1JN7ZRVqyJrogWzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199035; c=relaxed/simple;
	bh=w4ehybMAv+OD5uRAOunLamcTmTo8P2LhhYBiP6Z+ERQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H46n5hWMfO4eazt47LpuXpyCoMa5ogKRBxf2RPMA0rV1Dj/duKgLKuyLLUY13fcQk2Kaw+bBcb2UQQ/tTQdr03O1b/EcsPFzRbsHBJetAZGf8TshIefumZUXA/pb34z+ltsEUBLnMHTu+b1DnZ/PaKKN0CGUUspIPMCxOYYUCDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7zqt+04; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779199033; x=1810735033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=w4ehybMAv+OD5uRAOunLamcTmTo8P2LhhYBiP6Z+ERQ=;
  b=l7zqt+04Tsvm8sBxuUwX06JEuze6KMtDHfsAyLw1aVtuck3FmHdlE/t3
   jGF1apABVknEt/X+6/Vcj7AJId2zldt2UoNYb1yO4ZTEASWiqFbMrZFtz
   20h1D1P4nhSx+nw0CpqoeEl+EbZ1N5jbzITPEFxVGcql5as4WhuokFVCy
   sznqfu4stduw+6OtoRllHIDhzDuQh4bmJjInTZBB+RKVpLyfluNWDvaSj
   9xxRMDJrv9vojHZDez8w4BoNGw0vRsK3mUtxW9nbZMtAIJKZO7SYSGBhe
   hxYLtHBT/KPaYFEpDVdRpaAsCm6Hl4bNzHeP7Zh7EWhgJNnsw5Ifh3mvQ
   A==;
X-CSE-ConnectionGUID: nW7S6KuXQpeeYofQFyl1Jw==
X-CSE-MsgGUID: 546dZ5SAQ1eQrNlo9/AWrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90772625"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90772625"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 06:57:13 -0700
X-CSE-ConnectionGUID: sd0VRwKrTBuDWnhPwalIUg==
X-CSE-MsgGUID: oVq4Gk7BQzimvBHDFFDwJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="243776001"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2026 06:57:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9FCF395; Tue, 19 May 2026 15:57:09 +0200 (CEST)
Date: Tue, 19 May 2026 16:56:58 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v2] usb: typec: ucsi: Move long delayed work on
 system_dfl_long_wq
Message-ID: <agxsKhEjF3ygE0zs@kuha>
References: <20260508143853.330151-1-marco.crivellari@suse.com>
 <CAAofZF5xeDSV=YBQckRSKVgiNiM5RXshnR19DVOYmwgNxncB3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF5xeDSV=YBQckRSKVgiNiM5RXshnR19DVOYmwgNxncB3w@mail.gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37715-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linutronix.de,suse.com,linuxfoundation.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 5CB175801DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 11:01:18AM +0200, Marco Crivellari wrote:
> On Fri, May 8, 2026 at 4:39 PM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> > [...]
> >  drivers/usb/typec/ucsi/ucsi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Gentle ping.

This is okay by me. FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki

