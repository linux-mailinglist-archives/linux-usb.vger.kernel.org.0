Return-Path: <linux-usb+bounces-21380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F689A4F8D4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 09:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD54D189275A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 08:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CED1F4194;
	Wed,  5 Mar 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q62L6lOM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DEA1C8603
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741163477; cv=none; b=m6W6+hDWBxrUn/oOoBOCtQ8q3Mum4RHLSXrmrxYCcPMK1v8fx/H5ym2NyFUF7mdKLDbo4ZTMd8KmBrr+O1W1YaQmG4Ze5D2DOS653oC2iOc9gVQqyo+Qxw2nz7IDZiZ01oRHn60Av6hSIsRo+l5U6+IgCz/fDxNFUDDlkLY/SaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741163477; c=relaxed/simple;
	bh=cfNiG+ZHDFCD3IthfVbGMMpx8csQJ+tVDYJf4y5itj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5ys2pIvKlY/DbpsGmdM2VbPWRkWL6/IQ119i/hh7rwp4lc3UMpKuBzwiZ6Qd5AHdzH71OwLBosCHV9xYwSZqyp5bMlQZ7n7tQ9LQ+E3pscrPbuFbBL881hSm4bKSQbwwfKE7DWiOQgy4K0prNiun0xWBIhch9RPf2e0q21bBfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q62L6lOM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741163476; x=1772699476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cfNiG+ZHDFCD3IthfVbGMMpx8csQJ+tVDYJf4y5itj8=;
  b=Q62L6lOMHCS8smRunVEuL0EyKwbzJlTKXtHOETF/GU0+MMPlIf7cv2IA
   kaekzWkH1XaK4MBXMOCyeNTOh098th4kPAxivxjkTScp496SXJyXDVVIz
   I0q7ZBxUi/NxG7tbSj4s9pYmSbfqAikyfDtGD/0Bj2xjTla93pspvd6r4
   0xSBt38ZhcmNFiDEYwdq8YUMqQ4f8T4xaLihGGlJbu42kr8/ht7/y/QDc
   IWeZrmEKn8ZBQhNdcmRrn0VAezmC4djPJIGAj+DWuEabkDkMytc8ZWyvI
   Aw5GL34c8Q0rkoIloAKq5hdl+7aJOgvGq9400S8pUdRSThOauH3rb+WZR
   Q==;
X-CSE-ConnectionGUID: CezXOOzYTyi8Z3b5qgQN7g==
X-CSE-MsgGUID: bQ2B3oo+QKWBxB5RiyKmYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42136453"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="42136453"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 00:31:14 -0800
X-CSE-ConnectionGUID: FK6jX6LBTsqrCP7MN2WTmw==
X-CSE-MsgGUID: efWe6nmkQoW8NzVj7zJ2BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="119115228"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 05 Mar 2025 00:31:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C687518F; Wed, 05 Mar 2025 10:31:11 +0200 (EET)
Date: Wed, 5 Mar 2025 10:31:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kenneth Crudup <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
Message-ID: <20250305083111.GP3713119@black.fi.intel.com>
References: <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
 <20250303175818.GB3713119@black.fi.intel.com>
 <007b005f-a6d1-44a2-9795-036c8f397274@panix.com>
 <48ef4c14-55d5-4baa-b862-f9e7368ed950@panix.com>
 <20250304082731.GF3713119@black.fi.intel.com>
 <14351945-fcde-4088-b7b3-542c6e4b7d0e@panix.com>
 <20250304134017.GL3713119@black.fi.intel.com>
 <7c5ec580-9b1c-40b7-9a8d-64bc95c41432@panix.com>
 <20250304135148.GM3713119@black.fi.intel.com>
 <ae9cfc12-99ba-4c40-b698-e2b12eb22ab8@panix.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae9cfc12-99ba-4c40-b698-e2b12eb22ab8@panix.com>

On Tue, Mar 04, 2025 at 09:29:49AM -0800, Kenneth Crudup wrote:
> 
> On 3/4/25 05:51, Mika Westerberg wrote:
> 
> > > > It only happens if you have TBT dock and the NVMe connected and you
> > > > disconnect them while the system is suspended. I suggest trying that a
> > > > couple times and see if that happens. For me it
> > > > happened pretty much on first suspend cycle.
> 
> So I've tried it twice again today-
> 
> 1 - CalDigit dock, NVMe adaptor. Put it to sleep, disconnected everything,
> even waited a while (call me crazy, but I swear how long the system is
> suspended seems to make a difference). Opened the lid, and it came right up.
> 
> 2 - CalDigit dock, NVMe adaptor. Hibernated, drove to clients' offices.
> Resumed, came up OK.
> 
> Now I'm curious what difference the "4. Authorize both PCIe tunnels, verify
> devices are there." makes to your system, as I have "boltd" running and that
> handles it for me.

It should not matter the underlying mechanism is the same. boltd is fine
here.

Can you try the more "synthetic" way if that makes any difference? E.g do
exactly following steps. Do not connect any monitors to keep DP out of
this.

Also do this first without the latest patch from Lukas so you can see that
the issue actually triggers. Then apply the patch, just that patch nothing
else and try again.

1. Boot the system up, nothing connected.
2. Plug in TBT 4 dock to the host.
3. Plug in TBT NVMe to the TBT 4 dock.
4. Verify that the devices are there (lspci)
5. Enter s2idle:

  # rtcwake -s 30 -mmem

6. Once the system suspends, unplug the device chain.
7. Wait for the system to wake up (it wakes up automatically in 30s).

Repeat steps 2. - 7. several times in a row (say 10).

