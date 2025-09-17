Return-Path: <linux-usb+bounces-28245-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7252AB81E70
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 23:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BD217AEC37
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 21:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAB8302770;
	Wed, 17 Sep 2025 21:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FFwTdM7m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1929478
	for <linux-usb@vger.kernel.org>; Wed, 17 Sep 2025 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143667; cv=none; b=TbMSaiKD3a/w6zoRCTN/0zCPKP7fmCjLlwo8bXbwr8devKY3WQeSdvBkdOooFFexXwK3Rvn5uC7X3stvp+RkuO0Ic12kcqGWd72MG9XXQozAxds6UcQjtOiJmkQ86orKfECyAzF2J3xKothq/kzrcvJfzq2O5Ex2GSdKWpsRsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143667; c=relaxed/simple;
	bh=hJnuKrP679llZ+ohB71khl8nXEaIUVsmII2FHhH2/BI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwqCENwZcu096N69bgF9xzHEGeslEWwDNPU4VLV19OBQgJh5FOxH1cBMFeb9SG4B8kTfIMpKrlzk0K3KCYwu84NbCC21YJBqlWeyGVQCaClJm15kirlBTxEXyN31pjHOoG5q7/T2l2iszN/DWb4h+mI/L1kEZFP/n3vK7Z5H7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FFwTdM7m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758143666; x=1789679666;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hJnuKrP679llZ+ohB71khl8nXEaIUVsmII2FHhH2/BI=;
  b=FFwTdM7mtzhv5VEZyBa1U3R6sCekvEgqySAYJqqOsWSW89MH+HjK4Vqw
   aG1QZ2TUYEsrafmc9noXsLStnbLR1NAOPYFLKcrY/CfB1PvKt5FkFLeSq
   UKtdMAtdWVoOFz+cwDg6P1r1JViAF7K0SrB1phde/VtWvqE9gVs3G4HrE
   X8UnIvlYprJd6WaP1SxEIghGYkGqvTnBhplhDCkw4A0wuyRTObON20pIO
   e0R4G70f1niHlJ8NWGmbycpnapMI07Hrh7Zhkm1OrukOCzJNaNuJ/mz8V
   I67entVJd+lQ7kaonbN8P+8dM8YHJQVLEhss5T3b7HfQk6KnbzAgrDVzT
   Q==;
X-CSE-ConnectionGUID: rE8aCHjVS5G7rY9cCkVigw==
X-CSE-MsgGUID: YN4S2FPSSV6YfT+SDrtHTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60394455"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="60394455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 14:14:11 -0700
X-CSE-ConnectionGUID: bMeCeicwStWCT77AbUqjUg==
X-CSE-MsgGUID: LHlWGqm0Qza2q6lD5qmDgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="179761014"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.42]) ([10.245.244.42])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2025 14:14:10 -0700
Message-ID: <9137ae66-8850-4853-82d6-c4fbd268f2b6@linux.intel.com>
Date: Thu, 18 Sep 2025 00:14:09 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] usb: xhci: align PORTSC trace with one-based port
 numbering
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, peter.chen@kernel.org
References: <20250917125850.3380560-1-niklas.neronin@linux.intel.com>
 <20250917125850.3380560-3-niklas.neronin@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250917125850.3380560-3-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.9.2025 15.58, Niklas Neronin wrote:
> In the xHCI driver, port numbers are typically described using a one-based
> index. However, tracing currently uses a zero-based index. To ensure
> consistency between tracing and dynamic debugging, update the trace port
> number to use a one-based index.
> 

This makes comparing traces and dynamic debug logs much easier.

I picked patches 1/8 and 2/8 already now and sent them forward for usb-next

Thanks
Mathias


