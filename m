Return-Path: <linux-usb+bounces-27281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CF6B353CD
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 08:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D986846D2
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 06:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D277B2F49E7;
	Tue, 26 Aug 2025 06:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrYxFY74"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081382F3C18
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 06:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756188439; cv=none; b=O95W55GMdqRg4wDC1IwsuWsJITU5V0pvbOtE+GeXZLl8xTJutQvAq+S0qBfqNFIOUJqA0tTiB3oA35EzUd+Em4ZJRJ5yDcbXNcNjyomxTfnP//x7D2lj4HCeiARFFYQHiC6lkrVB9npEiq1nTn8F56jqxfmTdQmE4Yw1vRyDGkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756188439; c=relaxed/simple;
	bh=yEUO4NN6wC7ad06F+BMH9e6c3RC9zXgSjom2ozl9NwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmEcpsM16UEOmQVTnHB/8wxtJk2gUqSRkimW8Ar56JzX3CDMBQsh7M3ZjWdA19K03MmQlR6Kw+rI3jcU+3EuuwEe38MAcp3ofqi7qjmLSNPCT7bzW7pYZZDUcnc0Z7BvbdZ3qugSvev0yl2hkEqRlVf8fyJhtAItShN1EZLtX/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrYxFY74; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756188437; x=1787724437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yEUO4NN6wC7ad06F+BMH9e6c3RC9zXgSjom2ozl9NwU=;
  b=HrYxFY740TB2l246WOGfCzh23xMSK6LQq3gK9PeSC2lm4Sw/H3W2pWKL
   meyJ4hMipdkdtBKMKRu+Wk8WO4B8aYCWkhXTysIgbJ2wsd+/B3pCsoAtA
   FpywYtsMz/fZnCO7I2pgI/Pw2zG/jS+RSJdyBbbz1qmYaTu9hbSQvOdFE
   ppGLsoUemtoB+/Un+2mOlfkeeC1hEo4zCToDSLZXsf3d9HJgwQHGBbtXX
   tIWzCeRq9pfgKJQsNY4B3xcLZoNasJBBpd+vBIVhAyQT2bo+LoAqRIGG1
   YRxzrjxrf/XnOW7PBhhr4U0jdsOOMA3qmFeEFjmiy9ba64vLhg7pGZi3a
   w==;
X-CSE-ConnectionGUID: Cr7bhPJtS6+2vJwntPe36g==
X-CSE-MsgGUID: 94XFu4RORJ2WSOWNm+yXYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62229606"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="62229606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 23:07:16 -0700
X-CSE-ConnectionGUID: LFfb2XVrS3CdGdFm1mY9Ig==
X-CSE-MsgGUID: TsWmqfpgRxSxTfUJ6rzIBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169417452"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 25 Aug 2025 23:07:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F140294; Tue, 26 Aug 2025 08:07:13 +0200 (CEST)
Date: Tue, 26 Aug 2025 08:07:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] drivers: thunderbolt: Use string choices helpers
Message-ID: <20250826060713.GS476609@black.igk.intel.com>
References: <20250824151316.2388812-1-chelsyratnawat2001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250824151316.2388812-1-chelsyratnawat2001@gmail.com>

On Sun, Aug 24, 2025 at 08:13:16AM -0700, Chelsy Ratnawat wrote:
> Use string_choices.h helpers instead of hard-coded strings.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>

Applied to thunderbolt.git/next, thanks!

