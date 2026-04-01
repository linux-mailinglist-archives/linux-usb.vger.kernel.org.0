Return-Path: <linux-usb+bounces-35776-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0G+gGmkBzWmSZQYAu9opvQ
	(envelope-from <linux-usb+bounces-35776-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:28:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5523796D1
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B04F3079A66
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 11:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702673C7DE5;
	Wed,  1 Apr 2026 11:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXSG/YiH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D56436897F;
	Wed,  1 Apr 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041742; cv=none; b=L+0bWwROrPAokveLkczBIGeATkjh2NifF7iBvw6swsOW0nfX1GL8gVBbuODrAkbUM53l77OnqgjD6xNr6FOL4zjDrZ38wNpwNu1CK/jbkUeqUs/rlQSPmMiaZeZDdDd/51iyTva6hvyhAr7AVFFzl+AcOD98I5eRXRwYVk/DbKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041742; c=relaxed/simple;
	bh=Zxi+Ax8a1EFVtCv3R8GcG1vgZHfp9YtzaQh1YjP/3KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIDxiSGauH1H+iG3nKSn0cC71/1OsA5r/NXXLswhDtjUqg/TVK/OliyQ+ybfDflnbXCu4O1iestXdSpUNJSdaGOTey/2DgrbAIkyZlnbEdpFJX6TUG+noXWsgkrVceyu+3SGKiQDMM3hv6QhTzliAvJkaB0Wn+CgCzFJ5DCt6nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXSG/YiH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775041741; x=1806577741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zxi+Ax8a1EFVtCv3R8GcG1vgZHfp9YtzaQh1YjP/3KE=;
  b=NXSG/YiHYAB2xkPMgYYdZJ71CcJ8V8GBRWB+UE0XkXcgQlaHJrWgjO6g
   HmFoMBliMiEcy7uVwJl57MXZNpcSMaLufrBwLaU4PqTBv0H11AmyD6y8w
   jCCIGbYoh3sHp8+59crqWomdHtfynypCQpLQExG4uLq6BKEL2LBOZABTx
   N8rrxlANdPpfFcA/GEX9CzxR4/sgQFm3aP5n5ULicrYHPYg1h4500Nn7Z
   OmwAvke1L10HJwO1Iv4XMbpucwSmoqz34uqFz8zQALl0IDjnYcvPRI7fi
   w4QOFealovdg4xDP2XT6xNJvVhd4f/lSQCoNS/sQhsA/GMIpGrqKIxH52
   g==;
X-CSE-ConnectionGUID: BI9UrpwURxO4+G7LUZe55Q==
X-CSE-MsgGUID: m0OHGU69TLyjL/1yhjUEtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79930870"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79930870"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:09:00 -0700
X-CSE-ConnectionGUID: m6P+EwcBT0CN1EKk/rbGmw==
X-CSE-MsgGUID: QldhNkYSQumcxyP2VWiw4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="228260147"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2026 04:08:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D244A98; Wed, 01 Apr 2026 13:08:56 +0200 (CEST)
Date: Wed, 1 Apr 2026 13:08:56 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: tunnel: simplify allocation
Message-ID: <20260401110856.GS3552@black.igk.intel.com>
References: <20260330211014.12121-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330211014.12121-1-rosenp@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-35776-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F5523796D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 02:10:14PM -0700, Rosen Penev wrote:
> +++ b/drivers/thunderbolt/tunnel.h
> @@ -75,7 +75,6 @@ struct tb_tunnel {
>  	struct tb *tb;
>  	struct tb_port *src_port;
>  	struct tb_port *dst_port;
> -	struct tb_path **paths;
>  	size_t npaths;
>  	int (*pre_activate)(struct tb_tunnel *tunnel);
>  	int (*activate)(struct tb_tunnel *tunnel, bool activate);
> @@ -107,6 +106,8 @@ struct tb_tunnel {
>  	struct delayed_work dprx_work;
>  	void (*callback)(struct tb_tunnel *tunnel, void *data);
>  	void *callback_data;
> +
> +	struct tb_path *paths[] __counted_by(npaths);

Please move the kernel-doc to the right place as well.

