Return-Path: <linux-usb+bounces-21822-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A2A649C3
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 11:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96CA27A4D54
	for <lists+linux-usb@lfdr.de>; Mon, 17 Mar 2025 10:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F5F22CBC9;
	Mon, 17 Mar 2025 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZZs8Kwdr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EFF133987
	for <linux-usb@vger.kernel.org>; Mon, 17 Mar 2025 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207144; cv=none; b=cwx5jK4IHtS0TELENMFUFoGrTOpiK6xyXDbzt2PUG07tKXOilb16xEcTLgZRT7dC2x1I1pfrWLtHjW/CtxXAVBdPykuJtopw5Oa7DyeIA7lJ9uZRna2SyCBSiFWd+W/Us7FL+hPNiSiOzDpYTLEfiYk3e43End+OLImWuqtMXls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207144; c=relaxed/simple;
	bh=9bOljZZxdsx8HwzhEpFmTxmgqc5+EG4VCX7btuaF/9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bf4UINu+pNGOI6haHakykZwfo2nJOOMXeMsnSC4E5hPLto76ozOHTDyg4j98Ift/DVzUXM336cqKcitkPTkkiROcomEjRcMkel3MTy4SYsaOeBj8BXWrzy8y2W6xcnMpK94ka3nG373/HOAJM0uK7l3Sk0tviKA/dBio0bqCzYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZZs8Kwdr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742207143; x=1773743143;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9bOljZZxdsx8HwzhEpFmTxmgqc5+EG4VCX7btuaF/9M=;
  b=ZZs8KwdrJ6zrzn4Y6sOhHwJ4dDSx9JqRaGE5ffXpRU51dEig2SZVpD6D
   c9sVartLaVjF5OI2v/DREfvtuSOlaMp1ZicROQJ3Zs6HIeQqtBIPHcNxq
   RLYZz6CBh7tiWwh4BslNa2nQqLzn907PaRHUN8bV7SMJRX65yyc3RJ6Px
   h/O/7U79jolG4C0ih9hQdsXuccRjTNSM+9QKdaxbTO2QvLGs2t9K36tog
   gm8HXcFF3FrofZDK86QYZORYC7hs6nluvMs3rRgK/kLIV6bZQuuYq3QY0
   0o7MTH4nVlNMJqzXw0BY/pE+GBtevfvWY4RxqK/ZwzcIEgu/nMS8ja5yB
   A==;
X-CSE-ConnectionGUID: 2m7yDLrmT0+dyNnTOt/Khw==
X-CSE-MsgGUID: jzWZ7XzCSk69WeShyA002A==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="53501141"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="53501141"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 03:25:41 -0700
X-CSE-ConnectionGUID: qhQzj04FSby5NrdolqGfBw==
X-CSE-MsgGUID: xu43uBYDTemx1Bx+tzQYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="122641767"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Mar 2025 03:25:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9980D1D8; Mon, 17 Mar 2025 12:25:37 +0200 (EET)
Date: Mon, 17 Mar 2025 12:25:37 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Thomas Lynema <lyz27@yahoo.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: Scan retimers after device router has
 been enumerated
Message-ID: <20250317102537.GL3713119@black.fi.intel.com>
References: <20250312092603.3666723-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312092603.3666723-1-mika.westerberg@linux.intel.com>

On Wed, Mar 12, 2025 at 11:26:02AM +0200, Mika Westerberg wrote:
> Thomas reported connection issues on AMD system with Pluggable UD-4VPD
> dock. After some experiments it looks like the device has some sort of
> internal timeout that triggers reconnect. This is completely against the
> USB4 spec, as there is no requirement for the host to enumerate the
> device right away or even at all.
> 
> In Linux case the delay is caused by scanning of retimers on the link so
> we can work this around by doing the scanning after the device router
> has been enumerated.
> 
> Reported-by: Thomas Lynema <lyz27@yahoo.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219748
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Both patches applied to thunderbolt.git/next.

