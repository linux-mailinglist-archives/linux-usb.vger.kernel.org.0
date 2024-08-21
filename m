Return-Path: <linux-usb+bounces-13800-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76013959F6B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 16:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A37B21B74
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 14:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372961B1D40;
	Wed, 21 Aug 2024 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGGTvT05"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3E718C348
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249578; cv=none; b=KStx92t03AfrASayBAvZEZUD8XfzT0/dzo+S8R3e8YAqJgknbRmyxmdaZItvrX8dBsShpqNrtMf+9Y9XdKa88gqjw7eQiuwYaQZDj6re0MUYYhu/H3iNM5qrPU6mVa/gd6Muy8nNljKhFnGqPaRWAx+LaIH2mirD1Vvcq5MZ4rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249578; c=relaxed/simple;
	bh=OHUI3E3PfQDOdHt+6ZDW5KMFm7R18sr8fyK+7Qij6zE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLeYO7vAAvuCIprOm7h0KC71l9ML2rkUua2cbK6Cqg8/JOigBMkAdEc866mDsv2rUUlj4fDQsNNUZdqFmekj4VQ/q8rnxWV1MdfLPY3+RN95Uv23ouoCgC8FbsdrOVVj7qjrS1MywCHunXrDs8FOR5Yd3HQBw16JURSlguRcLwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGGTvT05; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724249577; x=1755785577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=OHUI3E3PfQDOdHt+6ZDW5KMFm7R18sr8fyK+7Qij6zE=;
  b=YGGTvT05T0ug4FKuhnbPeVruEA6/v17ZJA+Tnq/ZRNpVrQ8EIbGA6MWj
   3Ej0XuhWqV2mXFoUngT3keEi7eZjlPplz2u/l/xgdwCCcosEMjMkNEpy0
   ybtA82KT4/GMkZ45cxoqPkIxFFLUOZ5PUPp7I0Gi/WsdyUDUxHFHTfudi
   2/7B+AVjQfXkmS71C5rtoQ4kffyGkq1KHqAH3U/+Blj5NLji/HNjahJ4H
   udb2CcnOzr0c2WoHsPvMrVPN9M/CBq3UHNmhZ30pPxyYJVdLxZtCR8fxM
   3NGHgr6B+lxZi6EYzOpyYcZDIDyMJtio5JSJ0qvQ4eNMb6MjMbDkOOOYq
   Q==;
X-CSE-ConnectionGUID: CkeirLPMRy6KX/nL+RZ9Yg==
X-CSE-MsgGUID: a4bJRzFURrGCCag+spVDow==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="13133738"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="13133738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 07:12:56 -0700
X-CSE-ConnectionGUID: ND8ce7chTgmEWcWOi5I0iA==
X-CSE-MsgGUID: DQsBiY0fSWSfictBxUbJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="91897717"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2024 07:12:55 -0700
Message-ID: <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
Date: Wed, 21 Aug 2024 17:15:00 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 FPS <mista.tapas@gmx.net>
Cc: linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240821150233.4f8f66ef@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.8.2024 16.02, Michał Pecio wrote:
> The reason I suggested aplay is only because it terminates after a
> finite time, reducing the amount of output produced.
> 
> Today I found that I have similar issues if I plug my audio dongle into
> one particular Asmedia USB 3.1 controller. I quickly confirmed your
> finding that aplay has different symptoms - audio is slowed down and
> distorted, but no errors in dmesg. Same for Jack in playback only mode.
> I need to use Jack in full duplex to reproduce your symptoms.
> 
> I automatically stop Jack with timeout to control dmesg pollution:
> timeout -s KILL 0.1 jackd -d alsa -d hw:3 -p 48 -n 2
> 
> 
> The root cause appears to be that there are those "missed service" and
> "underrun" errors in the first place. One means that the controller
> failed to execute a transfer in its scheduled (micro)frame for internal
> reasons or that the transfer was queued too late by software, the other
> means that the controller ran out of queued data to send.

My best guess is that these are caused by a full xhci event ring.

If event ring is full it would stop transfer rings, and we would see
missed service events. This matches the logs.

The events get handled and cleared in the interrupt handler, but
not every event generates an interrupt. for isoc transfers we intentionally
block a lot of event triggered interrupts.

The event ring size has doubled since 6.6.45 kernel, using a newer kernel
could help. This changed in 6.7 kernel:
28084d3fcc3c ("xhci: Use more than one Event Ring segment")

I also now see that there is a driver issue in handling "missed service" events

If we get a "missed service" event for the last TD in a URB, then that URB won't
be returned to audio driver until we get a _successful_ event that generates
interrupts at some point later in the future. This could explain the underrun/overrun
events.

If possible I'd like to see xhci traces of this issue.

steps:
mount -t debugfs none /sys/kernel/debug
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send content of /sys/kernel/debug/tracing/trace

Trace grows fast, so please copy the /sys/kernel/debug/tracing/trace file
somewhere as soon as issue is seen.

Thanks
Mathias

