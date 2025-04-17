Return-Path: <linux-usb+bounces-23186-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CECA917C8
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 11:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B8093A6F3F
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 09:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5C1224AED;
	Thu, 17 Apr 2025 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIki+3PX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885117A2EB
	for <linux-usb@vger.kernel.org>; Thu, 17 Apr 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882069; cv=none; b=uuUQYfnId8DaZ/LsqT8E/VREzoRLY+wvaFZwORJjvNAbKran8HVFfTuPqUrjXn0qdepqkNY17Xr4FKTVR1T+NgvOOIX3b6yUAi27vYq4PSBzZgI6UCBU3JkIR0TkjRg9XRPfAgpXnyxVNY1KlGFLwejSQFL3/JGvj68VYTSt1kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882069; c=relaxed/simple;
	bh=/QAGtQWu6HUNDfHjZmCJjq/Wf9z1irHinud6H+tA9ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQY28RR9ZRrvM0zx7ElKMHOAgPXe5bq5iNrOlCDxEe9HKEHus2KRXX7kbEVI7TI2lITTW8t2f1Q+udk4tL/MU1WJWfbZIJo52UbUG38aQ6iFbe5p/rNfl/i6ZoBEUCELjhD85/IIwl1BY4DLsvDKU3YhZRP+0BaKWKiOMOigO5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIki+3PX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744882068; x=1776418068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/QAGtQWu6HUNDfHjZmCJjq/Wf9z1irHinud6H+tA9ac=;
  b=jIki+3PXKSKTIXcOC/3NmKGVKh6x2VNGOi+TiVi/p1mjLb6AHT2+HIXF
   Z1/e39bSDssIDfSDVfPuJK51J7Uon+myacilplDcXCdtdsXlSItUE/q86
   LSOOrueIA6ouPubeR3w5ztVebSh7wtOWmY8teqsCSSl1AyxkbWzYtWPWB
   zaBkzR5okL5pnncWmP2pIQ8WiPkbFLKIE15yWMrVPTs2pRRO/O0pV0Szz
   y6WMcpml8y262stG/YghVyHdvqdUm9ePknaD+wT/lkezmjdARaVF9QPQj
   xDQaBUkL+xGvL8MYEbqvAZSITYKYHd7MuaMuF6YmjgwL3TnrZILhUmKus
   w==;
X-CSE-ConnectionGUID: LpCafyyaSIWT6KXw3/T8aw==
X-CSE-MsgGUID: tadZ/+17Q32Y06W7Aimy2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50269307"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="50269307"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 02:27:37 -0700
X-CSE-ConnectionGUID: 85qkjxcXRLWlSkRSSsGrRw==
X-CSE-MsgGUID: dCvbfXF/QMSGjUSRrl7x3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135718336"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 17 Apr 2025 02:27:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7471771B; Thu, 17 Apr 2025 12:27:34 +0300 (EEST)
Date: Thu, 17 Apr 2025 12:27:34 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <20250417092734.GB88033@black.fi.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>

On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> Hello everyone,
> 
> This patch series introduces the creation of symlinks between
> Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> primary goal is to provide users with clear visibility into which USB4
> port is connected via a specific Type-C port. This provides the same
> functionality that is already present in Chromebooks.
> 
> Alan Borzeszkowski (3):
>   thunderbolt: Expose usb4_port_index() to other modules
>   thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
>   usb: typec: Connect Type-C port with associated USB4 port

All applied to thunderbolt.git/next, thanks!

