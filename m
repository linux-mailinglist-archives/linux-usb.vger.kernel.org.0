Return-Path: <linux-usb+bounces-9213-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6789ECBA
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 09:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11E371C20F7C
	for <lists+linux-usb@lfdr.de>; Wed, 10 Apr 2024 07:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFE013D501;
	Wed, 10 Apr 2024 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxj2FA5V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643213C904
	for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712735614; cv=none; b=Q/od+rnFbAo55NrYajJ9JSUSzlzJUBL3mWfyKER5KppdYHRoB/NJYN9GBWz2alVq6gKoGtNckjsx9Na0G0vhQdaH1NKPToq7MH3BhpWm1WRPP7xYp8al/vR8K9drj58AoTEiCSBo+Wkmv1swyiU36EoBmJhf3ipY3DTcNiJWG/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712735614; c=relaxed/simple;
	bh=c+beXtPMxxW9tQusZU+7EqzDUwvfnzbDCCUkQMVBo0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXUso2/PNn5T4f72J49SoW0OOXKfbHMYyZgwbR/2MUbO0GLfX72IzzsPVS1jQH8q/v5Ioms145EH+bIevpu/4aEQEoxHuQDreELQXYy4Q4dol2yBxPvnBoPfinOuyHs3emScDGfRkXLaADu4RG4bws18xgjDLjIXWfjnJfiHd9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxj2FA5V; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712735613; x=1744271613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c+beXtPMxxW9tQusZU+7EqzDUwvfnzbDCCUkQMVBo0g=;
  b=jxj2FA5V0yl1FqkqvEsmdl5Xc6dhTAJGnZf6OoDdEupmvtedR5DwvY14
   YRww9R+kOv5FSkWDHfot/OGZZ+VSWClDkmsyhuZ7ziakNEXT/PDd6bYlW
   S4li/QH3R/xMGNe6+oczIUU/2opiD7OXjgWiYSOJgCUBVeEc9BlOSzSCg
   t6jE05kARzK3kUq346yBkJDSZji40bmLoPee2+4V+Hkp7PqHT67czHa0N
   /uCApXmCWH6SRUAkOP6NcLqnSc3m199XeiAN9ILKi/L+crL7+zqhUlhqk
   fBIbntmoTE8MV1UrWyjHErmHy2jlkmgBY++onHEbCqogNIRla++ChWo8M
   Q==;
X-CSE-ConnectionGUID: IkPL8/QyQkybhKN8oFXEJw==
X-CSE-MsgGUID: JMZ2SO2ISJWRbSoBkl+Gpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18648001"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18648001"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 00:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="937094666"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="937094666"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2024 00:53:30 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8FF24169; Wed, 10 Apr 2024 10:53:29 +0300 (EEST)
Date: Wed, 10 Apr 2024 10:53:29 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Fix wake configurations after device
 unplug
Message-ID: <20240410075329.GY112498@black.fi.intel.com>
References: <20240408124803.12329-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240408124803.12329-1-mika.westerberg@linux.intel.com>

On Mon, Apr 08, 2024 at 03:48:02PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Currently we don't configure correctly the wake events after unplug of device
> router. What can happen is that the downstream ports of host router will be
> configured to wake on: USB4-wake and wake-on-disconnect, but not on
> wake-on-connect. This may cause the later plugged device not to wake the
> domain and fail in enumeration. Fix this by clearing downstream port's "USB4
> Port is Configured" bit, after unplug of a device router.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both applied to thunderbolt.git/fixes.

