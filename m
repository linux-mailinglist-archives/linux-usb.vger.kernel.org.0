Return-Path: <linux-usb+bounces-28107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE47BB57A98
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A87381729A4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6B5309F1F;
	Mon, 15 Sep 2025 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDYxtxHd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614D23093C8
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938863; cv=none; b=hw1f4QODSNAHeSXXzU/RwNSW7BIrsfZ0FlXosnl7fqwhXrmhMhbndtwi3CZQEmyjK2k8QxObFVH6rUyQqUKVm5KcbZ10oxCkwUpyH1MxDVKybM5+eaSnnlc6tXo6XTK6EK3QhVILtlH8SaX077zxYkGvKN0q0/6+UxJvZ3Cypkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938863; c=relaxed/simple;
	bh=Ou+dDgDau3bmmphdXyMLG//Za6xdISG9bF10bWH/JlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0p83BykLoD6EgfazGe/lX707caEeQ2k6N927tGoKX3MFABW/XGD3zH3YXvDF32sqEBJBAOFUZDl6LcxSqWK822vKZS+jhdaNKeGCEDcBFyEUWmqMsauSJ9Tc6bkv/Owvw+AhvWImcyTIv5UQfwHohxB3PbeT3ESdIuw8DuH6xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDYxtxHd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757938861; x=1789474861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ou+dDgDau3bmmphdXyMLG//Za6xdISG9bF10bWH/JlM=;
  b=oDYxtxHdk0OmTvfxwf4wUyY9F9AlmE2Qt++LPXNKQOTEQnuLWY5ys6I9
   TzRAWyjdfmVqeaXNiguk3QJxXXkCjDEugcJX6vCfIThjfYMsmWR1xisKY
   EGE9U/zwCDGXMkgSzEOhv8gdRcSX75elyK4CM03TKn/JD8cZQELgb69tU
   P4wNwUSoJ/CcuwV/6/Hv2xyWaviGYs7bQHqE7NfiTiVwrhuW7FaiGDnBH
   ZtLOZ7nL+kb3kcyjckSyX0Cryhcdu1fwN+V6GZPW5jDd0EWdTglzqcq8Z
   G5+dF3KmSzftAHIq1M5qSCMlZTw6ykE69Fqwl64V6yFkNpHI94s4rSMVk
   g==;
X-CSE-ConnectionGUID: U09GjZ/LSLKJPaU4k8XL/g==
X-CSE-MsgGUID: /vnXBy3uRmiBBd/Q0jD8BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59231289"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="59231289"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:21:01 -0700
X-CSE-ConnectionGUID: YnXNgPReQ4WITJ8xOdqrcQ==
X-CSE-MsgGUID: AS6w2pifRM2jfZ9nbYu1EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="211783542"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 15 Sep 2025 05:20:59 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 15:20:57 +0300
Date: Mon, 15 Sep 2025 15:20:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 3/4] usb: typec: ucsi: Enable debugfs for message_out
 data structure
Message-ID: <aMgEqYsdQhzK_QZI@kuha.fi.intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
 <1746700c747e0be20af39abb0fe8d4f4dd54262a.1757374784.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1746700c747e0be20af39abb0fe8d4f4dd54262a.1757374784.git.pooja.katiyar@intel.com>

On Tue, Sep 09, 2025 at 06:52:06PM -0700, Pooja Katiyar wrote:
> Add debugfs entry for writing message_out data structure to handle
> UCSI 2.1 and 3.0 commands through debugfs interface.
> 
> Users writing to the message_out debugfs file should ensure the input
> data adheres to the following format:
> 1. Input must be a non-empty valid hexadecimal string.
> 2. Input length of hexadecimal string must not exceed 256 bytes of
>    length to be in alignment with the message out data structure size
>    as per the UCSI specification v2.1.
> 3. If the input string length is odd, then user needs to prepend a
>    '0' to the first character for proper hex conversion.
> 
> Below are examples of valid hex strings. Note that these values are
> just examples. The exact values depend on specific command use case.
> 
>         #echo 1A2B3C4D > message_out
>         #echo 01234567 > message_out
> 
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> Changelog v4:
> - Fixed build errors reported by kernel test robot.
> - Added changelogs.

Ah, you just copied the same changelog to all patches. You could just
put the log to the cover letter in that case IMO.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Changelog v3:
> - Updated debugfs message_out write handler to use message_out fields in
>   UCSI structure.
> 
> Changelog v2:
> - No changes.
> 
>  drivers/usb/typec/ucsi/debugfs.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index 4bf3a8f65a4e..0693acf04c37 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -109,6 +109,30 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
>  }
>  DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
>  
> +static ssize_t ucsi_message_out_write(struct file *file,
> +				      const char __user *data, size_t count, loff_t *ppos)
> +{
> +	struct ucsi *ucsi = file->private_data;
> +	int ret;
> +
> +	char *buf __free(kfree) = memdup_user_nul(data, count);
> +	if (IS_ERR(buf))
> +		return PTR_ERR(buf);
> +
> +	ucsi->message_out_size = min(count / 2, UCSI_MAX_MESSAGE_OUT_LENGTH);
> +	ret = hex2bin(ucsi->message_out, buf, ucsi->message_out_size);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const struct file_operations ucsi_message_out_fops = {
> +	.open = simple_open,
> +	.write = ucsi_message_out_write,
> +	.llseek = generic_file_llseek,
> +};
> +
>  void ucsi_debugfs_register(struct ucsi *ucsi)
>  {
>  	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
> @@ -121,6 +145,8 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
>  	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
>  	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
>  	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
> +	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
> +			    &ucsi_message_out_fops);
>  }
>  
>  void ucsi_debugfs_unregister(struct ucsi *ucsi)
> -- 
> 2.43.0

-- 
heikki

