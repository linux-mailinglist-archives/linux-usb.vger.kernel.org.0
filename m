Return-Path: <linux-usb+bounces-7822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A496878150
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 15:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC2B284123
	for <lists+linux-usb@lfdr.de>; Mon, 11 Mar 2024 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48C43FB8A;
	Mon, 11 Mar 2024 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmSMBua6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4A3FB39
	for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 14:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710166095; cv=none; b=NwYDVd914t0nPEWuKKh4/qyEHW1oML9lEuy8IeF4ImVkoRZBdymgbNZQbjxnnP+1UU8xfugU4epzURFqDOO1h9pJ1KAVrGZbyG8ah5OZ5Zi7Ke+ukUMHDx6vk86WHK6UiviJVWGcODxjK7CCtOuYuTGm1Brsyo9rtPuKsNhYF5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710166095; c=relaxed/simple;
	bh=HGUaeKfExZYTwtcSbNPnBWYeHvgY6LqqFM8aPC3l5Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+owQZTvYFNNAe9ZqGRcbGnv2ccWKmV7cZVL9ThnpO1+rWJma/RrKa7yS8puPRz4hbuYUSrtTisLR3czUzCaIA4rmVanbzSiQ5GwsUE/GN50uNzoePrq82GDr1zfIcTAJlqt8Xus51Dw3iY6DB+YxJrarhsw5CY+n6Y9PLY9Yys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmSMBua6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710166094; x=1741702094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HGUaeKfExZYTwtcSbNPnBWYeHvgY6LqqFM8aPC3l5Do=;
  b=kmSMBua6AuMEtG5Qn6tNAikc2AttHeYR/QYPBQUsp6qNFg/K/57fy3G9
   gc+EtYUlx/NAN7QkJe0dtk4Cb/HakTm7AWz+xssgb1Xw3c80iLjbu9ZxY
   ttep05zQHE35/6eU8Wf1NWSjZsf6nv6O6WeOS/7V0kyPLjhYAIuEzBRt0
   sA0FIbJiTGfsenWC8BMzeqIfAOZfUIcI7Xuy5Jf2CCUKJMICc2gFpbyFa
   4lm0DivrlvqyFrx0J7Q2zkip0mm9W8Md7W7y50BL+iVRagYau3gFLYYeM
   ijCgeZmHdNgrxyYw2IRwFt5Q+2ge/o8+T2CGpoIVQpQAnqDTciO/n+wIR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="22351031"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="22351031"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 07:08:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="937049954"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="937049954"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2024 07:08:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 43E9A177; Mon, 11 Mar 2024 16:08:08 +0200 (EET)
Date: Mon, 11 Mar 2024 16:08:08 +0200
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
Message-ID: <20240311140808.GH112498@black.fi.intel.com>
References: <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229123042.GH8454@black.fi.intel.com>
 <SEZPR06MB5439B1EDA735894215D6263BF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229125536.GI8454@black.fi.intel.com>
 <SEZPR06MB5439FEE8694906792549E92FF3242@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240311115627.GD112498@black.fi.intel.com>
 <SEZPR06MB5439F409D2761039ECD26BA8F3242@SEZPR06MB5439.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5439F409D2761039ECD26BA8F3242@SEZPR06MB5439.apcprd06.prod.outlook.com>

Hi,

On Mon, Mar 11, 2024 at 02:03:38PM +0000, mohamed.rayan@siemens.com wrote:
> Hi Mike,
> 
> I have enabled the dmesg as per your instructions below,
> 
> Kindly check the log as attached and let me know if you need anything else.

Checked now, thanks! Found this:

[  156.919971] thunderbolt: loading out-of-tree module taints kernel.                     
[  156.919991] thunderbolt: module verification failed: signature and/or required key miss
ing - tainting kernel                                                                     
[  156.932195] ACPI: bus type thunderbolt registered                                      
[  156.987694] TBT debug : ==> Start to enable MSI interrupt <===========                 
[  156.996266] TBT debug : ==> pci_alloc_irq_vectors is done <=========

This is something that is not part of the mainline kernel. First of all
Thunderbolt driver has been in the mainline for a long time so it
definitely is not out-of-tree module. The debugging also does not exists
on any of the trees I'm working on.

In other words, I cannot help you here.

If you provide me the same output on a mainline kernel with no
modifications I can take a look, sure.

