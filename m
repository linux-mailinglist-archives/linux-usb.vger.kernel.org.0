Return-Path: <linux-usb+bounces-21282-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDB1A4C366
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C844188D54B
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 14:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250D1F4C8A;
	Mon,  3 Mar 2025 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="Iq5GHZxx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C337212D63
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741012393; cv=none; b=XZha+c6IiwcUc89ZlSOuihKz/Y+gz4jqdm8Jel9PqWao2taNcVTC4Ff2YCKXc1bnRrye7afobW5oKlSqsyLkpHhD4pHVMTeiXB8QuWjNC+VLKqQ2EYp0KUFZEwBJevwy3JiTSAWe6j6baf2pgw/TWHouqsqr8/0dTLCDPv3iWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741012393; c=relaxed/simple;
	bh=s+FoJtKmlgMw/QXOaHBp8YK4f5PUwp9gJxhG2Vu4l/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZm08Y05eI0KQA2pYBT+wmnRmeay1m7YK6pOpx8jOR5Rc4t4sCpEm3fYOTw8a5yEO/uHazvZUqw073PzQRcmg+YKp9OW3aAqXi0rKaTjxzBVCGLxVSiO4Me9Y3alYoodTXcU+5xiTRvXGoiRrXyF6JYYtGxMla9r32fFGpbG60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=Iq5GHZxx; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.126.122] (ip72-219-82-239.oc.oc.cox.net [72.219.82.239])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4Z61WS5Sqtz16d5;
	Mon,  3 Mar 2025 09:33:08 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1741012389; bh=s+FoJtKmlgMw/QXOaHBp8YK4f5PUwp9gJxhG2Vu4l/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Iq5GHZxxiqUFFk05OtmCmCVM+fDJL5w6LKPip8QhSRNPfp7x4h7WkHUq/ZasNP09Y
	 cSgLfjowjKfvfoBATZxSezVlt6g+L+A3e9HANywGP3LN32TpRrSfAL+ecIpGcJs7HZ
	 DvrG32zQCzMgztRApdwWRfsszPQIgXmojOCjqrMs=
Message-ID: <402bcee8-030a-45bf-834b-ea4baf5eed3c@panix.com>
Date: Mon, 3 Mar 2025 06:33:06 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: So, I had to revert d6d458d42e1 ("Handle DisplayPort tunnel
 activation asynchronously") too, to stop my resume crashes
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Me <kenny@panix.com>
Cc: linux-usb@vger.kernel.org
References: <d56fcd99-433e-4670-8388-7035812a78d9@panix.com>
 <20250303115329.GT3713119@black.fi.intel.com>
 <68cec31a-0132-43bd-8a61-29e0ac23b326@panix.com>
 <20250303131359.GV3713119@black.fi.intel.com>
 <744090aa-074e-443f-8a94-567dadff4c7d@panix.com>
 <20250303132327.GW3713119@black.fi.intel.com>
 <20250303134618.GX3713119@black.fi.intel.com>
 <24ef839c-8fa5-4a19-b9c6-0a267aab84f5@panix.com>
 <20250303140156.GY3713119@black.fi.intel.com>
 <567725a5-f984-4ea1-bd38-8815825c1211@panix.com>
 <20250303142058.GA3713119@black.fi.intel.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <20250303142058.GA3713119@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/3/25 06:20, Mika Westerberg wrote:

> Actually just managed to reproduce this with hibernate \o/ so debugging
> now.

OK, this is good ... but now you've got me wondering if I indeed saw it 
during suspend cycles as well (I usually suspend only, then systemd will 
initiate a hibernation after 4H so just going back/forth to the office 
shouldn't trigger this).

Waiting to see what you find,

-Kenny

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


