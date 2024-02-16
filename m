Return-Path: <linux-usb+bounces-6560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E98857A7A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 11:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A8A81F23B01
	for <lists+linux-usb@lfdr.de>; Fri, 16 Feb 2024 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EC51C5D;
	Fri, 16 Feb 2024 10:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdQpa6Uq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2814EB24
	for <linux-usb@vger.kernel.org>; Fri, 16 Feb 2024 10:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708079963; cv=none; b=Gw/XasWVHBTtoDJyw5HuKWErPoZlr1aDkwTsKLgylUOzDIIet62HVyJpl0F4XqCj5Vn9+kPRUjcsploEIRMCgIz/pOKi+WmFXIdQi68S9Z3Thg1tW4Ye792/7LS3aAhQdO35Q9wh3UnsiuOni4FeNNLNkThbfzGrXkf1QOwp9HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708079963; c=relaxed/simple;
	bh=qrzr7XvIi+jHbuF6nal8j4dcjriwEejj+uJZiZyWD1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ankgjKbbOS4a/tKeBVWwxpBlQbgFayBuPdfnF5eEkqIkqD8gn94gv77jwBrQ8bkIitXgLIoQ3WAwyNhj6XtMkKpzbwUCjYx674BN24kQuD9njuda9IBS26gBbDGWyhahbmDyfETW1P0Q5Ilj1b2p0EspMN7nGNM1GO3zvjfn3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdQpa6Uq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708079961; x=1739615961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qrzr7XvIi+jHbuF6nal8j4dcjriwEejj+uJZiZyWD1Y=;
  b=fdQpa6Uqy2y7LJZc5RxF8UMRFUZpJOchxzE/4ra/wTLrhVKEH0KKGcag
   2GhxgK8digh047pzF+WK91C5TQXr/8iQv7nPuwF3oXwXKl6t4MwK7V4J6
   gEX1C2XK4FxviUtt4TNo7m8g4HupOUFDfjp4D7iW5bOWNkhOwZO+y7FuB
   ZmCbQYo92QUbBboctD31JF4/TSNgZNpCpxqVpvA/3T7Vau7BJVIhWrj+J
   qFvkOq52IDLvqTckf4lJND32/QUmQtybHlHle64nZ+88UACsdWFjK8GS0
   eJ0VWS/ozpnw3ZzPWXSJUt5zdCxyOBEb86jJKdUZ3pVfq5pSxVEK+J7a6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="5171138"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="5171138"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 02:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="935820438"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="935820438"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2024 02:39:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 289EC20B; Fri, 16 Feb 2024 12:39:17 +0200 (EET)
Date: Fri, 16 Feb 2024 12:39:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 00/10] thunderbolt: DisplayPort and bandwidth allocation
 mode improvements
Message-ID: <20240216103917.GO8454@black.fi.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>

On Fri, Feb 09, 2024 at 04:13:25PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series improves bandwidth allocation mode support to follow the
> USB4 spec more closely. In addition to that DisplayPort tunneling is
> made more robust so that if a tunnel does not come up properly (for
> example on a discrete controller the DisplayPort source from the
> graphics is not connected to the DisplayPort sink of the controller) we
> tear it down and continue pairing.
> 
> This series improves bandwidth allocation mode support and DisplayPort
> tunneling to follow the USB4 spec more closely.
> 
> Gil Fine (2):
>   thunderbolt: Calculate DisplayPort tunnel bandwidth after DPRX capabilities read
>   thunderbolt: Improve DisplayPort tunnel setup process to be more robust
> 
> Mika Westerberg (8):
>   thunderbolt: Use DP_LOCAL_CAP for maximum bandwidth calculation
>   thunderbolt: Re-calculate estimated bandwidth when allocation mode is enabled
>   thunderbolt: Handle bandwidth allocation mode disable request
>   thunderbolt: Log an error if DPTX request is not cleared
>   thunderbolt: Fail the failed bandwidth request properly
>   thunderbolt: Re-order bandwidth group functions
>   thunderbolt: Introduce tb_tunnel_direction_downstream()
>   thunderbolt: Reserve released DisplayPort bandwidth for a group for 10 seconds

All applied to thunderbolt.git/next.

