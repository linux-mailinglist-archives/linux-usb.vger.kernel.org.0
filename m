Return-Path: <linux-usb+bounces-35181-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANksBDZlvGlgyAIAu9opvQ
	(envelope-from <linux-usb+bounces-35181-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 22:05:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A954F2D27F0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 22:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67FC830234FA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF663ACA65;
	Thu, 19 Mar 2026 21:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YR10BltK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB593321A2
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954344; cv=none; b=JufnTb44cvYQej0HW6DzcRx/0zsVuMRs224m8sS//5d2zeRuKHdzmG6v5n1pAkP4gk1JyX1zcXOjQGLq8I5uSj3jThkAs85tjMWNO+W6dUc1sgWcG07FW+qJOaBbtbycF1WVuopCkhxabPXYUzRyf2M+7Cr39HXKy2fBn+KxrIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954344; c=relaxed/simple;
	bh=HE6THcH6TiOBiXIvDkKWNmIvYffg41IuKgoQZ1XYK40=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y7xFFe927cUlV+mlhhi6h5792OssVW51b+64ZD24nJ5ZjDFkI9ghm4OP1IF9CY4ompctoxlNFP0ru814yqA7LIiIJpaUTtiXXiEQro+UTLO74elXnpt2VbvF3uOgImapCRKY1za4IaoszWAds3b/R42ZO9bX2SVWx8TkWaTpPuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YR10BltK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773954344; x=1805490344;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=HE6THcH6TiOBiXIvDkKWNmIvYffg41IuKgoQZ1XYK40=;
  b=YR10BltKEd6FgSVD/1DfVIP3mcnSepcgp3I6adkobnBiYkDYSy3VarxR
   c0sorvZqWnvDcoNAOGIeBSI5k62i/WmduNUB96Dyu7t0LimWEtDdDVSoe
   nH6ifv9TvCq/WG6jqg5mCve+vjFkoDzEKx8JHZSdfgDxObhi7PIAG/7Ot
   s0S+Tv9uV7N63S7UGYMRiCPjrOlsL2fKapdhsGm6sLWYrAi7Xa+W1igI+
   tA4lYo9+3HCzoPm95UY8et9u9ummH3GnLv88Omwp89dSXLHeVBx/ISjAv
   HlxShbJspcthRtWOrMmWYG+RC2CRrgh588thpTSbCF9DU/BHB6VSAKU/Y
   w==;
X-CSE-ConnectionGUID: DVmPVy7ERvGngrQFy8hskA==
X-CSE-MsgGUID: p/1aBnfVQlS87fg7p6yKyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74949526"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74949526"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:05:43 -0700
X-CSE-ConnectionGUID: V/hYVl/QRPaBuVitEjPggA==
X-CSE-MsgGUID: alRLMjcfQ+G3wqHPeh29Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="218958147"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.144]) ([10.245.244.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 14:05:40 -0700
Message-ID: <175e480c-4ef8-4946-a597-905f45ff276d@linux.intel.com>
Date: Thu, 19 Mar 2026 23:05:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] xhci: use BIT macro
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20260316160213.1367774-1-oneukum@suse.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260316160213.1367774-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35181-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathias.nyman@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,suse.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A954F2D27F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 18:01, Oliver Neukum wrote:
> We have the macro. Use it.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Added to queue

Thanks
Mathias

