Return-Path: <linux-usb+bounces-417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01D7A8758
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 16:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDB332820BA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 14:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494CE3B28F;
	Wed, 20 Sep 2023 14:43:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684E37176
	for <linux-usb@vger.kernel.org>; Wed, 20 Sep 2023 14:43:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549991BFB;
	Wed, 20 Sep 2023 07:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695220985; x=1726756985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xD+kCDuKOctFEp9FrRuO8zEdKonGQP5B7ih1GY4kA0s=;
  b=BZsoyDBKdeahfpvYeU8xya1BERf4OSw/yga/fub68DBSDPx3hWOgN2up
   tcbU0P7ffysxfNg0bgD48U4ZobsBGy76PfikslmFywssRe3PsKyGoIgDA
   3QS6VpKjIyn13JmPI24HMHJ3ZlT5/3FWI9HplUMTWlim1g3gzkTrSVsXP
   +TG0nM9SBszdOaXzsvMF5iiqVjHOjt6lFvmJd4EbimdlsT7Jyt1FsxOkc
   zwuJ4Y003Q09jImXD4VsoP8dhyT3h/VeHOPF6wjr+S31MG0KFwm2WCXiy
   vjKQL+XFnBnDFjJObz6Svc+Hwg8ag9vNteLbQd8CiY0qflU3KD4W9HjSs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="365294446"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="365294446"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="816931136"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="816931136"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:42:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qiyPe-0000000Fs3W-43Nz;
	Wed, 20 Sep 2023 17:42:46 +0300
Date: Wed, 20 Sep 2023 17:42:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Utkarsh Patel <utkarsh.h.patel@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	heikki.krogerus@linux.intel.com, pmalani@chromium.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org
Subject: Re: [PATCH v4 4/5] platform/chrome: cros_ec_typec: Add Displayport
 Alternatemode 2.1 Support
Message-ID: <ZQsE5hgm4qYpr/My@smile.fi.intel.com>
References: <20230920023243.2494410-1-utkarsh.h.patel@intel.com>
 <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920023243.2494410-5-utkarsh.h.patel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 07:32:42PM -0700, Utkarsh Patel wrote:
> Displayport Alternatemode 2.1 requires cable capabilities such as cable
> signalling, cable type, DPAM version which then will be used by mux
> driver for displayport configuration. These capabilities can be derived
> from the Cable VDO.

...

> +	/**

Are you sure?

> +	 * Get cable VDO for thunderbolt cables and cables with DPSID but does not
> +	 * support DPAM2.1.
> +	 */

...

> +	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
> +		dp_data.conf |= cable_dp_vdo;
> +	} else if (cable_tbt_vdo) {
> +		dp_data.conf |=  TBT_CABLE_SPEED(cable_tbt_vdo) << DP_CONF_SIGNALLING_SHIFT;
> +
> +		/* Cable Type */
> +		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_OPTICAL << DP_CONF_CABLE_TYPE_SHIFT;
> +		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_TIMER << DP_CONF_CABLE_TYPE_SHIFT;
> +		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
> +			dp_data.conf |= DP_CONF_CABLE_TYPE_RE_DRIVER << DP_CONF_CABLE_TYPE_SHIFT;
> +	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
> +		dp_data.conf |= VDO_TYPEC_CABLE_SPEED(port->c_identity.vdo[0]) <<
> +				DP_CONF_SIGNALLING_SHIFT;
> +	}

You can also make it a bit more readable with (use better names
if you think it's needed)

	u32 signalling = 0;
	u32 cable_type = 0;

	...

	if (cable_dp_vdo & DP_CAP_DPAM_VERSION) {
		dp_data.conf |= cable_dp_vdo;
	} else if (cable_tbt_vdo) {
		signalling = TBT_CABLE_SPEED(cable_tbt_vdo);

		/* Cable Type */
		if (cable_tbt_vdo & TBT_CABLE_OPTICAL)
			cable_type = DP_CONF_CABLE_TYPE_OPTICAL;
		else if (cable_tbt_vdo & TBT_CABLE_RETIMER)
			cable_type = DP_CONF_CABLE_TYPE_RE_TIMER;
		else if (cable_tbt_vdo & TBT_CABLE_ACTIVE_PASSIVE)
			cable_type = DP_CONF_CABLE_TYPE_RE_DRIVER;
	} else if (PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_PCABLE) {
		signalling = VDO_TYPEC_CABLE_SPEED(port->c_identity.vdo[0]);
	}

	dp_data.conf |= signalling << DP_CONF_SIGNALLING_SHIFT;
	dp_data.conf |= cable_type << DP_CONF_CABLE_TYPE_SHIFT;

-- 
With Best Regards,
Andy Shevchenko



