Return-Path: <linux-usb+bounces-33852-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MAmD8YzpWmh5gUAu9opvQ
	(envelope-from <linux-usb+bounces-33852-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 07:52:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2DF1D3954
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 07:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60A32301453E
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 06:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966EC201004;
	Mon,  2 Mar 2026 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsgcxYwP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D528A3F8
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 06:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772434369; cv=none; b=TMRaC4ypfvN0KxZN1iVmkDJe9YFutwwzaMEHONHaYdQIYTKHLZnMGRcVycCQ5kLFYHi2YhLCr4WSMETgXD4bVO4HZXo84Rq8sfQTVf+SNmVOah0ECXACgG47PYCEyS28/BcYEPNyUY2mz2kLDHhJ5EG7BGK7PpP/W6lmEWZqMkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772434369; c=relaxed/simple;
	bh=rHSR9gbxokeoyscznea6Qrh6DR4kbRFA2bSwojaSrdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFNmHlV2yW0VaTmFBfmGCIOpEgn2HUsRVTLcxEK0BurmDc5lTGcEcZyzTlhp7DSnfxxDsKRESQrp+oBfvSMxI6bQtdg7bMaxOd5r10MdpARbq2FGyDl83C8LQevN1lRv/EkbK8Tah3plLDY/N+yabU3zOkJyoWF7wQ8SiAkUHKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsgcxYwP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772434368; x=1803970368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHSR9gbxokeoyscznea6Qrh6DR4kbRFA2bSwojaSrdU=;
  b=LsgcxYwPWHX4YOwbDU3UWmnyACd3rgx/GCVMB2ATM/YvcMmH7K02Oi6/
   32CtHTeeh4XXs/fsu1sWfzGokX7PUHNmnEN0BeC5PIO7iq1BgLcVWv3ki
   hv8/xyZy+v8Kg7IDli8lTdiELeCqj+RbLTfHED/K4CMiWOVvuFsCtsGCx
   FHadpjvFBxcV8gga7k0lQCSaMLHbUtwCuSaemZzPEVWTK0xuAYO4iF4hZ
   AW8fp+Dw5o07FRLavDVoWQ3TQ2VsaBX0KS3gdZmMLTqE3mSQ/Md/2DWW4
   MnzHg3hD5H3RR7T9RlXjP9unDtjQUSN8bln4NojR5CZlHTI1IJQfJEw/c
   A==;
X-CSE-ConnectionGUID: xapxqBYIT8yrvbjZrDY+AA==
X-CSE-MsgGUID: jwVP0O15S4SR5RP1snAHWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73544985"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73544985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 22:52:48 -0800
X-CSE-ConnectionGUID: LLXlVoTDTAOyplIOI6JNKQ==
X-CSE-MsgGUID: 4Y0WDYVlSuSEuwPx8Tbekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="215235736"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 01 Mar 2026 22:52:46 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A923195; Mon, 02 Mar 2026 07:52:44 +0100 (CET)
Date: Mon, 2 Mar 2026 07:52:44 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>
Subject: Re: [PATCH 0/2] thunderbolt: Disable CL states on older Titan Ridge
 firmware
Message-ID: <20260302065244.GP2275908@black.igk.intel.com>
References: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-33852-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: AE2DF1D3954
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 08:01:48AM +0100, Mika Westerberg wrote:
> Hi,
> 
> There is known issue on Titan Ridge with older firmware that makes the link
> unstable if CL states are enabled. This series adds a quirk that disables
> them for older NVM firmware.
> 
> Rene Sapiens (2):
>   thunderbolt: Read router NVM version before applying quirks
>   thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware

Applied to thunderbolt.git/next.

