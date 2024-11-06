Return-Path: <linux-usb+bounces-17221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15F19BEF14
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 14:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F45B1C2341F
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 13:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6123C1F9AB7;
	Wed,  6 Nov 2024 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwjXplGg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CEC1F9AA4
	for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2024 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730899984; cv=none; b=oKls9x6V0+JnC397Kd6PeaFUIsu2OYxZtREJVULVhLkweutawxFNqI+Ya7bD3MWG8heNC8Ic+Hv+RVnT+pdtt6AVmsKDwRd0y4oZlddMi79mGH07FDeqQijc20ybpV8D6XoSUmy6lnFwtKfUytTsfvDEVvAux/PYvR/S9iPHyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730899984; c=relaxed/simple;
	bh=zV1KdjgKCfLsyQjLdnKjdRQJ7pj0rrrcFmfPnx3r8CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRd1p2hDtRR6xN4T6aMsXwcKcDny/fy/ZSAqAxNx/Y94ZTPkS8y/yztLiElw0SXbVcTNDuL9thDKRopHmc92TsfV+UPN+vapmJ8WHzP3Q2Ohtix341hDW67l5rIcGpkSue73B8rZQLX1rOyMM/Us//ikHMVgtzmxfCnmDxtwV/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwjXplGg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730899983; x=1762435983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zV1KdjgKCfLsyQjLdnKjdRQJ7pj0rrrcFmfPnx3r8CM=;
  b=nwjXplGg+8pKGbCuK7T3BglEb3JbovXJ7sg1bs2xZ8vP0tCm7lH5tzz9
   xDbHvu+TTpeIFRhxxO6XSbOvVnHGvhO2ufOFWowcMKaQ+HWSDACptDCEx
   VLKiBqevoUHYkZjrEDYKezWOLCnU1NxXM5B9q+VZ7XGxP2x9fjmBYPFwu
   Lb9GxNvdw+/2XU2J6oMDAZs7lsDl2k+em6FM3zTnYFaZFcnPSrL1KCAfU
   zDmdVH1drUGQ636vc3IzsBne+VTuve63aPTd49CICDYkYMxskdYK7n17b
   3Jp/XEZ6qAmiPMp1GK3dqBl74tAm3ddB0vMdt+h11I4/XNUUyX8cHZDC+
   A==;
X-CSE-ConnectionGUID: ILnMu934TVWvUUrjJJDqig==
X-CSE-MsgGUID: 2fdQ3YQCSG269lQGEFj0cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34395434"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34395434"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:33:03 -0800
X-CSE-ConnectionGUID: YOY2PdFvSHOZs+X9Cl92Qw==
X-CSE-MsgGUID: Ia8rmK/bR4u2WAlUjEIriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="89127012"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 05:33:01 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EFA6D11F9C3;
	Wed,  6 Nov 2024 15:32:58 +0200 (EET)
Date: Wed, 6 Nov 2024 13:32:58 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <ZytwCjFd93GTgtav@kekkonen.localdomain>
References: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106123438.337117-1-stanislaw.gruszka@linux.intel.com>

On Wed, Nov 06, 2024 at 01:34:36PM +0100, Stanislaw Gruszka wrote:
> Do not mark interface as ready to suspend when we are still waiting
> for response messages from the device.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

