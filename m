Return-Path: <linux-usb+bounces-5844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 313D4848C00
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 08:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 115171C216FA
	for <lists+linux-usb@lfdr.de>; Sun,  4 Feb 2024 07:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B10749A;
	Sun,  4 Feb 2024 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0cSFE3T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E848F66
	for <linux-usb@vger.kernel.org>; Sun,  4 Feb 2024 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707033424; cv=none; b=PzZeaP6WgE1Wn1v4y/gARqv9YoNs22n58GDn3LR8gJa8qIFcCbJs+Nxkls4Y3tKj1uiaZ1hRlQPGSD3YpYcCZieSTXQWx5ypx6dd+B0fu93iI4hAwe9Y8bDCE7HhiCCClJ1JKcxKJCYiBFBOO/W3/D7pKxHwCbmWzOoj6dR0ZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707033424; c=relaxed/simple;
	bh=2QZdAeFMRaLsfVycTq9vrMu5DuZCuxZhJIXgxldKuQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vu3nhE1mbQrrJbARt8jyGYhIMh44cZ/lC4rUMtaC7xaUKLPRyaiHqaoQpErM++ZcrMmoHWFhErmXkIen2nHFOHA5hYu7WwbGevJb9E4Cusy74Cn8PKjaeiyFtjzqpBPqVw+QUpkUf9yaKDSCmSlarit0KCX3rVguKIpu2VEnusI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0cSFE3T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707033423; x=1738569423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2QZdAeFMRaLsfVycTq9vrMu5DuZCuxZhJIXgxldKuQo=;
  b=T0cSFE3TF3Zt687Sv3kXQYAxEk7zp87eYF19Unm6MBT+tvAT06D+AlL+
   yXU6Gl6XQMPdu6MWdi+2llcqq3fFa1FQOmKnT5PVjTB8yFeVJKITULivX
   fWNmgsWk5akU09o/OLm/rOY75QDM1yfFV9bvjw72qDmlFkV/s1GgFU/3y
   FDyYlqm+XPyxNlUzHXPzdYsYCYvrDQ/em5y2jeb7XR3eRQG+CGfXFU4aR
   Gakfx4B1vJ/zlWk8FBpiR83/wwnVUrF+LrQGPejF0t2Kfc4Us8reK+kNQ
   bWq4Ri5JXywAp9iEObE/w1FDav9R7wOq1nKk9r05jAGoUylS+Ia1/R+GR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11739955"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11739955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 23:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="909008182"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="909008182"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2024 23:56:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9658BFF; Sun,  4 Feb 2024 08:40:49 +0200 (EET)
Date: Sun, 4 Feb 2024 08:40:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>
Subject: Re: kernel NULL pointer dereference on hotplug
Message-ID: <20240204064049.GD8454@black.fi.intel.com>
References: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl>

Hi,

On Fri, Feb 02, 2024 at 05:47:01PM +0100, Olliver Schinagl wrote:
> Hey guys,
> 
> I noticed this nasty kernel NULL pointer dereference yesterday on
> 6.7.2-arch1-1 (haven't done this in a while) but also today, after updating
> to 6.7.3-arch1-1 it's still there, so dumping the panic here. Hopefully
> it'll be resolved by 6.7.4-arch1-1.

Thanks for the report.

> The thunderbolt gbit adapter always worked in the past, so this seems like a
> regression. Anyway, here's the log.

Can you try to bisect this, preferably using the mainline kernel? Let me
know if you need instructions how to do this.

