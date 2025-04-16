Return-Path: <linux-usb+bounces-23129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC648A8B94D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 14:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5201896C51
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF811B960;
	Wed, 16 Apr 2025 12:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMCM4186"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58CD12B73
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807070; cv=none; b=c24JhQO5OrYQQrZN1OgiSg2zSnZptUAC4kltki/THkXPE4qqHY6Q+LXPxVzSnjjY14MDaFbkl/aAyWepvaggfa4cXVVhwjzRITx6TKO48POYc0LDHmy6owDSrP9axg2F3CxkSkST+zlOgcBt5RSdWrg8Bve/ijSsdavzOs++DWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807070; c=relaxed/simple;
	bh=1cSJ9dc/ws6cKODgdr0sqq5pYsvKGzSC64n5HqPPDbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLPqWn+67D/Q56kwokMRyZi94ydzGBDNUVcUpBOkcttyM6Gf7OU0Bd/jIcYlKl3FGsQgW2GV3OIyWSnp/ERE/lobmim8VFofzB7iIPI6q793BGzPrI9TNBsKinhw4HY9XDsiHBOacXXYeMEe38gr9TJMH36e5HSfB0caagasJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMCM4186; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744807068; x=1776343068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1cSJ9dc/ws6cKODgdr0sqq5pYsvKGzSC64n5HqPPDbg=;
  b=DMCM4186FU8hM2B2cZfQTraPDOTpV1N4cE+241k9If7GrwGjwj7ku0ao
   LJITDPRIwcMqdEKRJZzV8w8aBXk9tgSjfONQH40Eftzcd0GZu1Yz4G/Qy
   bHhcNpSjLd3w9MROyQCP6EGbOIMIeXtkmFoYuQpPwQP03f8+1LxpuT6vr
   41W7If7/6Dvs06u3SmleQK9E7tpBcrCF8PkTc+XfneW9LetWcRWGd0q20
   4PYJoWfgpY87U0kL6QzB3Hl+HuFiu8RtQ5SFRC3FNW9dEvNyVKqDtLvk0
   JOIE3+gNs67vNSquXVnGVD/4W/nyY9ovhOH+jDvbE3kZPAu5OyUjhs5nW
   w==;
X-CSE-ConnectionGUID: 4kZjqWH4TDS50LEA1HrzHw==
X-CSE-MsgGUID: DEOhYTWKQAyxyaCCTVkOuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57740716"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="57740716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 05:37:47 -0700
X-CSE-ConnectionGUID: YB3dXXvGSAmCyebeoWVHeg==
X-CSE-MsgGUID: AR2Y//MER6y0gC5vg6oD1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135317302"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 16 Apr 2025 05:37:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 5235AF8; Wed, 16 Apr 2025 15:37:43 +0300 (EEST)
Date: Wed, 16 Apr 2025 15:37:43 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com,
	michael.jamet@intel.com, westeri@kernel.org, YehezkelShB@gmail.com,
	rajat.khandelwal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix a logic error in wake on connect
Message-ID: <20250416123743.GH3152277@black.fi.intel.com>
References: <20250411151446.4121877-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250411151446.4121877-1-superm1@kernel.org>

On Fri, Apr 11, 2025 at 10:14:44AM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> commit a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect
> on USB4 ports") introduced a sysfs file to control wake up policy
> for a given USB4 port that defaulted to disabled.
> 
> However when testing commit 4bfeea6ec1c02 ("thunderbolt: Use wake
> on connect and disconnect over suspend") I found that it was working
> even without making changes to the power/wakeup file (which defaults
> to disabled). This is because of a logic error doing a bitwise or
> of the wake-on-connect flag with device_may_wakeup() which should
> have been a logical AND.
> 
> Adjust the logic so that policy is only applied when wakeup is
> actually enabled.
> 
> Fixes: a5cfc9d65879c ("thunderbolt: Add wake on connect/disconnect on USB4 ports")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I guess the offending commit was never even tested :(

Applied to thunderbolt.git/next thanks!

