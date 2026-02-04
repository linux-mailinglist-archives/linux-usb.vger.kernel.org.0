Return-Path: <linux-usb+bounces-33084-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CF0wEMELg2k+hAMAu9opvQ
	(envelope-from <linux-usb+bounces-33084-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 10:05:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD092E3882
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 10:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D0D30616FA
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 08:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6178539E6CB;
	Wed,  4 Feb 2026 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GXUPOFEj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m1973184.qiye.163.com (mail-m1973184.qiye.163.com [220.197.31.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC78D359FB8;
	Wed,  4 Feb 2026 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770195589; cv=none; b=ofyb9Y0b4V4cW5WfXLad7ay/Foli9jZDU7L0+nijgHkRuBVdVjWetj3sJ0dVXmOhBNHHhZeNVKjH0iM1NNhSPMAbzwSw4+mX+DeD8WHQcr/loRcQ8MnIRXnN3zGHMbGT+1q8P29qeHnkiVWEb7P8JdIAQ3wXrknA5MZi/hA0euY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770195589; c=relaxed/simple;
	bh=FBm08EgxhjgcghY9Mqa9v4hoNGW3rD1QUnFyAnGb0eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YA7yd8l7n/zFp1slQnAfqM3gkSAgWJ+QJi3mpjXM+BVtOpfuWi431O4+9wGGwhZIDrYmIJZ0Un7E5Txl7N0R5KjbPE51n4wKixCHAeTeioAoTx+I928nsXz2p76EcQk7Az/ScxAWOBwYwyp4fIn8F/J71jUup/YjlRPlpKcc51k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GXUPOFEj; arc=none smtp.client-ip=220.197.31.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33159c373;
	Wed, 4 Feb 2026 16:59:34 +0800 (GMT+08:00)
Message-ID: <fdc1df7d-b8ff-4778-bfd4-292e916096aa@rock-chips.com>
Date: Wed, 4 Feb 2026 16:59:33 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 0/9] Add Type-C DP support for RK3399 EVB IND board
To: Hugh Cole-Baker <sigmaris@gmail.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20260119073100.143-1-kernel@airkyi.com>
 <c9dd365b-ad8f-410e-96f8-f914f03634b2@gmail.com>
 <e1b172bd-443f-40a5-9d9e-9e575b0b551e@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <e1b172bd-443f-40a5-9d9e-9e575b0b551e@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9c27e0df8003abkunm47ebfb0fc6ed1f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9KSVZOTB5LSR1NGkNPTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GXUPOFEjineBR3F/Oa8PhIiHVe9wHSneU3r5eCy+zDqLZUSXJ0UwNP4PgDqjK4dlWdlOOFj6tzl5+AcH5O04cM+b9B15UCFVojo7KqF/tNQtrnWHmu7/zBe3dKIKe0j1cEyMChWds2E9KOReGMgLaoVw7HcHQLz7liVdkAnMpyk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7bsWow0W4kR530wfCqB4TkbHmgVZW3XApJOi5iMFmcI=;
	h=date:mime-version:subject:message-id:from;
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33084-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaoyi.chen@rock-chips.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[airkyi.com,linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rock-chips.com:email,rock-chips.com:dkim,rock-chips.com:mid]
X-Rspamd-Queue-Id: DD092E3882
X-Rspamd-Action: no action

On 1/26/2026 11:22 AM, Chaoyi Chen wrote:
> Hello,
> 
> On 1/26/2026 3:42 AM, Hugh Cole-Baker wrote:
>> On 19/01/2026 07:30, Chaoyi Chen wrote:
>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>
>>> This series focuses on adding Type-C DP support for USBDP PHY and DP
>>> driver. The USBDP PHY and DP will perceive the changes in cable status
>>> based on the USB PD and Type-C state machines provided by TCPM. Before
>>> this, the USBDP PHY and DP controller of RK3399 sensed cable state
>>> changes through extcon, and devices such as the RK3399 Gru-Chromebook
>>> rely on them. This series should not break them.
>>>
>>> ====
>>> 1. DisplayPort HPD status notify
>>>
>>> Before v7, I implemented a variety of DP HPD status notify. However,
>>> they all had various problems and it was difficult to become a generic
>>> solution.
>>>
>>> Under the guidance of Heikki and Dmitry, a decoupled notification
>>> method between the TypeC and DRM subsystems was introduced in v7.
>>> First, a notification is sent when TypeC registers a new altmode.
>>> Then, a generic DP AUX HPD bridge is implemented on the DRM side.
>>>
>>> During v7-v10, we added a new notifier in typec to notify the altmode
>>> device register event. With the help of Greg and Heikki, we implemented
>>> the reuse of notifiers for the type bus itself in patch1 of v11.
>>>
>>> The USB subsystem related parts have already been merged into the
>>> usb-next branch in v13 [0][1]. Therefore, this series no longer includes
>>> these patches starting from v14. Thanks to Greg and Heikki!
>>>
>>> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=67ab45426215c7fdccb65aecd4cac15bbe4dfcbb
>>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=4dee13db29de6dd869af9b3827e1ff569644e838
>>>
>>> That makes it redundant for each Type-C controller driver to implement
>>> a similar DP AUX HPD bridge in embedded scenarios.
>>>
>>> ====
>>> 2. Altmode switching and orientation switching for USBDP PHY
>>>
>>> For USB Type-C interfaces, an external Type-C controller chip assists
>>> by detecting cable attachment, determining plug orientation, and
>>> reporting USB PD message. The USB/DP combo PHY supports software
>>> configurable pin mapping and DisplayPort lane assignment. Based on
>>> these message, the combo PHY can perform both altmode switching and
>>> orientation switching via software.
>>>
>>> The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
>>> fusb302 chip as Type-C controller. The connection diagram is shown below:
>>>
>>> fusb302 chip +---> USB2.0 PHY ----> DWC3 USB controller
>>>              |
>>>              +---> USB/DP PHY0 +--> CDN-DP controller
>>>                                |
>>>                                +--> DWC3 USB controller
>>>
>>> ====
>>> 3. Multiple bridge model for RK3399 CDN-DP
>>>
>>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>>> the CDN-DP can be switched to output to one of the PHYs.
>>>
>>> USB/DP PHY0 ---+
>>>                | <----> CDN-DP controller
>>> USB/DP PHY1 ---+
>>>
>>> In previous versions, if both PHY ports were connected to DP,
>>> the CDN-DP driver would select the first PHY port for output.
>>>
>>> On Dmitry's suggestion, we introduced a multi-bridge model to support
>>> flexible selection of the output PHY port. For each PHY port, a
>>> separate encoder and bridge are registered.
>>>
>>> The change is based on the DRM AUX HPD bridge, rather than the
>>> extcon approach. This requires the DT to correctly describe the
>>> connections between the first bridge in bridge chain and DP
>>> controller. And Once the first bridge is obtained, we can get the
>>> last bridge corresponding to the USB-C connector, and then set the
>>> DRM connector's fwnode to the corresponding one to enable HPD
>>> notification.
>>
>> With a similar dts patch [1] on top of this series I tested a type-C to
>> DP adapter/cable for display output on the ROCKPro64 board, which also
>> pairs a FUSB302 with RK3399. Booting it up with the cable plugged in
>> works, as does hotplugging the cable after booting in both orientations.
>> The correct mode for the display is detected. I wasn't able to test
>> audio, only video output, as this display doesn't have speakers.
>>
>> I did once, after unplugging and reconnecting the cable a few times,
>> see it get into a state where it didn't detect the attached display.
>> Logs from that unplug/reconnect attempt are here [2] if of interest.
>> Nevertheless, hotplug seems to work the majority of the time, so
>>
>> Tested-by: Hugh Cole-Baker <sigmaris@gmail.com>
>>
>> [1]: https://github.com/sigmaris/linux/commit/91724088b19bee7d248946442a801423e8cd0634
>> [2]: https://gist.github.com/sigmaris/fa107384a7492583ceee1c2962f5030a
>>
> 
> Thank you for the test. I also have the same board, and I will
> try it later :)
> 

I just tested on the ROCKPro64 board using a Type-C to HDMI dock,
and after repeatedly plugging and unplugging it over 30 times, 
it performed correctly every time :)

-- 
Best, 
Chaoyi

