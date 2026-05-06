Return-Path: <linux-usb+bounces-37004-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIXoI7MN+2kuVwMAu9opvQ
	(envelope-from <linux-usb+bounces-37004-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 11:45:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 080554D8D59
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 11:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 136FF309D38B
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 09:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7253E92AD;
	Wed,  6 May 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwaZOiSM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3393E3C45;
	Wed,  6 May 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060405; cv=none; b=ColjbbJTqTkIWF9Bcq4XOC1NfUj1ec2X8OAO6hthJl/gTiQ+6iwFTEX7CK/7SRbIeFUgsygbckhmMNF7HIcHd5lWeOs9dpyI6O1Occ3Ck5E4AxnF+E/GfMO97deMxhNr4HyuUX4h8KeegmCmt7gqOfmNWt8T4GnnHT/ujHyE5aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060405; c=relaxed/simple;
	bh=qmjYHGZXtiYUtQtV14Rvb+sQ5RX2t6MVyg4wbNNzAnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHCCYnwtLTyQe95jhBbYxecQwO271/WGfSQIvHGtvmVJd4D0hSeJMccddhJX/N8ig1B+rHIc2GA9V3dlw3Xg9W2lu3+g8tg/9ipwiRIEkNjqMjO3sXCEy0cHH1Fa9umTKrC/LaCkRsgrZSc2y5S/DA8qBj7CKqnnIgo19wzMBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwaZOiSM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778060403; x=1809596403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qmjYHGZXtiYUtQtV14Rvb+sQ5RX2t6MVyg4wbNNzAnY=;
  b=cwaZOiSMxOu9/yXQaji5SHDr14fh6OsRmOTPoaGXKUCh6IHfFlL/OvQ/
   JQXMqSDl3ztTwASb4LYOTgaTimlwesx5Zby1tjQeJeGJNYhahChUeWj90
   HVgr7IHsFj7yRoqHuJcvrTr2Jk+X+OANivvvBIDsq2+hZmcrjGsNEaa0H
   3KsU87w0udlU8gVIJy9u0V3qhq6FOi4PX7YQTJsYpMGDJ9Xvbyi9fA+6e
   UNto3RZSdHeu/xVqdyo3SV3pxcd9ZFn1cAwkoGpMfyE/sYTTMHMUr/kyQ
   S5zXTiwMCUF2Vi6/THHyspdq4BGeKroe3npKW74MFxn81Nbx/s3ZC5oiH
   A==;
X-CSE-ConnectionGUID: V7FIkSteTlSngZjCKb3Yiw==
X-CSE-MsgGUID: Gw2bLFQgSqeCxQ8MS0HVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78875562"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="78875562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 02:40:03 -0700
X-CSE-ConnectionGUID: BZvwe19/RBGv8e+twRE6WQ==
X-CSE-MsgGUID: wj1vVCwCQq+amL1x7Gp8ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="237904989"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2026 02:40:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5273595; Wed, 06 May 2026 11:39:59 +0200 (CEST)
Date: Wed, 6 May 2026 12:39:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	"kernelci.org bot" <bot@kernelci.org>
Subject: Re: [PATCH] usb: typec: intel_pmc_mux: Zero initialize num_ports in
 pmc_usb_probe()
Message-ID: <afsMbeGfk5EHxFHV@kuha>
References: <20260506-typec-intel_pmc_mux-fix-uninit-num_ports-v1-1-929b128a32e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506-typec-intel_pmc_mux-fix-uninit-num_ports-v1-1-929b128a32e9@kernel.org>
X-Rspamd-Queue-Id: 080554D8D59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,kernelci.org];
	TAGGED_FROM(0.00)[bounces-37004-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kernelci.org:url,kernelci.org:email]

On Wed, May 06, 2026 at 02:05:54PM +0800, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
>     740 |                 num_ports++;
>         |                 ^~~~~~~~~
> 
> This should have been initialized to zero. Do so now to clean up the
> warning and ensure num_ports does not use uninitialized memory.
> 
> Fixes: 8bdb0b3830ea ("usb: typec: intel_pmc_mux: combine kzalloc + kcalloc")
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://lore.kernel.org/177793914437.2560.9287713196857718000@997d03828cfd/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index e22b070a140f..219a32da1348 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -732,7 +732,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
>  {
>  	struct fwnode_handle *fwnode = NULL;
>  	struct pmc_usb *pmc;
> -	u8 num_ports;
> +	u8 num_ports = 0;
>  	int i = 0;
>  	int ret;
>  

thanks,

-- 
heikki

