Return-Path: <linux-usb+bounces-37592-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLSgDrnsCmo89gQAu9opvQ
	(envelope-from <linux-usb+bounces-37592-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:40:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B356AD91
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 12:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27732300337F
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 10:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E5C3EFFA0;
	Mon, 18 May 2026 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b52Rn+GH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE65306486;
	Mon, 18 May 2026 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100737; cv=none; b=lVR4MVWebebnP35tSYBspJ/L0D2a6k2grYQCCUjL9MXxATAy/m50JfaG8cBiFwVYCeOPdUxkxUq4oVeZh+rcHW4KCQzfUQTNx+6HuE9X81ptGdlvCbzaP/IsoIh52PFguo31uMuMZHeLZCVeJ3CvkXC/Ht97GWcfvK/nqmbtWoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100737; c=relaxed/simple;
	bh=0UNNYewqIPRFKkkCZX+Z07VT/BlNZ2s7OtTzTVSd2/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0YbRvTF4SKwmS8BaeiXJUjh4cIF5WSH5c+s5lwEAGgiPSsNWCJSmWk0c9yx2Aqfx7o2WIp/smMO5f/AuFJWuoU+5b5olLuBfjHZGK8uyLZBYszi7ejHQmnnDNlo7xVh4B/cYvEbyHnIld6FDujRMW2hx72HaVyV2DhmLu5wKUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b52Rn+GH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779100726; x=1810636726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0UNNYewqIPRFKkkCZX+Z07VT/BlNZ2s7OtTzTVSd2/U=;
  b=b52Rn+GHNzgxuq/y0W9yKmn+pqzAFIVf2KnjAmeMr4I5Yupoxt2RDqTa
   lIYgsMZYyemCCL+tJ7DllbyDXApvwTW6qjdm5AwnFjAGgbAHflsxHL3mZ
   OLB5HQ+VWAr3qoXoJ8ENbZv10ffkIJKyXdBbgpAcnHKq4ujKukDlrhhtO
   VIfmyp9g2tjI2KC7qWx8pr/khAlHCBGAkGwpj3QxYhZkPC2NnAQS2w3w7
   a+XyXJ+XuC3KDVvGC5XokXRpBKx7T4mLj28DOI6xi/aPIFo6qT9eG0X1R
   zmkMnV/WYq37Wj3RTK0i0f/iyfcJ9PVwr4bewEzGt7AcU9c8qxIhNfyIZ
   A==;
X-CSE-ConnectionGUID: hUqr7kt5TKmGDyTWwXwxhA==
X-CSE-MsgGUID: YrO8bhLrTyilkVsC4RoZCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="91409119"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="91409119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 03:38:41 -0700
X-CSE-ConnectionGUID: zs2QZ6SMQKGI4OTcY3H+rA==
X-CSE-MsgGUID: TbC8zOYeQQGoa4/eZ5SA0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="236383284"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 18 May 2026 03:38:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id AD0C695; Mon, 18 May 2026 12:38:38 +0200 (CEST)
Date: Mon, 18 May 2026 13:38:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH] usb: typec: ucsi: ccg: reject firmware images without a
 ':' record header
Message-ID: <agrsLHAGds_cXDrR@kuha>
References: <2026051405-posture-shrill-7884@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051405-posture-shrill-7884@gregkh>
X-Rspamd-Queue-Id: EE7B356AD91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37592-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:email,intel.com:email,intel.com:dkim]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 07:10:06PM +0200, Greg Kroah-Hartman wrote:
> do_flash() locates the first .cyacd record with
> 
> 	p = strnchr(fw->data, fw->size, ':');
> 	while (p < eof) {
> 		s = strnchr(p + 1, eof - p - 1, ':');
> 		...
> 	}
> 
> If the firmware image contains no ':' byte,  strnchr() returns NULL.
> NULL compares less than the valid kernel pointer eof, so the loop body
> runs and strnchr() is called with p + 1 == (void *)1 and a length of
> roughly (unsigned long)eof, causing a wonderful crash.
> 
> The not_signed_fw fallthrough earlier in do_flash() and the chip-state
> branches in ccg_fw_update_needed() allow an unsigned blob to reach this
> loop, so a root user who can place a crafted file under /lib/firmware
> and write the do_flash sysfs attribute can trigger the oops.
> 
> Bail out with -EINVAL when the initial strnchr() returns NULL.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 199799b319c2..4463c1ae96bd 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1243,6 +1243,11 @@ static int do_flash(struct ucsi_ccg *uc, enum enum_flash_mode mode)
>  	 *****************************************************************/
>  
>  	p = strnchr(fw->data, fw->size, ':');
> +	if (!p) {
> +		dev_err(dev, "Bad FW format: no ':' record header found\n");
> +		err = -EINVAL;
> +		goto release_mem;
> +	}
>  	while (p < eof) {
>  		s = strnchr(p + 1, eof - p - 1, ':');
>  
> -- 
> 2.54.0

-- 
heikki

