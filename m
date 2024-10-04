Return-Path: <linux-usb+bounces-15694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524E990083
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 12:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D4228328F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 10:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A5C14A08E;
	Fri,  4 Oct 2024 10:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQnQ6GUW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05D13A257
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036441; cv=none; b=VL6EkZJB+CHZOIhMYUMT0XjHN2i5EibP0Dslv2aXqk2yVjiO+GF+Ehn1fIDAlO+Cy+Xtd2earNxsDZwLzjYEezXcp0d//QOQhYJw2YgyI9R+M6P4yQSWK41jkFQRTjON5d76dhtyKnzhdJDCFpIQ2aJnD6ZqDyjRX9yjoQBgNig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036441; c=relaxed/simple;
	bh=Tyog9WZ4D14aX3hUcT8v4t2JYKMsydQvJ79stnoHvio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYogR4HSwO4PvzKv7AyP3kaxP4eBYMnjHOBYM9ElsmGakc7BGQMUqAkGCPF4n7San+mWvjAyyAL21ZiS/QlQzefIEuZmuFKM2wiC1lI3TjWIx3G8VozfbQfKV8+imEViH/u214esfRg4UvoBfhcfxEz7UQ5e4LW5dxU9wRX3ZRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQnQ6GUW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728036441; x=1759572441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tyog9WZ4D14aX3hUcT8v4t2JYKMsydQvJ79stnoHvio=;
  b=ZQnQ6GUWPXewkxXUDlWC+KTQY/cDnb87jrqJkME0sakYaSV/5tb6+g33
   i5HkIHkN8aQv6uT2O0hPJOczTg+8iFUTYAOzDYmFr1M2E1TNZUJ1TP5tZ
   OzzLMsO9HvzAVp4YZ65/uxRtQtE2j0l9S8NGyUKntQ0an5KQ+6SEz4zNX
   4wbh5HYdAQKtuY8R3Xs9oxdyIywA52DtjM/ULzgritMgH/SwadDv/Ecg4
   vsF1CNX3vEg8Owr30g19oj0iVElV28EGoQ4EGBCgRAxztP1pXbbcYrcLG
   HZFzRzBytPEijnaLnb0jE73tRhIEkUishU4GFld8QEkmp/latplif/J1A
   Q==;
X-CSE-ConnectionGUID: W6o7/SD/Q1OzA38uGRiOqQ==
X-CSE-MsgGUID: 8xKQ7WmhT+ObpTOnlM6iVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27198436"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27198436"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:07:20 -0700
X-CSE-ConnectionGUID: TsktxyVWS6+XveZfKvDIKw==
X-CSE-MsgGUID: kVLVdMBdTPC3iuVuRBSZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="79426563"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2024 03:07:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 31E893E3; Fri, 04 Oct 2024 13:07:16 +0300 (EEST)
Date: Fri, 4 Oct 2024 13:07:16 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 43/51] thunderbolt: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <20241004100716.GR275077@black.fi.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094145.114082-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241004094145.114082-1-sakari.ailus@linux.intel.com>

On Fri, Oct 04, 2024 at 12:41:45PM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

