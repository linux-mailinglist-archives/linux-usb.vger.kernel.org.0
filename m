Return-Path: <linux-usb+bounces-38241-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAUyEm1pHWrqaAkAu9opvQ
	(envelope-from <linux-usb+bounces-38241-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:13:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B738D61E294
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 13:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AC2830094D0
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 11:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B706A39D6EE;
	Mon,  1 Jun 2026 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsZUqzpN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139083191C8;
	Mon,  1 Jun 2026 11:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312368; cv=none; b=dmg9Ox/77Y6FaCLYvtevlu6ByptrxSGxab1TaocyTL4H61ZcaqwJ4QAYYuEKnRyumVNP9nLk5/PubXA/B6twWxZxWRNGslqRh9Cw0ADd1sT0/9/SyUe+nwyILCw1NKeypt6yxKoMdfEn0qA4/FBETyoehga4Fyyzp689ck45ABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312368; c=relaxed/simple;
	bh=aS6HEGadJlmHWKF99CfKJiyf4k3tc0Rr4PCVRz04dl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEeMYaHlw3R7Dbokj6nfEwd3ZP6hZGFmf7YMaITb7Jurx2C+EYD6rjyzWpdWewOCe4zx3O5M/zQy5mCWFdg07dJ6SrBYZOKJJjYsidCpvbmw8g7k1mHiA0LLz155IIZ8+RBYqCIpGNYfJawpJvAnRdiAXPGCFbQkiCowcKWxAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsZUqzpN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780312367; x=1811848367;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aS6HEGadJlmHWKF99CfKJiyf4k3tc0Rr4PCVRz04dl0=;
  b=IsZUqzpN7UatlZoo2ezP3CnvIPLTTA999+GE9IIrX1eLSBGQm5HZk62P
   nhXC678J718mSkNlxKRTN2xUqRxxc8LnBH7m2LlUDzX0F5UYBlG2J8Qv5
   yYWHnckkQw4qQY496RZgFW+6WtP/YwtTmysF3zcN/VdlvhLMgjw/KbMcx
   ggOTXP+D6t8+Vh9fH9SrLGyDB6sdm4CbuL5nhHFyfiF9qC/UDg7HGRIoH
   nomzvLuIFEwX9EKD2eESOBCrmDxPk7rqtCDUpMz0v4OL3LSlGCeyR+hKX
   ErDWRwfkBEngYZdkRD7sYUTwS4s6PAU4Eax/E7k4RyVPdUH2INQZw7+Y0
   w==;
X-CSE-ConnectionGUID: wMTwrPA9R3mIWDAvsvqbmg==
X-CSE-MsgGUID: 2qKST0a8Qtinn0RPtXijKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92542496"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="92542496"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:12:46 -0700
X-CSE-ConnectionGUID: mgglzSuLRmK173AAl/Xnkw==
X-CSE-MsgGUID: Eq8isNfNQD6usj3Q1QfUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243644753"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.110]) ([10.245.245.110])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 04:12:45 -0700
Message-ID: <e5970217-f6a1-4fd9-bf19-bae0ccba6fd2@linux.intel.com>
Date: Mon, 1 Jun 2026 14:12:42 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: Remove isochronous URB_SHORT_NOT_OK handling
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260529111151.17375c5d.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260529111151.17375c5d.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38241-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,linux.intel.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B738D61E294
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/29/26 12:11, Michal Pecio wrote:
> This URB flag was never supposed to have any effect on isoc endpoints.
> 
> No kernel code uses the flag except usb_sg_init(), on non-isoc only.
> USBFS can't use it on isoc because proc_do_submiturb() rejects it.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Added, Thanks

-Mathias

