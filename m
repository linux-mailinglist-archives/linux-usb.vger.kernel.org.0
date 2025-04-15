Return-Path: <linux-usb+bounces-23068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73200A8980A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 11:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ED103A5CBC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 09:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DCE27A936;
	Tue, 15 Apr 2025 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZUk4v+G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD41AD41F
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 09:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709538; cv=none; b=Tcf8gkJHUXACL20N6upDPBuXfrRAtWEznzwR8UDln+bnGjKPCI9BuQwnwwBl1Lw1yXfmBG+l5eRXNx+8Dj5ptUqwNYEQXDOBim1oSxNQqxg3BgIwi/TDgUQy/D9shbdp49PqEYviCL9IYzgSn6CrTYDFSCxY/EY5y46XslcwDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709538; c=relaxed/simple;
	bh=NejoJ+orAluVJiftRHZPpZ/2hNnuflANS4za720ZjxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTD7HVbOlGWOUQ0AsWUmKL8TfTu1OT+htIgd/hsizJ/WH6/yi9n+4iULw0h86Ejx3G/+y92IKlyAVXlirT7xLXCo3Fbn8OtMXOr2toPG+8KH6dzV1LOHv6EetqYvj0E+wuQc3i361p8OGEwqUP+RgSokI+WZx8iwDonyI0DKOS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZUk4v+G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744709537; x=1776245537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NejoJ+orAluVJiftRHZPpZ/2hNnuflANS4za720ZjxU=;
  b=YZUk4v+G/2nJLg/ruvjwfhg6BaRmmO1LOh38+1d14dubZpCr2/M/Ss4u
   VJpMlHgM5UeYxKan3defqemnFVUuE1BXikfybCUpLJrcRrUcBOdP9i2YF
   gXoE9sJze5lJvpcJZqqjQekwZrQ2WS8PUV8lbi+Fye750OkJZyUgOYnbp
   Ep264Gja7U3MAPE5Yzpc7WNHOz+c7M2ZvTT3k5DfGS4YRleZCrpb7is8/
   aj0SnBSRc92dMh0FSrJRdjGm/zvoH+lcmHXYNidlqeiB6VmKh63Sp0HOn
   bmGgNAi7hSy1Lg8ACQTNy+I0TKgMSVSK+GzArYu9cogbwR9kz3Ln+dHXK
   w==;
X-CSE-ConnectionGUID: FdCxYKjmSvCAnSDqY7mu1A==
X-CSE-MsgGUID: lIbRbh7xRjGyTC7bTqDhDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46124825"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46124825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:32:16 -0700
X-CSE-ConnectionGUID: jxf+a6eYQvGZWr1YMQah3w==
X-CSE-MsgGUID: hNBKzrykSoeViY5fvkB7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130074605"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 15 Apr 2025 02:32:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 15 Apr 2025 12:32:11 +0300
Date: Tue, 15 Apr 2025 12:32:11 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com,
	andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <Z_4nm3x6TvgkO4Rl@kuha.fi.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
 <2025041421-snowbound-lullaby-3450@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041421-snowbound-lullaby-3450@gregkh>

Hi Greg,

On Mon, Apr 14, 2025 at 09:03:42PM +0200, Greg KH wrote:
> On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> > Hello everyone,
> > 
> > This patch series introduces the creation of symlinks between
> > Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> > primary goal is to provide users with clear visibility into which USB4
> > port is connected via a specific Type-C port. This provides the same
> > functionality that is already present in Chromebooks.
> 
> "mapping" in what way?  sysfs links?  If so, care to add
> Documentation/ABI/ updates?

It is already there:
https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-bus-thunderbolt-devices-usb4-portx-connector

The link is already created on Cromebooks like Alan explained, because
there each USB4/TBT port has a device node in the ACPI tables with the
appropriate _PLD (Physical Location of Device), but on systems
targeted primarily for Windows, that is not the case. There ports do
not have device nodes, so we can't make the link based on _PLD.

This series makes that same link by taking advantage of the
"usb4-host-interface" _DSD device property [1] that we always have on
those Windows platforms. That same device property that we also use in
drivers/usb/code/usb-acpi.c, and probable some other places too.

[1] https://www.usb.org/sites/default/files/D1T2-2%20-%20USB4%20on%20Windows.pdf

thanks,

-- 
heikki

