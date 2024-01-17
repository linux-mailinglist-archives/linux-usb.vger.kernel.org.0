Return-Path: <linux-usb+bounces-5162-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94B08303CE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 11:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C4AFB2285C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 10:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DA1219BA5;
	Wed, 17 Jan 2024 10:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="aJf6qqZo"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7D14296
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705488299; cv=none; b=hZkI+buAGM1eP3OQXihPzCmK19jYxoyKTDAykq2ZmIH2rzc7GNSic3IWz7NOD86vBoF4wppxEOE3xHrUNEo2aK2Y5yqIQRHSGSZ3XQ74ws1nk/G2XpYCNKQcFJQf0B7XYYK4dXjspbW3HnvdNiD+gpT9TqjDOHkkq3L4XRGyFhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705488299; c=relaxed/simple;
	bh=hs880b/eAkQ5pFcZXxeUkW5aVNCWnQ9s1kCMMUQ3RDs=;
	h=DKIM-Signature:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=gcjyOfKK0kBgF0kmY3PPa2fkunll7wLAwAuBRoTs3X29SVFZFSUDgS1gg919nLPMe94YpGzRZUISd5my/oOtSR1yb8I8EjA/ZkQNqF9extOGeaHKGIULRc8TlPqlCeYmIqoPdoQ4mazQwfkz0j4V2BzQ75oT4Dr3IN/OBzpp/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=aJf6qqZo; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jzjKCLRJpMMgQnO1yLdJ8/DASMBJpbOZnqpwOgziowk=; b=aJf6qqZotKcoF+Z4rUkjVTYUA9
	MHlbYRUYMevPNJK+Douzov7veVQjEvlvvwbbSULqeSHzSCK5RG8emQPxsKyRDnkZLnKknkdPG5w4n
	m1eEDp4pLdl1ha6GQ0Akwl419q61NFnKTZMtDVIafczmApbQxe0g2nE4wJfUeWQMYPPh/WC6MhDBW
	5CggZ7WiObDYqZ8PLeXYyc4LyA015r/cVV+Rr3Pp5l/L1GaSZQZhcT5zpWkNlsjPmHiNG9E85QtCe
	0v8FsILxvBo5j4PcTRRCXcl61dTBNNOYXeRVtXEZAG0t6havZ5uNnSHDpCgbIh9u0B95OiJkaNyVj
	b1FjQTTw==;
Received: from [191.193.161.120] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rQ3PX-007Jae-4p; Wed, 17 Jan 2024 11:44:43 +0100
Message-ID: <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
Date: Wed, 17 Jan 2024 07:44:33 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "balbi@kernel.org" <balbi@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "johan@kernel.org" <johan@kernel.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Vivek Dasmohapatra <vivek@collabora.com>,
 "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/01/2024 21:34, Thinh Nguyen wrote:
> [...]
> Please confirm that the STEAM DECK is soft-disconnected when you put it
> in suspend. That's the current implementation of the dwc3. If not, then
> it's possible the activity over the wire can wake up the STEAM DECK
> since the controller is still active.
> 

Hi Thinh, apologies again but I don't understand the terminology.

What do you mean by soft-disconnected? Do you have any suggestion on how
should I check that?


> If it is soft-disconnected, but the PME is still generated after system
> suspend, can you check if that's also the case when physically
> disconnected?
>

Again, what does it mean "physically disconnected"?
Thanks,

Guilherme

