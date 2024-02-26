Return-Path: <linux-usb+bounces-7044-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C11C866A82
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 08:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16C532828DE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453CD1BDCB;
	Mon, 26 Feb 2024 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QVgKQYFm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F021B80A
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708931632; cv=none; b=fc0k+wyhp5WdnXRRRuW+pKAd/xveqiqFOu8VVZRv9gtxEZ0TNFFq0tqzTIX62orRfPJgBh69dTzxLTViaurwzmlb3kENmiv1Uwl2G6ay6zxv2gxkIdOOcC7HVrSBsY2570U7v/sW72mwn3TecW/dB8PF+PptnadeDOZ7uKWUypc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708931632; c=relaxed/simple;
	bh=4O7+z/cZv3HXjRcxlC3QJA0OvrmOYodOY1rqDeh/2K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmi2wYB0nR6ByF8pr1arsOdVEZxT1p16Xl4t7tfRwE2el6YTz7w7++Vw/mXHIg7xsvuPpju7Kgnaqi6IhziE76ihlZJ1MklH6huLDFhlTk10dVfbxyzd74uyvoajO3z5GZsanQ8WypnM9+NHHoEFGd4dDP0h2wD08+7yuMP1oww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QVgKQYFm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708931631; x=1740467631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4O7+z/cZv3HXjRcxlC3QJA0OvrmOYodOY1rqDeh/2K0=;
  b=QVgKQYFmbFImKnQmmSlI0+ygXEEVGYMNqVSniVtAoMFVQiYoAQk+MS/N
   bZXI+sqEp5X4tJZ+CpKekPPNd07dNcEN0VwJpTSNofA5RfPeYgIGwn1Nz
   vUdEZkuD+CyumcOaU1LiNlX8sCgKO/R0jzhBRO1p6GDZElTzFJDjRu7FC
   Tt9uYP0GTUkIvl+ZZLBHZNgwOdH4lV4MVj/QG25ZlklAIzrO0yoR/wW+c
   v+WuvLqd90QwtTxJ/gSVa5nynrnWYLxcs0RgV80U3dIXPlfMY6mtr66Rt
   YLYaEOUPwIXTkfCRS7tMT+D21DAtpPYcP/WO60C3VZzRpgcIEe3+HdhSf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3363506"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3363506"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 23:13:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937029355"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937029355"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2024 23:13:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C199348F; Mon, 26 Feb 2024 09:13:47 +0200 (EET)
Date: Mon, 26 Feb 2024 09:13:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] thunderbolt: Add trace events support for the control
 channel
Message-ID: <20240226071347.GX8454@black.fi.intel.com>
References: <20240215123535.137840-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240215123535.137840-1-mika.westerberg@linux.intel.com>

On Thu, Feb 15, 2024 at 02:35:35PM +0200, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Sometimes it is useful to see the traffic happening inside the control
> channel, especially when debugging a possible problem. This adds
> tracepoints close to the hardware which can be enabled dynamically as
> needed using the standard Linux trace events facility.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Co-developed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

