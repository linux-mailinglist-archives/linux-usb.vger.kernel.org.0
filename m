Return-Path: <linux-usb+bounces-7043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94258866A81
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 08:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 215E7B20CEB
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E171BC5C;
	Mon, 26 Feb 2024 07:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NobYc3hn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17451B80A
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 07:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708931610; cv=none; b=rUXU8K4GO3TUrVFUmz2jBCwpmu4x6d1KEKT8ADD4BNKS9QC2RjRgT7IURMCHLfjV0O3BuPI/NqZJe5Gm9lH7kOjP3c0SH/HwAilJDyleVwPLvYREhEN3dLeRscKZVKdFiKYSB0c2YYP7JXTxi1oMTHAkzl2ra/t/HSb82h474F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708931610; c=relaxed/simple;
	bh=18tEAyGV3qlGLWv80/mHDYJny0BlJbc/Wq3tz3XupzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/KwPru58nqFII3XI/BLmTmD5xZZgXiFVJ66h3K/f6FK+woUSLArEhnNnqZsmB17qdpArvQStePVIOeHM0IpSpJjPxp+HY8bYibxiP5rhjpGPYmClixt6L3OHBydw0aWdI8b4Pzq2+flkeLdcvSc+YdI8+RIA0IjV80UqxT7SkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NobYc3hn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708931608; x=1740467608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=18tEAyGV3qlGLWv80/mHDYJny0BlJbc/Wq3tz3XupzM=;
  b=NobYc3hncNIVN7ILwBeDNkVb6frIL0sOpycW6Z8Q0N/GhPWQwTZ22DeD
   llAGS58p2lHEWQil7+iUV2NnXRLVr/hriPYB5LFSJ57K++6W0D7w791Tw
   eOidtBwgvkPPexEJGs7zkF6BgTeAvx7ABiW540e6zSEEKW6r4JCiGCgYO
   ZXPo22MMDpZ+ffq9djy4s3pJLKVwxwVdWTSNvOSUKpME+3DWmVimN6sfR
   GIlTEndthV7VkbTI4knCeUc+b+KP3SZj0Kyy4/7VhubwtBQ359zX/NZM1
   jjRWXhjCaav/uZMjvJldiVn1JBjnnN58+05a3PwPxjP82WJWnCBN7+xLs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3363449"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3363449"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 23:13:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937029352"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937029352"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2024 23:13:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5D7DF48F; Mon, 26 Feb 2024 09:13:25 +0200 (EET)
Date: Mon, 26 Feb 2024 09:13:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Keep the domain powered when USB4 port is
 in redrive mode
Message-ID: <20240226071325.GW8454@black.fi.intel.com>
References: <20240213114318.3023150-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240213114318.3023150-1-mika.westerberg@linux.intel.com>

On Tue, Feb 13, 2024 at 01:43:17PM +0200, Mika Westerberg wrote:
> If a DiplayPort cable is directly connected to the host routers USB4
> port, there is no tunnel involved but the port is in "redrive" mode
> meaning that it is re-driving the DisplayPort signals from its
> DisplayPort source. In this case we need to keep the domain powered on
> otherwise once the domain enters D3cold the connected monitor blanks
> too.
> 
> Since this happens only on Intel Barlow Ridge add a quirk that takes
> runtime PM reference if we detect that the USB4 port entered redrive
> mode (and release it once it exits the mode).
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

