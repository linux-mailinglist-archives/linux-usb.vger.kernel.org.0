Return-Path: <linux-usb+bounces-20962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BB7A41664
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 08:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8DF16FD78
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 07:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087B3156F3F;
	Mon, 24 Feb 2025 07:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU+yDAqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C741898ED
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740382674; cv=none; b=UxTSy7GEjMcUKiZXZrPrmw63iSDCGCnqzwzgyL4HSi7C9pzRjWHQrgSL8L8yQUrEvfH7pGGAjOKM9HrLSvp8bd3G2dYF/r2f0Ep19qSKvse59/gu+RO+VWPYFr7UDZm3Ygkgy9dPB/N76phlbNHlfIGczOm0eDn/OteUoEzEklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740382674; c=relaxed/simple;
	bh=eXCoH9N4XIuoENjKKItMZ7guPUnQHCI6tP93QCmt4rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCVVCEX0QRpcwHs7kqNMHu7i6flMI2iEWXvrHJ3F856v127MNT/YOeembHD1rsgSTXDKEgtjaHIhkLLqTbosDjiDLghcj0TSCuHzSvWuE6SBDEj9Z3L1qEit5EgJvuGTdQFPlOCZjvGbNuWFWNH9hp5P1r4r+rCgO7XYx7UZN58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU+yDAqF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740382673; x=1771918673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eXCoH9N4XIuoENjKKItMZ7guPUnQHCI6tP93QCmt4rs=;
  b=nU+yDAqFapF3RQhFD2p8kFwEK5clR5MdqGwj4EMLRfzyxSbA9My3q9ul
   gQmhIsK23S/Ff/0GPOq+h/u+7LbIf0wUtyxjrTI5FRDM0z37FHCLbXdVN
   drvBdoqEQfdv7aOp7tTXH558CYSX6ErlrkCcELyQ1dZJjyXXBI8UZj70d
   CyUSzzqJYT+TeU2PzWDEi4QCSMksXwMDeYV5TaaD3litYyD4PWXKOnyqk
   jUmwjZEWkr5hIirEfSGXwNOCKpCivHrr0DUGFRzE6I8nmc1azX7snz+ZE
   TRtEP1mTCZBJR+JyfDchTJ9HjHK20WBPDY9p1eQZr22MH7CpHUoh2rKg5
   Q==;
X-CSE-ConnectionGUID: hi0wIp3DQ3C9cDQb9F0AVQ==
X-CSE-MsgGUID: uBVbd0ZOQcehRpjmtgXBzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58543218"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58543218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:37:52 -0800
X-CSE-ConnectionGUID: O7QXXHj0SN+Yo+bBEIQ0aQ==
X-CSE-MsgGUID: +zC4m36CS+OP+SNO5xUYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115961757"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2025 23:37:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 77C5015B; Mon, 24 Feb 2025 09:37:49 +0200 (EET)
Date: Mon, 24 Feb 2025 09:37:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Make tb_tunnel_alloc_usb3() error paths
 consistent with the rest
Message-ID: <20250224073749.GL3713119@black.fi.intel.com>
References: <20250213141630.2751958-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250213141630.2751958-1-mika.westerberg@linux.intel.com>

On Thu, Feb 13, 2025 at 04:16:30PM +0200, Mika Westerberg wrote:
> From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> 
> Make the tb_tunnel_alloc_usb3() error codepaths consistent with the
> DisplayPort and PCIe counterparts.
> 
> No functional changes.
> 
> Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

