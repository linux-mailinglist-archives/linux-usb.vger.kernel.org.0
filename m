Return-Path: <linux-usb+bounces-38236-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E/GApRhHWojZwkAu9opvQ
	(envelope-from <linux-usb+bounces-38236-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 12:40:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0061DB1D
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 12:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB2983002B16
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E346039A07E;
	Mon,  1 Jun 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ra94bV5C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628873998BF;
	Mon,  1 Jun 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310411; cv=none; b=QZi8vrKZCpobfTZM81cw2DyQc61PIXfmz8l6gfOsUQ4yDbf1/hsizB2PLLBPjeYmiX0U8tRXa1jz3pd+C7s89nzFhWQpIRQLUmbZNNTlIYTXWzB5ezvhjhMZHvTQpX9uSyEYoRaOLbg1CG6Vltb78ZOLmbQq1ozg+naCwkzDOgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310411; c=relaxed/simple;
	bh=bwHMHe4L+qBeK222881FYVxQlgMAxXPNdsSc8eNgedo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLKDHUIK7CedKeBD/BDTWubxcogt6ypXgEvkUPYwGQhfmH5hP70yjiS748Ij4jZCsDk5uNOfzt5OQTIow8TydrWLi+CNRnJdW1TZflzoL1kEubECZFlWy57azwsGUPGB3aH+kXsmjZJIGefXqkdsg8Rriy/l28U8gNiByBZxc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ra94bV5C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780310406; x=1811846406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bwHMHe4L+qBeK222881FYVxQlgMAxXPNdsSc8eNgedo=;
  b=Ra94bV5CT+dFNZTvXMSPKjtuPI6x2lpZvgpq/xGM9NNZIndSySaQhwzo
   dzsBoGfwF/gECHXlCziGg5j4pSgg9gVM5FEc2p7IJ8NwZTDoClIjWkqm+
   956sq/CwzvvVYWN3DnA0h6TlzxuwmGIEpIcUYpEqFRUd9LiScujjvWBxy
   9sBlxtsygt5lNbRy9OFNwbV75fMCnsvN2t1RHJvgxChsnyxqLxX1RmJJt
   CFC9HK8CiIaoMlLH8YtmP5WFrBhRQpQ9DmNLxZILEebQ4rz4rEcOw6jJW
   LBrNtefRChgEFanQx6DOxhxbx1hVTn1IMhBDgRPzgPA1H9VQ++FjTaoLX
   g==;
X-CSE-ConnectionGUID: t7Kixz8uT8GNhERfKBrlWA==
X-CSE-MsgGUID: ynXOOX50TL2fOMRXjusMww==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81096257"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81096257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 03:40:04 -0700
X-CSE-ConnectionGUID: 0Rkdr2RTSrCOF0KXNka8Og==
X-CSE-MsgGUID: SR4/ZcX7SsWRxmIl9AxKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="248632704"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jun 2026 03:40:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8E61995; Mon, 01 Jun 2026 12:40:01 +0200 (CEST)
Date: Mon, 1 Jun 2026 12:40:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Xu Rao <raoxu@uniontech.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: test: release third DP tunnel
Message-ID: <20260601104001.GQ3102@black.igk.intel.com>
References: <523C55ED1A2B868E+20260601062854.4334-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <523C55ED1A2B868E+20260601062854.4334-1-raoxu@uniontech.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-38236-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 95B0061DB1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 02:28:54PM +0800, Xu Rao wrote:
> tb_test_tunnel_3dp() allocates three DisplayPort tunnels
> but only releases the first two before returning. Release the
> third tunnel as well to keep the test cleanup balanced.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied to thunderbolt.git/next, thanks!

