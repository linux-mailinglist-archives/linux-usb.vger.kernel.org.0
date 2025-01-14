Return-Path: <linux-usb+bounces-19318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21775A1020F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 09:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E4A3A9574
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 08:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44D1CDA0B;
	Tue, 14 Jan 2025 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nmc/ulbT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A483035975
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 08:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843511; cv=none; b=gvX9juHmyZuhUxXusqZt0gASH6wa5ug06w5UkHA7AFxOC6tTy33o2qo9xEbNgL1jJ8stqQBynNTljQL+ZHH4EncXRFh8TtT3JA36I+Nj+8Yy/8pxejCPcfIHWu/PIUl86qmJ2HBXU9agdtqex/NiEGahNMlAFgFpa8iUmsmTueQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843511; c=relaxed/simple;
	bh=YwVZRB7defeQRwCnHUvRpC5Bzt1O/5V4ESGpv2Ogivw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7isGXhWnvzQT64IJEAZaq1uq3k6Kfu3orv1SOHyzYzH/j3u9Ea5390PpkEQ7KEnqKmaX+PDPxsOq7ncCpK6FbhSoRVzRtSyGbQkF+piOrKoM67/kcV3aBPjL+0uaxQ87CDJP2616MAiFxkD8g4cNzFbZ6fKi/pOlPdGyF2FfRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nmc/ulbT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736843509; x=1768379509;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YwVZRB7defeQRwCnHUvRpC5Bzt1O/5V4ESGpv2Ogivw=;
  b=Nmc/ulbTKU/AIt+imzF7x5Bz0WpGQ2C+MsCmm6jkNF7l5yti2W0urjnO
   853IYXWPpEupBWRcGFz/nwtJtRTduEZo4d0USFxTXqa7uZSG5f11a4cH4
   /Qs4B2TvYUG+Kh8bwCDGk+1k06eMGyqsjwnXGG/K2xoixoGwph06zwTWv
   O7fVY0jyM9nOisTdUa0R9z1J5e3axdWKY9xLhvQ8OU0ftR6HEbnV553rQ
   caL0p1PxzugnXklR+UNB7G2T//UfcbZL24uAXRXe6Ip9UKRYzK95MfWsi
   G6g6ocv7CQcb9nxRUDNQVNUrxtwSy5RKybV5GCvpAowRQqwfnWyPWR/rE
   g==;
X-CSE-ConnectionGUID: 7wsNZF/SRUKkaaaA7/LwJA==
X-CSE-MsgGUID: 0CcGG6NKRSWrLkIVBdFIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41066184"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="41066184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 00:31:49 -0800
X-CSE-ConnectionGUID: ntDCDCfyQhO0wo1WIagcDg==
X-CSE-MsgGUID: V1oO5sb2QSik3QzROFELNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="135567998"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.84.183]) ([10.245.84.183])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 00:31:47 -0800
Message-ID: <87b337a4-01fb-483c-b84d-d231daf6ac71@linux.intel.com>
Date: Tue, 14 Jan 2025 10:31:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] usb: xhci: correct debug message page size
 calculation
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
References: <20250113143037.2131346-1-niklas.neronin@linux.intel.com>
 <20250113143037.2131346-2-niklas.neronin@linux.intel.com>
 <20250113170043.25d689a5@foxbook>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20250113170043.25d689a5@foxbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 13/01/2025 18.00, Michał Pecio wrote:
> On Mon, 13 Jan 2025 16:30:36 +0200, Niklas Neronin wrote:
>> Fix this by subtracting one from the result of ffs(). Note that since
>> variable 'i' is unsigned, subtracting one from zero will result in the
>> maximum unsigned integer value. Consequently, the condition 'if (i <
>> 16)' will still function correctly.
> 
> Is it unsigned? I see a simple 'int' here, so this wouldn't work.
> 

You are correct, it is not unsigned.
Thank you for catching it, don't know how I missed it.

Best Regards,
Niklas Neronin

