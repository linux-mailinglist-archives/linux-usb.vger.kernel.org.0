Return-Path: <linux-usb+bounces-14791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2B396F68D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 16:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A16A286F9D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2F21D0491;
	Fri,  6 Sep 2024 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iHPooccS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AE1EEF9
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632401; cv=none; b=HPhVnOpPOJ98JyftMZBa1qGGMPITnnW8AxnL+WvoVTEKiI5XvCyhgvhZVLp1yfhc3i6LCnU3IJhBdqrmW0FXHg3Ate9xZKYI3I0aW8W5SVIoIJgdxA00kbHlv4b75t07pSDk5/TDXZPcKDV6ZF8bVynOdGpFG/fv+qzoAx0xaQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632401; c=relaxed/simple;
	bh=vId2srKe0fbdlIdvOiJAT3wMG2yLGyRD/YQjTpUDQMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOn2ARLLTCyBCzlt+w9vUVUSf2IBkyOKsGir/qKNorrEnRMDn87+qC7tlO+WjxDvXOkGyYtdkClDmUGEAlZfKVKnccs9pQvZmUoRSf9+bttJUYXqIuuv8iObTjm57Ps+RMlnJHdQ0KIiUnzclSZob0YQV2YyTqsU7qX+/aKEwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iHPooccS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725632400; x=1757168400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vId2srKe0fbdlIdvOiJAT3wMG2yLGyRD/YQjTpUDQMY=;
  b=iHPooccS9dsVjydli8SlQzRwsDzHf1ENNZjbEygwHf+WMxfA0Sx7sbWF
   o5hGDFWUBVpDwoDb0LiPPs1fmmaPSQm3Sacfziw5YYq7th82zcs4HCkXF
   pWfBmZsgTpxZMAOoirSQ4K+4b5ZO6RlUHrQIIFqK9G9X187fBWnWVIg7L
   fTxLsL61BjQjbyfG4pnsBScEby8u0/nuQ2k0iBvcsHJC4aT6zxg3bh1Ds
   /qd7m22woqu4Q0aytbV2rBsrMGct0zoj98XC92BhSAsbvpZrNTo7QzjYO
   ALdL4SL3Dxss7VWQhYDNy/aX8fZAL2TTj2MSkActqPnA9nJ2bW1yHZolS
   Q==;
X-CSE-ConnectionGUID: 0eK8XlHtT9K4ksYQ5BTCXw==
X-CSE-MsgGUID: 3VKYR2IcQhGENUFZGpdBUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24501389"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24501389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 07:19:38 -0700
X-CSE-ConnectionGUID: xMhbKBW6SvKhdEFXgs1ogw==
X-CSE-MsgGUID: WGKnkTF8TWi57Mq7zahTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="65656795"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa007.fm.intel.com with SMTP; 06 Sep 2024 07:19:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 06 Sep 2024 17:19:33 +0300
Date: Fri, 6 Sep 2024 17:19:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v5 3/8] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <ZtsPdWRHkHWufsVh@kuha.fi.intel.com>
References: <20240903163033.3170815-1-ukaszb@chromium.org>
 <20240903163033.3170815-4-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903163033.3170815-4-ukaszb@chromium.org>

Hi,

Sorry to go back on this, but I noticed something..

On Tue, Sep 03, 2024 at 04:30:28PM +0000, Łukasz Bartosik wrote:
> +static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
> +{
> +	struct cros_ucsi_data *udata = ucsi_get_drvdata(ucsi);
> +	struct ec_params_ucsi_ppm_set *req;
> +	size_t req_len;
> +	int ret;
> +
> +	req_len = sizeof(struct ec_params_ucsi_ppm_set) + sizeof(cmd);
> +	req = kzalloc(req_len, GFP_KERNEL);
> +	if (!req)
> +		return -ENOMEM;

Where is the memory for req released?

First I though that cros_ec_cmd() does it, but it's actually
allocating it's own cros_ec_command, and then releasing that in the
end, so I just got confused about it.

Is this a memory leak, or am I missing something?

> +
> +	req->offset = UCSI_CONTROL;
> +	memcpy(req->data, &cmd, sizeof(cmd));
> +	ret = cros_ec_cmd(udata->ec, 0, EC_CMD_UCSI_PPM_SET,
> +			  req, req_len, NULL, 0);
> +	if (ret < 0) {
> +		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
> +		return ret;
> +	}
> +	return 0;
> +}

thanks,

-- 
heikki

