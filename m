Return-Path: <linux-usb+bounces-35301-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b7PeGoLVwGnXMwQAu9opvQ
	(envelope-from <linux-usb+bounces-35301-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 06:54:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C29EC2ECBF5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 06:54:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8E2E300D153
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 05:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E1F2C234E;
	Mon, 23 Mar 2026 05:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEY71oMW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14577AD4B;
	Mon, 23 Mar 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774245245; cv=none; b=PwciPCKEBYEHNBcOEeIf7ZUaMvc0jIW50E32r5C82yhVhkfU/NWXz/ZGhS9sV5k2NtaqIce6YLlXNpSfljxTzTV09fNLEuJN2hXEV+huSzqWaeg0V1fKE75xwJvSNCXoqpx88Lx4l6nzIzDigSQG0vq0CnpkmhYyD/l26v8N29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774245245; c=relaxed/simple;
	bh=5Np89iEfAkaoUvFYor9oqdXgPCMO1WES0ZnH+qDTPxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMOD3eE67aBAkzp4CwolxyLvV7+gGI5YvgpQVIRuybkQWgtQF9V2EaBT2D4OzoiWY4Vc732IlUvbXQ7XgaegO3ye6cOwrEeNBDA7x6Qm2g2hIkB1+HV+PhW3RF62ZBY5zfYcyz5RTfmeTCtauOtxuLBD32Ewoy+M0EqKO3j1VXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEY71oMW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774245243; x=1805781243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Np89iEfAkaoUvFYor9oqdXgPCMO1WES0ZnH+qDTPxk=;
  b=aEY71oMW8P50ywDqzB9Vg1lKeIMjrRCzWB1k8EgC1Nx6q4hdB/esB5LY
   qnHkxr7a2aBCaPjEowXP4oJVqxqbwo3tYKkXos489NQF72qd62CFeXIfg
   7ul0PnCg8rbqzzRWwLtIqByMc4uq/Lv98LGkT5FgCKHCtxzOm2f+NHQ0n
   mcpteMM3UY/pODjRnuKojOs1cta7vOiovT9GqF4e1PuH+z9COjQJl25c1
   XcvyILtD02lzfpL7MvBeBAqRC3MaGs8tUHLauiWeWzvAHmfTwNanEfazw
   ZzFkxlsJyarhBfNT9PgXurGAW68oB+SGsPYYVsbX2wvpzAGvmVJZINg+/
   Q==;
X-CSE-ConnectionGUID: C/QoECbtSa2yQiLO/e3ImQ==
X-CSE-MsgGUID: sByAzvn1QFmsaGyNrtPbZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85549584"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85549584"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 22:54:02 -0700
X-CSE-ConnectionGUID: ALiZczb0S/W3xBNmG9F17A==
X-CSE-MsgGUID: aRewrqC9SISR1w+X2oTSGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="224140347"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2026 22:54:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 28C6A95; Mon, 23 Mar 2026 06:53:59 +0100 (CET)
Date: Mon, 23 Mar 2026 06:53:59 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv3] thunderbolt: use kzalloc_flex
Message-ID: <20260323055359.GV2275908@black.igk.intel.com>
References: <20260318185237.4742-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260318185237.4742-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-35301-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C29EC2ECBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 11:52:37AM -0700, Rosen Penev wrote:
> Simplifies allocation by using a flexible arraay member.
> 
> Added __counted_by for extra runtime analysis.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to thunderbolt.git/next, thanks!

