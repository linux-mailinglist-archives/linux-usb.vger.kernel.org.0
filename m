Return-Path: <linux-usb+bounces-7694-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCC875705
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 20:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E623F1F220B5
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 19:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536DB136647;
	Thu,  7 Mar 2024 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="FOTcuUxI"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2662574B
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709839363; cv=none; b=AijZS1a7Az/JgtEEGVpl8f1XM/PC0m4/ZikG33hSVOinXfOdCf2NLpPbWUo+LI5sU9ZL7xT91KpeFra8nWF9oQ/ISPu7mq1inybJSufLNb/3oanuD7Ln81q/tVvsg2+0iqcQFuHf5u+1yhbPOkpjCRYlY6RSgL1CeNG0XkTWR+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709839363; c=relaxed/simple;
	bh=jckae/icxH9Dnfw4v6C2z6ZWItx/ow6XLkQzWFzf+zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaocqxZjHO99K7LuatYQiCddK4z1lYtG0r+BjCzqU8q8W8GJkqt3UKPFRWzuTZRvsdGmGcF5q07GWA0Dc2oeRcet/bQMkAVJVLOee6dWHLEnjceczm1jGxZAM3tMxxZ3RGyyCeSBwF20BVt2TDHFW2PUfe0MaK4P1JsMXKOD73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=FOTcuUxI; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qL8qjncugKoYRuAFy9ILAvH/ZHixptiYrTLFjDQXyU0=; b=FOTcuUxIuwjyyr1+dkhDkRDKV1
	oNyeBu/C7vU6j0jbzKp37UphIGmRkxbDt+yQRG/IXiGdsFyNdbaLtTztSVMcnWXboCnrLFUE0MI3c
	BhsfMniJGnwSyRs8CcWWHV5GPEzAh/JhjX3VLOPW969NS2Y1x+zmKbEvUZO7wBKqj/i3BLfopBwJ6
	lt1CFU1iBBKdEMsBx/vgaqAoEhm2VfEuN9971Q4OVMa5B1Oplejk4ZjTgyRC9qpm4J6fpiUsD216D
	aai7Yh7LjPTgnDVF7y0BUgbSxJOyZOZQnkwv+UFe6VL+U5wyXBR8D+A1JTJ1Fun8slSdjhs6MSIb1
	L10kmT2g==;
Received: from [177.62.247.190] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1riJJz-007OUP-JI; Thu, 07 Mar 2024 20:22:28 +0100
Message-ID: <70a7692d-647c-9be7-00a6-06fc60f77294@igalia.com>
Date: Thu, 7 Mar 2024 16:22:22 -0300
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
References: <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
 <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
 <20240307003955.js57ik6cuxhhsae3@synopsys.com>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20240307003955.js57ik6cuxhhsae3@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2024 21:40, Thinh Nguyen wrote:
> [...]
> 
> Can you try this? I made some adjustments to the previous conditions:
> * If operate as device mode, only allow system wakeup if there's gadget
> * driver binded.
> * Make sure to pass the wakeup config to the xhci platform device when
>   switch to host.
> 
> If it works, I'll clean this up and split this into 2 separate patches.
> 
> Thanks,
> Thinh
> 
> <patch>


Hi Thinh, thanks again for your support!

I've tested the suggested patch, and it's working fine in both device
and host modes. In both modes the system suspends and wakes up fine.

And when in host mode, with USB connected, I see the following on dmesg:
"xhci-hcd xhci-hcd.2.auto: xhci_plat_suspend: device_may_wakeup: 1"

Please CC me in the official patches if possible, I can send my
Tested-by tags there.
Cheers,


Guilherme

