Return-Path: <linux-usb+bounces-9475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC28AA7E0
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 07:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49BA3284B7F
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 05:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E298F5B;
	Fri, 19 Apr 2024 05:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBTZbINO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462DEB666
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 05:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713503041; cv=none; b=YHOwVF1LW/IbIc1RvDaVSYv/lHSFFTUcBKkzcFb6pfEk9J6FQWOkbhyLc4ZB+KKCm1Py0J9GVR7EbZYsZqTf6dyVg57wnxeH4yq6UHFsgFGM4YVC2QXlEMWdw9oidyJ+ipnykegPh+8jfIiYI8HNACEzz0NQtNgO2y/7G9P4NKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713503041; c=relaxed/simple;
	bh=mxeXUPoFnBKx33CGb+AXTQO2bwz9fOMLCT5aR7BTFcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4VZcP29cejkMSOgqFUM8zvFKB/UG5WZPNoSTgSpQOwvgvrXYCTjtKzYDdgsqNQLcEEdon4tUx88jrDpHf2cfITTwLjV5kSJBHU39N0uDHBZl1V6eAbFmyoYgT3unlZ8RNqfeya4higby45wNEtQYNG1xgkgqoKdcxr3bU2+H5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBTZbINO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713503040; x=1745039040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxeXUPoFnBKx33CGb+AXTQO2bwz9fOMLCT5aR7BTFcA=;
  b=GBTZbINOLYwO7Oauef5ZApfjfnpq3LT/uIp/K2YrhnmnIu04RpHPNjTi
   ytQ9dPGOpn6Zkfs78F9GV05khsNFJ8K6fasyiYvxmhQ5/FFj3mK5PS/x7
   HgmGuSZLNQVppYcI2Mm5QeLBdr/FgdwuUWHAPh9PYXoT2HyCTc0dkfCU7
   k4UjuvJuZGWkoBDYYF4ov52ISTpTpMHNhS38M5cnaljRwNbiY7SkCIe0r
   gQwaQWKQkRcVYXV7b8imyYYlXfF0ONfE/aLNG7LZ9tRKmThY8daHEIBfh
   meb1JfvaDRYYpT/HgEwIIt+NhyigeCm7PNuPzD6EZhPYCftR7+VYQ8zSf
   w==;
X-CSE-ConnectionGUID: yaFGZC2zSmGXX7aqZX6v+Q==
X-CSE-MsgGUID: xZ8lEQi+QSWggP1YYfuwMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9314088"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9314088"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 22:03:59 -0700
X-CSE-ConnectionGUID: flNU4rPRSzuf6mBJiyNTxw==
X-CSE-MsgGUID: ouhqYrA7RIePThLjYUHXOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="54133993"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 18 Apr 2024 22:03:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EEC7418F; Fri, 19 Apr 2024 08:03:56 +0300 (EEST)
Date: Fri, 19 Apr 2024 08:03:56 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH] thunderbolt: Get rid of TB_CFG_PKG_PREPARE_TO_SLEEP
Message-ID: <20240419050356.GT112498@black.fi.intel.com>
References: <20240415070106.577176-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240415070106.577176-1-mika.westerberg@linux.intel.com>

On Mon, Apr 15, 2024 at 10:01:06AM +0300, Mika Westerberg wrote:
> This is not used anywhere in the driver so remove it. No functional
> changes.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/next.

