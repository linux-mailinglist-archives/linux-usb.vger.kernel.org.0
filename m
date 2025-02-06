Return-Path: <linux-usb+bounces-20262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ECFA2ACF3
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 16:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E8CD161CF6
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 15:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76201E5B89;
	Thu,  6 Feb 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bb1R6odE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE944C8E
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856828; cv=none; b=tTWgxybkwU/pOhcyYCeBccAe47g9Dy26IoxFDsivKKmpdpcSB3fQ6fInRoXsjqMZk5Wt06kxIAuUlKl2gkgp2ziINuf1bSd/24lBzvJlb39hHu/aPer/fWLk3DOVqy/oJiYWPjiaqGZmGWYqPZDCWOlTQXX6Ai2dUotWT6E7814=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856828; c=relaxed/simple;
	bh=s6W5ZK6enKgHd4IT5MX1XxkZkON5DN5CDBMyBOtFzz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Acy16/bAvJKL94oyy/K9M0Qzfgiv5hAdupHPoa8k0oY77qbcn0VUSGlTWWwyVvTroaz1tLceQTVmMNCqHNbtjTxsFWNofym6J+pBDwK1oDMFULRwgfeNSd6/zWFYTZww+6x9mZcOHKKkz8CYB/cAw+BuVEjUYLYM3qKeM3IviV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bb1R6odE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738856826; x=1770392826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s6W5ZK6enKgHd4IT5MX1XxkZkON5DN5CDBMyBOtFzz4=;
  b=Bb1R6odEr4D81lXm39FIpR+skm7xlzYJxoGmt77hImk91h5Twp+W/9nD
   rYqkWLdmu81ictUVBPQDiLxTf9lmm0eIevYIZniNQrYR+ATP1ErQsFJz8
   6fHJTCKYYTQQqKZQuhdmMx2EFkQkRYywULZMc7PsELq/Alv4NqB3DAhVO
   oDLjUUOVTuEnb7PaXwdEdyW7dHp1ZjNxYI7abIt94/yuFPNGPxBKZU2sX
   kJO3xOunqGASBzRbp9Oz/cIbvjQ1ODEsO7AZ5dQRqaExUGOf4WQCGBg+X
   2tdwSp9n6pteHphxyz5+rYXooX5xqIkCPEnFOSsVzV4V/TqY1l/IZTP2k
   Q==;
X-CSE-ConnectionGUID: o1GwICTnQeaMGbmGx4bLeg==
X-CSE-MsgGUID: Ulv15secS9KGU+6Xtr41ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38696845"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="38696845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:47:06 -0800
X-CSE-ConnectionGUID: BqtFf478QZ6fKxQqiPwjmA==
X-CSE-MsgGUID: 8JvSdhhIQn6SIeBQowWj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116233724"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 07:47:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AE1A6EE; Thu, 06 Feb 2025 17:47:02 +0200 (EET)
Date: Thu, 6 Feb 2025 17:47:02 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Use my kernel.org address for
 USB4/Thunderbolt work
Message-ID: <20250206154702.GS3713119@black.fi.intel.com>
References: <20250204124959.3998521-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204124959.3998521-1-mika.westerberg@linux.intel.com>

On Tue, Feb 04, 2025 at 02:49:59PM +0200, Mika Westerberg wrote:
> Switch to use my kernel.org address for USB4/Thunderbolt work.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

