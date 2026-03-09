Return-Path: <linux-usb+bounces-34291-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECV2HUKwrmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34291-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:34:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E58237FC2
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 673A43036632
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203103A4F27;
	Mon,  9 Mar 2026 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrLMfiyt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2939B285050;
	Mon,  9 Mar 2026 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056059; cv=none; b=D3WuysVpYdl58+1GZM+FCH+kLTZHqmNA//1WICKsPLFi4FtIDTDmEezvXzS+F8NYJNDc49k10o3ZYZXD56K4zRYKPWpwiVZOhB1zxf0FeIz9OpgmtQC057tTkm12JTTOFHi2dSF/s8uPL6Zz7153lGW1pb8A5LiwfBgp+WwjoBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056059; c=relaxed/simple;
	bh=hqcu7qx/hyMsD6C7ZpqhKNfzuPS+EcyCzrZ9uZ4KnDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gw0S4rBshQeMuhpWy1AMLY306yb4W4gt4DGoVCBnO4hRz0U9XCJd9L+b0CBFKIthKzoDhwN5GDl95MLVYanUnJtGhHi8BKnnz44nENwRuCcEuizaTUKzVpQiHH6dtzVsbvu114zv0aXCYY7ai9McgVvCrQDX6IFEbH+HQTR39Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrLMfiyt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056058; x=1804592058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hqcu7qx/hyMsD6C7ZpqhKNfzuPS+EcyCzrZ9uZ4KnDQ=;
  b=lrLMfiytxtF9KsM9SZwtaXYzbDlcpnSLzN5mOGN0OosO2WLjn7uM75xj
   nrvAMCVWwkzdfjSts7f3L3NyYiOVsWfb2dxv1qFY0TF1+8Ri/kOMYyQ8L
   w6y/leD1pb+FbCZCGZOg6Y92rh05TS8Jr03nDG8PUVCE9Gjb+Adt/UJ/U
   8XMGSzQlewgubclGTuM6VHBfl9D5Wrf0ggXG6ZlNIjDUAipsEI8GofhkQ
   fkPfOSnk31BqZn344R1fZAgsV7RwcUMp+8qMJIMKRJrJZlXt8s8Tawu9/
   Y8G1bjXqbfNqTAVDayJ1CZ4TIQpfbC0pHfF86AERvKJGjzQKXtJmlfRnX
   A==;
X-CSE-ConnectionGUID: qQjpxncbT4WljOtzzaH5Jw==
X-CSE-MsgGUID: NmANxH18TuOwGXeHpuG2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73096533"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73096533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:34:17 -0700
X-CSE-ConnectionGUID: m+NByb55RR2ny33Ixwusuw==
X-CSE-MsgGUID: E3qz9KhkS16Q6a/rNoGmzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="218934532"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2026 04:34:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D4C2F98; Mon, 09 Mar 2026 12:34:14 +0100 (CET)
Date: Mon, 9 Mar 2026 13:33:34 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel test robot <lkp@intel.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ucsi: huawei_gaokun: make gaokun_ucsi_ops static
Message-ID: <aa6wDlolFS7FR5Fn@kuha>
References: <20260305144054.27848-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305144054.27848-1-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: E1E58237FC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34291-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.956];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Thu, Mar 05, 2026 at 10:40:36PM +0800, Pengyu Luo kirjoitti:
> The gaokun_ucsi_ops structure is only used within its translation unit
> and is not referenced from any other file. Add the 'static' qualifier
> to avoid unnecessary symbol export.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603050203.KD4RWA00-lkp@intel.com
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index c5965656b..ca749fde4 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -193,7 +193,7 @@ static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
>  	gaokun_set_orientation(con, &uec->ports[idx]);
>  }
>  
> -const struct ucsi_operations gaokun_ucsi_ops = {
> +static const struct ucsi_operations gaokun_ucsi_ops = {
>  	.read_version = gaokun_ucsi_read_version,
>  	.read_cci = gaokun_ucsi_read_cci,
>  	.poll_cci = gaokun_ucsi_read_cci,
> -- 
> 2.53.0

-- 
heikki

