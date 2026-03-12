Return-Path: <linux-usb+bounces-34663-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLFRNC6EsmkeNQAAu9opvQ
	(envelope-from <linux-usb+bounces-34663-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:15:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F626F719
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 10:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93FA530D478B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7F83AC0C6;
	Thu, 12 Mar 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/pnx3/j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA626332EC8;
	Thu, 12 Mar 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306790; cv=none; b=YjonSnREvtPLJ7Nd1SHLJCkOt/4YZj4rb7JfrZC28u3rS3z8FlqPLE3OrS03Q6hM23tPLPHkNYsKl35t20tZfXZ41smvTLS3jz5xHgPP3ENiEMkObi3hnYAVqykmxFFPAEyq6MyQ3pWTFkh0nJ5wtaHYSTZ4gDV6C/DRZZ5s+2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306790; c=relaxed/simple;
	bh=dhoSPpvme1yC+0znu1FvG/g5nERL311+M9W3z6P8Two=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNsDI4lXBfqWXISrwswBW7Kh2ZECaEYZgNio0dTSc26sQuK1fnhCxAgwB9k9ZGSxlqX+Bxkc8AwEEXw0QM4BLPvJVAwHD9Op4dOhkSqJR2GovIzotSUsxPgK33x411EpI1WO6HI5Z6B0m6BbM5WlSDA3A7SAxOo601M+9g93nsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/pnx3/j; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773306788; x=1804842788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dhoSPpvme1yC+0znu1FvG/g5nERL311+M9W3z6P8Two=;
  b=W/pnx3/j0Wy2LatQKv7nvWa2+MVvyXD92f+/L+qAhFusAkUNm7PXiAhi
   I++TQD5Y3/wzBJDvgtYxMQjpYNtDI8Hdr2TKHd0t3dJ3qXv8fYb8M+CbC
   medA6uaBP5WPxoqJqQufw7MwglbsMAjKPwf+7CO1NrXc751pji4dpNem1
   +3esIat32S0aB4PNuhFEqAum0M25q+Cnk2Phr8anC+hoUGp6SibvJLH8E
   YEcaPxKvelXMTHAJmxlJa9MkdSt442/NUmo8he82X+S6MV7aGowk1eFW7
   xJB+bxvpRhzIglVCiEzaQDJSP2JNMnK9mu1xt4K5040ANnt2+JHavIMu6
   g==;
X-CSE-ConnectionGUID: FoHqTbgcRiORLFQEUOx4lg==
X-CSE-MsgGUID: jrzM4yinRUWIFLWKmLUbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="77994944"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="77994944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 02:13:08 -0700
X-CSE-ConnectionGUID: q1FRX1CHQgGatLcLsKc20Q==
X-CSE-MsgGUID: cX/lR53bSHSl9gcxH0+q+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220815742"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2026 02:13:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8E8F195; Thu, 12 Mar 2026 10:13:05 +0100 (CET)
Date: Thu, 12 Mar 2026 11:12:24 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Aldo Conte <aldocontelk@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: Document priority and mode_selection fields
 in struct typec_altmode
Message-ID: <abKDeL-1bd_fJsDT@kuha>
References: <20260311163320.61534-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311163320.61534-1-aldocontelk@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34663-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E45F626F719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wed, Mar 11, 2026 at 05:33:20PM +0100, Aldo Conte kirjoitti:
> The fields 'priority' and 'mode_selection' in struct typec_altmode are
> missing from the kernel-doc comment, which results in warnings when
> building the documentation with 'make htmldocs'.
> 
> WARNING: ./include/linux/usb/typec_altmode.h:44 struct member 'priority' not described in 'typec_altmode'
> WARNING: ./include/linux/usb/typec_altmode.h:44 struct member 'mode_selection' not described in 'typec_altmode'
> 
> Document both fields to keep the kernel-doc comment aligned with the
> structure definition.
> 
> Signed-off-by: Aldo Conte <aldocontelk@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  include/linux/usb/typec_altmode.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index 0513d333b797..b90cc5cfff8d 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -26,6 +26,9 @@ struct typec_altmode_ops;
>   * @mode: Index of the Mode
>   * @vdo: VDO returned by Discover Modes USB PD command
>   * @active: Tells has the mode been entered or not
> + * @priority: Priority used by the automatic alternate mode selection process
> + * @mode_selection: Whether entry to this alternate mode is managed by the
> + * automatic alternate mode selection process or by the specific driver
>   * @desc: Optional human readable description of the mode
>   * @ops: Operations vector from the driver
>   * @cable_ops: Cable operations vector from the driver.
> -- 
> 2.53.0

-- 
heikki

