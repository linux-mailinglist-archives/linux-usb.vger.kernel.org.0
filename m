Return-Path: <linux-usb+bounces-9054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4889BF45
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 14:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 760711C239E3
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 12:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FF26EB72;
	Mon,  8 Apr 2024 12:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX49XKpK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D602A6A348
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580169; cv=none; b=bbuyGMx5XEtMO5Xc8mJ8bPHbRQZ4b+L5v9hToCwU/jj6WM2RYfH+1+JJ45KhSdckVnU2MDckhlDlcJUgn8QAFsgMB8jTnOpUe305lDY5v7FAzbkOf84PR/PzUALbz3oxB08+ac6Gz2SuK33jnklFtcnzUC7SlUHWjAU4uoeyEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580169; c=relaxed/simple;
	bh=icvpH59xGGaHUczgCp9DlJmaVuJ6t/8ETencgt85cYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAGDdGyjJqaS/zEMmGTC5ZOhhDWp5EBGHGbOq6MfG2DAJiIEi3YbVcz+eUqgmlRDCDvszQLKXctEvgILqmhBokIdf1pMD61pDltp+pmt15ePoH6fYCIrvIOtBBdscfjqm0/HDsMzyIoWUGkvyvSSczuU5hOsoTy9ryde1G4KCOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX49XKpK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712580168; x=1744116168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=icvpH59xGGaHUczgCp9DlJmaVuJ6t/8ETencgt85cYo=;
  b=VX49XKpK9uREjnD654yLQlXHbFiLQOomSHMhfRg/a4//iXrVClE9wXSc
   jQelnZvLBcZ4N/zvL3bWQYNVLUgaGuySVc7KLlpqyHgDFtjGGlCP7mC/R
   f0r64goNmXTfMKUU/uWl0R6bmP1bKj3fV1YRGtSwrA+et3zOxWQoqNItu
   d1AQOh862G0d7etcQWN2T1aemyAjxX1Zr+ztDFcUQXAZK8LHdkTPOBJwF
   1Jub3pICGZPYMwHs1ZPFynolCgZ2bifDJQpZViD6brpr9motncObRFUkb
   d9a+PDbwvMj3D0X0AXy2susF5OSEIiPZDCTKN5g5kL+iqA4uCQ0HLacm2
   w==;
X-CSE-ConnectionGUID: s/5PkWELTyWJsdxXf1K9Uw==
X-CSE-MsgGUID: SztXJhWvSLyx3O3Tcg/jKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7720870"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7720870"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 05:42:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="937091377"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="937091377"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2024 05:42:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1C179194; Mon,  8 Apr 2024 15:42:44 +0300 (EEST)
Date: Mon, 8 Apr 2024 15:42:44 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] thunderbolt: Fix calculation of consumed USB3
 bandwidth on a path
Message-ID: <20240408124244.GW112498@black.fi.intel.com>
References: <20240408123550.4178338-1-mika.westerberg@linux.intel.com>
 <20240408123550.4178338-2-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240408123550.4178338-2-mika.westerberg@linux.intel.com>

On Mon, Apr 08, 2024 at 03:35:50PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Currently, when setup a new USB3 tunnel that is starting from downstream USB3
> adapter of first depth router (or deeper), to upstream USB3 adapter of a second
> depth router (or deeper), we calculate consumed bandwidth. For this calculation
> we take into account first USB3 tunnel consumed bandwidth while we shouldn't,
> because we just recalculating the first USB3 tunnel allocated bandwidth.
> 
> Fix that, so that more bandwidth is available for the new USB3 tunnel being
> setup.
> 
> While there, fix the kernel-doc to decribe more accurately the purpose of the
> function.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Please disregard both. I sent a wrong patch with the first one. I'll
re-send with correct patches, sorry.

