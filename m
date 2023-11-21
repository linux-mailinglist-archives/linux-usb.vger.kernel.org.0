Return-Path: <linux-usb+bounces-3096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A397B7F3005
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 14:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55991C21A9D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 13:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B1A54F88;
	Tue, 21 Nov 2023 13:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZ3IXWgQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BEEFD6F
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700575174; x=1732111174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SUECUIlmyXOQrQt/LcigahuMpF2Pgp0NyrBUZPdrV8U=;
  b=AZ3IXWgQwjBMo4zzX0kinQHzc9nvJPlfouXbiTo+XVYwBeMnoxGhFXKT
   SdMX4dTBxD0DndawHN+O+HEuNox/FD1x0h7+la6bnBOzCQfTXvNX3SGrN
   J1n6OKzW1oFTvn0NemzwN1H4h/MsEnrz1TDDKNePqfeAunLsSS844Zl9K
   5Xc5Bc6cQsIOdmCBbHx5f3rbmRmxli87RJcemtu51M9GdfxmJN6mHYtaf
   B5qB4P8jKlgo642pHmDtu/Z+vmto81d2JWP9AwVQSHeg2f9FgJi1CaAi+
   /+uPcIYUYSnu+1fZauz8k8FixjPxhFPFF3wZi+bEp1IVk2/TBzdA0E69k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395766833"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="395766833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 05:59:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="832655051"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="832655051"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga008.fm.intel.com with SMTP; 21 Nov 2023 05:59:31 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 Nov 2023 15:59:30 +0200
Date: Tue, 21 Nov 2023 15:59:30 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: Test USB Type-C port?
Message-ID: <ZVy3wnSc0i4jGYh2@kuha.fi.intel.com>
References: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>

Hi Paul,

On Tue, Nov 21, 2023 at 12:30:34AM +0100, Paul Menzel wrote:
> To test a USB Type-C port for conformance to the specification, is it
> possible to connect two Linux devices using a USB Type-C cable, and run some
> programs on each?US
> 
> (I started using a Dell XPS 13 9360 from 2016, and sometimes experience
> troubles with USB Type-C adapters/port replicators and want to verify that
> the USB Type-C port works according to the specification.)

Unfortunatly USB Type-C is handled in firmware on those computers. We
can only query the status of some basic things using an interface
called UCSI, but most details are completely hidden from the
operatings system.

There have been a lot of problems with the UCSI interface on older XPS
13 and Latitude systems. Some of those problems have a workaround in
the driver, but not everything.

Br,

-- 
heikki

