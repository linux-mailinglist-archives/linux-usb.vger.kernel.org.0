Return-Path: <linux-usb+bounces-6314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105D852A84
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 09:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0CA428401A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 08:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A5617998;
	Tue, 13 Feb 2024 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVNiyMWl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002D17985
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 08:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811608; cv=none; b=DdyNM4tmMBJmLB3dUT/Q8gOFt0TcAXnUZ7Yn8kL6imfBid6frmK6XTNe60L1G/Mkp4NVC2q5iQZ+8N2dgTjejN15WwXKY/wk2fqtddFXBSD2q2cYKQsNGZ0h8neBEoy7GHsb9UwJ4guWVJLBum9JKYu6QZjm8pALjE6B8rcvESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811608; c=relaxed/simple;
	bh=5gO6CJ+Oj9xhz00T7q0M7BBYVnw214RcBQ2QHQh1s7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sV5IRbuTdGXu9QyISgrpyThmTFaXAAp4fes1K+TevvLxZztIYCqdXWx3HuYMz1oEvvWmrIacD6xggr9xWxCnzEB1IaLpWgEBHg7sl0TV9WTZUCRpjEbsPgbClhcNVJrQk0MjW+vzEgBatP5iPioUn91gwcwNiBLPBx1qRlLfvGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVNiyMWl; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707811606; x=1739347606;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5gO6CJ+Oj9xhz00T7q0M7BBYVnw214RcBQ2QHQh1s7o=;
  b=iVNiyMWlL56lJ2rxedgF1TNCJqt7N/fU8KUq1gXQy+CPnPrwrRowjqT6
   qQSlX6GSSTPeUVBpvDG4U9oZfYxKWbQdsrI4RBH4Ad4HHL7J0pGm1CuDy
   gtbhB9T0y9eISzzH9QW5iblk0MxTD+jxqDxQvSelFBF7PL7YEcnXCxBo9
   RSzra3g5ZEMFfOMa/Oncy48immfF2rcnh2NRj4vJUPANYevSwJBqKb78T
   Ia5UJlDXBNOZ7JosSpu4vA39rao8BWBG8y7Rb8gU2CHEkK+oIIahUr3HG
   fcjM3dWwUY9e/+3chOxFqMlU2TPCGr7acQkjXS6GFAiSuW5QM5v/xmAIh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396241566"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="396241566"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orsmga101.jf.intel.com with ESMTP; 13 Feb 2024 00:06:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2869124"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.252.63.7]) ([10.252.63.7])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 00:06:45 -0800
Message-ID: <5ad63fdb-c922-48b2-bc1b-c240f2349496@linux.intel.com>
Date: Tue, 13 Feb 2024 10:06:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
 <cf529310-233a-466d-ade8-e0de4e20a794@suse.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <cf529310-233a-466d-ade8-e0de4e20a794@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/02/2024 16.16, Oliver Neukum wrote:
> On 06.02.24 13:56, Niklas Neronin wrote:
> 
> Hi,
> 
> this part should be part of uapi regardless what
> you think about the rest of the driver.
> Could you make a patch for that?
> 
>     Regards
>         Oliver
> 

Sure, I'll create a patch.

Thanks,
Niklas

>> +
>> +/* Struct for Billboard Capability Descriptor */
>> +struct usb_billboard_cap_descriptor {
>> +    __u8    bLength;
>> +    __u8    bDescriptorType;
>> +    __u8    bDevCapabilityType;
>> +    __u8    iAddtionalInfoURL;
>> +    __u8    bNumberOfAlternateOrUSB4Modes;
>> +    __u8    bPreferredAlternateOrUSB4Modes;
>> +    __le16    VCONNPower;
>> +    __u8    bmConfigured[32];
>> +    __u8    bvdVersion[2];
>> +    __u8    bAdditionalFailureInfo;
>> +    __u8    bReserved;
>> +    DECLARE_FLEX_ARRAY(struct {
>> +        __le16    wSVID;
>> +        __u8    bAlternateOrUSB4Mode;
>> +        __u8    iAlternateOrUSB4ModeString;
>> +    }, aum) __packed;
>> +} __packed;
>> +
>> +/* Struct for Billboard AUM Capability Descriptor */
>> +struct usb_billboard_aum_cap_descriptor {
>> +    __u8    bLength;
>> +    __u8    bDescriptorType;
>> +    __u8    bDevCapabilityType;
>> +    __u8    bIndex;
>> +    __le32    bwAlternateModesVdo;
>> +} __packed;

