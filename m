Return-Path: <linux-usb+bounces-19399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA05A138EB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 12:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855C516827B
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 11:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E0C1DE4E5;
	Thu, 16 Jan 2025 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dmmfyuzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB791DE3DC;
	Thu, 16 Jan 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026802; cv=none; b=rj54STVJgsVnNDOCqGjqkgsCm5K2e0BgdAfMGdexns/rCR4U9cq4Aw9B+MK5lyCF7HDTrx167l36AQhjs+7ol9ep8Hxr3+sSfSpwMYKXlOO+9my2q576Ioh4bgg5OUOWptKpP67w8W+kflI9vc2CT9IHKIrs7OHxQlpknSKfCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026802; c=relaxed/simple;
	bh=FrjtZpyrpZkoOtMA2tMWyt3NzcRmJwyNxY/9Dr85UWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9YbZig3hUyQevcG97cdYgseA/8zYHt4gMqMksS7fDRJi8xL/yvpcsytgk6t0/sWhbTka3dMCYgTqscneqby2ksCY5m/iqTvaFl+qgDeEgYZxIS0Ha22iBrbkY7UanY08xb5t6HlPXCN69sNs4buA8NvK/innL3xiT6znHdjfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dmmfyuzw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737026801; x=1768562801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FrjtZpyrpZkoOtMA2tMWyt3NzcRmJwyNxY/9Dr85UWU=;
  b=DmmfyuzwAsK4HEeZspd/04zactCGmJ3d1vJ3fTnIAcFOYlWkxvjGcihx
   XlhRm+BJDdP4LXl8ltQ27PM84ndc2UO/JMWkRsk38uhP/bvCu+iXEtGdR
   Us5bqrF7mgVmbuGdviokgFP2Jc2luR5pzMb9NgWl3FL5Utd7ZVWkzcqvI
   1g2n3Ue5o8dSWEWJ1yJcxi2bmnsY2SzXMFJ8TPiVleJu1Zi1y3yD2Bh4u
   bUGs7U8AX4PxCKib5ahkBRZmtkjD9bbgAyGKVs4riAS4Flv/QrfWIk5Cz
   ruNxdr3ajp/tdOIQHH2BQtLPquCyYHBULG9mLr578LBsBbZbV2KKDWhJR
   Q==;
X-CSE-ConnectionGUID: UJmRXocBSG+GBd2E7/HmgQ==
X-CSE-MsgGUID: EtuEwpjsRrSbhGhJVmo2eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47996408"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="47996408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 03:26:40 -0800
X-CSE-ConnectionGUID: AqNM69uoTr6BlhSL/RW++Q==
X-CSE-MsgGUID: abKR+rO3S4yV51KHLPSK/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110440682"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa003.jf.intel.com with SMTP; 16 Jan 2025 03:26:37 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 16 Jan 2025 13:26:36 +0200
Date: Thu, 16 Jan 2025 13:26:36 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] usb: typec: ucsi: Add a macro definition for UCSI
 v1.0
Message-ID: <Z4js7DWtPXogyUKS@kuha.fi.intel.com>
References: <20250113174945.590344-1-mitltlatltl@gmail.com>
 <20250113175131.590683-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113175131.590683-1-mitltlatltl@gmail.com>

On Tue, Jan 14, 2025 at 01:51:25AM +0800, Pengyu Luo wrote:
> Many platforms from Qualcomm(before X elite) still use UCSI v1.0,
> part of them hardcoded the version number to dsdt, add this for them.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 5ff369c24..82735eb34 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -30,6 +30,7 @@ struct dentry;
>  #define UCSIv2_MESSAGE_OUT		272
>  
>  /* UCSI versions */
> +#define UCSI_VERSION_1_0	0x0100
>  #define UCSI_VERSION_1_1	0x0110
>  #define UCSI_VERSION_1_2	0x0120
>  #define UCSI_VERSION_2_0	0x0200
> -- 
> 2.47.1

-- 
heikki

