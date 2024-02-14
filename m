Return-Path: <linux-usb+bounces-6403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF838549C7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 13:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41F2C1C24035
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 12:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2F552F75;
	Wed, 14 Feb 2024 12:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4oRPute"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B02B537E3
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707915390; cv=none; b=Gv3YAXKwcqGBfceTjVAnFNZ41pE/NLCjXYn/QlEYoYFAvam2Wpx2h9UMQ4XPr9U2Se9yoMXvBk2rS3em/eEGCEru6zqKoIYag9NOai37IRBXiAuekmrFfp1OkNTnLTsMmrYBDalvTu2q7JQ9aAg1d1TsNd7H5m7QTO+x+QqkcDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707915390; c=relaxed/simple;
	bh=Gx2Oo732rqatHJu68SvhsYg5CvLh5GSko7RSmXSckhk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:From:Subject:
	 In-Reply-To:Content-Type; b=ueqgiW8qcVnFOT1diA8wKIwrsm3dpk93Q2Rzl3HJzU5tW2jJ/FXChnMfhLM3BK9sE0bpFRAWraQ0Dov6UY2y2C0N6agyNCGXteTZT0j1HIr1XItvCp0BJ6ELcTQ/GyOLcW2dbXWlhm3OzcBn4Qkrd+9Ppn5DsRkCf0WqSI3r7AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4oRPute; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707915389; x=1739451389;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=Gx2Oo732rqatHJu68SvhsYg5CvLh5GSko7RSmXSckhk=;
  b=h4oRPuteMtSldvH9SGUmdrIqYinGG9A9EVQRfIMuaZL3xO9GEX2fAOAN
   v6F48KISOctmA77qV1Mu3XCwUtFOxGz9f6f38H1m0MgbUGMFAN/YVOcbC
   C0DkYRCvx0kwAp6iIVgKwvM2YxCgKjWhZL1pjZ1ZptUwl4l+hbICtAppQ
   TutUgip4KYsoK2Iu8wBTRD17kQq+BWlnObMD3dPGd8XLZeZENlmNWbupK
   UgD7qnHP746/eqdnCKI9qYrmUssjk7HdprGXB1cJx+6uPpI//Z1xAWNS8
   fo8dLb6i5nNSWgVswGf6AfpzdWhlDP9ce86jzS61nf855bXy3AhNUAqqh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24428467"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="24428467"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935616400"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="935616400"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2024 04:56:26 -0800
Message-ID: <7efc3c5b-3237-30c9-1ff2-88747897ed57@linux.intel.com>
Date: Wed, 14 Feb 2024 14:58:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 "Artem S. Tashkinov" <aros@gmx.com>
References: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Linux warns `usb: port power management may be unreliable` on
 several systems
In-Reply-To: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.2.2024 11.31, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> As a follow-up to *Linux warning `usb: port power management may be unreliable` on Dell XPS 13 9360* [1][2], Linux warns about this on Dell laptops, desktops, and servers, and also on devices from other manufacturers [3].
> 
> I created issue with corresponding Linux messages and output of acpidump attached for more devices I have access to:
> 
> 1.  Linux warning `usb: port power management may be unreliable` on Dell OptiPlex 3620
>      https://bugzilla.kernel.org/show_bug.cgi?id=218486
> 
> 2.  Linux warning `usb: port power management may be unreliable` on Dell OptiPlex 5055
>      https://bugzilla.kernel.org/show_bug.cgi?id=218487
> 
> 3.  Linux warning `usb: port power management may be unreliable` on OptiPlex Small Form Factor Plus 7010
>      https://bugzilla.kernel.org/show_bug.cgi?id=218488
> 
> 4.  Linux warning `usb: port power management may be unreliable` on Dell PowerEdge T440
>      https://bugzilla.kernel.org/show_bug.cgi?id=218490
> 
> (Artem (Cc:) marked them all as duplicates, and I asked him privately to undo this until the maintainers ask me to.)
> 
> Mathias was so kind to analyze the ACPI tables [2].
> 
> Is this a firmware issue or a Linux one? As a user I am unsure what to do, and ignoring warnings sounds wrong to me.
> 

At a fist glance it looks like a firmware issue.

USB2 and USB3 ports are in this case matched and peered based on the ports
ACPI _PLD (Physical Device Location) entries.
Usually there is only one USB2 and one USB3 port with exactly the same _PLD values,
but here it appears more ports return similar _PLD values.

But need to look a bit deeper at this. Linux does not compare at all _PLD fields,
and xhci specification Appendix D mentions mapping ports to connectors using
both port _UPC and _PLD ACPI entries.

Thanks
Mathias


