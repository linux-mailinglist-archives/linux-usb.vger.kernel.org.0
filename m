Return-Path: <linux-usb+bounces-27849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D8B50EDB
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 09:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317521C22A24
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 07:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE623081BA;
	Wed, 10 Sep 2025 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKGyYwwp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ACC308F1A
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488362; cv=none; b=LTa4987hY0NCsPThvoBHt2cO4cJBfGt3tFuuXi+aTTkm9jDhFu2IDLUPHxZD5Db8f0vH9p2CpX/WeBLTha9X0rN2Ft+PlFzRSCNzwp1QDrgH+l4XO25O/04vJ7T9mQkoIz4HYLUJ/4nM4su2+G0/ChPNAbAzhGuBKfPpDaj4TBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488362; c=relaxed/simple;
	bh=T8pLwzNvCxyYQgm0NgXtikvOD3VCUXG3SvdnXj3iSO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEBVHr8+Zb8H+RYJa0S8V7oK8x6UrjUvIfB/WaI+aRWFxO1Vk5glUH+n0DwPR8fWZmwnDqQzTPAO9d/8aZadUa83RBHhox4X7jrLTyCaE1ApROrPZW5HYO5fOFPhAC6jhZgN1S1WRz0iUb3k2jdRHCOdCbf166mBHayaW9nWH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKGyYwwp; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757488361; x=1789024361;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=T8pLwzNvCxyYQgm0NgXtikvOD3VCUXG3SvdnXj3iSO0=;
  b=XKGyYwwpfnsoTwbn//eI5ibH+qLlDc1MCKEDLQUSpnn/raXd2HjHyWbP
   WbgxDaWsROBaWxeLZRogHTM3ik+UK2vhw5I05eLFnjQxUiC9sDmAtfWD2
   hvsEzKe0ygiufPDzZHUJjf8JjRBdzQ+m7qd4asexp2wZkppAnF6uUSIjV
   vr5Z0PCC8+lcPoI7sDJL/FyOQaWTwtfg41HFbiypkzb3eQPGXfCI85A9b
   29uKc83VqZr8YlWdd+16iRYOnxNOIty40ZZaczy8t5XfMwsUemxPG5Uze
   MMjw2NDur3R8V9ndtnRuI66JFzMGyvHuDkO128afDv44tJw4x9ZjCd8L0
   Q==;
X-CSE-ConnectionGUID: sPhRd6FOTZerfPLiCC+RYQ==
X-CSE-MsgGUID: U6AkRtB+Rsu1VhQ18TBgWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59932338"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="59932338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:12:41 -0700
X-CSE-ConnectionGUID: PkOOdYZUQbe6vbjapGYU6A==
X-CSE-MsgGUID: mG//fALmSzCS85rBbNJyGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="173400082"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.83.145]) ([10.245.83.145])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:12:39 -0700
Message-ID: <971bf77d-da06-40d4-872d-b47a4a95f467@linux.intel.com>
Date: Wed, 10 Sep 2025 10:12:30 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] usb: xhci: Port Register Set improvements
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
 <20250905015739.GA2473920@nchen-desktop>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250905015739.GA2473920@nchen-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/09/2025 4.57, Peter Chen (CIX) wrote:
> On 25-09-04 17:42:13, Niklas Neronin wrote:
>> The aim of this patch set is to introduce tracing for PORTCS writes and 
> 
> I find several patches you are using PORTCS instead of PORTSC, is it typo?
> 

Yes, it should be "PORTSC" (Port Status and Control). Good catch thanks!

Best Regards,
Niklas

