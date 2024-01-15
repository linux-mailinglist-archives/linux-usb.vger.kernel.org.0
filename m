Return-Path: <linux-usb+bounces-5051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DE982D589
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 10:07:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 922E61F2171B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F5FC131;
	Mon, 15 Jan 2024 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJp8ZJIg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E96D514;
	Mon, 15 Jan 2024 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705309642; x=1736845642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6toMTsY2MQJYqbY6Y4j4fMTjC7Z9ecuuf5b634SQvJc=;
  b=cJp8ZJIgEkfDhHGrh9fuMNm7p+Vw/14+Y631Bv9w5Myapd7ypoUzIX2k
   YzFeBAN5chp8+0ZEC1IV+EwswWFXFcRvftFus1IZPTfgfYoAA5YdGVx4y
   5KCTS3juCodiZG+bgVg4bCFo7fhFptVIy+YsjSQ5xc1LG4yQjqBDTJeNV
   VZVaT8cna5Sph8f9DScfvNLU1AsCsYO9+5l3SogWt6myG2hAxb6WQbUGj
   V0DZGCFNNmU/GwBLxVwrWAxktspj1fN26RlP4SZgG6W6sFE7T/WIBlk9S
   NOMcS0/5Txr4Ik66fg2bzBo6siFiEEmcyoHlnUKFJ3MxeJglmOFXXea2v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="398433822"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="398433822"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="1030585206"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="1030585206"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga006.fm.intel.com with SMTP; 15 Jan 2024 01:07:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Jan 2024 11:07:16 +0200
Date: Mon, 15 Jan 2024 11:07:16 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	badhri@google.com, bryan.odonoghue@linaro.org, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org
Subject: Re: [PATCH v3 01/12] usb: typec: altmodes: add typec_cable_ops to
 typec_altmode
Message-ID: <ZaT1xE6kQGGnc3Jq@kuha.fi.intel.com>
References: <20240108191620.987785-14-rdbabiera@google.com>
 <20240108191620.987785-15-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108191620.987785-15-rdbabiera@google.com>

