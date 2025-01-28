Return-Path: <linux-usb+bounces-19805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21DA2062D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 09:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9EE93A78C9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 08:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4E81DED73;
	Tue, 28 Jan 2025 08:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkD1E7yj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A14A1D;
	Tue, 28 Jan 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738052826; cv=none; b=M+E+CRab/iFOzJ5Krh0DEsVzWvTtlgL91j1B2I0lASGLgmObdluGlcS4HlsEh37ZK8xHGpJhXty+fIPLbCxJhAK73EmKtrm4PlG8NZiwRvQXkAxvuoFZFB+xVTykK8BSypxUv/L4RfX32z0uw2lhWLGqhEPrA+HGGtAketCsqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738052826; c=relaxed/simple;
	bh=wENBjK0wW1o9V778R7bc6RC60ZOcv2ejFVBMCbvwalY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9E23/Ud8LeK+1R9wL0/ZIGGQc/0mOMWgeBebEG+r4sKmmf51Yc2bOjo6fKs+iZXpN401KpFkzYGJjn8ffjvYfB9MSq7o6btQfkIgQnnURtFuuq+eSLKOrZLo0O1opMk7w/0HjDBg+LnlLLNViGlZrE3vqZuHwvT4yIzAXHj+9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkD1E7yj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738052825; x=1769588825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wENBjK0wW1o9V778R7bc6RC60ZOcv2ejFVBMCbvwalY=;
  b=VkD1E7yjPMCtlPhekhV+BK1ph9QCBeb5datNElR7OVbGVlsfymfOp2Bj
   anjctUpOSitdcoNzEiW2nQWZl38nVPoFM4La00iKq/jY82kR9mwsvJaH6
   7tY6OAMvwmQ5aNvvbIyhD4Bgr1UyAVAFlYWdH+1s/q2l1jBHqFiu/2vml
   bpoFGPs7ehMFjBhLP52oSH7cAaSAHuJyFhcSv9G6dY6GkA1b2Jx+tYVIF
   im+BeWUnytDfEB3kmTxs08n0YtvyhK3DyLJQOVD4VZrLP7xoeHC2aeakX
   tjnlyYchsTsYja6BIwuwkdHqlCwWHdRbduLdT+LjB4u9C0q+dOaq05o/V
   Q==;
X-CSE-ConnectionGUID: r86Tf8PyT9OLhckXaeW7HA==
X-CSE-MsgGUID: hMbWCKT7TJiZJZg30aI1qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49185471"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="49185471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 00:27:02 -0800
X-CSE-ConnectionGUID: zpDsrNPyQnOgtW0fuGw8bg==
X-CSE-MsgGUID: Rc1uloxjTDqbznRgm4aCtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; 
   d="scan'208";a="108782057"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa008.fm.intel.com with SMTP; 28 Jan 2025 00:27:00 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Jan 2025 10:26:59 +0200
Date: Tue, 28 Jan 2025 10:26:59 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: typec: ucsi: continue rework of command
 interface
Message-ID: <Z5iU0xQWm01XObEI@kuha.fi.intel.com>
References: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>

On Fri, Jan 17, 2025 at 12:49:40PM +0200, Dmitry Baryshkov wrote:
> There are cases when UCSI drivers either want to mangle UCSI commands or
> its response or to completely emulate some of the commands in software.
> Currently code to handle such situations is split between sync_control(),
> read_cci() and read_message_in() callbacks.
> 
> Make sync_control() also return CCI and MESSAGE_IN data, simplifying
> this kind of handling. This series reworks CCG driver and LG Gram
> quirks. If the approach is considered to be acceptable, it will be used
> to emulate AltMode support in the GLINK and Yoga C630 drivers: on these
> platforms DisplayPort AltMode is handled via the non-UCSI messages,
> however in the past reviewers suggested reusing UCSI displayport driver
> and just emulate necessary commands (mostly GET_CURRENT_CAM).

This is okay by me. For the lot:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (3):
>       usb: typec: ucsi: return CCI and message from sync_control callback
>       usb: typec: ucsi: ccg: move command quirks to ucsi_ccg_sync_control()
>       usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()
> 
>  drivers/usb/typec/ucsi/ucsi.c      | 19 ++++++-----
>  drivers/usb/typec/ucsi/ucsi.h      |  6 ++--
>  drivers/usb/typec/ucsi/ucsi_acpi.c | 29 +++++------------
>  drivers/usb/typec/ucsi/ucsi_ccg.c  | 67 ++++++++++++++++++--------------------
>  4 files changed, 56 insertions(+), 65 deletions(-)
> ---
> base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
> change-id: 20250116-ucsi-merge-commands-f2f6f5c93466
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
heikki

