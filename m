Return-Path: <linux-usb+bounces-36523-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK2LCp4n72lE8AAAu9opvQ
	(envelope-from <linux-usb+bounces-36523-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:08:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3F46F938
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 351F1305FC33
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDEE3AEF4E;
	Mon, 27 Apr 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlfsAumQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D928E3AEF3E
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280564; cv=none; b=P7Ko3WAOATM/H+Db5zMab72lK13j/TDvYFtBIbCuuBsJej2ErfUFAmXhBS0DGq3+aD2LycvWjT7h191Q9L9U8MZr1cVaXXagZfP2z5qpCr71mgT85nvnhNwcWaBHGqBJB33X2aoEjb5YT1ffr594QP7ClJVGqM/n2Xe1C1XTtw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280564; c=relaxed/simple;
	bh=PmAR+tmIK07/4zBWgkasFU9pfx6OVs3M1n+LLHR1cOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKT+DOavRD1+1vCYCiuAMjndOWcHNxwaTWCZNVRUBSxoZLJ7vT1Q8rNpp2qUa65FKULZ4RtMwqG9aJnHGrc1XmodrHJ1YrNZVgOiu//NQrr0cllsyqsbwA1O1zKbb3FupAKX+K4bLOup0e685Iv5js7ETMnzZLJFAY+rMQvhfAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlfsAumQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777280563; x=1808816563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PmAR+tmIK07/4zBWgkasFU9pfx6OVs3M1n+LLHR1cOo=;
  b=ZlfsAumQjbJUKg9XUH1F7wiBrxzHpR3S8BTKeeoLM3SNqkiGTYFG9EwP
   ik9cjOoOJAjmS0D2IsPOCvNhXOYYwLzSlY0/1ssovfuwjPt9+JWuUfLbM
   i+OSYDQ7AC47cFJXfpmhuTD9MV6XJ1tTB9O1yOxZenYMS8RLzOpFsw1WO
   qqVfLXt1oOn8OQH7NCXyXUurfIHzaSPJw8d7dOWq3PRCKncEU6u/cpyQL
   jIs/mf0oaEnlWHLagt3aThhPSqzGVAHkE8gPEPVyadv1f7f2oZLrYKzSt
   Bfo38vTZSSvVUmh9pTxjW41IdrPQOjIayDJgM9KFWTZPDs62r269JpiN4
   A==;
X-CSE-ConnectionGUID: S7NtDh01Tm+ALfo1uHASHA==
X-CSE-MsgGUID: 6fNqSBhARh+UsgAAm60Ljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78222351"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78222351"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:02:42 -0700
X-CSE-ConnectionGUID: zdmIP4jZT4ShyJr2gNVaKA==
X-CSE-MsgGUID: 7TSKYifbQCy1XQZrsT+h6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="263990245"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 27 Apr 2026 02:02:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 7CFDD95; Mon, 27 Apr 2026 11:02:39 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:02:37 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Francesco Orro <ncesco@interstellar.eu>
Cc: linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7] usb: typec: ucsi: acpi: bootstrap PPM on systems with
 empty _DSM func 2
Message-ID: <ae8mLUvhpF4hIrum@kuha>
References: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
 <20260420172343.84456-1-ncesco@interstellar.eu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420172343.84456-1-ncesco@interstellar.eu>
X-Rspamd-Queue-Id: 7EF3F46F938
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36523-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]

Hi Francesco,

On Mon, Apr 20, 2026 at 07:23:41PM +0200, Francesco Orro wrote:
> On HP ZBook Fury G1i 16 inch (BIOS X96 01.03.04) the SSDT16 "UcsiAcpi"
> exposes a _DSM function 2 (READ) whose body is empty, so UCSI_VERSION
> stays 0x0000 after the read. ucsi_init() treats VERSION=0 as firmware
> absent and bails with -ENODEV, so /sys/class/typec is empty and no
> alt-mode info reaches userspace.
> 
> The PPM is alive: writing UCSI_PPM_RESET through _DSM function 1 (WRITE)
> drives RESET_COMPLETE in CCI. We can therefore bootstrap the PPM
> explicitly on probe when necessary and, once RESET_COMPLETE is observed,
> default VERSION to UCSI 1.2 - which matches the semantics advertised by
> the SSDT tables on this platform.
> 
> The bootstrap checks CCI first and returns early if RESET_COMPLETE is
> already set, to avoid resetting a PPM left in a stable state by
> firmware. Note that this early-return path was not exercised on the
> tested platform: on cold boot CCI did not have RESET_COMPLETE at probe
> time and the PPM_RESET was issued. Consequently, alt-mode state
> negotiated during BIOS POST (in this case a Thunderbolt dock's TBT
> alt-mode) was disrupted at boot. Linux UCSI core later calls
> ucsi_reset_ppm() in ucsi_init() regardless, so the PPM reset on probe
> is arguably not the root cause of the disruption, but the patch leaves
> the door open to avoid the early reset when firmware does leave the
> flag set.
> 
> Bootstrap failure is non-fatal: we log a warning and continue. If the
> PPM later reaches RESET_COMPLETE asynchronously, read_version() still
> recovers via the UCSI_CCI_RESET_COMPLETE check gated by the
> needs_bootstrap flag.
> 
> The behaviour is gated by DMI because unconditionally issuing a
> PPM_RESET on systems whose firmware _does_ populate VERSION correctly
> would be aggressive and unjustified. The DMI match starts with HP ZBook
> Fury G1i 16 inch; other vendors/models can be added as they are
> confirmed.
> 
> Tested on HP ZBook Fury G1i 16 inch Mobile Workstation PC with kernel
> 6.19.13. Before the patch ucsi_acpi probe returns -ENODEV; after the
> patch /sys/class/typec/port{0,1,2} appear with partner altmodes
> exposed when a USB4/TBT device is connected.
> 
> Signed-off-by: Francesco Orro <ncesco@interstellar.eu>
> ---
> Resending: previous send was mangled by quoted-printable encoding.
> No content changes.

Where did you send it? Or do you mean the patch you attached to the
cover-letter? I also can't find v1, v2, v3, v4, v5 or v6 anywhere, so
where did you send them?

In any case, you need to start by reporting these issues to HP.

The version field must return the actual ucsi version, so that really
needs to be fixed this platform. Guessing the version is a really
fragile solution.

In the UCSI specification the behaviour from PPM_RESET is a bit vague
in deed. However, the specification, starting from at least UCSI
1.2, does make a note that the connectors need to be reset separately.
So the connection states of the connectors should not be affected by
PPM_RESET.

thanks,

-- 
heikki

