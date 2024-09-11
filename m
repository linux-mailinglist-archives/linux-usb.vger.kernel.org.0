Return-Path: <linux-usb+bounces-14960-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD0975772
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 17:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73621286A69
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 15:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E861ABEC8;
	Wed, 11 Sep 2024 15:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Got6P2n9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37FC1AB6EE
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 15:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069572; cv=none; b=M6G21K2rB1GSk3oPcHl8nh1R5GtH16RU6DthYs8Qsr5SEye+sbAbgrPtBg31I1x70Ggy5o2CPRzA+LngH4UI3P8oba4ipSufJdmpr4Q5L9wYMUS8nz+JfRtpRkNXYjqRJgqO9bs7oXlnYmNXPQod/3bEiKT+PPpEhBf9eBZX3f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069572; c=relaxed/simple;
	bh=AdkWJqw7fXUER2tOWBh1Sw4jfThJ7C8Sw2iNkECRq7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S4wg1dZAoRLpD8FkKYEV8NfWj9+IqhRi1B3p0cpM+0lJ7U6LGSP9/bW0KCXJJvTHMdGjhEAsKfjDDh7Ak8k+1FA+9IqTnWn20X70C3Msl3SmkEIxB11piLLHfM6DnJWgJFxsurayGvEC/BjFqvJMhWBaUY+MIyEFPlQaA+zSRCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Got6P2n9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069570; x=1757605570;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AdkWJqw7fXUER2tOWBh1Sw4jfThJ7C8Sw2iNkECRq7o=;
  b=Got6P2n9oly3PmW9hdkHatCNmlvU2jBDbLNFEMhxh6FiaNTmYMIcagxf
   eNz+4bcpKEK1KVh42fmOiY514bIeo8ZWs2SUoY+7QkSmIPEphVDxrFD7T
   d82fc1UQV3SSG0zwesawQ+jux8htbzTr9IF/bpNkEM+3S/Q57LKbDdV6p
   iYpid4abIfCJ127iDuFetnQrIv7M3IyAHivxG5WwJ/RlWxTjLPKxdIixr
   HCXZ5uFVdntwobL5IA3T0bod/yi9CJneu9kXsY0GOV5CeQiKW56rWJHc4
   SRZTAtmgQML1KEK39H/Jb/JNxkdn0i6ZFQaXNWHhvRrmwrYHYsnYyAnkB
   w==;
X-CSE-ConnectionGUID: QfPgDejuRPS3LpeNrh92cA==
X-CSE-MsgGUID: xpPdvBQvSUakUYoCdFA/FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42393688"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="42393688"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:46:10 -0700
X-CSE-ConnectionGUID: mz4dunAIQtOCfSX6xr91+w==
X-CSE-MsgGUID: RryZcX3DTn2XLMQiFV7E7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71785220"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa005.fm.intel.com with ESMTP; 11 Sep 2024 08:45:58 -0700
Message-ID: <008d4b99-eba0-4e62-80f4-846871c0ac1a@linux.intel.com>
Date: Wed, 11 Sep 2024 18:48:05 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Fix sum_trb_lengths()
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <20240910160114.50b77a91@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240910160114.50b77a91@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.9.2024 17.01, Michal Pecio wrote:
> Hi,
> 
> This function sums from ring->dequeue instead of td->first_trb, and
> this is even documented. Makes no sense and doesn't work right.
> 
> I searched xhci-ring.c and this appears to be the last such abuse of
> 'dequeue' still surviving to this day.
> 
> Regards,
> Michal
> 

Thanks, both patches added to queue

-Mathias

