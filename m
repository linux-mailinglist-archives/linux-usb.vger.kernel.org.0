Return-Path: <linux-usb+bounces-28106-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E939EB57A44
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1547166748
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C093A2F8BFF;
	Mon, 15 Sep 2025 12:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RfFlr1LD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD72AD11
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938739; cv=none; b=M+au0TTg1vILsVM8I3AhMeQwxRag1nUDfNvQp6X//qeZ755hHelVGZVfqzGVSS+KlxjhHZgOq0fLIayaPAhg3Z+hq0zpIx0y17ahZw7EN5eczbZkfbmOGd4j4oQ2V1ZT0ECqJ6tYuESrDhKzuuhV3s7IyO4GkWPkKcYmGxHLh8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938739; c=relaxed/simple;
	bh=mxZiZ5xinftL2EGobMDLkXzg1NePx5uYLHn1NZFBw+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLgMNNC9HdqKUSZEAtmtQ8yaovi5uh3dCjpbiJkqo8Ce/I3N55xx/G5f0sQNum5czAWqOyZ/gBGL7afyYaOZT6DfDJl9N3zYYgakUxiKHGCPDx4zL6S5t/buhGvffdWzi6IOWvTtdYLrfqAH0LhRoElrErdkXGt3PZncFPM2zPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RfFlr1LD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757938737; x=1789474737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxZiZ5xinftL2EGobMDLkXzg1NePx5uYLHn1NZFBw+E=;
  b=RfFlr1LDaZphJ7FR0MkFJr3HsTb2l9MyaGP4oKnBmZuw63uC2zCPEZ+w
   vg/RGPcNaWfAOI7qUUlgEVcNn38dYCbBY5teP6UwXul2hg0uoABmYxSFE
   N2R6tQk3QTSR9knL88kz9pAcoJNqWbyY1PBlRMjqhGSARDc++E9I+OLRs
   4L4WWft6s31T8EqraRZn4opzz5+VLDR3TpOLTG3OEC56ti1i8TLedu1gj
   waWB2lw4E7HymSxGyFj1gouH9+TcmoXmnsONCPX0FLaiCHn3+M+Xe7Wh6
   8UAHZDEo6jucaP2wqFQZ6YoE3f02csGD8FUiUHSB9qPmZKnVJmFDIebh+
   g==;
X-CSE-ConnectionGUID: Rw5WjIbBTjONL2bI76q1HQ==
X-CSE-MsgGUID: wi5edBBQQSeJlD8HF177DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="71559290"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="71559290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:18:56 -0700
X-CSE-ConnectionGUID: SlcLlZ/8Tp2DKYhbWkacUA==
X-CSE-MsgGUID: msWNVh8gQTK4YRQ7IIGezA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="205402479"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 15 Sep 2025 05:18:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 15:18:53 +0300
Date: Mon, 15 Sep 2025 15:18:53 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 2/4] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <aMgELQ2IFw_cHpkO@kuha.fi.intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
 <429be91c2fdc038c266103083457ff9086e26d2e.1757374784.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429be91c2fdc038c266103083457ff9086e26d2e.1757374784.git.pooja.katiyar@intel.com>

On Tue, Sep 09, 2025 at 06:52:05PM -0700, Pooja Katiyar wrote:
> Add support for updating message out data structure for UCSI
> ACPI interface for UCSI 2.1 and UCSI 3.0 commands such as
> Set PDOs and LPM Firmware Update.
> 
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
> Changelog v4:
> - Fixed build errors reported by kernel test robot.
> - Added changelogs.

I'm not sure anything has changed in this patch. The first patch was
the one with a problem. In any case:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Changelog v3:
> - Added message_out fields to UCSI structure and updated sync_control
>   to perform write operation.
> - Removed extra DSM Write call.
> 
> Changelog v2:
> - Moved write_message_out operation to .sync_control.
> - Updated ucsi_send_command to accept message_out data.
> 
>  drivers/usb/typec/ucsi/ucsi.c      | 14 ++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.h      |  2 ++
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 16 ++++++++++++++++
>  3 files changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 073b80cfa414..a82088554a40 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -67,6 +67,20 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
>  
>  	reinit_completion(&ucsi->complete);
>  
> +	if (ucsi->message_out_size > 0) {
> +		if (!ucsi->ops->write_message_out) {
> +			ucsi->message_out_size = 0;
> +			ret = -EOPNOTSUPP;
> +			goto out_clear_bit;
> +		}
> +
> +		ret = ucsi->ops->write_message_out(ucsi, ucsi->message_out,
> +						   ucsi->message_out_size);
> +		ucsi->message_out_size = 0;
> +		if (ret)
> +			goto out_clear_bit;
> +	}
> +
>  	ret = ucsi->ops->async_control(ucsi, command);
>  	if (ret)
>  		goto out_clear_bit;
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index ba21fea53cb7..e6ca70f7fa1f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -69,6 +69,7 @@ struct dentry;
>   * @read_cci: Read CCI register
>   * @poll_cci: Read CCI register while polling with notifications disabled
>   * @read_message_in: Read message data from UCSI
> + * @write_message_out: Write message data to UCSI
>   * @sync_control: Blocking control operation
>   * @async_control: Non-blocking control operation
>   * @update_altmodes: Squashes duplicate DP altmodes
> @@ -84,6 +85,7 @@ struct ucsi_operations {
>  	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
>  	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
>  	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
> +	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
>  	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
>  	int (*async_control)(struct ucsi *ucsi, u64 command);
>  	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index f1d1f6917b09..f9beeb835238 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -86,6 +86,21 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
>  	return 0;
>  }
>  
> +static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
> +{
> +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> +
> +	if (!data || !data_len)
> +		return -EINVAL;
> +
> +	if (ucsi->version <= UCSI_VERSION_1_2)
> +		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
> +	else
> +		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
> +
> +	return 0;
> +}
> +
>  static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
>  {
>  	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> @@ -101,6 +116,7 @@ static const struct ucsi_operations ucsi_acpi_ops = {
>  	.read_cci = ucsi_acpi_read_cci,
>  	.poll_cci = ucsi_acpi_poll_cci,
>  	.read_message_in = ucsi_acpi_read_message_in,
> +	.write_message_out = ucsi_acpi_write_message_out,
>  	.sync_control = ucsi_sync_control_common,
>  	.async_control = ucsi_acpi_async_control
>  };
> -- 
> 2.43.0

-- 
heikki

