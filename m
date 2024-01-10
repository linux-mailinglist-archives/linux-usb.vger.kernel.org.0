Return-Path: <linux-usb+bounces-4921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34E829CDA
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 15:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09C61F2124A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1654B5D9;
	Wed, 10 Jan 2024 14:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FenE4l5j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726744BA80
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704898403; x=1736434403;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=eNgLq1AZWpzyqPdLR10T5JTea5pLiIiRxzNgAMi/2Yg=;
  b=FenE4l5jK3Rj6dGy4D8UPtsQJPlaUFUaOREfdB2pcr5eghmTNPA206oi
   E8+tvu9fhmHGaLf0So1KZIT4+PN9xYXh6niJ2E3ETFi4nYu/yDCmfWdo1
   DrB4z28hX9GZrzW1UuCcmYJSdk78UWIBfSgrx8nybnL/M1Gp8zLtrKf90
   okvlFMovIbEGQkJkA6VbtEiGzMkVVUXToVkZ22HYU4eQ6eSawaVix2Lix
   I89RN/pPPveY53sbphum0OcsTPDfWpMOCcZcDQmQgeSNay67dhRsivAG1
   mcDiE1ltjMyOH77Tnu9ntNdbOzQGdll1kIMSocw7jpF/TQ+QaAGe4YASz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5289552"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5289552"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 06:53:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731872824"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731872824"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 06:53:19 -0800
Message-ID: <1fbc12eb-f912-e7aa-966d-3f7115ccf532@linux.intel.com>
Date: Wed, 10 Jan 2024 16:54:48 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [bug report] xhci: add support to allocate several interrupters
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
References: <e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain>
 <1392587e-3ff2-4068-0df6-b09734a96164@linux.intel.com>
In-Reply-To: <1392587e-3ff2-4068-0df6-b09734a96164@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.1.2024 16.03, Mathias Nyman wrote:
> Hi
> 
> On 10.1.2024 15.15, Dan Carpenter wrote:
>> Hello Mathias Nyman,
>>
>> The patch c99b38c41234: "xhci: add support to allocate several
>> interrupters" from Jan 2, 2024 (linux-next), leads to the following
>> Smatch static checker warning:
>>

Patches for both cases you reported are not in my for-usb-linus branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=for-usb-linus

Once 6.8-rc1 is out I'll rebase on top of it and send them to the list.

Thanks
Mathias

