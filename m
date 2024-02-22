Return-Path: <linux-usb+bounces-6883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BE85F973
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8909BB231B6
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 13:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A34712FF95;
	Thu, 22 Feb 2024 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtvmhwnJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D0144C87
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 13:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708607871; cv=none; b=QGcyBpz6XXmqEogtfSuF0w5fI7WcJ4moIUcueHwo5o2aCKlAYVsL5PDq06fTo6+haqb3yWxxRQSwUXCM0eyyjukKs/E5EAXGjLsb2GtTjj91Lie9TD87bERtIHl+DNPru/vZMkgmXF8EozlF2TlRQCFcyWkZctoUeR1/tafqc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708607871; c=relaxed/simple;
	bh=Szsc17/FRbBwLWNgVKQsLi8/tAt3G3f9l2ZG3abMC2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E3pKmlyLVaK+QJjMe3aOgrntvV0iF/WxqiJR3Dy++nSUncth7yQt7GuMO9vv6dnlINzOcdF3MgHItEB9zLZEOA0KdwuceGsU0Ohl4zb2oWr8hIflPGfUm23JZ0B/SbdBbhUNy0D4aMfixWUea6fO0E7HAyz05f2WAo+EijpK9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtvmhwnJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708607869; x=1740143869;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Szsc17/FRbBwLWNgVKQsLi8/tAt3G3f9l2ZG3abMC2Q=;
  b=TtvmhwnJItlJs3g14LDuRtRxTlOzPawhKlellAKQCT5MgPC8TKoZB/Su
   QXGAgOVwR13p8FQsUBxXpkHxENsB0vplj8qCeXKZb2TdyP0viSoKLcYgH
   WsvQzj9EZkyQu1j3rD30vZMNbw0ZZmkzAShB45Vs3pGyohPrn08plz+bp
   NFzfYL95VQeWM8eZfhJrzYAlwCtlZqZm0xDKnbzEJz5/KeidcapTsFyHI
   lk8Riwb1lC8EdVbA3cLDJH53lX9s2fd37nKnkmHd44YofcQMKM5PqbJcr
   Er1jW/4a5nkVnA4rITpQ4MI+9Ieb08v+IfS3CfKAgGiIZCIqukINTaya4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2702490"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2702490"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 05:17:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936848847"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="936848847"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2024 05:17:46 -0800
Message-ID: <2a6de928-a23c-8202-61c9-af41d515fcbc@linux.intel.com>
Date: Thu, 22 Feb 2024 15:19:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFT PATCH v2 2/2] usb: port: Don't try to peer unused USB ports
 based on location
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, aros@gmx.com,
 stern@rowland.harvard.edu, Mike Jones <mike@mjones.io>,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <1075b61e-d380-8e45-61e2-33d181444594@linux.intel.com>
 <20240220135946.4028553-1-mathias.nyman@linux.intel.com>
 <20240220135946.4028553-2-mathias.nyman@linux.intel.com>
 <ba2257e8-e34e-462d-828b-92dbcb747f8a@molgen.mpg.de>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ba2257e8-e34e-462d-828b-92dbcb747f8a@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.2.2024 13.19, Paul Menzel wrote:
> [CC: +Mike, +Hans, +Kai-Heng]
> 
> 
> On the Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022, the warning is also gone with v2 of your patches.
> 

Thanks for testing, I'll submit these as proper patches.

Thanks
-Mathias
  

