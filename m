Return-Path: <linux-usb+bounces-36047-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OU6KmT31GkjywcAu9opvQ
	(envelope-from <linux-usb+bounces-36047-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:24:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C203AE47D
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:24:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B1C7D30195EB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 12:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8523B47D1;
	Tue,  7 Apr 2026 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/Z7DM5a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE93A6EE9;
	Tue,  7 Apr 2026 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564613; cv=none; b=Ac3L2AdrJvaSXxQg3McYRD/xUfoz2Pqpi9S7qKNPw8rL5nvHbbHgAPL0AKT1fyzS0jDXIcpoFRYb3eWJ5aXLTaQqf01lNNPAWCZwN/OWxRI/cIze56fTgkxoO5DFjfyrVNwPgV4gnrnaHPaSPi26GndcPOTL4GFMHqodQju9XYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564613; c=relaxed/simple;
	bh=udq5QbeRCScW+LsK/TRGpVNCFeuozgsH3RVfc5Pvj3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPlWnTKENIEGq2Uu32jnT8w/tTp/6PrIf21kS0TPOogUTQtUIbFOcfMD5UqqRkD3iM1oxYvnmlAtCT3AfSO7/N02+9B+Vlu9jcsmJsiWq8GPUtterbA/nLz72fwW02QvO667KIn0DUJi9Ns9CHQf8bmHyMf/VXtJUP7nrkZgaoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/Z7DM5a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564611; x=1807100611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udq5QbeRCScW+LsK/TRGpVNCFeuozgsH3RVfc5Pvj3U=;
  b=h/Z7DM5aeUwVez9/HKXHuw4TcFpRR+fTwb0R616SkxoQE671HeNrfTX0
   BntpUUJo2dCKQ42K65zr6K4ddzuwrNnWHm9a2LPrfLxcsgGiAGCzbDINg
   3C0fdrkVWYhCxO2DDCceUxSD9JMEe7FMXZVSS02Flx1AW7JuhfcP/VS1u
   8c1JMyEqM+vxKsPc0JXzL4KagZT+kVhoGhdvYtuzZt2mlTYl+/1fBXqur
   0CCJuyQgpV3Gl6aOgusGMRrwgQZCBPiLAnw5I60hvcOlt6IGuHp62Pt+l
   4VoDLCXNKlrFhsvXDd3Ovu5CFnnu1vQjUDJtrXi49pqTuh0XqJdHuaSw7
   Q==;
X-CSE-ConnectionGUID: HF/jYj6oStyzkyV/lZHZgg==
X-CSE-MsgGUID: WFBz5nkIQWucDRI0pHYC0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76420277"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76420277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:23:31 -0700
X-CSE-ConnectionGUID: DPVsHRSKRxaJc40fhJ/89A==
X-CSE-MsgGUID: kD9ZACXwT3ej17ecdX7ixw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223856369"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2026 05:23:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 54CC195; Tue, 07 Apr 2026 14:23:27 +0200 (CEST)
Date: Tue, 7 Apr 2026 15:22:38 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	akuchynski@chromium.org, gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: cros_ec_ucsi: Load driver from OF and
 ACPI definitions
Message-ID: <adT3DiyjvDk0y9R9@kuha>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-3-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-3-jthies@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36047-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E2C203AE47D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 10:33:27PM +0000, Jameson Thies wrote:
> Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
> compatible devices and "GOOG0021" ACPI nodes.
> 
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index 6bca2dce211c..251aa7251ce6 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -5,11 +5,13 @@
>   * Copyright 2024 Google LLC.
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/container_of.h>
>  #include <linux/dev_printk.h>
>  #include <linux/jiffies.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_usbpd_notify.h>
>  #include <linux/platform_data/cros_ec_proto.h>
> @@ -257,7 +259,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
>  static int cros_ucsi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
>  	struct cros_ucsi_data *udata;
>  	int ret;
>  
> @@ -265,9 +266,16 @@ static int cros_ucsi_probe(struct platform_device *pdev)
>  	if (!udata)
>  		return -ENOMEM;
>  
> +	/* ACPI and OF FW nodes for cros_ec_ucsi are children of the ChromeOS EC. If the
> +	 * cros_ec_ucsi device has an ACPI or OF FW node, its parent is the ChromeOS EC device.
> +	 * Platforms without a FW node for cros_ec_ucsi may add it as a subdevice of cros_ec_dev.
> +	 */
>  	udata->dev = dev;
> +	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
> +		udata->ec = dev_get_drvdata(dev->parent);
> +	else
> +		udata->ec = ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec_dev;
>  
> -	udata->ec = ec_data->ec_dev;
>  	if (!udata->ec)
>  		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
>  
> @@ -348,10 +356,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
>  
> +static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] = {
> +	{ "GOOG0021", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
> +
> +static const struct of_device_id cros_ucsi_of_match[] = {
> +	{ .compatible = "google,cros-ec-ucsi", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
> +
>  static struct platform_driver cros_ucsi_driver = {
>  	.driver = {
>  		.name = KBUILD_MODNAME,
>  		.pm = &cros_ucsi_pm_ops,
> +		.acpi_match_table = cros_ec_ucsi_acpi_device_ids,
> +		.of_match_table = cros_ucsi_of_match,
>  	},
>  	.id_table = cros_ucsi_id,
>  	.probe = cros_ucsi_probe,
> -- 
> 2.53.0.1213.gd9a14994de-goog

-- 
heikki

