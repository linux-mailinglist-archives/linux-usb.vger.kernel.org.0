Return-Path: <linux-usb+bounces-36073-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHFqExEo1mnqBQgAu9opvQ
	(envelope-from <linux-usb+bounces-36073-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 12:04:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A70BD3BA3C9
	for <lists+linux-usb@lfdr.de>; Wed, 08 Apr 2026 12:04:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31412302D5FF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Apr 2026 10:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213733B3BF2;
	Wed,  8 Apr 2026 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JwTChNh5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E013AE71D
	for <linux-usb@vger.kernel.org>; Wed,  8 Apr 2026 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642515; cv=none; b=Bod5CuQoNQUJfMhIWrm2kXEjeIWs8WaN50wdJ4JNSLGp5It98wdq5ndXt4221CkRu/457xvWttKpLc2JTSfr+/7Zj2ljZoIK0vs7tN4XeJKuHcyNkuJ5Kyj3bEi666Zluzqp1z/qh8GjHDT1qdTgeU4JdS8bZ7orFSgIiReuYZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642515; c=relaxed/simple;
	bh=QEY/oUjpLz8dj81y+JDwW9zs3XZnb9Fe+ggtt9AP84g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKazFXw6imXKPODBDYuPmQTG6k/f/BiG3X4pFzija0ylv0St89D/JC0sFqqb5WWaZOXY9V/ZAr0LEUs1nBQG90i7nqM+uiGe8nMzgxzXhGMrztJcGZgJmU/F/qvJou3nNAC7hgB+zzPBqfZ/lpCjZd9c8bm41Y/zMhUqBpvg2B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JwTChNh5; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775642509; x=1807178509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QEY/oUjpLz8dj81y+JDwW9zs3XZnb9Fe+ggtt9AP84g=;
  b=JwTChNh5w0WFZ4vfLKrd78+UxHRLW5MuopWjJnDLpGRRDlicAzB2sh6o
   w/TpNrU92sWrGaBR9rFvViQsokzFsr5gxMQ06nq/86Ky90U9y+PB9V4Gs
   xOna/NJ+384nxthH+LocwRSp1NuzUXfojaPzzPnMN/aGiO656a/bPzaNc
   m1hFzRZnvOd1W0tg4veY3OP9u8TapmMBXFh2N0MpCFXDmNYTTqQdEkQRV
   4Lwcsz8w8pXTN9biWh+05kQ6tT2T9iKzAgCox6SbkxvYMcIfSnohkDx3e
   koCPyTsOIBWwMXHo74XCl0/dubEvw2mcjk0oqntiSpcBrA/RmQtME6ICo
   A==;
X-CSE-ConnectionGUID: a6TkvFQoR4eXzTLL2F3fVg==
X-CSE-MsgGUID: QkuDlBUNRMqQjl55aYelRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76742123"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="76742123"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 03:01:48 -0700
X-CSE-ConnectionGUID: z+xsFNyERv+7WoO6f+15ug==
X-CSE-MsgGUID: 5L294rfNTAKYg6AXOfA+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228362430"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 08 Apr 2026 03:01:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id AEEBA98; Wed, 08 Apr 2026 12:01:45 +0200 (CEST)
Date: Wed, 8 Apr 2026 13:00:53 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
Message-ID: <adYnVcIDsdKlmyv5@kuha>
References: <20260402120433.22967-1-francois@scala.name>
 <ac5uh_3N3q61efIb@kuha>
 <8cef8b26-71ce-4fdf-a514-111d9760634c@scala.name>
 <adT144chxkINLk63@kuha>
 <d627d2fe-415f-4489-b4fa-ec0575a33239@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d627d2fe-415f-4489-b4fa-ec0575a33239@scala.name>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36073-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: A70BD3BA3C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> I'm running Archlinux with kernel 7.0-rc7 with my patch.
> 
> Please find attached the dmesg files (with and without altmode).

Thanks. So this is a known Dell specific issue. There is already one
proposal for a workaround:
https://lore.kernel.org/linux-usb/20251224070022.4082182-1-acelan.kao@canonical.com/

Br,

-- 
heikki

