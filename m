Return-Path: <linux-usb+bounces-32915-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iATDFDC9e2mnIAIAu9opvQ
	(envelope-from <linux-usb+bounces-32915-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 21:04:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE33B4231
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 21:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B39CC300611C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 20:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4B2311C21;
	Thu, 29 Jan 2026 20:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="qrJfAs/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6331C21CA0D
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 20:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769717034; cv=none; b=LNo6zCaok4lBn0hRgeAYoCT0Pa6/pIG4LmviakJFb4IxhfD1c0xloXQuLAVfTDBCet/KtK+pNGPBH/lOZnkmBtF+VPwUNV16P1yzCUfjejPnqlKQkQWhNX1wP//nszHS5Rw03021MqWFpbDGKk+v6mDEl9T8fPQN14qdWOslAwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769717034; c=relaxed/simple;
	bh=VE8N+aFLX1hPSpEtKiYV+GRCDTvd/jEMU/EtwAMiuY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k45A6Jj89cHwnCv59J2aQp0ucQH7JJ9Fe5xXlUAWaSl2BVg9z2J9ogKS02c8/p/TVMRI/gzU0g5KPfTnIq30rl8A4w+6zvkASTKDTRHUX0bLYvcXjFeQIYjrbWYyrH6hBZp+eAXnsUR93GyG+b6XwPELQz4kqj6lQUfxoZR887U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=qrJfAs/f; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.47] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4f297h158Bz4Ym9;
	Thu, 29 Jan 2026 15:03:44 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1769717024; bh=VE8N+aFLX1hPSpEtKiYV+GRCDTvd/jEMU/EtwAMiuY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=qrJfAs/fAZemeSPyh7O5dRK7butfigZgMPdlxHByvzEl/wXjeIztnyMnVBhLkDexO
	 Rv7DjQxm2yXRwSkR2dXcJBx9Odn144Xw+9h/FiZ+74c/MDIwZekTLMVTpR1RGMJDED
	 Rr4ufRwBjzekDJjBULBZWfPB/1qlqc1cjr9pZAJE=
Message-ID: <85a5cd81-bd1a-4a65-807e-cd9d85c81bf8@panix.com>
Date: Thu, 29 Jan 2026 12:03:43 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and
 route transfers per slot
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Michal Pecio <michal.pecio@gmail.com>, raoxu <raoxu@uniontech.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 niklas.neronin@linux.intel.com, zhanjun@uniontech.com,
 Kenneth C <kenny@panix.com>
References: <2026012754-ferocity-operator-e3b2@gregkh>
 <ED3E9F8EEA089A35+20260128080939.1145420-1-raoxu@uniontech.com>
 <20260129152222.79c1252b.michal.pecio@gmail.com>
 <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[panix.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[panix.com:s=panix];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32915-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,uniontech.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[panix.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kenny@panix.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[panix.com:mid,panix.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AEE33B4231
X-Rspamd-Action: no action


On 1/29/26 11:43, Mathias Nyman wrote:

> On 1/29/26 16:22, Michal Pecio wrote:

>> I'm afraid the only driver functionality exercised by xhci-sideband is
>> allocation and freeing of extra event rings. Handling those rings in SW
>> and solving race conditions is new, as is having no way to tell which
>> order some events were generated in when things go wrong.
> 
> Agree, commands like 'stop endpoint' would trigger a transfer event on 
> one cpu
> and the command completion on another. PATCH V12 2/2 attempts to resolve
> this by handling transfer events on the other interrupter before handling
> specific command completions. This will get complicated and messy,
> especially if we implement more fine-grained xhci locking.
> 
> The reward is too small compared to the risk of turning USB (more) 
> unreliable.

I've been reading these comment series and understand everyone's 
objections, but FWIW I've been running this patch series since something 
like its V3 on my laptop, moving between various USB network interfaces, 
hubs, storage devices and even headphones, with sudden disconnections, 
media errors and over dozens of suspend/hibernate/resume cycles, for a 
month now and haven't had any adverse issues.

(I haven't been running any numbers or tests, I just picked up the patch 
series' cause it looked interesting so I thought I'd try it out.)

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


