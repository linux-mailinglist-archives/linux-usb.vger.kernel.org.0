Return-Path: <linux-usb+bounces-30062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E11DC32E5B
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 21:23:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 663464E40EC
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 20:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E62D2638AF;
	Tue,  4 Nov 2025 20:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="NOvr4PWd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694D08488
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762287781; cv=none; b=b0i8eKsgB1rxp14AdVNWSog+M+mTte4C9dgjPzZu0dTk8Bd5VLmHwaihNHrwD80sdPKi9LRqsK6ASLGdXLbog7vbOiC46S0jCKJdiLmaHb9vLTI3WYUlDjADBEsal+UZ3QcwF+1DeqOSPRrSuz/TrdBewCUQ+vNK4fWBzXQmuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762287781; c=relaxed/simple;
	bh=v+yof/TGd4DFHMm2WOzmu2PvQi5F/bjkiOEMxJ0Mxbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eG4xRXD2Si/sqki7lahWytH86Wy0FbIc+YfX2IFXO3vAuFpSVJtPCt37D/R1JCgNbTSPjVSrHPB6/zymWTuqLUdaVppg+jm71a717fTlG3LVmlDwjZzP4SM0FY+21HlZJz38xJefSokP4TQUUGtrZGzF26lwWW1q3weW59l1xRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=NOvr4PWd; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4d1KdY2YMCz4Xc9;
	Tue,  4 Nov 2025 15:22:57 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1762287778; bh=v+yof/TGd4DFHMm2WOzmu2PvQi5F/bjkiOEMxJ0Mxbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NOvr4PWd63wpybmsPbb3zgAkO8xVpMxAwBd7DSr13XAGOEinxs+TuipU/74k3ZpX8
	 E08kO7Exn1syfRj1K+t7FEpzb50abXNNxjZi8Yw5L1Jurl+c5F6uGhyiXRqZBOWxN/
	 bsZ+PN2z6VNkDY3FqnjSnGDA+HIcleb+9+ZBJX74=
Message-ID: <00b5f5a6-27eb-4949-88ab-eb78badedc58@panix.com>
Date: Tue, 4 Nov 2025 12:22:56 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
To: Mario Limonciello <superm1@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Kenneth C <kenny@panix.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
References: <20251023050354.115015-1-superm1@kernel.org>
 <20251023055603.GU2912318@black.igk.intel.com>
 <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
 <faaaf1ae-4763-40d6-b734-b2dd0e47b27b@panix.com>
 <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <1d635632-e51f-4538-9896-3e4fa56a4193@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/25 11:12, Mario Limonciello wrote:

> V2 caused nonsensical testing failures that I haven't figured out yet so 
> I didn't put it out on the list.
> Try V1 and let me know how it goes!

Will do ... the transition from work to home (with totally different 
setups) is where I usually see this issue come up, so I'll know more 
tonight, but at least just a quick suspend-resume cycle RN hasn't blown 
anything up, so that's promising :)

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


