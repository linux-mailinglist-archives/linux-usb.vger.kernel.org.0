Return-Path: <linux-usb+bounces-17939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1F19DB9DD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 15:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DE34164740
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2024 14:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 549F4156661;
	Thu, 28 Nov 2024 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxtkaT0v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DCD2233A
	for <linux-usb@vger.kernel.org>; Thu, 28 Nov 2024 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732805189; cv=none; b=VFm/flxwBMPVwVsoNxY5iig9DOgieP1v2o3LzbmNys2Qpf8DWvb0zWh5/70n+dHuQP57uvaX4ipKUaG7tAJdPYwDebDIX8Ew4pVz0GCeki0T8jp+obad1vOiNdRREevyiMhATSf7pmeP+gEbRHHca98Jsi30s4h80+c7hPvRsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732805189; c=relaxed/simple;
	bh=dm+H6duiKZ1ALxKoVK3GAQQ7hN4dp0ZpY/FeLJZA0d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOisPM3Wmyd7N3UIPNAaY8I3vyf/fuXDyhVB796GXz4258Fc36i5vL6Y3aVM2Sn4z0QoSZScTi4rsV5kNscin+PbM+lghW7YhqjsVBbPAe4lokMbvpvtIcYnFOrMD9BY56YnlztEBCex3Fb/qXyQxIj3UsJDjBjv5zewg1YbTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxtkaT0v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732805188; x=1764341188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dm+H6duiKZ1ALxKoVK3GAQQ7hN4dp0ZpY/FeLJZA0d0=;
  b=KxtkaT0vD71eZbo2PjVxk/sBEmh2CPSEfR4SUCtRGKFnj/WLNs4Xxm1T
   w6WnWutVsa1Tz2ti4P3ZjFQE1yw5V1WXL98v3W7Z9YgJVJDK5tRU4XR5H
   bCVQQiu+azGxKwgkitiDzceEzHvkv9rg+QcUCOOsccmzatI1cFv6YXqtA
   JVnnKQecPtymv+AnWMtm/cIVNk+IcyExQhM7XKtKmBm7L3sSPfo/mS+1z
   8EfgaViekKBgxwjbtnV9Sn12MLlThzRzsCsvB8A5M2Qz5l89TpQzs4y5G
   fJEmPWsQQd39GKvNj3Wf0K1OGUjeZorcSighDx44R/sVXFbJbt1swCKEd
   A==;
X-CSE-ConnectionGUID: s2tn2Mp8TN+I/GVOrwHn0w==
X-CSE-MsgGUID: ouNfkupjSza6Vv186Y3pvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43529529"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="43529529"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 06:46:28 -0800
X-CSE-ConnectionGUID: nM5wbWuuSmaje/cHbTB9fg==
X-CSE-MsgGUID: RMdJQHu9SRyn7//9a6cjow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="97014315"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa004.fm.intel.com with SMTP; 28 Nov 2024 06:46:24 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 28 Nov 2024 16:46:24 +0200
Date: Thu, 28 Nov 2024 16:46:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v7 2/3] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <Z0iCP_2RM-c_yvU1@kuha.fi.intel.com>
References: <20241115155234.1587589-1-ukaszb@chromium.org>
 <20241115155234.1587589-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241115155234.1587589-3-ukaszb@chromium.org>

Hi Łukasz,

This LGTM, but since you'll send one more version in any case..

> +/*
> + * Maximum time in miliseconds the cros_ec_ucsi driver
> + * will wait for a response to a command or and ack.
> + */
> +#define WRITE_TMO_MS		5000

s/miliseconds/milliseconds/

thanks,

-- 
heikki

