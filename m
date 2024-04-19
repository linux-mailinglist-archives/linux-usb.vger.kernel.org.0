Return-Path: <linux-usb+bounces-9474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344C8AA7DF
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 07:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 650D21C223D3
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 05:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB729473;
	Fri, 19 Apr 2024 05:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN663lEJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E077494
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 05:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713503028; cv=none; b=BNTlSODtiijYhvy4ur49p0bYYQUjN2fxhw8m2edlXckLrf8roGCgKfbspR+fnhLczOWgo+ybX9lEWkAAXKKSDQ8VBceYZC1RQRpkR+ME0t89JZfZYBUSqMGac8jVSgSK2FR+O8M4Ybm68w3m1sij5DrGMzQMnxloS5UFuhAQg5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713503028; c=relaxed/simple;
	bh=QccgjETx47zz3I5lALYAzbZgbZ/6MfnwYTNRacjen08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Esf92J3p5CIp9QEg90zN84Lg9Rf/s8JhZXDHOh0phx4y+AYemlC4RHgF4qNPNiKp/PLfLQiyau8xXPJRzlVlVvwwJgJcX/hpKfqkkyAPL1pceXCpsyonUtBgeK7sSUneePHudbf1PUgwFRL36SCio6c6V7MLrIP5UPNWhRaeoXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN663lEJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713503027; x=1745039027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QccgjETx47zz3I5lALYAzbZgbZ/6MfnwYTNRacjen08=;
  b=FN663lEJShuQl7FFJFpS0yeyf49amp+XM4L/CLGdnkTHnXLQnuCdjTaB
   YJ1r+PyQt1rbBSAGPNpWb8/DdAxwg/BPcd/5w7Sq05ijWAU+n8F4twy/4
   McnYOjBdP0Gup618Nu7nQPsVDP6Ut6rAigvGVBOzV5otcaaeTMq45S0k8
   zcWr8uXqkT29ZYhoOApy3eggxMwb2TeokaHzj0hqEZKuybeTpM5c8N1Us
   lN9Jhuoj1Dzyswvk+JoqNAxjpnBRdAjr8lNkCiMlqm8DWw8OoVwS8T0b7
   AJyL95P5Y2AIUApOyyCRbE2iLxjl3oBX0AdYUqVsSzAWA0bHtqDMVyXmy
   g==;
X-CSE-ConnectionGUID: etML9SvcQcSV1DrV6/8ojA==
X-CSE-MsgGUID: H26YMxdXSmO6BvqaW2tG6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31572081"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="31572081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 22:03:46 -0700
X-CSE-ConnectionGUID: wIl5esn/T82P92t89zjIcQ==
X-CSE-MsgGUID: 0/ijDdzgQhmniCEQ8yzYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23657102"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 18 Apr 2024 22:03:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8246C18F; Fri, 19 Apr 2024 08:03:43 +0300 (EEST)
Date: Fri, 19 Apr 2024 08:03:43 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Use correct error code with
 ERROR_NOT_SUPPORTED
Message-ID: <20240419050343.GS112498@black.fi.intel.com>
References: <20240415065528.576769-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240415065528.576769-1-mika.westerberg@linux.intel.com>

On Mon, Apr 15, 2024 at 09:55:28AM +0300, Mika Westerberg wrote:
> We check for -EOPNOTSUPP but tb_xdp_handle_error() translated it to
> -ENOTSUPP instead which is dealt as "transient" error and retried after
> a while. Fix this so that we bail out early when the other side clearly
> tells us it is does not support this.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

