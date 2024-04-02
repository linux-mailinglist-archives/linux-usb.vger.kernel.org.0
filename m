Return-Path: <linux-usb+bounces-8716-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08208894F9E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 12:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D55F1F2593C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 10:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A7A5CDC9;
	Tue,  2 Apr 2024 10:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVHaQ0ak"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36AB5A4E9
	for <linux-usb@vger.kernel.org>; Tue,  2 Apr 2024 10:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712052625; cv=none; b=jz0/WBlTiWfwIIl9oAY5es9TYjOE0i/9PCsqXM1mROp3iCT3XaSyPIEfnQ/RVizIdyBxJfRJzPmuMA3mS7bQ5cYk84Q8TDAPPE5fbvFOp0+O8DUppS05rViFLP5YYkhAzvjdmHTVXqzdzZ9tKCQM4hRByfmOCSb1Y1mAzHvRm8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712052625; c=relaxed/simple;
	bh=5+D22n6NjEK7V57SzA0mqDqWK4xcaRAH+sKuXTPM2n8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+vTlWcVr30is9Phwo+FqKsQyWoPak7BnOJJQrnbCYtlujRTd9v09onKIgO7j12QY2H1jNdTIWST3rN2NccaL/VWosoeMnIIrkpbA5lBmi4olDRdbtj27UEV61/+boBbhie1JKQHeaPNQdrHbDHg6AZi8eHYwJt5atatNniW/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVHaQ0ak; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712052624; x=1743588624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5+D22n6NjEK7V57SzA0mqDqWK4xcaRAH+sKuXTPM2n8=;
  b=LVHaQ0akIHkya4dye36zAhF7aV4WZ22d3dsDws8jj7qn5QzMwrLTiv2Q
   q15Bwz4nD5g170MEU4/OM+6JcvV4mk6vlZICMqtQaXqXFTcaK9P9sekFc
   XDPuX045yV8GglHGAHCK4ALEcaePW9u//iW674JAgktwmVlg5CNtL7zmY
   Z+7GUQwF9Mm7yoEMWkKAd2q4OyYnReN3eGUQmCYLCUaXtuwgTlffAJkCT
   DWeKdFXd165wSbkRDQTsINRsc9Xeb1wlBKjq/kDZAMrtu6jJ5kx2ejy9z
   Zj/eh6uYh6A/yPiplmA1+dZX21COxl7frNVXQuIfUMs4azUBYrp5aJCW2
   g==;
X-CSE-ConnectionGUID: Jn04nvFXR1ysgYeZKO1AGw==
X-CSE-MsgGUID: lS3fmoQNSZ2mfZzOHvSAQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24669913"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="24669913"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:10:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="937083265"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="937083265"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2024 03:10:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9DC4228A; Tue,  2 Apr 2024 13:10:20 +0300 (EEST)
Date: Tue, 2 Apr 2024 13:10:20 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sanath S <Sanath.S@amd.com>
Subject: [ANNOUNCE] Thunderbolt/USB4 debugging tools
Message-ID: <20240402101020.GP112498@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi all,

This is mostly for the folks developing and testing Thunderbolt/USB4
driver side of things but may be useful for others too. Not intented to
replace anything we already have for the regular user stack.

In summary this is a collection of small tools that provide bit more
user friendly access to the sysfs/debugfs/tracefs interfaces made
available by the driver. Mainly useful for debugging issues around the
software connection manager parts of the driver (although some of these
work with the firmware connection manager too). We have been using this
internally for a while.

The repository can be found here:

  https://github.com/intel/tbtools

