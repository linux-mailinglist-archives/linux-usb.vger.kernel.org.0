Return-Path: <linux-usb+bounces-26843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D464DB2662C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A286585678
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0750115A87C;
	Thu, 14 Aug 2025 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc7IK1HG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F52C187
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176575; cv=none; b=IEY0sgbCR5B2pPkf0ExKmRVWmiMtXph6Gl4HhMx1I/htq4zvRkO0WrNLIfgMQfiRmQgmyKTNqT+B8Nwac0lM+a4hGMqTqUKsLanOQeBPj5YxY3/vd9abPtwbYu3cGrnum80Hxx6e4PXrgkyT0vDGNKFKrBM9ba+jFNqqm1fZcgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176575; c=relaxed/simple;
	bh=ma0iTNdpj1rjXu7vtuNgP+iAQA5qmIpZII+UfsduNSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CCcakRwVteGYTryuZHk5wPYfNCGzuMXAt4dtBW17GqE3aAWP/8xSPAWMzyxNnElcEosvg+O6PCXJGr4aqam3sXwh6ZJU+4X7xl+o4sIl3iqcYq61+iB2l97f8R9yNnWbj5wVunWNLqIvYxes4N+RJb6f5LSvSjOqWFFnr/IP5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc7IK1HG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755176574; x=1786712574;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ma0iTNdpj1rjXu7vtuNgP+iAQA5qmIpZII+UfsduNSw=;
  b=Lc7IK1HG1p7ErNvucqkURQL8TGkST4+idbW2GV/ZpxZOGrR77fsId9zH
   7ReXhWSqBQBaFVF8pfwZQYWywwHXcrFoebI6WYgRa1Ejb6aDgqJUd3bsP
   DzkmIqVz47r85HFpFqVwr0gyFY2J1M6NXe48H/0dghpx/36wep5rM2huP
   xBM+3n+oIVPAdoGmydq4GaFTFFW+GK4SarGDFlH6cT1ghEzNYfzZWnBaA
   Hy2CevkJEKsGl5fd+ysFl3SrxJrQVaASzn8CUMT4s4qpvlNpA7rkl9E6S
   nEJYtslVkmUmCt6G2b5U4eyIlIgizRUpo7K/A3hrjbykbxJ/PkmBPXmzG
   Q==;
X-CSE-ConnectionGUID: jQH+Nu9bRMOnmL+oAtpg4w==
X-CSE-MsgGUID: wvSMSuEASF67G6FQYXqEkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67760644"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="67760644"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 06:02:49 -0700
X-CSE-ConnectionGUID: 0TNkwv9USEmUmKe8Q075vQ==
X-CSE-MsgGUID: zbDI+jz8TCaAVMRD2B1u5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167560293"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2025 06:02:48 -0700
Message-ID: <2c13a7f8-647e-4199-b0e6-451128bdd61e@linux.intel.com>
Date: Thu, 14 Aug 2025 16:02:46 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem hanging Bulk IN, with USB 3.x, perhaps due to
 wMaxPacketSize = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and
 reproduceable with i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
To: Martin Maurer <martin.maurer@mmeacs.de>, linux-usb@vger.kernel.org
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9.8.2025 0.47, Martin Maurer wrote:
> Hello,
> 
> since some time I am fighting against a problem with USB:
> 
...
> 
> Note beside:
> 
> I can query number of sent and received IP packets. I sent the pings (1 every second).
> 
> The ping does not display, that it receives an answer, after the hang occured.
> 
> But the radio module tells 5 sent and 5 received packets, when querying the statistics every 5 packets via QMI.
> 
> So I assume sending (Bulk OUT) is working, packet go to server and back to radio module, but answer is not sent over USB from device to host.
> 

I didn't fully understand the complex setup, but the subject, and this section does give a hint it
maybe could be related to missing zero-length bulk packets.

The receiving side, which on host side would be the bulk in endpoint usually knows a transfer
is complete when it receives the exact amount it requested, or if it receives a packet shorter than
maxPacketSize. (short transfer)

But if the sender sends less than expected, and it happens to be exactly maxPacketSize (1024) bytes,
then the sender should send an additinal zero-length packet to let receiver know no more data is coming.

Otherwise the receiving side will be stuck waiting for the next packet.

Thanks
Mathias

