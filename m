Return-Path: <linux-usb+bounces-34564-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBnwLlN1sWnovQIAu9opvQ
	(envelope-from <linux-usb+bounces-34564-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:59:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF5264F3A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78BDC304A2DE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9252C326F;
	Wed, 11 Mar 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNvQiC8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E178F2E;
	Wed, 11 Mar 2026 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237507; cv=none; b=iqzxe+Npr4HjAUk/9456PnjMsuUZYckyrNNiZRoIEUFeNIO9OF3zvw7Gc3loiJklxoURBvGIaaX2waJicMbaxX2/9Op0ajJvfV7rbq57JgPgu4A7woc9aZf7xZ4MOIaZSClVM51rzxhmCRuiGtDxWmrVyU4jztRAy+6cCgQb+jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237507; c=relaxed/simple;
	bh=WBuac49ghBCA9CO7FSkQO8q6aJ7b7i6XfZTZL5xM0Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTUskQ/7GIXXk3+Gk+hjwtSKktYikikvhu7FmEyGJxMi4nqrbtocQYlfQuli8oAzXG7+JQcHNKuE+EMhFhnwqeSoRhaemf8sueUShGVES3PVOjc4Vi9ZaqCxjRhltqWsCVOzoRzqAjP/2jnZKaRJTpoVTBuViJK5omt1ZGZUah4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNvQiC8X; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773237505; x=1804773505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WBuac49ghBCA9CO7FSkQO8q6aJ7b7i6XfZTZL5xM0Y8=;
  b=lNvQiC8X8KpPTIfezYcJFdw+rhb7L3bI+ZGVuwAcKh4JVaVDOMGhLspG
   cQgxJHQgjkBvvcN8w/h9ocimr6Ofs+cHtH9sDE5RFSW/DZhluVB5wRyPu
   QArYTCA0RNGcMK/toYLB3ViidqhnAsxT3tlHjNKHg/McGNXKyPaH5Fsxi
   evnV30kYV3iwLyEpYLSLJdD3PcgAdP3cn+uhdc9H7tEw7gXPl6T5MAa7d
   3OMdPDGfsCeWCIoTjSZiKd9bl/2G+9pgZxwJCmLgU5N5Ntys/NL+AZC/G
   C4LluYKJJkb8LGn3yNKGzHD69+h8YTMPRKXNG5xdqBEnQSOnsoxpXXsJi
   w==;
X-CSE-ConnectionGUID: xF4ov7VxSs2BrphRBOkwdA==
X-CSE-MsgGUID: mDns1dXyQQKzevF9GHxuOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85781119"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85781119"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 06:58:24 -0700
X-CSE-ConnectionGUID: OVvD0NciSrWopuchyjErsA==
X-CSE-MsgGUID: 1PTLgwKqR1WJcZ3jEYMN2w==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 11 Mar 2026 06:58:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6D63495; Wed, 11 Mar 2026 14:58:20 +0100 (CET)
Date: Wed, 11 Mar 2026 15:57:39 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AceLan Kao <acelan.kao@canonical.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Pei Xiao <xiaopei01@kylinos.cn>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <abF00-Squp-tEOKS@kuha>
References: <20251224070022.4082182-1-acelan.kao@canonical.com>
 <CAMz9Wg_H0HrDHvnvKbPE7XMtBwCQ=2poeqseNW_RdoOC-DNrDw@mail.gmail.com>
 <2026021124-badly-emit-e90f@gregkh>
 <ffzdbsfxugeoca3csa56t3ieh5laxdyra3kx6mh646eokezhkr@v6xqqbjtn42m>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffzdbsfxugeoca3csa56t3ieh5laxdyra3kx6mh646eokezhkr@v6xqqbjtn42m>
X-Rspamd-Queue-Id: 39BF5264F3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34564-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Action: no action

Thu, Mar 05, 2026 at 04:58:02PM +0200, Dmitry Baryshkov kirjoitti:
> On Wed, Feb 11, 2026 at 06:37:41AM +0100, Greg Kroah-Hartman wrote:
> > On Wed, Feb 11, 2026 at 11:32:37AM +0800, AceLan Kao wrote:
> > > A gentle ping.
> > > Please help to review these patches, thanks.
> > 
> > Wait, no, we rejected this series and said "fix the firmware".
> > 
> > What happened to doing that?
> 
> Having a similar problem with other platforms. It's not always possible
> to fix the firmware. I have one platform with a similar issue, but that
> laptop is EOLed long ago (Lenovo Yoga C630, the issue has been worked
> around in the EC driver, but I'd be really happy to switch to the
> generic fixup). At this point it really feels that there might
> be more UCSI implemetations having this issue. 

I would still like to get an answer from Dell for this (if this was
the Dell case). It looks like they are using the GET_ALTMODES_COMMAND
in some custom way. It's almost like they are first returning all the
SVIDs without the modes, followed by something else.

So even if these products are EOL, and we will never get the firmware
fixed, we still need to understand what exactly is being returned to
the command, and is it returned like that intentionally or not.

Br,

-- 
heikki

