Return-Path: <linux-usb+bounces-16937-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D49F9B8D25
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 09:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13668284104
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87741157E88;
	Fri,  1 Nov 2024 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDbnmGTn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7EC156F3A
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 08:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730449922; cv=none; b=irkqrnqFPDau7egh/WLVR9cpcZVUYH1v/vY0Pef3vX7O6Ryq9Rlr77wAtPZqjO6f1bCbnno+tbqDLH4PEmXil9Z0KBpe30SLfqjoNP81tzBZQYtqDE+Rxu3YMFXEPgmmDA5bAJS2cqMjypIZdsrC0bnX8vGlzHBxoKkUHYsrZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730449922; c=relaxed/simple;
	bh=+PdfFUFlEmuCVtSEl/wzcsx9ncmb+tYAugykqaQDhGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NrC7TpcfIC97pWaYWJvo+1Ky9xm2A2+4fLf/TwwgQi2Z/JWE2itvFgrZUIEwISvQP+aja799lQ9Lp/W56VT61pYF9XhEkvDfpp4FVyQX/3m3ovdcj/B8z015izuSam2cxsSSbcIPUqHj+XD8G6RLue2TNm5bN7ExA3Byso46yIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDbnmGTn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730449920; x=1761985920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PdfFUFlEmuCVtSEl/wzcsx9ncmb+tYAugykqaQDhGE=;
  b=aDbnmGTnXndJ5/ZT4RH6G+pxm4NDBT2DlasxpeNwm9TWpgsq9ystvc1L
   JRinJsW+OItHBLTMC1+TlDuY0J+P2cHdhF6pVmtfpyNglgf5xmqWLsKi0
   eiQymRGM5ie5Ve4t/Ig05MJ+rkzq2XM9Gb5XOfdOQ3fnly97gVzD9InHh
   2i1FyZlUOdHS9miENgEPwS/lKZZN/FEW6X1xz+4GI84KiLahqU3amjwqX
   9vDJYNSS/8tiAhIgnBAiISLasR3TjP+R0Ok2o0eaidyBHt0vf2ojuiJeN
   YE42GyU+CpanXQ+OvD6u38l4Tmsxkj8iBguB3Z0V3b6aIGeqnJqjKZz5V
   g==;
X-CSE-ConnectionGUID: kgZBSRWvSNqBCH2gi6q56w==
X-CSE-MsgGUID: DFIW0OubTFeFQAAQB9tdwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30427764"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="30427764"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:31:59 -0700
X-CSE-ConnectionGUID: UHuZEVjqTEOp+Ijp9rkkpA==
X-CSE-MsgGUID: j8t/sScjRb+18vFd5AwzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87443662"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa005.fm.intel.com with SMTP; 01 Nov 2024 01:31:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 01 Nov 2024 10:31:54 +0200
Date: Fri, 1 Nov 2024 10:31:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Bartosz Szpila <bszpila@google.com>,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: ucsi: Convert connector specific commands
 to bitmaps
Message-ID: <ZySR-iYLCZLLZFah@kuha.fi.intel.com>
References: <20241031154122.2641624-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031154122.2641624-1-heikki.krogerus@linux.intel.com>

> +/* Helpers to access cached command responses. */
> +#define UCSI_CONCAP(_con_, _field_)					\
> +	ucsi_bitfield_read((_con_)->status, UCSI_CONCAP_##_field_, (_con_)->ucsi->version)

Pooja noticed (off-list) that I forgot to fix this part - "status"
should be "cap" here. Thanks for cathing that.

> +#define UCSI_CONSTAT(_con_, _field_)					\
> +	ucsi_bitfield_read((_con_)->status, UCSI_CONSTAT_##_field_, (_con_)->ucsi->version)
>  
>  /* -------------------------------------------------------------------------- */

thanks,

-- 
heikki

