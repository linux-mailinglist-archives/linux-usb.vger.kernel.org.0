Return-Path: <linux-usb+bounces-21074-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7157CA45B09
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 11:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A8D93A8768
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 10:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0FD23815A;
	Wed, 26 Feb 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS6Ezwjw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63B514A62A
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 10:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564047; cv=none; b=rLDxkWG7KDYk/NVRIHatuJ7sPSklzElLTFQ4gNQLyX9CF0aN5FMZaolSwB9Wpkjo7BwiOVSkaW+hQjaLtnKpU7Pb8//6VYLlZ3Wv7CV26/sbGGjzvC6AcXAdNg0RkFqB1faa/COE1NrIvofkg1kZprkHrAe00UhhUiYm12xR1vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564047; c=relaxed/simple;
	bh=wadn9SA6kUAB/t9IKIPzS6MgMHFIJkwt+9yQMGqfkxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv2IevSQGA1mcsXXXrpc74lXQeFBQgyqnbLfTxYBFZcEAEZoszIxvlMl/A3r7GTilnPFrrsF9yfRb8EZ4ye6C0E5mjKJTuYCpXWxHlbXPmz34WnnA7xaunMWvXVCEWTFqWPlAyD40m9NLY6ZmICMaN2KHIK1l/xtyKt4y5ltbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS6Ezwjw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740564046; x=1772100046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wadn9SA6kUAB/t9IKIPzS6MgMHFIJkwt+9yQMGqfkxM=;
  b=WS6Ezwjw8LzFdPlrQ33O3K8q0DRiaPygIAtE91DPlnSGhyj3fN37gXKY
   Ns17xuifw7VZh1FS/btJyA9IV1N8twEoWaWzPQaxvmRKNHpCONpE0qrqf
   SezQVM2b0k8D/IQxitmK1C5KML/OxhEhpRjwbFFU63K+rBwKlyxSkBezY
   UEhRpVsKxKBGyr/+f92IiQH+UkxMrZ9nfkho1ty7jiI3fPaDX+BE3J/yf
   iYmS7oc5HTqjkRXL2eNU3AWTm1GAY5r26SekyFgdRprDqpcfBbWTJAlhc
   ZliykBUQpeK9nxvAZlnToo6pS0/ftS2GkG0TME7jzQajBxgIPEx6h4nnB
   g==;
X-CSE-ConnectionGUID: 7tYcXcWcQBaNZIsRUVlJ/A==
X-CSE-MsgGUID: bSXsZnshQju7AdhGLpZevQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41104015"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41104015"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:00:45 -0800
X-CSE-ConnectionGUID: YQr27o3RS0Om7yfOWzIV0g==
X-CSE-MsgGUID: RQm1zmQ+RFuH4hAJgN93Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120770708"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 26 Feb 2025 02:00:42 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Feb 2025 12:00:41 +0200
Date: Wed, 26 Feb 2025 12:00:41 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, gregkh@linuxfoundation.org, ajayg@nvidia.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] ucsi_ccg: Don't show failed to get FW build
 information error
Message-ID: <Z77mSfPDQptt5yrL@kuha.fi.intel.com>
References: <20250221054137.1631765-1-superm1@kernel.org>
 <20250221054137.1631765-2-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221054137.1631765-2-superm1@kernel.org>

On Thu, Feb 20, 2025 at 11:40:03PM -0600, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The error `failed to get FW build information` is added for what looks
> to be for misdetection of the device property firmware-name.
> 
> If the property is missing (such as on non-nvidia HW) this error shows up.
> Move the error into the scope of the property parser for "firmware-name"
> to avoid showing errors on systems without the firmware-name property.
> 
> Fixes: 5c9ae5a87573d ("usb: typec: ucsi: ccg: add firmware flashing support")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 740171f24ef9f..663aca9421410 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1432,11 +1432,10 @@ static int ucsi_ccg_probe(struct i2c_client *client)
>  			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
>  		else if (!strcmp(fw_name, "nvidia,gpu"))
>  			uc->fw_build = CCG_FW_BUILD_NVIDIA;
> +		if (!uc->fw_build)
> +			dev_err(uc->dev, "failed to get FW build information\n");
>  	}
>  
> -	if (!uc->fw_build)
> -		dev_err(uc->dev, "failed to get FW build information\n");
> -
>  	/* reset ccg device and initialize ucsi */
>  	status = ucsi_ccg_init(uc);
>  	if (status < 0) {
> -- 
> 2.43.0

-- 
heikki

