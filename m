Return-Path: <linux-usb+bounces-10727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030048D5F82
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 12:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3A3A289D6A
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2024 10:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D096B1509B9;
	Fri, 31 May 2024 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OP37va8i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A013D63E
	for <linux-usb@vger.kernel.org>; Fri, 31 May 2024 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717150832; cv=none; b=ShINuY1rpNVggDUyuqbEh++j4zby4BNeC7+HE4VGb854ydkNWwObikRZbgH51BpKRjwVisRvkwthvFvqQ95PEtmZgzhDnxPFC1gc3LdXTu8HqLD5poBgtE0iRU10hMVuG4r5KPaPp0SySbHQIe/wpHqr47GqnuZlNdMB/gvx5W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717150832; c=relaxed/simple;
	bh=2AT3NamIbzRa3+JouCmebSQL52V3CP0OjXaqVgGXfeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHYSjj9TdvkqqYRlEIqAFkuPPlvtdCWJAAoiF15tyU/r/u7+YpuaUXqEjtGse0DpYMx6+8HYv3922qG7msHz2XnebpDB/yGH2SbtregP1Wdkm0+SSJVItGNzuI9Jpkol7E93H5oEliyy4AJcx3jTjKTZGcbCmjjxBK8hCOZEwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OP37va8i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717150831; x=1748686831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2AT3NamIbzRa3+JouCmebSQL52V3CP0OjXaqVgGXfeE=;
  b=OP37va8iGh6oBTC/XMtFes7qwkgakJbW967GbeKoTgs7G3m9P5T2dFXn
   2F2/WvXw/re9lGCsnQOk2nIeGN9krl9SG3mYMEObSRX/Y9G1zjKxCIhOW
   QBO5Wq7XrET87ANEQBVm0vHDCCsHb06CtzuInGeog3/hXEQnINXGEDgxy
   MeeXEIZN2kgjDbApLuhAB/h+cMwySI4XlqVpF/RO2l4bl2OGW4BQzBW4r
   f00kYkNDltvMCHlNpu9NLV3nOLOT5Sx9jBsRQF5F34WDhxmU6fs4ULjkq
   Y2PtDW/glYHa23LTXfFEn4stUDFvhXdPTy33gJVy87nV+XtIT5dfNZrpg
   A==;
X-CSE-ConnectionGUID: 4kDGSbAyT1u7UPv/FjCvfQ==
X-CSE-MsgGUID: oX5b1qxQRc+CNwZxI+pKTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="16636289"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="16636289"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 03:20:26 -0700
X-CSE-ConnectionGUID: 3Y7i6EkHRl+XU6YhUXSXSw==
X-CSE-MsgGUID: r4bNJymnTXqEkeo2aZjaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40680910"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 03:20:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7C04D1A3; Fri, 31 May 2024 13:20:23 +0300 (EEST)
Date: Fri, 31 May 2024 13:20:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] thunderbolt: Mention Thunderbolt/USB4 debugging tools in
 Kconfig
Message-ID: <20240531102023.GC1421138@black.fi.intel.com>
References: <20240529125038.1051641-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240529125038.1051641-1-mika.westerberg@linux.intel.com>

On Wed, May 29, 2024 at 03:50:38PM +0300, Mika Westerberg wrote:
> This allows the interested parties to find the Thunderbolt/USB4
> debugging tools (aka tbtools) easier in case they need to look at the
> information under debugfs entries.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Applied to thunderbolt.git/next.

