Return-Path: <linux-usb+bounces-9630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB58ADD2C
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 07:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38B6C1F22D13
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 05:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C05820B33;
	Tue, 23 Apr 2024 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G//IdxUT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C863C8
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 05:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713850602; cv=none; b=PwyRYRnvW0UuvIgsQinGnnT6lu9iqqu2JFVrLP9EIgLmZ76rYPpU2GPIu0tDmOO4pDlTc+VPdRMZ6AnkfLfFRdgB4zGr2tX6QvHVbTsm7vN8k6gfXDqQVLqfl1n1mHNe93HYuLTd33temjWglc76349djjsO5aYrNWKallH4UWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713850602; c=relaxed/simple;
	bh=Bt1l5pc78BH7OMkTzWAem+Ziy10LCZ6ozvh7JNYvI68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI0SvmLkbIqsgur3H9V+4JRfOwizmOS5k0jtO1pwD5OlptGsUNjvY99m4JrXQB1z3MjmS1/7C0q+qardOMBY84iYyW/8zW6xjOv6CD62BnsZDmZ822UDw/hVCjcN4PHHxXVgN2Ftvr8Yj2dzLz6r3z+qxd+oyhRJAIOqS6I44p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G//IdxUT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713850600; x=1745386600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bt1l5pc78BH7OMkTzWAem+Ziy10LCZ6ozvh7JNYvI68=;
  b=G//IdxUTTlFQtSI9hHoeii71i/cK8m4qUxQ0IKa1pzbr8Z2gttAndbdy
   NTkoVGo5P/TRUHVdWRWnVHZDqKI+hf99hfcN24pSi82rtSN75V3a8gPko
   KBrTYuv22OO9e9wZ9hZt4p3LAqUN2x7B2s6nz3rfEyWbEXAcdfbp+OWZR
   IdMIeqhM+x01nE1gSwoBpkI20YTZmWY2EzPSpda4DAfr6Aq/kRVimIeXv
   YkZyWb7cmD3RGKqY6mW5oB5AYtSIoD5eqCWdvh+KnrpyavQuc7+X90bOw
   R9oqUO7gKCF+33i+B49nhEdcKl4rHcKJVcrFrCZ0Ial20zjZgKMycWgyX
   Q==;
X-CSE-ConnectionGUID: +jJ+K8zgRzKDlhiHNqfVFQ==
X-CSE-MsgGUID: SMb3U6drQbqqzk46+0yKgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="20027711"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20027711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 22:36:40 -0700
X-CSE-ConnectionGUID: B5a2vGitTtGkyztksgvSqQ==
X-CSE-MsgGUID: y8ixn7NsSa6wa0mUWeHpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="47531246"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 22 Apr 2024 22:36:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EF982192; Tue, 23 Apr 2024 08:36:36 +0300 (EEST)
Date: Tue, 23 Apr 2024 08:36:36 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [ANNOUNCE] Thunderbolt/USB4 debugging tools
Message-ID: <20240423053636.GZ112498@black.fi.intel.com>
References: <20240402101020.GP112498@black.fi.intel.com>
 <2024042110-oat-juicy-e599@gregkh>
 <af511b0a-f87c-4168-8f46-8d471a5c36ec@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af511b0a-f87c-4168-8f46-8d471a5c36ec@amd.com>

On Mon, Apr 22, 2024 at 09:36:24AM -0500, Mario Limonciello wrote:
> On 4/21/2024 05:27, Greg KH wrote:
> > On Tue, Apr 02, 2024 at 01:10:20PM +0300, Mika Westerberg wrote:
> > > Hi all,
> > > 
> > > This is mostly for the folks developing and testing Thunderbolt/USB4
> > > driver side of things but may be useful for others too. Not intented to
> > > replace anything we already have for the regular user stack.
> > > 
> > > In summary this is a collection of small tools that provide bit more
> > > user friendly access to the sysfs/debugfs/tracefs interfaces made
> > > available by the driver. Mainly useful for debugging issues around the
> > > software connection manager parts of the driver (although some of these
> > > work with the firmware connection manager too). We have been using this
> > > internally for a while.
> > > 
> > > The repository can be found here:
> > > 
> > >    https://github.com/intel/tbtools
> > > 
> > 
> > 
> > Very cool, thanks for the link!
> > 
> > greg k-h
> 
> Yes, thanks for sharing!  Is it worth adding a link somewhere in kernel
> documentation to make it more discoverable?

I can't think of any place where this could belong though since this is
not meant for ordinary users (so I guess admin-guide is not good place
for it either).

