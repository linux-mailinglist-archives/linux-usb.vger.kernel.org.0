Return-Path: <linux-usb+bounces-10260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395108C4E8E
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 11:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9D1F284CE9
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 09:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9BF2554B;
	Tue, 14 May 2024 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5ainiE3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93271D54B
	for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715678141; cv=none; b=QNG0zLkbqp1tAxx2GXFJOgcNmhdtTlG080HboAX6mcAllj5Nl7avL0H8cWL6fPqMIDfZOcOBjr8TmJp7bdg0KDn+5/rOsLBgYIm4nHznYbZbNhlReHWbUvAj/XgWcklHxs0r1k0cFeKsAcWeDZBl2yvLmRmQT9dwJB+1GsjUEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715678141; c=relaxed/simple;
	bh=dznKRnnrQjxlcmiPJN/HttnecyFpEcqVbKnv3874RPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKDd0tRMB11jPASeAFL6hKkZj3twGDPQtBbJHqEnLVJMpsjvSRThNJ4kDmpidpbfzGSHLyn1vH0dGPTrIkME+4rvAVxdR+MvqcHR51eFSZ0HR7rNsvrF1oFojEdoT9v/wDXKXDquh1BWpw5yEsodJa4mOoKhKPalMJuTM1X12jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5ainiE3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715678140; x=1747214140;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dznKRnnrQjxlcmiPJN/HttnecyFpEcqVbKnv3874RPg=;
  b=n5ainiE3iPBk07cfBRRqlneqeyDIq+D6kVdST/WBAtSDqy+OTTLkLNSI
   tRvCkcBDsGi7a3hscFROtj0d78irVtjEYBXlNBuy2fvx5W0wg3VsuF5so
   yEl0AATQCi8k7kMh2/LVUM+S18b+Mg1Eaiv2wths4tlCypZKHIKq0xQ/R
   O/ZYskD18BXeLXO7okiBh8r+cuLs4ppYdJ2oFY1in+OCDUscOR+iurtd4
   gkv49ZFbdWGnPc1zWqrach+Ilcwzs+NC8VDRprWPdBcBAVc6Olth7cjUK
   kzBKexnd2ufzNQVCkwjtpWbl2ioedHNtSgt358d8k5c9CbVM/VO4zGBnq
   Q==;
X-CSE-ConnectionGUID: Bxt5mo+rTdqcrvrybSqqSA==
X-CSE-MsgGUID: pMYNJbmCQNiIvEg7MtjEwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14593187"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="14593187"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 02:15:39 -0700
X-CSE-ConnectionGUID: rt3e/ryoTLuuPCUMENw5Cg==
X-CSE-MsgGUID: EFUFqA/AQ3mLmwkMk3B6gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="30758766"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2024 02:15:38 -0700
Message-ID: <1a03a778-75db-9345-0baa-4031660e7192@intel.com>
Date: Tue, 14 May 2024 12:17:32 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: dwc3 hci_version==0x110 should configured xhci->quirks |=
 XHCI_LINK_TRB_QUIRK in xhci_init
Content-Language: en-US
To: app l <lipc198702@gmail.com>
Cc: gregkh@linuxfoundation.org, USB <linux-usb@vger.kernel.org>
References: <CAGaOi3bfswEqzF2jzoipzOwzyRknD1oxzwayM1r3KG0QYDrhdQ@mail.gmail.com>
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <CAGaOi3bfswEqzF2jzoipzOwzyRknD1oxzwayM1r3KG0QYDrhdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 13.5.2024 16.40, app l wrote:
> Hi,
>     Host mode，bulk in， dwc3，version; 0x110
>     A TD is comprised of two normal trbs. The TD length is 0x1000.

Is the bulk TD split into two trbs due to scatter gather data buffer, or
by xhci driver due to buffer alignment requirements?

Otherwise one TRB should be enough to point to 4k data

> There is a link trb between the two normal trbs. If the chain bit
> (bit4) in the
> link trb is 0, there are two interrupts and the data will be
> lost(scene 1). If the chain bit (bit4) in
> the link trb is 1, there is one interrupts and then the data is normal(scene 2).
> A TD is comprised of two normal trbs. There is one interrupts and then
> the data is normal(scene 3).
> So I think hci_version == 0x110，it should also be configured
> xhci->quirks |= XHCI_LINK_TRB_QUIRK in xhci_init;

The chain bit for the link trb should always be set by driver if the link is in
the middle of a TD. This is done in inc_enq() by checking if trb before Link trb
has chain bit set.

The XHCI_LINK_TRB_QUIRK is for controllers that always need Link trb chain bit set
even if no TD is spanning the segment. i.e. link trb chain bit is never cleared.

There might be some other issue here.

Any chance you could try to get a snapshot of the endpoint ring, and event ring
when this is seen.

debugfs example snippet of device 1, endpoint 2 transfer ring

# mount -t debugfs none /sys/kernel/debug/
# cat /sys/kernel/debug/usb/xhci/0000:00:14.0/devices/01/ep02/trbs
...
0 0x00000001041e0fc0: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
0 0x00000001041e0fd0: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
0 0x00000001041e0fe0: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
0 0x00000001041e0ff0: LINK 00000001041e1000 intr 0 type 'Link' flags i:c:t:c
1 0x00000001041e1000: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
1 0x00000001041e1010: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
1 0x00000001041e1020: Buffer 00000001041e5000 length 13 TD size 0 intr 0 type 'Normal' flags b:i:I:c:s:I:e:c
...

Thanks
Mathias

