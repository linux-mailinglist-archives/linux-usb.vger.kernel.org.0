Return-Path: <linux-usb+bounces-31694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D213CD89FF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 10:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A3423048432
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 09:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0CA329C41;
	Tue, 23 Dec 2025 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY7fPHok"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2F032938D;
	Tue, 23 Dec 2025 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483059; cv=none; b=HnA3R7v8IkQfJVsnDweBdiD+Ex2rMEAlRPPH+KnHhmBgRdunfyihVSzzzsjizI9PdCOQ7Ic4jirM8CLTpc2JCCAkY86OWfH4Y4JY+v8f9VH+D/FucGr7ivY3BWUreMXmliVO0dIT0dOvtKPaWL5FbKLYQ0EfUpXydqwN8/lMnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483059; c=relaxed/simple;
	bh=1c1si+bEFmabBtS/Hi21tdCGvQSrs7m/pdcxZm8gkro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/kyn3nV3a6YswsfE3Pgp6Zw54OSXMyq3wF+WrJVOCpI5OgqmQ32G3v36lEO2cmFzey6yDcABpbDSt0VwzQUchKIfd4Ie5HYEoWpYu71L6fAbkP5zhk7NMH01c6MaHBJ/2gIYKm664tFhaX4YjYYRX18Q+HHuvSKahUgPe2ig2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY7fPHok; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766483058; x=1798019058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1c1si+bEFmabBtS/Hi21tdCGvQSrs7m/pdcxZm8gkro=;
  b=QY7fPHokPMufUmfq9GyKP1TKl/hwtWFrJ6nvIhU7lziMOS0/OWjZ9g6B
   E/IoFjnFXTdaINuQXOm1trUC2bzfwaEYfcjvu2uOiLYAoI+2pR95ZMT7Z
   DCJsScMt1hZzM2CWthsNMHaDYw/t/1ufGai0Zn5j33gC85/3nO6buGxIS
   MfKHDL6ODXF1tpr6DJoQhnKKFVk853evRNFlClm+KzfRH+5aFXHVSD2Z1
   SPFi4vU8E0A8oiQMWuWfHll2CxKKC+5U1MuonMQS8JX1AfiPVmMs9s8wK
   eGxzN3rdc3MOa4gLzCkVLDykpb9u5RmLVsgFqUgJTJNQqS1NuBRfum7EJ
   A==;
X-CSE-ConnectionGUID: zWiNITlfQ1u54Ie8HEVf5w==
X-CSE-MsgGUID: KLJHPykyT5erLWiVcGZmJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="78647913"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="78647913"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:44:17 -0800
X-CSE-ConnectionGUID: eu3MGfg5SLu4qnNEKnDyFw==
X-CSE-MsgGUID: 4crCkqHmTRWbsfGmcWBVFA==
X-ExtLoop1: 1
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.220.158])
  by fmviesa003.fm.intel.com with SMTP; 23 Dec 2025 01:44:13 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 23 Dec 2025 11:43:58 +0200
Date: Tue, 23 Dec 2025 11:43:58 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <aUpkXs3Jd6UDoPuq@kuha>
References: <20251111010541.145421-1-acelan.kao@canonical.com>
 <aRrkLczHJzONnxtT@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRrkLczHJzONnxtT@kuha.fi.intel.com>

Hi,

Mon, Nov 17, 2025 at 11:00:34AM +0200, Heikki Krogerus kirjoitti:
> Hi,
> 
> Tue, Nov 11, 2025 at 09:05:39AM +0800, Chia-Lin Kao (AceLan) kirjoitti:
> > Some firmware implementations incorrectly return the same altmode
> > multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
> > This causes sysfs duplicate filename errors and kernel call traces when
> > the driver attempts to register the same altmode twice:
> > 
> >   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
> >   typec-thunderbolt port0-partner.1: failed to create symlinks
> >   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> > 
> > Detect duplicate altmodes by comparing SVID and VDO before registration.
> > If a duplicate is detected, skip it and print a single clean warning
> > message instead of generating a kernel call trace:
> > 
> >   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please update your system firmware.
> > 
> > This makes the error handling more user-friendly while still alerting
> > users to the firmware bug.
> > 
> > The duplicate detection logic is implemented in a reusable helper
> > function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes().
> > The fix applies to all three recipient types: partner (SOP), port (CON),
> > and plug (SOP_P) altmodes.

Will you be sending v3? This does need a fix.

thanks,

-- 
heikki

