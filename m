Return-Path: <linux-usb+bounces-7538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEB871FC9
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 14:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1803F281FA9
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 13:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0664385933;
	Tue,  5 Mar 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4N8xaYL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABC65822E
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709644040; cv=none; b=sEBH2ITNGghLPoniMHj5NWezXvQxTQUVHt8TsWVJsnpVj7ai2uWzOPvL3bupsXatqeDBNQDx5ukaLB180hbWBR5JHsTqpoEtXMF84CaoKCPtRvAQBRJ5Fo9rjkKnBicMfGtXVKfkRhtY/YI0u1DxoJPV3Eg/Se+aq7+GXZErv/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709644040; c=relaxed/simple;
	bh=H9R+9l5LasyuwDFLBJBIoH0e701LzvAJlO/i/m9gWrE=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=alJfxTHJYu8D3I6KfcJdNxquVBtloAkdRU25DWBBVh6OPEYLmu+cxE5UssxX+sfQaQitQ7OK99N6/Xk9IhqYsi1uJTHv2wQlp2ONWUFR0NKQVHOq22FTP7IhcrzEX6pxASxm+4ArOgjF5ngme6Fe+cJ9CIbaid0YNGAcLkeEhG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4N8xaYL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709644039; x=1741180039;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=H9R+9l5LasyuwDFLBJBIoH0e701LzvAJlO/i/m9gWrE=;
  b=G4N8xaYLosDoMrsHtyRawM4hwnBwrU67JK5DkZBgUQPO2F/USA52RQIc
   b2r2RcPE0wb1RYOD1fStWrMUi1mhNvcoyqH/0q9KelkyMdM2m0luRQj4q
   qdn1Wev+Z1EOVuwiaCoLRUSW+gqGHFhSygml50XzoxWrvIuXJx5SgInOr
   xTGnrVC9oHyzYhx7HkD+klf31rkD/aI6fluScVRkLyH2k8sdOCScKwYxH
   XrnVtAXBwVoiAkWr9SVtC9d+PyoaJ+Pvgd0/MB7+WQD+vtswc+PiGB8Ly
   u2ZxxrnXfn2SCcN0Z6MsOizZk7xHdvZHhgxwqOOpkjfMvHRRYsAfo1D27
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4356079"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4356079"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 05:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="937042293"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="937042293"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2024 05:07:16 -0800
Message-ID: <f9f89ec1-6baf-4a61-e685-a0f311b5a298@linux.intel.com>
Date: Tue, 5 Mar 2024 15:08:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 mario.limonciello@amd.com, Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20240304054327.2564500-1-Basavaraj.Natikar@amd.com>
 <2024030555-fervor-unlovely-98c5@gregkh>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3] xhci: Allow RPM on the USB controller (1022:43f7) by
 default
In-Reply-To: <2024030555-fervor-unlovely-98c5@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5.3.2024 14.04, Greg KH wrote:
> On Mon, Mar 04, 2024 at 11:13:27AM +0530, Basavaraj Natikar wrote:
>> Enable runtime PM by default for older AMD 1022:43f7 xHCI 1.1 host as it
>> is proven to work.
>> Driver enables runtime PM by default for newer xHCI 1.2 host.
>>
>> Link: https://lore.kernel.org/all/12335218.O9o76ZdvQC@natalenko.name/
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> Changes in v3:
>> 	- Reworded the commit message.	
>> 	- Removed fixes and stable tags.
> 
> Why?  Why doesn't this belong in a stable kernel?  It's a quirk fix,
> don't you want this on systems that are running 6.1 and 6.6?  Or are you
> willing to wait for 6.9?

Might be better to add it to stable after it has been upstream for some time.

Previous attempt to enable default runtime PM for AMD xHCI 1.1 hosts caused
regressions and had to be reverted from everywhere:

https://lore.kernel.org/r/20231205090548.1377667-1-mathias.nyman@linux.intel.com

Thanks
Mathias

