Return-Path: <linux-usb+bounces-28108-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C570B57AC3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE8320292F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CDC3093A6;
	Mon, 15 Sep 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RC6aNjbR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCE308F02
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938909; cv=none; b=DAUJZIWpSwKP8gr32JrSTt5Y8NEVsgIYEqoDPq1TtxY5pV0c5qHelFSYHvsJAyvIAm2o46r5ypYSvBIjcpcNfVFrjqSBO4kBjKjRgmqseCTrWXoZC12VxoEnCffS1gIfJA+h1DgGpUMGj0y46w1Fy89+M2w9C++DVUivrc/wClM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938909; c=relaxed/simple;
	bh=xoowDF8ygL9DB6XdaFOEugHSSvIxHAWVhCdtqTg7/CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czT5Lr2WDw6wvnQ9MbAMWkgS29NuCnpjuVIRVfexXujXrVzCDyIHBmsrRorlDg6Q4K3iR6uPMAyjSWihPe8eq+kwmT8pzh8dWxXg1uWW2BgSwNDbOI7wenoXw/LFvkIrWeWHtzytMCe8csFwARm/nIp6gSXIgSPik+uoeoc+5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RC6aNjbR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757938908; x=1789474908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xoowDF8ygL9DB6XdaFOEugHSSvIxHAWVhCdtqTg7/CA=;
  b=RC6aNjbRMTAYRXysTHHK/C8Wa24S3YeXGnCm27KWqUaWWAl7ma+79kdh
   C8Z0v0O8CnQRvktP48IP1wk5ccBOKk7feNEMwvaSfiUtNEUzS1DxYyY78
   Lawcw6SaWGLR5hfQIWwHg/QItzG13H9tUklI7yAinvtB0ZeW0lKeVwmz1
   7DZgyR4APmmc8c0hsq0wwTKzaF6HtScjK3kfBwYZb5tnRm/wU37xLo40O
   mREP/zxgZTeslYG/qwmi7Xeprl+asc15VRv7sbabdTCHMjcVfCCAJwdJP
   wNuLg495HnvDcBF1beIChw+eeE0gBsxFXAttHJFz+e5YN+h1GRYHjlmeD
   g==;
X-CSE-ConnectionGUID: LGHoANkXTlqzhQCLKnZirA==
X-CSE-MsgGUID: XzkvTdzsRC6MWUuoMe6h/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70806873"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="70806873"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:21:47 -0700
X-CSE-ConnectionGUID: K6bdX1tAT7yslHw47OKE2Q==
X-CSE-MsgGUID: A+QHcTOuQgWJcnCIbQ2eZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="179782959"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa005.jf.intel.com with SMTP; 15 Sep 2025 05:21:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 15:21:44 +0300
Date: Mon, 15 Sep 2025 15:21:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v4 4/4] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <aMgE2Nf6gQj5f6bS@kuha.fi.intel.com>
References: <cover.1757374784.git.pooja.katiyar@intel.com>
 <0b93319351439e9b4adcd9d3ae28c7bc252b7f03.1757374784.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b93319351439e9b4adcd9d3ae28c7bc252b7f03.1757374784.git.pooja.katiyar@intel.com>

On Tue, Sep 09, 2025 at 06:52:07PM -0700, Pooja Katiyar wrote:
> Add support for UCSI SET_PDOS command as per UCSI specification
> v2.1 and above to debugfs.
> 
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changelog v4:
> - Fixed build errors reported by kernel test robot.
> - Added changelogs.
> 
> Changelog v3:
> - No changes.
> 
> Changelog v2:
> - Send message_out data as part of ucsi_send_command.
> 
>  drivers/usb/typec/ucsi/debugfs.c | 1 +
>  drivers/usb/typec/ucsi/ucsi.h    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> index 0693acf04c37..63a5fe791a82 100644
> --- a/drivers/usb/typec/ucsi/debugfs.c
> +++ b/drivers/usb/typec/ucsi/debugfs.c
> @@ -36,6 +36,7 @@ static int ucsi_cmd(void *data, u64 val)
>  	case UCSI_SET_NEW_CAM:
>  	case UCSI_SET_USB:
>  	case UCSI_READ_POWER_LEVEL:
> +	case UCSI_SET_PDOS:
>  		ucsi->message_in_size = 0;
>  		ret = ucsi_send_command(ucsi, val);
>  		break;
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index e6ca70f7fa1f..bdbaaeb1d925 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -136,6 +136,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
>  #define UCSI_GET_PD_MESSAGE			0x15
>  #define UCSI_GET_CAM_CS			0x18
>  #define UCSI_SET_SINK_PATH			0x1c
> +#define UCSI_SET_PDOS				0x1d
>  #define UCSI_READ_POWER_LEVEL			0x1e
>  #define UCSI_SET_USB				0x21
>  #define UCSI_GET_LPM_PPM_INFO			0x22
> -- 
> 2.43.0

-- 
heikki

