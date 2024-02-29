Return-Path: <linux-usb+bounces-7330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC086C988
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 13:55:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32EB11C21BCC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 12:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E005F7D416;
	Thu, 29 Feb 2024 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/lx7SFG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7270B7D415
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709211342; cv=none; b=m3h0lOecq2NX7xITf/ONQdj9Ih+F5PmkU88unjZ5EcR01cXLSr3Epu4ZUtDR64Rl7QeuuI3WSPUhc4FfYimj28uXcQQSwCjhIWzR2kMqb4zVpW4mZpB5CAG5ctZUWg9g8hmRTeNyaSWb/D1RBvg0X9SKOQ7NUFEtK/LlyFN94Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709211342; c=relaxed/simple;
	bh=Nt4NxWgI6RJwbHPvc3EhO2PsoxHefqJJw+nQ9Y7LHsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWT/bWWp0XJsQXPafMfPGx6o9F3rn0L2GeAJ5IQCzn7OtnpGNuLAvUsNJGMOXTT0SlnVpyiJgpu5n7k8WtYIeBO9B/qlAXjTz6J4q/YrqUd4MMHsgLXcbrc5aXQh0yQofPEJm9th0qADmYc3qgZ0nzc0GHXWI14ac1mQPzNBa/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/lx7SFG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709211340; x=1740747340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nt4NxWgI6RJwbHPvc3EhO2PsoxHefqJJw+nQ9Y7LHsA=;
  b=K/lx7SFGo37xcxHuYk8Du3Ds0qhE9Zye8/zXCvHr3HjCBFmJNmc2ajLj
   Srd7Smg6S8zKYzElSJNYUnMKvh/YmSUN8X6Kdt2OYifGK7AGlE96dGGLb
   Dg416snUcY/Akg3EahClmMQY1fA8O5yF6l9oeetcokHfJxppcljxaisBH
   NQtJgnKsAa8pbI3zbIx0KNyw9rl6DMshYbqFVbBif0xa+fKE0utrUqA/Z
   h11Ff7FYaN5P2jlGyLeyvinQ+g/sH3GATG9ToYlBV1reNtZ7tio37ZIRj
   acx9Pnwem6qfJpJKly8s87WOMP4SgIPqT+RIbOapoY8prgOv8AuRAeNGf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3600913"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3600913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035911"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035911"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 04:55:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6D0EE3BC; Thu, 29 Feb 2024 14:55:36 +0200 (EET)
Date: Thu, 29 Feb 2024 14:55:36 +0200
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
Message-ID: <20240229125536.GI8454@black.fi.intel.com>
References: <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
 <20240229123042.GH8454@black.fi.intel.com>
 <SEZPR06MB5439B1EDA735894215D6263BF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SEZPR06MB5439B1EDA735894215D6263BF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>

On Thu, Feb 29, 2024 at 12:48:46PM +0000, mohamed.rayan@siemens.com wrote:
> Hello Mike,
> 
> Thanks for your reply,
> 
> Yes, I see a problem in my case, because When " tb_cfg_get_upstream_port", " upstream_port" variable gets updated with wrong value not the actual "upstream port" corresponding value in the Router configuration space of the USB4 host controller.

Can you share full dmesg with thunderbolt.dyndbg=+p in the command line
so we can take a look?

