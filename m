Return-Path: <linux-usb+bounces-30853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FDC7F522
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 09:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53FBB3449B2
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 08:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC822EA473;
	Mon, 24 Nov 2025 08:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KJvSMQWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m21470.qiye.163.com (mail-m21470.qiye.163.com [117.135.214.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB20325B1D2;
	Mon, 24 Nov 2025 08:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971569; cv=none; b=eAkTzoJCMnLtJeTHAk808NRCL1WFD/e5EjKhnzqjrXs/APgNz6PsLbyZzSf+75XWdIrpXJ0dlQT8dAIagKvbShsFk6uQgQd+oxwgh6v5wS731W2Qz7r+fTuD9ZaoL3DRTJgTnMjVhe0opP6vdfFZVQ5ypZaqYeTwZbROi2HFR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971569; c=relaxed/simple;
	bh=qPNY91SDrIBCELOETUIAMUZaWMsxc902AJdatxGf/3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qToSDNskq+fzrvs6/k3Rd+x4isbvp1zxBpL0QLZlnOCAPXpDNAzZHEX/vBrRY1ck4Z6mLjrEOwpBiwuLjPl3R1KUfi90J/BBshC91/L0Ht6PVHbFJMvC+7jIFCfAa0r+D4l+kbunxjUXktwHTY9IfDTZH1p7pCq1zlUgVyjgNBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KJvSMQWn; arc=none smtp.client-ip=117.135.214.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2aa88f2fe;
	Mon, 24 Nov 2025 16:05:54 +0800 (GMT+08:00)
Message-ID: <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
Date: Mon, 24 Nov 2025 16:05:53 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112402-unopposed-polio-e6e9@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ab4e5daa803abkunma55763e93ea70d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkxISlZNSktCGh9IGkoaTk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KJvSMQWnhpc4p7xme6emDFe2++rK44pn+ANOLRzg5kiLyjx+/4+yFvS6QcBrrxdhALgpyzrKiSpzwKvymkjs34dszmAkArFI9nKrFKxGwSzH8jEZmbae68cvtp3xcYfv9VmIj6xu/V65TudwLH2r6q/J/2emA/s0k+m7iBbXtjc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Dm0AUIAI3rBdsSDVXq01oojJAQeP5JCEx7XZOEM8cDU=;
	h=date:mime-version:subject:message-id:from;

Hi Greg,

On 11/24/2025 3:10 PM, Greg Kroah-Hartman wrote:

> On Mon, Nov 24, 2025 at 09:40:03AM +0800, Chaoyi Chen wrote:
>> Hi Greg,
>>
>> On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Nov 20, 2025 at 10:23:33AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> Some other part of kernel may want to know the event of typec bus.
>>> Be specific, WHAT part of the kernel will need to know this?
>> For now, it is DRM.
> Then say this.

Okay, please refer to the discussion below.

>
>>> And why a new notifier, why not just use the existing notifiers that you
>>> already have?  And what is this going to be used for?
>> We have discussed this before, but the current bus notifier cannot achieve the expected notification [0].
>>
>> [0] https://lore.kernel.org/all/aPsuLREPS_FEV3DS@kuha.fi.intel.com/
> Then you need to document the heck out of this in the changelog text.
> But I'm still not quite understanding why the bus notifier does not work
> here, as you only want this information if the usb device is bound to
> the bus there, you do not want to know this if it did not complete.
>
> That thread says you want this not "too late", but why?  What is the
> problem there, and how will you handle your code getting loaded after
> the typec code is loaded?  Notifier callbacks don't work for that
> situation, right?

In fact, the typec_register_altmode() function generates two registered events. The first one is the registered event of the port device,

and the second one is the registered event of the partner device. The second one event only occurs after a Type-C device is inserted.

The bus notifier event does not actually take effect for the port device, because it only sets the bus for the partner device:

     /* The partners are bind to drivers */
     if (is_typec_partner(parent))
         alt->adev.dev.bus = &typec_bus;


I hope it's not too late. In fact, the notifier here will notify DRM to establish a bridge chain.

The downstream DP controller driver hopes to obtain the fwnode of the last-level Type-C device

through this bridge chain to create a DRM connector. And when a device is inserted,

drivers/usb/typec/altmodes/displayport.c can notify the HPD (Hot Plug Detect) event.

If relying on the second event, the bridge chain may never be established, and the operations of the DP driver will be

always deferred. Furthermore, other parts of the display controller driver will also be deferred accordingly.

>
>>> Notifiers are a pain, and should almost never be added.  Use real
>>> function calls instead.
>> In v6, I used direct function calls, but had to switch to notifiers because couldn't resolve the dependencies between DRM and Type-C [1]. Do you have any good ideas? Thank you.
> Only allow this DRM code to be built if typec code is enabled, do NOT
> use a select, use a depends in the drm code.

Sorry, I didn't get your point. Does this mean that the current notifiers approach still needs to be changed to direct function calls?

If so, then based on the previous discussion, typec should not depend on any DRM components. Does this mean that we should add the if (IS_REACHABLE(CONFIG_DRM_AUX_BRIDGE)) before the direct function call?

Additionally, the current version of CONFIG_DRM_AUX_BRIDGE is selected by the DP driver in patch9.

-- 
Best,
Chaoyi


