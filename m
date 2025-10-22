Return-Path: <linux-usb+bounces-29542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F71BFE397
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 22:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C0493A7837
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 20:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142C5301009;
	Wed, 22 Oct 2025 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b="teo1lGo0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830132FF678
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 20:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.206.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761166358; cv=none; b=m+rkoyuR43BcXuX3vlWO4dp4n1iVPjihVYojJuWr0Ixy9yP0jIRtAME8UEwRiAo5D+kqqC+NXty4z9K8ZkaQibD/l2sPSeIcmFJNXnfJ8nNgu9vSUR9VWjYd5uDzmGJGCs7vDVJF7bWTf4uM0n7QQLbobQl3oT7yZvk5i8wEAgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761166358; c=relaxed/simple;
	bh=/FWQZoAeguDCWysuyz5TVd5Q3ZKwpjQ/UrkrHSRl5LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bvFZG2R8/bqKC0LDTxcxtEEf/rxA1XVJWWuFW3/TodqeCAs3AnDaQksoDCL3ELA8VhvM+nY0mPqWPchbZH/SYUmu3B87SS2hMk2wg9g5ma0xSySG7MZfinRxWiG9JmQJSnXF2vCiMXmzry5sGjWhcibyxv8/OBaCKTkvqwcZStg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net; spf=pass smtp.mailfrom=gouders.net; dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b=teo1lGo0; arc=none smtp.client-ip=202.61.206.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gouders.net
Received: from localhost (ltea-047-065-178-028.pools.arcor-ip.net [47.65.178.28])
	(authenticated bits=0)
	by mx10.gouders.net (8.18.1/8.17.1.9) with ESMTPSA id 59MKPUvP022242
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 22 Oct 2025 22:25:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1761164732; bh=/FWQZoAeguDCWysuyz5TVd5Q3ZKwpjQ/UrkrHSRl5LY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=teo1lGo078DP8GsqgAghc6+wOu7F069pZD0j7Mhourxf1CqGoEO2CRooOOAacw0NG
	 kHyRuTXzGUkwu9KsyubTwGjBL51Nsgtbe3N+1QxJ1A6n5AuAsitZh+Lea2aMiFat8Y
	 Slx9xkXu6J2oRMJfVHHVQL5mTMhx67Uvf7bY6QBI=
From: Dirk Gouders <dirk@gouders.net>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        Niklas
 Neronin <niklas.neronin@linux.intel.com>,
        Nick Nielsen
 <nick.kainielsen@free.fr>, grm1 <grm1@mailbox.org>
Subject: Re: [PATCH 3/6] usb: xhci-pci: add support for hosts with zero USB3
 ports
In-Reply-To: <20250917210726.97100-4-mathias.nyman@linux.intel.com> (Mathias
	Nyman's message of "Thu, 18 Sep 2025 00:07:22 +0300")
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
	<20250917210726.97100-4-mathias.nyman@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Wed, 22 Oct 2025 22:25:30 +0200
Message-ID: <ghwm4msmyt.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mathias Nyman <mathias.nyman@linux.intel.com> writes:

> From: Niklas Neronin <niklas.neronin@linux.intel.com>
>
> Add xhci support for PCI hosts that have zero USB3 ports.
> Avoid creating a shared Host Controller Driver (HCD) when there is only
> one root hub. Additionally, all references to 'xhci->shared_hcd' are now
> checked before use.
>
> Only xhci-pci.c requires modification to accommodate this change, as the
> xhci core already supports configurations with zero USB3 ports. This
> capability was introduced when xHCI Platform and MediaTek added support
> for zero USB3 ports.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220181
> Tested-by: Nick Nielsen <nick.kainielsen@free.fr>
> Tested-by: grm1 <grm1@mailbox.org>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

I noticed that on my notebook (Lenovo ThinkPad L14 Gen 5, model
21L5CTO1WW) the integrated camera is no longer detected.

Bisecting this problem (in Linus' tree) led me to this commit.

I'm unsure what further information might be useful,
please let me know what else is needed.

Regards,

Dirk

