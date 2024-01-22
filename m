Return-Path: <linux-usb+bounces-5357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C90836233
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 12:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B6F91C24E87
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jan 2024 11:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4703CF54;
	Mon, 22 Jan 2024 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cVSIeb9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012DF3CF7F
	for <linux-usb@vger.kernel.org>; Mon, 22 Jan 2024 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705923353; cv=none; b=ibko13M6rDLzu5Kbtb+EIIjvBQZ8Z1w2NJJ+kl1HDygw2cuGcaFszhumAIWqxgBha+P64z8mYDvlJcvl2Rob3rEnnw6T8n1AtgCusheX3joXxbLAgoNtoG4R3lqtc7bXTKYaBn1IydmN5l3A5WGaLiaWeOAgMxDq1zKkhUfHJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705923353; c=relaxed/simple;
	bh=lO8GcnlvX/vriKoPqakMDo2afcF6NJzgG9k+Aliqoww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1Kmgm7HtEL5XtAY+3v7mANegWOnAbnryoSmAxAJ10bFlSBXqKkUzhRW2YMQCUYkCN1g453tdvIHd1SF4+bcN/XfAbzzX0vj0y4nFv4ixKKP71JJfG4fnmwjTr9eWbGk5qHkcpTcrM1tU4KDdI4TOdneN0SwyfA6iIDOVz2myDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cVSIeb9S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705923352; x=1737459352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lO8GcnlvX/vriKoPqakMDo2afcF6NJzgG9k+Aliqoww=;
  b=cVSIeb9SRubNkvmpG34I4N4znUewDZ0e8k7whjdwx3Npq2+KZoI8znXU
   VZ9WZfmi/QkqLdqJFmXWJqk/NeA/i2J5DEV6aPTDTOVXtv7ge5MWnQuzy
   5cG8jxXROwFZEtVeajzVkv5e/ZFsd+wBOuiRfT21JbqGcsFOI1hRNnIZw
   Dd9fOwa5fpm+bmrwNNClY1FqrPUu5yS9GpAPUSwifUOhVidWkXvYKS9MS
   NsHqzxzoH2xsoy0LxrAHZDIzTtCQrDJ4HnYdKWLObdWR3Xlj8XKW2wOzM
   Vrk84K2+2iaArO3eD+eYafROqFcyA1i7I0qf/3Sj/7XLgQs//LTVt9huf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8280782"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8280782"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 03:35:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785656922"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="785656922"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 22 Jan 2024 03:35:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 12C263EA; Mon, 22 Jan 2024 13:35:47 +0200 (EET)
Date: Mon, 22 Jan 2024 13:35:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix rollback in tb_port_lane_bonding_enable
 for lane 1
Message-ID: <20240122113547.GJ2543524@black.fi.intel.com>
References: <20240114120420.35378-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240114120420.35378-1-rahimi.mhmmd@gmail.com>

On Sun, Jan 14, 2024 at 08:04:20PM +0800, Mohammad Rahimi wrote:
> If enabling lane bonding on lane 1 of a USB4 port results in an error,
> the rollback should set TB_LINK_WIDTH_SINGLE for both lanes.
> 
> Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>

Applied to thunderbolt.git/next, thanks!