On Mon, Jan 08, 2024 at 07:16:14PM +0000, RD Babiera wrote:
> Add typec_cable_ops struct for enter, exit, and vdm. The struct is added
> to typec_altmode so port alt modes can have access to partner and cable
> specific callbacks, and alt mode drivers can specify operations over SOP'
> and SOP'' without modifying the existing API.
> 
> typec_port_register_cable_ops is added as a new symbol for port drivers
> to use to register cable operations to their registered port alt modes.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes since v2:
> * fixed documentation prototype errors
> ---
>  drivers/usb/typec/bus.c           | 102 ++++++++++++++++++++++++++++++
>  drivers/usb/typec/class.c         |  19 ++++++
>  include/linux/usb/typec.h         |   4 ++
>  include/linux/usb/typec_altmode.h |  20 ++++++
>  4 files changed, 145 insertions(+)
> 
> diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
> index e95ec7e382bb..6ea103e1abae 100644
> --- a/drivers/usb/typec/bus.c
> +++ b/drivers/usb/typec/bus.c
> @@ -244,6 +244,108 @@ typec_altmode_get_partner(struct typec_altmode *adev)
>  }
>  EXPORT_SYMBOL_GPL(typec_altmode_get_partner);
>  
> +/* -------------------------------------------------------------------------- */
> +/* API for cable alternate modes */
> +
> +/**
> + * typec_cable_altmode_enter - Enter Mode
> + * @adev: The alternate mode
> + * @sop: Cable plug target for Enter Mode command
> + * @vdo: VDO for the Enter Mode command
> + *
> + * Alternate mode drivers use this function to enter mode on the cable plug.
> + * If the alternate mode does not require VDO, @vdo must be NULL.
> + */
> +int typec_cable_altmode_enter(struct typec_altmode *adev, enum typec_plug_index sop, u32 *vdo)
> +{
> +	struct altmode *partner = to_altmode(adev)->partner;
> +	struct typec_altmode *pdev;
> +
> +	if (!adev || adev->active)
> +		return 0;
> +
> +	if (!partner)
> +		return -ENODEV;
> +
> +	pdev = &partner->adev;
> +
> +	if (!pdev->active)
> +		return -EPERM;
> +
> +	if (!pdev->cable_ops || !pdev->cable_ops->enter)
> +		return -EOPNOTSUPP;
> +
> +	return pdev->cable_ops->enter(pdev, sop, vdo);
> +}
> +EXPORT_SYMBOL_GPL(typec_cable_altmode_enter);
> +
> +/**
> + * typec_cable_altmode_exit - Exit Mode
> + * @adev: The alternate mode
> + * @sop: Cable plug target for Exit Mode command
> + *
> + * The alternate mode drivers use this function to exit mode on the cable plug.
> + */
> +int typec_cable_altmode_exit(struct typec_altmode *adev, enum typec_plug_index sop)
> +{
> +	struct altmode *partner = to_altmode(adev)->partner;
> +	struct typec_altmode *pdev;
> +
> +	if (!adev || !adev->active)
> +		return 0;
> +
> +	if (!partner)
> +		return -ENODEV;
> +
> +	pdev = &partner->adev;
> +
> +	if (!pdev->cable_ops || !pdev->cable_ops->exit)
> +		return -EOPNOTSUPP;
> +
> +	return pdev->cable_ops->exit(pdev, sop);
> +}
> +EXPORT_SYMBOL_GPL(typec_cable_altmode_exit);
> +
> +/**
> + * typec_cable_altmode_vdm - Send Vendor Defined Messages (VDM) between the cable plug and port.
> + * @adev: Alternate mode handle
> + * @sop: Cable plug target for VDM
> + * @header: VDM Header
> + * @vdo: Array of Vendor Defined Data Objects
> + * @count: Number of Data Objects
> + *
> + * The alternate mode drivers use this function for SVID specific communication
> + * with the cable plugs. The port drivers use it to deliver the Structured VDMs
> + * received from the cable plugs to the alternate mode drivers.
> + */
> +int typec_cable_altmode_vdm(struct typec_altmode *adev, enum typec_plug_index sop,
> +			    const u32 header, const u32 *vdo, int count)
> +{
> +	struct altmode *altmode;
> +	struct typec_altmode *pdev;
> +
> +	if (!adev)
> +		return 0;
> +
> +	altmode = to_altmode(adev);
> +
> +	if (is_typec_plug(adev->dev.parent)) {
> +		if (!altmode->partner)
> +			return -ENODEV;
> +		pdev = &altmode->partner->adev;
> +	} else {
> +		if (!altmode->plug[sop])
> +			return -ENODEV;
> +		pdev = &altmode->plug[sop]->adev;
> +	}
> +
> +	if (!pdev->cable_ops || !pdev->cable_ops->vdm)
> +		return -EOPNOTSUPP;
> +
> +	return pdev->cable_ops->vdm(pdev, sop, header, vdo, count);
> +}
> +EXPORT_SYMBOL_GPL(typec_cable_altmode_vdm);
> +
>  /* -------------------------------------------------------------------------- */
>  /* API for the alternate mode drivers */
>  
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 015aa9253353..8fc9795d6bd4 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2280,6 +2280,25 @@ void typec_port_register_altmodes(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmodes);
>  
> +/**
> + * typec_port_register_cable_ops - Register typec_cable_ops to port altmodes
> + * @altmodes: USB Type-C Port's altmode vector
> + * @max_altmodes: The maximum number of alt modes supported by the port
> + * @ops: Cable alternate mode vector
> + */
> +void typec_port_register_cable_ops(struct typec_altmode **altmodes, int max_altmodes,
> +				   const struct typec_cable_ops *ops)
> +{
> +	int i;
> +
> +	for (i = 0; i < max_altmodes; i++) {
> +		if (!altmodes[i])
> +			return;
> +		altmodes[i]->cable_ops = ops;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_port_register_cable_ops);
> +
>  /**
>   * typec_register_port - Register a USB Type-C Port
>   * @parent: Parent device
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index a05d6f6f2536..38f93d72fd1b 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -18,6 +18,7 @@ struct typec_cable;
>  struct typec_plug;
>  struct typec_port;
>  struct typec_altmode_ops;
> +struct typec_cable_ops;
>  
>  struct fwnode_handle;
>  struct device;
> @@ -157,6 +158,9 @@ void typec_port_register_altmodes(struct typec_port *port,
>  	const struct typec_altmode_ops *ops, void *drvdata,
>  	struct typec_altmode **altmodes, size_t n);
>  
> +void typec_port_register_cable_ops(struct typec_altmode **altmodes, int max_altmodes,
> +				   const struct typec_cable_ops *ops);
> +
>  void typec_unregister_altmode(struct typec_altmode *altmode);
>  
>  struct typec_port *typec_altmode2port(struct typec_altmode *alt);
> diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
> index 28aeef8f9e7b..72ec8058543a 100644
> --- a/include/linux/usb/typec_altmode.h
> +++ b/include/linux/usb/typec_altmode.h
> @@ -20,6 +20,7 @@ struct typec_altmode_ops;
>   * @active: Tells has the mode been entered or not
>   * @desc: Optional human readable description of the mode
>   * @ops: Operations vector from the driver
> + * @cable_ops: Cable operations vector from the driver.
>   */
>  struct typec_altmode {
>  	struct device			dev;
> @@ -30,6 +31,7 @@ struct typec_altmode {
>  
>  	char				*desc;
>  	const struct typec_altmode_ops	*ops;
> +	const struct typec_cable_ops	*cable_ops;
>  };
>  
>  #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
> @@ -75,6 +77,24 @@ int typec_altmode_notify(struct typec_altmode *altmode, unsigned long conf,
>  const struct typec_altmode *
>  typec_altmode_get_partner(struct typec_altmode *altmode);
>  
> +/**
> + * struct typec_cable_ops - Cable alternate mode operations vector
> + * @enter: Operations to be executed with Enter Mode Command
> + * @exit: Operations to be executed with Exit Mode Command
> + * @vdm: Callback for SVID specific commands
> + */
> +struct typec_cable_ops {
> +	int (*enter)(struct typec_altmode *altmode, enum typec_plug_index sop, u32 *vdo);
> +	int (*exit)(struct typec_altmode *altmode, enum typec_plug_index sop);
> +	int (*vdm)(struct typec_altmode *altmode, enum typec_plug_index sop,
> +		   const u32 hdr, const u32 *vdo, int cnt);
> +};
> +
> +int typec_cable_altmode_enter(struct typec_altmode *altmode, enum typec_plug_index sop, u32 *vdo);
> +int typec_cable_altmode_exit(struct typec_altmode *altmode, enum typec_plug_index sop);
> +int typec_cable_altmode_vdm(struct typec_altmode *altmode, enum typec_plug_index sop,
> +			    const u32 header, const u32 *vdo, int count);
> +
>  /*
>   * These are the connector states (USB, Safe and Alt Mode) defined in USB Type-C
>   * Specification. SVID specific connector states are expected to follow and
> -- 
> 2.43.0.472.g3155946c3a-goog

-- 
heikki

