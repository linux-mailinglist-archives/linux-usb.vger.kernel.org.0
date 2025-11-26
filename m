Return-Path: <linux-usb+bounces-30968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 085ACC89C13
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 13:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7E53AFB51
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 12:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C76F32825A;
	Wed, 26 Nov 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZboYDNmL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1673271F6;
	Wed, 26 Nov 2025 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160037; cv=none; b=Vb6D88qXP1L07XZzp6FpCmp84NtstQnpCahi4VLSc/Rpa/J+qWrKFRKqnQSP95m7zRv5GK4GRjcTRSNZ0oYKsNn51iS9Z1KXEdRbxvwolGsN2JCzHceMhT0ITTQOECp6FMIWJEZ+cYl1SzOzL8UsSh3Uzx9Z5Dtmky8BJaiz2zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160037; c=relaxed/simple;
	bh=pJj9SXCnzo90+DixwyYr9NX9ycTVPOj55Ho2Nr5EF/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N43IF3/s+jX0b4xI/QKcclW3E+4LzFnmNSqtPMgNE9mXWbEUEkR2Oo6se4ysRog0G+fmuOo333AFmh3/7xBfcG1eQl/uyZa/hCdRjT5m1Ind9rlZ6a/SD1uiF6qkA/iyN+kjJKg6wAzqK+kyQDbYZCpbAoaYLUELju/UYvvz/yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZboYDNmL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764160036; x=1795696036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pJj9SXCnzo90+DixwyYr9NX9ycTVPOj55Ho2Nr5EF/c=;
  b=ZboYDNmLfbYkF2zVRePWHqFT0FMfjjY2M47Dxk21J1no70ZNLGfBMna3
   1Qo28x30SzETum3aUFXUi7VDjMAUMiBHl393OHheGp6sXeE+BieEW8Hr7
   yEnlaNQbHG5Z8u0MWJRFfNhv8kZguvG3poFCsnI3fJQddd6y6091PG9xY
   RHByZ9hNaJlri9ZLgopXAHHu3ceqaH2Mo0aypUV4jJo3Y9o7lrQT7eeE8
   pvddQPvbJLHF7DiRHkKyWguQjnWX+hg3pus2FcXqx2nNC3hRij9SiIUmL
   COlzUwOvzGoeWpbCvZ34pvPuRcsFtl7u92c1P4cbFiDKfzHETRMWKIJh3
   g==;
X-CSE-ConnectionGUID: MLPy71sIRR6BBPY6stiQBw==
X-CSE-MsgGUID: 2Ne737CdTzmqYF2RajKdoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53763989"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="53763989"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 04:27:14 -0800
X-CSE-ConnectionGUID: z0tpH0x3TM2bE/67WRuiwA==
X-CSE-MsgGUID: R83cXsFESAaKBf/MW0YBaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="197421382"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 26 Nov 2025 04:27:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C51B5A0; Wed, 26 Nov 2025 13:27:10 +0100 (CET)
Date: Wed, 26 Nov 2025 13:27:10 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] usb: typec: hd3ss3220: Enable VBUS based on ID
 pin state
Message-ID: <aSbyHj-keYZWLwDy@black.igk.intel.com>
References: <20251111072025.2199142-1-krishna.kurapati@oss.qualcomm.com>
 <20251111072025.2199142-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111072025.2199142-3-krishna.kurapati@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 11, 2025 at 12:50:25PM +0530, Krishna Kurapati wrote:
> There is a ID pin present on HD3SS3220 controller that can be routed
> to SoC. As per the datasheet:
> 
> "Upon detecting a UFP device, HD3SS3220 will keep ID pin high if VBUS is
> not at VSafe0V. Once VBUS is at VSafe0V, the HD3SS3220 will assert ID pin
> low. This is done to enforce Type-C requirement that VBUS must be at
> VSafe0V before re-enabling VBUS"
> 
> Add support to read the ID pin state and enable VBUS accordingly.

...

> +	if (hd3ss3220->vbus) {
> +		hd3ss3220->id_gpiod = devm_gpiod_get_optional(hd3ss3220->dev,
> +							      "id",
> +							      GPIOD_IN);

Can be also

		ret = PTR_ERR_OR_ZERO(hd3ss3220->id_gpiod);
		if (IS_ERR(hd3ss3220->id_gpiod))
			goto err_put_fwnode;

> +		if (IS_ERR(hd3ss3220->id_gpiod)) {

> +		if (IS_ERR(hd3ss3220->id_gpiod)) {
> +			ret = PTR_ERR(hd3ss3220->id_gpiod);
> +			goto err_put_fwnode;
> +		}
> +	}

...

> +		ret = devm_request_threaded_irq(hd3ss3220->dev,
> +						hd3ss3220->id_irq, NULL,
> +						hd3ss3220_id_isr,
> +						IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> +						dev_name(hd3ss3220->dev), hd3ss3220);
> +		if (ret < 0) {
> +			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);

The above call already prints an error message, no need to repeat it here.

> +			goto err_put_fwnode;
> +		}

Since the patch is already applied, please send a followup for the second one
(the first one is up to you, just a hint for the future code contributions).

-- 
With Best Regards,
Andy Shevchenko



