Return-Path: <linux-usb+bounces-7809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40888877F5B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 12:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F1A1C218A5
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 11:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717EE3B7AC;
	Mon, 11 Mar 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqS8dL68"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C6138394
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710158193; cv=none; b=lk23GgoLxT7aAbINgYezRjx/6KhzNdM2lyUQZ1xXBj5uDYY9o+Vxc+3xpv8kYIw0b3UUJl00xv7ZPG4a7Hceyzipo77y7mUHW4XJZPsE7QGGx8yC7MfBKjEnUSBTTI7v15/1cySB2b/WHnFS5gZVEvGPKnLJ0Ku0chsHZl9esOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710158193; c=relaxed/simple;
	bh=5iZi2i9hsdhPL4yJkwbmA8KofrNZFuLx3k52EgS+WwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaBSBFMYN8AtBolItIdB8vCNBF1KwDaFAuoeoMYajxxew+mUKzl/DIblll6g6p9Bz+e0LxP+xIY0/A9QgcDi15TzV+lPSzKy1ev0Tkz6URuU45RK4kDI5LrzhAo4TjLPiGC+J6p4RWdQkYLsmi8juYU+o5+AvcSwDWZ3Q4Dx4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqS8dL68; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710158192; x=1741694192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5iZi2i9hsdhPL4yJkwbmA8KofrNZFuLx3k52EgS+WwU=;
  b=dqS8dL68FYknK55e0nIDKq5P9cKSTGWjcY7utOJ1S2epsHIAavxGQXql
   mBSG5I2vnUEDVELU3es7jtJqWSqeJ6CMNGxFoA0ctbtFb0O3Hzb/jTqoI
   PGW2H7tKdOKA1wcjLQKzY+Tgk0b/h96ZE67MLK22l0ocqVOi3Xd5GJhN/
   rOtjbKnVDKrOLRGuO3tlOuZ6AKAo/OBzHrRk8C5ZkcQ5Bhb98IJdQn8H5
   eUm6I4aQ67dyn+mQvOmOZEWSiDLPgy4HvefDUUEP43kSUI0WceyotVazE
   eRgu0X1wxTnsKAr12z+nDyRoGJ3MmFuMsCSdBL34MbDy52ZsuoBpRMk6c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16253565"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="16253565"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 04:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="937049691"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="937049691"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2024 04:56:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 48F44177; Mon, 11 Mar 2024 13:56:27 +0200 (EET)
Date: Mon, 11 Mar 2024 13:56:27 +0200
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: "mohamed.rayan@siemens.com" <mohamed.rayan@siemens.com>
Cc: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"michael.jamet@intel.com" <michael.jamet@intel.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"mohamed.samy@siemens.com" <mohamed.samy@siemens.com>,
	"mohamed.el_nahas@siemens.com" <mohamed.el_nahas@siemens.com>,
	"ahmed_mohammed@siemens.com" <ahmed_mohammed@siemens.com>
Subject: Re: Inquiry about tb/usb4 driver
Message-ID: <20240311115627.GD112498@black.fi.intel.com>
References: <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229123042.GH8454@black.fi.intel.com>
 <SEZPR06MB5439B1EDA735894215D6263BF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229125536.GI8454@black.fi.intel.com>
 <SEZPR06MB5439FEE8694906792549E92FF3242@SEZPR06MB5439.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5439FEE8694906792549E92FF3242@SEZPR06MB5439.apcprd06.prod.outlook.com>

Hi,

On Mon, Mar 11, 2024 at 11:11:45AM +0000, mohamed.rayan@siemens.com wrote:
> Hello Mike,
> 
> Sorry for my late response,
> 
> Kindly find the request log info as attached.
> 
> Please note that I have generated this log using the following steps:
>     1- echo "module thunderbolt +p" > /sys/kernel/debug/dynamic_debug/control
>     2- To get the debug data I have ran: cat /sys/kernel/debug/dynamic_debug/control | grep thunderbolt

You need to run "dmesg" to get the debug data. Please do 1) and then
repro and send the output of "dmesg" to me.

Thanks!

