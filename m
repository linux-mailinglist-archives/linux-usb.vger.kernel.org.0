Return-Path: <linux-usb+bounces-19804-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424BA205C9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 09:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62D18166A87
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD2A1DE8B8;
	Tue, 28 Jan 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heokINVi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2918BC20;
	Tue, 28 Jan 2025 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738052253; cv=none; b=OQw/PiRXd1P42vMDlb16KNPPDTx7LbW/9SQggnehBqadB6GnODofCruiQHRPKXXswrxLO/wHgNwPXXjP6kZVJwEreHp5dHYGnpxAPFIhO2rG0famBoSg3IupeHhpSGiX8muNYrNcgTTW5SadN8jHT5Fma/Oi24itRbhpFD39h4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738052253; c=relaxed/simple;
	bh=KAXJdugDc/vcJie95lmmCOy3dYfDNiYjuMwMjXvkvIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGosx1QbCVHcXWX0KtCcCT04b52QawAwTFCbr8HQTtzh7apFuHNgSvszbEFlIMFv1mam+UB9ebUhrGdSK34whvh2aZcY5KK7hQKUTd8iMoa/UBfwREn4/5m5O315/vYe89WnWievbllRpqN8DA5CdiKRnsiAhaso9jve7TW2z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heokINVi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738052252; x=1769588252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KAXJdugDc/vcJie95lmmCOy3dYfDNiYjuMwMjXvkvIY=;
  b=heokINVi8a0lp7bilVrAYyB0i8q3e7jfBSwPC61cv4lkWmGVE6hLlRXA
   jIOoPyZ0llXQ1V/qwdhNx0EnEMHdRG9X44W9F7Pk4FVIe+R1NVFHl+Wtb
   +JcDk12q+XP41+Vjf8kmdvI4DTT+Tz/bjsGa5spFmq/dwziP2CycVO9HC
   HQxdsJafCreyEKl3fchyBOT2w0VIs58IblrhALcCM2zKNRDtCOSPFyNjW
   OaZOzYLTyA3aGScXyTw0JSoXs0NZTSi7/BpiqMMGY68rnNP6TBF1e4k09
   etO38KVedb3Mkzr1NPSZmmVRpUOPQzUTBfu6u4bSFfCfS05/5YYfMhGYH
   w==;
X-CSE-ConnectionGUID: huO6qwO0SWGHGeweeaEwZw==
X-CSE-MsgGUID: Z3n3ux9MTUSljc3cFD/CJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38776583"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="38776583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:17:32 -0800
X-CSE-ConnectionGUID: EFn83TVzSwWBm+JPb5SfvA==
X-CSE-MsgGUID: ZIPKxcaVQCCEfH0FXB48wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131967779"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa002.fm.intel.com with SMTP; 28 Jan 2025 00:17:28 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jan 2025 10:17:27 +0200
Date: Tue, 28 Jan 2025 10:17:27 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Benson Leung <bleung@chromium.org>
Cc: gregkh@linuxfoundation.org, abhishekpandit@chromium.org,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, akuchynski@google.com,
	ukaszb@chromium.org
Subject: Re: [PATCH 1/2] usb: typec: thunderbolt: Fix loops that iterate
 TYPEC_PLUG_SOP_P and TYPEC_PLUG_SOP_PP
Message-ID: <Z5iSl7Nj5Nzpj4rV@kuha.fi.intel.com>
References: <Z5Psp615abaaId6J@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5Psp615abaaId6J@google.com>

On Fri, Jan 24, 2025 at 07:40:23PM +0000, Benson Leung wrote:
> Fixes these Smatch static checker warnings:
> drivers/usb/typec/altmodes/thunderbolt.c:116 tbt_altmode_work() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:147 tbt_enter_modes_ordered() warn: why is zero skipped 'i'
> drivers/usb/typec/altmodes/thunderbolt.c:328 tbt_altmode_remove() warn: why is zero skipped 'i'
> 
> Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
> 
> Signed-off-by: Benson Leung <bleung@chromium.org>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
> index 1b475b1d98e7..94e47d30e598 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -112,7 +112,7 @@ static void tbt_altmode_work(struct work_struct *work)
>  	return;
>  
>  disable_plugs:
> -	for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +	for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
>  		if (tbt->plug[i])
>  			typec_altmode_put_plug(tbt->plug[i]);
>  
> @@ -143,7 +143,7 @@ static int tbt_enter_modes_ordered(struct typec_altmode *alt)
>  	if (tbt->plug[TYPEC_PLUG_SOP_P]) {
>  		ret = typec_cable_altmode_enter(alt, TYPEC_PLUG_SOP_P, NULL);
>  		if (ret < 0) {
> -			for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +			for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
>  				if (tbt->plug[i])
>  					typec_altmode_put_plug(tbt->plug[i]);
>  
> @@ -324,7 +324,7 @@ static void tbt_altmode_remove(struct typec_altmode *alt)
>  {
>  	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
>  
> -	for (int i = TYPEC_PLUG_SOP_PP; i > 0; --i) {
> +	for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
>  		if (tbt->plug[i])
>  			typec_altmode_put_plug(tbt->plug[i]);
>  	}
> -- 
> 2.48.1.262.g85cc9f2d1e-goog

-- 
heikki

