Return-Path: <linux-usb+bounces-10774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1598D7E0D
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 11:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A489DB23AEB
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2024 09:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26975763E7;
	Mon,  3 Jun 2024 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8Qb2HEY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E3B823A6
	for <linux-usb@vger.kernel.org>; Mon,  3 Jun 2024 09:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405488; cv=none; b=BBAWPZEZn+QHgQ8ngKE2Uoa71WAMu0MsvxHQfGXSRM1YLrlEOdMrMYEl7KOgyiCxaFkPwsrAjFA/6ihjKGsCXPnu2oLOSw8zU1FZrfviB6x3ePgH53yQiOgSdQeSe1xRU52/Ed3PQ330R7KVM7vcbABmeNYOiC754/6nqocKKDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405488; c=relaxed/simple;
	bh=DhW5BaQByzD1Go904sapmcVj5pLapXlSf94myTW39a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaHvKHqflJ8UF8Fnyj2Yci6UKpx4TJolil5S7hF9w009v8BSzYJ8ilyy2ZjM7drralO5gluXy4hZYxewvCK0AlcUw5wRcMBkS7zxsa77MsYm7OQ4n78DRsA+outQcBB3SscHUHiHq2vob32FzX8/tpq2cn1sJbLJIA6X92g0TB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8Qb2HEY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717405487; x=1748941487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DhW5BaQByzD1Go904sapmcVj5pLapXlSf94myTW39a8=;
  b=E8Qb2HEYq2JjGeXE9WIn7XYGzNHEfD0+vS0jaCd64JYBT8xBDSKpb6O3
   iCwxX1v5aa/fbN2+8yeuznu/QYPtMugE5AKpWP+0OIVfV2LcTIJfP3X0l
   FPnWhxbp+A4I0vBGyr+AVFUf4uB/xrDr4j49SfdJqwz14NVuCO6GmflEQ
   xOoiQZ8sGtBC7Z8PD+TEYZ7JK7bD0hWc9rRNOkUqGs3hhFI11L5KMv0oY
   qzKOMwsctcaiymnCmMh3OMZ9mNq8RbgQmnHafg/q9YM4Hkz+at6yr3DRA
   cGzCGVIByaqN8blSEVuklImJeYG+568l0+pVEF9tKj/pig+zz5WNRGNZ+
   Q==;
X-CSE-ConnectionGUID: eDCURmnHTWSC34K+KESZ2Q==
X-CSE-MsgGUID: 0rD/XeJzSjyzP7UcdDxDmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13832185"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="13832185"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 02:04:47 -0700
X-CSE-ConnectionGUID: rIoQyFteRtqtGpCrdA9aOg==
X-CSE-MsgGUID: 3PH2C3tdS0uOCifqoEJvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="67659873"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa002.jf.intel.com with SMTP; 03 Jun 2024 02:04:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 03 Jun 2024 12:04:43 +0300
Date: Mon, 3 Jun 2024 12:04:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: James Dutton <james.dutton@gmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB-PD protocol
Message-ID: <Zl2HK3CT8uuJzr9j@kuha.fi.intel.com>
References: <CAAMvbhEmLhpOEOegCWkKhEupOsSih2ct-ye7o3m0Sr8+zv=gbg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhEmLhpOEOegCWkKhEupOsSih2ct-ye7o3m0Sr8+zv=gbg@mail.gmail.com>

Hi James,

On Sat, Jun 01, 2024 at 10:36:13PM +0100, James Dutton wrote:
> Hi,
> 
> Is there any way to capture the USB-PD protocol messages on the CC
> pins of a usb connection?
> 
> I can use "modprobe usbmod" to capture the URB messages.
> Is there any way to capture the CC pin messages using in negotiation
> power USB-PD.

Unfortunately there is no way to capture the USB PD messages. The
operating system is not in control of the USB PD communcation in most
cases. Instead, there is a dedicate component called PD controller
that handles the communnication. The PD controllers often only give
some status information about connections and limited control over the
connectors.

> I guess is association with this, some way of also capturing the
> Volts/Current on the Vconn and Vbus pins.

The information that we can read from the PD controllers is exposed to
the user space using the USB Type-C connector device class and USB
Power Delivery device class. You should see the PDO details under
/sys/class/usb_power_devivery if they are available.

The connectors, and the partner devices attached to them, are exposed
under /sys/class/typec

> If it helps, my cpu is an AMD 7840, so it will be using whatever USB
> hubs come with that.

Br,

-- 
heikki

