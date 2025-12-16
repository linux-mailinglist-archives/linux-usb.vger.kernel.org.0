Return-Path: <linux-usb+bounces-31479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADEBCC2914
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 13:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B559330047C4
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 12:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CF43659F7;
	Tue, 16 Dec 2025 12:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfBEC64Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FD42BD5A2
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887125; cv=none; b=l8E/UDsktJ3Dk32+7zIU2IAODMLm+hpQj9UWtebh/g8iMHSuE+8BwXfssJWMi0EVhFBzv+jCBbdxfAM9ti/HaAuPZhqkvDFWcmKJm7RuenWiDDL9SHw+Ev68qARnppw903WRhK4DvfUyc5eAFAFe15eF20CiKmG4OGQNuL0UGiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887125; c=relaxed/simple;
	bh=apkkbnr2tek6VDxI/TZRaqZaPZZtEKfasKT2589AL34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCHVHH7uCVrxJgTQ0pBOZ5PP0AtLHxAAUKNLgD67KzV9x0PWIWoHBJ0s7yL/q8/zDDcDB/VcN16o0OkqddImasT6w5B4Wn/Jukod60QFoMVnQJ4aeXyTRHlo+HqKiuIhWE8JDQmVNZb/yapMEaZ0VXylDPw381CIkH6sy+PKHIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GfBEC64Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765887124; x=1797423124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=apkkbnr2tek6VDxI/TZRaqZaPZZtEKfasKT2589AL34=;
  b=GfBEC64QAUEmTCVvr1OCEW6krTeLZjwt7/d2m/TznfIU61duCPxheA/K
   v3deRZ7QG7FL6Q/TY9mv3rzjDvMmly6+A1ITX1HPl4mzh+FM7sOipts5z
   boGfBx0j3EHIyLsjDW+x7pilaAytnXQCcfEHxT+nn00TxfgXoeyh/AbMM
   i+pObl0i4vLPs9NDFx740ITIN3sR1oN9m0NrI/Qfiin1cWbpU/L1dsSrr
   WCI2Wr+9jCShFE283SVSuL6XsLTZJxD7kOqRflpKBfPXqjqUuy5ZdhQ4C
   bH0fL2iz6Djykdvqp4sxP8HYCzyGQpLgajSIjWBEOhdRjIa/6ufZ9MLIg
   A==;
X-CSE-ConnectionGUID: pg84/rK2QSOHgxKW/BJI+g==
X-CSE-MsgGUID: 65nfDHMnRRmNn575w4e0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67839138"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67839138"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 04:12:03 -0800
X-CSE-ConnectionGUID: dOLbNb95St6fUv70O1K25g==
X-CSE-MsgGUID: FzheRqAqSfKIVTXqCmUBaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197745941"
Received: from sramkris-mobl1.amr.corp.intel.com (HELO kuha) ([10.124.223.55])
  by orviesa009.jf.intel.com with SMTP; 16 Dec 2025 04:12:00 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 16 Dec 2025 14:11:47 +0200
Date: Tue, 16 Dec 2025 14:11:47 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: mario.limonciello@amd.com, gregkh@linuxfoundation.org, lumag@kernel.org,
	ukaszb@chromium.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix null pointer dereference in
 ucsi_sync_control_common
Message-ID: <aUFMg-3DZ4MZZqHJ@kuha>
References: <20251214183729.150811-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214183729.150811-1-superm1@kernel.org>

Sun, Dec 14, 2025 at 12:36:41PM -0600, Mario Limonciello (AMD) kirjoitti:
> Add missing null check for cci parameter before dereferencing it in
> ucsi_sync_control_common(). The function can be called with cci=NULL
> from ucsi_acknowledge(), which leads to a null pointer dereference
> when accessing *cci in the condition check.
> 
> The crash occurs because the code checks if cci is not null before
> calling ucsi->ops->read_cci(ucsi, cci), but then immediately
> dereferences cci without a null check in the following condition:
> (*cci & UCSI_CCI_COMMAND_COMPLETE).
> 
> KASAN trace:
>   KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>   RIP: 0010:ucsi_sync_control_common+0x2ae/0x4e0 [typec_ucsi]
> 
> Fixes: 667ecac55861 ("usb: typec: ucsi: return CCI and message from sync_control callback")
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

I guess you need the CC stable tag.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 9b3df776137a1..7129973f19e7e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -97,7 +97,7 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
>  	if (!ret && cci)
>  		ret = ucsi->ops->read_cci(ucsi, cci);
>  
> -	if (!ret && ucsi->message_in_size > 0 &&
> +	if (!ret && cci && ucsi->message_in_size > 0 &&
>  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
>  		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
>  						 ucsi->message_in_size);
> -- 
> 2.43.0

-- 
heikki

