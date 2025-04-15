Return-Path: <linux-usb+bounces-23084-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E5A89E48
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 14:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76B671777CC
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 12:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A418284679;
	Tue, 15 Apr 2025 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fibD64BY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529F1C6FF5
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720648; cv=none; b=ry88AqBNASlJiIgPFwWvr2Z21DjrDof38Vha1P/c5D/GQmQdMT+io4Z03Bk/YuUf1ls8ev1h6LYnc2VChN4Puh1yy1/uLwZr9g+gtH24KpwJejuE8Xi4yjNkewtlnhYTciuePxnbP7inmjShTHuEYY+pslFkN7iGvXidsRI6WdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720648; c=relaxed/simple;
	bh=wxH+/h7j84YFV5OC/w59n8xJ+G44cxPsxULt0hOsIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9vIKUr1D2tMaIqYZc+PlLaI9XLv3hFLmMKtjsiJILDn8KROVJkSpf2m4NXIvwUlNnobWgCSh5yDfwsLekwmZF92/WL6ty3gnkHeBea6xj1PkIDJYTBuQrU92dqM3PGOHN3/yXdpWcEmQoFElAh2cMAHhYkCSeS+bHrK0H5aFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fibD64BY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744720647; x=1776256647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxH+/h7j84YFV5OC/w59n8xJ+G44cxPsxULt0hOsIDo=;
  b=fibD64BYiSnXsyNhFWaBRDoqaU+oWLsK48o3naIqg6PkjfQSuC9qhFQb
   rsbX1RyTWITxdKnnNw+8RTPdmosIBDY/9S3SMSBJENUzkEXZbmUWxEJbw
   AkKFkls86lJTk+0SHVmVA6Le/WSGk0ejNpurJvQKry6755d2vCB7lFdd5
   OCfsX9HeNts1AzlPe6TIj8zHZ9cqmwcxGLQJoO5zXTYOHGTVshzUDJ7v1
   RTQPTh03Wtq5v34lwcoYGcBfxE1PbE3XXdNrvHlzDGvYzvsEFDldAMctR
   e7cA40fTlNP/KPk9WafKLGdv5H57KmnPDA2Goi83M6DGc1S7hFBzViwkY
   Q==;
X-CSE-ConnectionGUID: EIg+0+LRRjC6Kj249bPPMg==
X-CSE-MsgGUID: kYHggs/pQXmNlyeKgFH97w==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50052622"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="50052622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 05:36:19 -0700
X-CSE-ConnectionGUID: dA0L30H+Q2e69NQPY73j1Q==
X-CSE-MsgGUID: 3CHVnKAkRQq9CR8FeRQXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130126331"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2025 05:36:17 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 763FC8D1; Tue, 15 Apr 2025 15:36:16 +0300 (EEST)
Date: Tue, 15 Apr 2025 15:36:16 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	michael.jamet@intel.com, YehezkelShB@gmail.com,
	heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 0/3] Introduce Thunderbolt/USB4 <-> USB Type-C port
 mapping
Message-ID: <20250415123616.GG3152277@black.fi.intel.com>
References: <20250414175554.107228-1-alan.borzeszkowski@linux.intel.com>
 <2025041521-axis-broadly-2216@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025041521-axis-broadly-2216@gregkh>

On Tue, Apr 15, 2025 at 02:22:35PM +0200, Greg KH wrote:
> On Mon, Apr 14, 2025 at 07:55:51PM +0200, Alan Borzeszkowski wrote:
> > Hello everyone,
> > 
> > This patch series introduces the creation of symlinks between
> > Thunderbolt/USB4 ports and their corresponding USB Type-C ports. The
> > primary goal is to provide users with clear visibility into which USB4
> > port is connected via a specific Type-C port. This provides the same
> > functionality that is already present in Chromebooks.
> > 
> > Alan Borzeszkowski (3):
> >   thunderbolt: Expose usb4_port_index() to other modules
> >   thunderbolt: Add Thunderbolt/USB4 <-> USB3 match function
> >   usb: typec: Connect Type-C port with associated USB4 port
> > 
> >  drivers/thunderbolt/tb.h        |  1 +
> >  drivers/thunderbolt/usb4.c      | 14 +++++++--
> >  drivers/thunderbolt/usb4_port.c | 56 ++++++++++++++++++++++++++++-----
> >  drivers/usb/typec/port-mapper.c | 23 ++++++++++++--
> >  include/linux/thunderbolt.h     | 18 +++++++++++
> >  5 files changed, 99 insertions(+), 13 deletions(-)
> > 
> > 
> > base-commit: 306a14d03f47fa152c7e47be544d8d582d387a20
> > -- 
> > 2.43.0
> > 
> > 
> 
> I'm guessing that these will come through the thunderbolt tree to me?

Yes, I will pick them up and send to you with the rest of the v6.16 stuff.

