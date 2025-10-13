Return-Path: <linux-usb+bounces-29202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC3BD1E2E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ECB5188191A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD5D2E0B5F;
	Mon, 13 Oct 2025 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4Iwv3l5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C282EB84F
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 07:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342164; cv=none; b=I/9OeY3SYVQc8RVXiPTQs8QqTQ+oPpOLAHXCMA9k0WEeTWbJmvlcGSARcoiEbfdy0V6bKdclbHGVbJ7nwcXnMz8NAsPwvB6H8wOU7BaJ3IL0ahSyIIeTbV2PC6t3Fjt2KDpA0YmNJwjh3fTexX6yZFIJC5nmKxgAp+34T9pvCEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342164; c=relaxed/simple;
	bh=p+PaJfRi1WCR9SU6BVGd3F9l+uM7iq+JFum96KFJxnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwIsTOMc1PdTMbA6EnL0jogRvSRTiVAljjWsRRXLVOFgttUBLtvz7QgKlZ7UM7b0YYXu8NPVhMr4Uj99iOIo+mROrsNtdrtOkCyXK/G7MeOE3/xXruRiixiBJg9BJFUKX9x2hB7oGH0Nepo7kqR/bM2monZLDfNrqvGsrpIkVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4Iwv3l5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760342160; x=1791878160;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=p+PaJfRi1WCR9SU6BVGd3F9l+uM7iq+JFum96KFJxnM=;
  b=d4Iwv3l5xFlKAXToX1MgNL6uwo+tX4NyDOvdMgOXIR6X9+3CudS8MPhR
   6MCoLCx6n10mTOs4dfS3ly0PHLKMjsiA2AePiCZfri6T7FFoAFisgyoSG
   81XBvhLwN++PaA/IgY8eCSr1q9BO36aIOCEjKr+OEfuVW4kxaAbc8GsOb
   mGc/+1Jb/+x9a9KQD1LAmkVP1EsGoj21mtPDvGJPBgja0zl4/UcWAnQ4N
   8S4RzaMMEzrY4P4X5XAE0w3pV3ilD7fgwy8n4ySnYeWTEpTwbgvZfdzzk
   jnaQ6FcG3g7XXWSxsrd6irdUfkwRp3KbFzfx1rsp77unL64muqA8yB5aj
   w==;
X-CSE-ConnectionGUID: uul13iwJTKOIPYIQtaAKSQ==
X-CSE-MsgGUID: c+5ZcT1WSvettwKxaf9JFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87933642"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="87933642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 00:55:58 -0700
X-CSE-ConnectionGUID: ZaQ3rjWIT5qXV1zfh1IH+A==
X-CSE-MsgGUID: Iefzp6W7QeOJT5m3MP2iBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="205221901"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.60]) ([10.245.244.60])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 00:55:56 -0700
Message-ID: <21741b98-4844-4218-8bd9-10b8bf5cd869@linux.intel.com>
Date: Mon, 13 Oct 2025 10:55:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH usb-next] usb: xhci-pci: Cleanup xhci_pci_setup() for
 shared HCD
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin <niklas.neronin@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com>
 <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
 <20251008082055.5646dadc.michal.pecio@gmail.com>
 <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
 <20251008130532.49922d58.michal.pecio@gmail.com>
 <CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
 <20251008223406.13f16f19.michal.pecio@gmail.com>
 <CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
 <CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
 <20251009131444.2c221922.michal.pecio@gmail.com>
 <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
 <20251009152703.72e780b4.michal.pecio@gmail.com>
 <b8c2423f-aa9d-442a-ae2f-3c4d78949b38@linux.intel.com>
 <20251013092250.699bf60f.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20251013092250.699bf60f.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/25 10:22, Michal Pecio wrote:
> This function will be called again when/if the shared HCD is added.
> Little to do in this case and there is no need to set some de-facto
> read-only properties of the xhci again, even if it was harmless.
> 
> Don't bother passing the unused xhci_pci_quirks in this case either.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> This is an alternative to the cleanup discussed last week, which
> doesn't require a v2 bugfix. But I also have a v2 bugfix ready if
> you think the original option was better.
> 

Can I get both :)

A v2 targeted bugfix that I can send now to 6.18-rc, tested by Arisa,
making sure the regression is fixed.

Then this improvement on top of that, which we can send to 6.19 after
it has been sitting in next kernel for a while, making sure there are
no new surprises

Thanks
Mathias



