Return-Path: <linux-usb+bounces-24178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2AFABF608
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFE71BC48FC
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD2F2798F1;
	Wed, 21 May 2025 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZTeJ77R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE222686A0
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833883; cv=none; b=tpFSfSMRVfHrO40jbRvoNRjJPyvl33tpiE3ZWsdvO6G3SKCcE39POrNOrWlezdacNcyGXF0dGQWCaipcjwOrBbXSP3l1bvG/Ko6RzjfW2Q0S3CAUb4xJb4Sl1aTk4vXFlkCmRpCsOiqW+YSp/FnnesFpJhMA4H5aHVn8Y8NOHSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833883; c=relaxed/simple;
	bh=A/ClUfODNTLGTTIO0YbzehwwKKZaM7DMkEUudYyRleo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afh47j69MGt/AGjsnqxfR3vByr+XMBG8ShOTDsnPBdH8IgUsUGggWo6/wisd/5Bd6vEMZMVOdd36rkcrGXFIJb2V8FCcgTm02jFzMvppxIY8Wu/elWzwqjXDcIzMFnoQZe+LlXYbGhI9IbTkcZBsyUaPbPzNJUSxMIVbyuyLpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZTeJ77R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747833882; x=1779369882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A/ClUfODNTLGTTIO0YbzehwwKKZaM7DMkEUudYyRleo=;
  b=XZTeJ77R+n1bdoXRZdKNBMuJNLxEOkpdwVURvbASNuJw33ZAxYy+/Pkn
   SabZRA0DXPL3HsAxTY0zuPvvmb6x3fcCpNvs//fX2osyZx0j7TF1uJ2Sc
   QORsWimoK0UjET+jtIjnwGKp/ixZYBAploRZqItgyYbPdYES8ACbSqEgy
   qRQCrjDXiMxDS4hKfv53U1VI2bjMicpR4yCd6/coM4Z+T6oCGXFJLgBHH
   D19XGtBmyYpFVmozhIJFbCdvDCbKFwwUhBsbNI/nUbPE9JDPk4XDAEPOy
   GujLaK83UatjJPR6OrQdRWKPJFqCLrk+rYHcSWjNzWYfxBr6b/QJZfIDX
   A==;
X-CSE-ConnectionGUID: D7Yn5UZgSVaUxPSwKF8k+Q==
X-CSE-MsgGUID: vQMGZTWiQCqa6rxdw5n26A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61150742"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="61150742"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:24:41 -0700
X-CSE-ConnectionGUID: woA8IZEGTTevE6JIFChHGg==
X-CSE-MsgGUID: s9tf+yDeSJK/JVmJ1IZqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139823622"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2025 06:24:40 -0700
Message-ID: <0930a4a2-03b8-45f5-bd64-c132400acf80@linux.intel.com>
Date: Wed, 21 May 2025 16:24:39 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/24] xhci features for usb-next
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <2025052156-naming-employed-ccdf@gregkh>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2025052156-naming-employed-ccdf@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.5.2025 13.36, Greg KH wrote:
> On Thu, May 15, 2025 at 04:55:57PM +0300, Mathias Nyman wrote:
>> Hi Greg
>>
>> A series of new xhci features and refactoring for usb next incuding
>>    - Debugfs support for showing available port bandwidth
>>    - xhci parts of eUSB2 double isoc bandwidth support
>>    - refactoring to decouple allocation and initialzation
>>    - other misc cleanups and refactoring
> 
> I've applied all but the last 2 patches here.
> 

Thanks

- Mathias

