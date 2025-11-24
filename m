Return-Path: <linux-usb+bounces-30841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B98C7EC24
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 02:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D05D4E2159
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 01:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EDB2274B48;
	Mon, 24 Nov 2025 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="f4+mCPYd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m19731100.qiye.163.com (mail-m19731100.qiye.163.com [220.197.31.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9013A26F291;
	Mon, 24 Nov 2025 01:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948415; cv=none; b=Pw2MXELYfZPNIc9b/1TowdWxXD73IFLMw5eeQjkbGDo8J/4CHlIb7BSrUMKAGLgHRKs+jKitUThP9lbIzqtlF9nulNbJSXMZ3cq7PWrT8sXC+098dc5yzRTVQnYIFrEjliS0TbYw1fyzFTwd8Bm9qRh4LaZMsqkp0cOt3J4Vey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948415; c=relaxed/simple;
	bh=A54Tt7fZbPo+rw1lDD1wXICoAklfBRc9gzNlQoTif0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/TYR+I9C/RfOOS8lXBYgBha8+E4o8iobLZQFmJyFYKWm2uunEA0I3mJjsziksqM/wXheZ7/BSZ6zxPwXSkaXkMcRhIFwCz5+PIwGhwX7v+C6m1+usYJuM+32EFRAlFmDsOywZN3+5jgr3JIMo7Jgeh6tEeESyiJXJcYfHMeZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=f4+mCPYd; arc=none smtp.client-ip=220.197.31.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a998c2ff;
	Mon, 24 Nov 2025 09:40:05 +0800 (GMT+08:00)
Message-ID: <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
Date: Mon, 24 Nov 2025 09:40:03 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112102-laurel-mulch-58e4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ab384a1c703abkunmfa83b8ab38c240
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JKGVYfGEpIS04dQkgeQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=f4+mCPYdv+riXF8Aoj4wUW+oYifKZiJ/TjuUgPWTmNFL8Iz3GvYFWK2QMaTCMdPv2zqbWK5Zjj+81aUzEy5KEuDCOVR74l6uME4OFfDsttmHKoAszBI6HwlYyNszsCtMJETC/7YZJqFTDoTE0Ag2zR+1xxAQDZ/fwtcF0T2b1t4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7neti7dpAmDFcPilq2Bt0Tzsj7xXGZOIwTb6sK9LseA=;
	h=date:mime-version:subject:message-id:from;

Hi Greg,

On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Some other part of kernel may want to know the event of typec bus.
> Be specific, WHAT part of the kernel will need to know this?

For now, it is DRM.


>
> And why a new notifier, why not just use the existing notifiers that you
> already have?  And what is this going to be used for?

We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].

[0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/


>
> Notifiers are a pain, and should almost never be added.  Use real
> function calls instead.

In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.

[1] https://lore.kernel.org/all/aPYImGmesrZWwyqh@kuha.fi.intel.com/


>
> thanks,
>
> greg k-h
>
>
-- 
Best,
Chaoyi


