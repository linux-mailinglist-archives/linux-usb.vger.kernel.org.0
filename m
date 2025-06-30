Return-Path: <linux-usb+bounces-25263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F618AED3AA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 07:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68A7C188C479
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 05:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD20191F92;
	Mon, 30 Jun 2025 05:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GuxztjYb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68F92745C
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751259859; cv=none; b=eTLgV3JctHBhYRlg5x9sVeIdhCCiRvsZVfXMtDfze9hl/o3rZvwoX8IJqXSiS8VXSLch6jkzpNzT2l/htZQOLYSaz8Nj03+QT2jkHLDExDQJ1y/vDJ/tTbtOnOwLLq/UaE0WD0CLDZNS8VVJZDXxnvrd3NFl9va8QZbcznonVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751259859; c=relaxed/simple;
	bh=IC1hilONg1FTSFHY5TIHsbBBE/UDsOlvMkuPxcM6ko4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=su2iJ2zbEfTUR/Zj80cuomYBdXOv2cGfEf4INZc2JITAr5bGFoulYvcG0z39/9V+DiCoCRuOopHlgdqcUUZ7lM17ycFD0NaIBmVGXao4D/wnJOffsAdIlGHJYSVFfOBK30YTyjLfoOAA0ubWOmjQaMcabDT7ZKcZqjUaIMZ7TG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GuxztjYb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD06C4CEE3;
	Mon, 30 Jun 2025 05:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751259857;
	bh=IC1hilONg1FTSFHY5TIHsbBBE/UDsOlvMkuPxcM6ko4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GuxztjYbg2TfWAuWoDYFRVkQEiCaihJihPOQFD+Js6bNaqDOu/KZlgVlWBnqD7WhM
	 vNc45zuKylwoBJ8QLNm1P6Tk3fA2c6L5sK7WFPvONJ2I60KrYWvYXnGDvicBYxgSx4
	 8NEvttAQ3fBB3vr2ywPQtzkvnjOiTzFjTo/IIKVw=
Date: Mon, 30 Jun 2025 07:04:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkat Jayaraman <venkat.jayaraman@intel.com>
Cc: linux-usb@vger.kernel.org, pse.type-c.linux@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <2025063018-stunt-hamstring-0331@gregkh>
References: <20250630001556.651826-1-venkat.jayaraman@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630001556.651826-1-venkat.jayaraman@intel.com>

On Sun, Jun 29, 2025 at 05:15:56PM -0700, Venkat Jayaraman wrote:
> @@ -89,6 +117,12 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
>  	ucsi->debugfs->dentry = debugfs_create_dir(dev_name(ucsi->dev), ucsi_debugfs_root);
>  	debugfs_create_file("command", 0200, ucsi->debugfs->dentry, ucsi, &ucsi_cmd_fops);
>  	debugfs_create_file("response", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_resp_fops);
> +	debugfs_create_file("peak_current", 0400,
> +			    ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
> +	debugfs_create_file("avg_current", 0400,
> +			    ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
> +	debugfs_create_file("vbus_voltage", 0400,
> +			    ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);

You can have these all on one line, but not a big deal :)

And what are the units of these files?

> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 01ce858a1a2b..8e0f0289a11a 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1218,9 +1218,11 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  	struct ucsi_connector *con = container_of(work, struct ucsi_connector,
>  						  work);
>  	struct ucsi *ucsi = con->ucsi;
> +	u8  curr_scale, volt_scale;

Odd extra ' '

> +	if (UCSI_CONSTAT(con, PWR_READING_READY_V2_1)) {
> +		curr_scale = UCSI_CONSTAT(con, CURRENT_SCALE_V2_1);
> +		volt_scale = UCSI_CONSTAT(con, VOLTAGE_SCALE_V2_1);
> +
> +		val = UCSI_CONSTAT(con, PEAK_CURRENT_V2_1);
> +		con->peak_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
> +
> +		val = UCSI_CONSTAT(con, AVG_CURRENT_V2_1);
> +		con->avg_current = UCSI_CONSTAT_CURR_SCALE_MULT * curr_scale * val;
> +
> +		val = UCSI_CONSTAT(con, VBUS_VOLTAGE_V2_1);
> +		con->vbus_voltage = UCSI_CONSTAT_VOLT_SCALE_MULT * volt_scale * val;

These will never overflow, right?

thanks,

greg k-h

