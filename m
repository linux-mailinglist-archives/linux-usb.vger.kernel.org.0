Return-Path: <linux-usb+bounces-21075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0D4A45B19
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 11:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE34D18865F9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 10:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9B423815F;
	Wed, 26 Feb 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZC6Rg2lg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE42258CE0
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 10:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740564094; cv=none; b=PR4KRy7l/wfCWbaxi1PS12D1huv0oeuLJiP8soNMhJnYzBOSz+QAN0kKzbQqkgd+QMlBxAY4jD1Uo2AE3iYDmyrC837fxi5AiyQIGmQfzwYjf8uGsY4QQGbPgefGSZVsYtcM2mhvyjvHGFFHgCXNAc91tO3fH1JgQ4X3YV5t/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740564094; c=relaxed/simple;
	bh=VwAh2NeObfIW+ZJ2BjdYgktAF/MTNbM7sbrHybQovbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGNAxp10Z887sg202a/vXsYyAgiudS5JfbdG3rtk4OaApi+Vz+dP7CTGIJ0DTx0QRr1r146/5okgpzcoMG01gii5+Ixpuq8uXrGtj3RVexBCKBzwceylvSwoqXoirBfsvK5nMZEhJmSO3ZwSxFaU5ZrgKfpeuibYQn2tk+nddc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZC6Rg2lg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740564093; x=1772100093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VwAh2NeObfIW+ZJ2BjdYgktAF/MTNbM7sbrHybQovbM=;
  b=ZC6Rg2lgz6Qg+MlZIHi7rufDDLwJ21ZeusoZemx2YaiSF+3SuI+gI9bw
   uRMt9JsCSwvrpyY2hiulP412j0fuEFnFJUV2nj9Ufs9ZAVY7pRL3P7W8Y
   Lf8hG3oIOlkbCpZvlHneYek0UP7vrchE6mURYFlRZsICZx//+ohBnbV2g
   Nb1EMTgsFAoHKqtwzY9k0dPrZA13al1ROI1iqfT/GydUjQsQTW26NVql9
   15yEEnsPPAa7w/OwTeMaK7FuXjNXfZPLFdi5BpYXSGCy3GcgVwqFIB7te
   O+ullBTlKsZbWESBRHn1ImgolVfDvpwGPcwZKAtvodLnsRzWo1pF66NUo
   Q==;
X-CSE-ConnectionGUID: mRH8TWtiScWLzi1+ov63xg==
X-CSE-MsgGUID: KP4fFuk7TL6rf7d5E7Y4Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41104136"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="41104136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 02:01:31 -0800
X-CSE-ConnectionGUID: vXkRA8VKTRSl3sHntPhcTA==
X-CSE-MsgGUID: TQPKyDSZQayqgZUPedVh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120770924"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 26 Feb 2025 02:01:29 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Feb 2025 12:01:28 +0200
Date: Wed, 26 Feb 2025 12:01:27 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] ucsi_ccg: Don't show non-functional attributes
Message-ID: <Z77md-hzNsKziOjc@kuha.fi.intel.com>
References: <20250221054137.1631765-1-superm1@kernel.org>
 <20250221054137.1631765-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221054137.1631765-3-superm1@kernel.org>

On Thu, Feb 20, 2025 at 11:40:04PM -0600, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If no fw_build is recognized for the controller there is no point to
> exposing the `do_flash` attribute.
> 
> Add an is_visible callback to the attribute group and check for that
> fw_build member to hide when not applicable.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 663aca9421410..801a66efa9820 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -1390,22 +1390,35 @@ static ssize_t do_flash_store(struct device *dev,
>  	if (!flash)
>  		return n;
>  
> -	if (uc->fw_build == 0x0) {
> -		dev_err(dev, "fail to flash FW due to missing FW build info\n");
> -		return -EINVAL;
> -	}
> -
>  	schedule_work(&uc->work);
>  	return n;
>  }
>  
> +static umode_t ucsi_ccg_attrs_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct ucsi_ccg *uc = i2c_get_clientdata(to_i2c_client(dev));
> +
> +	if (!uc->fw_build)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
>  static DEVICE_ATTR_WO(do_flash);
>  
>  static struct attribute *ucsi_ccg_attrs[] = {
>  	&dev_attr_do_flash.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(ucsi_ccg);
> +static struct attribute_group ucsi_ccg_attr_group = {
> +	.attrs = ucsi_ccg_attrs,
> +	.is_visible = ucsi_ccg_attrs_is_visible,
> +};
> +static const struct attribute_group *ucsi_ccg_groups[] = {
> +	&ucsi_ccg_attr_group,
> +	NULL,
> +};
>  
>  static int ucsi_ccg_probe(struct i2c_client *client)
>  {
> -- 
> 2.43.0

-- 
heikki

