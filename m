Return-Path: <linux-usb+bounces-5997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D00884C8F9
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 11:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A16D2818AE
	for <lists+linux-usb@lfdr.de>; Wed,  7 Feb 2024 10:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEEF168DC;
	Wed,  7 Feb 2024 10:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwDXh/ZF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6BE171B4
	for <linux-usb@vger.kernel.org>; Wed,  7 Feb 2024 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303070; cv=none; b=Ryr4GpkCmT+nvILY/hqsqe2DEfbOZX6Y4mYJ/ydijJNQZRgwb67Hg/pxHyzHR9cQTDfgdJnnAOa2Ly/Dp973251falikr4V801GNIE1dMDjqZOfMyLlpAH8/mAx+b5P5EXGoUIdpCUBlsbqP4ichfv1RjTHcCyRbkwVAPOeub74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303070; c=relaxed/simple;
	bh=wcUGdlLADKaRdwkTzF+TtBpqwM4GNDRYl+VBFYH0H8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWJeubAuKmMtCVrjkY5/XmTkJ9vmDnpGLDHw1W/7i+PoL4CAnBbOzkYp6htF/juCx7rHX4Y2ZRXSLhAlF3ORd932Y308vcwvljy79KVRwyS/MldPhriMxS6TftqKUDc8qu7KsTduDDb/+Y1lEJHlWtuP3ighbyd3co7O3q6GWac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwDXh/ZF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707303068; x=1738839068;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wcUGdlLADKaRdwkTzF+TtBpqwM4GNDRYl+VBFYH0H8k=;
  b=HwDXh/ZFoZb/j5J3reNj/rkUaDugbfmsND69XwIXbHWeBGbTiVhhECps
   XRMvf3b5rXfNXtc92eqoe1NVYCVHWgsYTulX5uYALu4m7TiZvG0JyzvI7
   a7Kb+YjAuHk644qsOhGGlzGKy2Ty/BLvm2StwzwWRr0DtE16acxHXvPRX
   wArbEjgkyZ2wyc700U9EksuLBxNSXQPRFGyk4Jo6UxGo+cmmxqmn1LSI9
   F6mBi3CsBvYt5UFkLNeNs2JzaATTcq3EkS0iziFvjyNtF5hlBCufzCM9O
   URPyzgWz1IlmCkVGrZn4Skls0lrBdTuR/k9UG7NICEkuhWxRYKn9mvHey
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="12317805"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="12317805"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 02:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="32113524"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.249.42.87]) ([10.249.42.87])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 02:51:05 -0800
Message-ID: <ca6d6a0f-e5bf-492a-8e6d-dc22c1f0518a@linux.intel.com>
Date: Wed, 7 Feb 2024 12:51:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 heikki.krogerus@linux.intel.com
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
 <2024020641-relation-embattled-1fb5@gregkh>
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <2024020641-relation-embattled-1fb5@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 
> I'm not going to actually review this patch, as you didn't follow the
> rules that all Intel kernel developers need to follow, sorry.  Please
> work with your Linux kernel team to do this correctly, otherwise I have
> can't do anything with it even if I did want to merge it :(
> 

Thank you for the feedback and apologies for my mistakes.
I will make sure that subsequent patches are up to code.

Thanks,
Niklas

