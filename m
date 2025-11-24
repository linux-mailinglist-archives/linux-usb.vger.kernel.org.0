Return-Path: <linux-usb+bounces-30842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 300E3C7EC4B
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 02:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF06A34498F
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 01:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019DD239E9A;
	Mon, 24 Nov 2025 01:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jFaRCEOC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05465F9C0;
	Mon, 24 Nov 2025 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948769; cv=none; b=pSV1FiY4CDmxB5Q8OuLWKigfc33dAjLUkixZedgxhemWel1C9OmtR+N8RUdXGWQchsFBZRVYY7KnA5Zma2fQgRfvT9aH0sz5zJ+DG+Qfm8bCdwEp+AWstlGpc8X8KpLkXMKrW2ltKe4z/Z+VDn1POkTN+fHyJOIW9Fv8k4Hq080=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948769; c=relaxed/simple;
	bh=2DEAk7Izt0BE4gyGpCbJhLzZfJG2/PYwdwUcKxMGBqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InK225KqsjyKoPNBFsPhK/0a3IU8IvxWznoyvi9y5U5Zli4cct59VXvS7A7i+EbKli8IN3aJGQWHTga5k4Ixz1SpGeITde0XhOSoTbOPJ0EN0q7wRD4roMt0VPcNvzW1KrHRrPVUSWuT9j4V0Mer8GPTMCyLDkjYRHrq8Ogy4RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jFaRCEOC; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a99bc279;
	Mon, 24 Nov 2025 09:45:59 +0800 (GMT+08:00)
Message-ID: <c73306de-f3a0-42ac-bfed-ef6b52cf4759@rock-chips.com>
Date: Mon, 24 Nov 2025 09:45:57 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/11] usb: typec: Export all typec device types
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
 <20251120022343.250-3-kernel@airkyi.com>
 <2025112109-glacial-outmatch-add7@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112109-glacial-outmatch-add7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ab38a087603abkunm5871a99e38da02
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hCHlZDGUIeTExJS0ofGE1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jFaRCEOC5tnsMOQoZGeJ0Zdgx6p5zsQj8cNYZi/RkN84pJ52JSRZufKH1THClfPoo8DtwqnoQ0GVvgMekScnFuWH9BR5DRj80PaRKV0KeKuZpBEK7cGkPcgAngzJsImZ/9i2H2DZEy0eBEvv86asQkLn4UStVNdivkE8Tjti02Q=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=iFeIe++8q8EPpaof9jHYzhJp6EO127xLsuYKalp+96M=;
	h=date:mime-version:subject:message-id:from;

Hi Greg,

On 11/21/2025 10:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Nov 20, 2025 at 10:23:34AM +0800, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Export all typec device types for identification.
> I do not understand what this means.  Who is going to use these symbols,
> and for what exactly?
>
> Be specific please.

In patch3, we need to distinguish whether the notifiers in patch1 are triggered by the typec port device or the typec partner device. Therefore, we export the various device types of typec here.

Sorry for the confusion. I will add more information later.

>
> thanks,
>
> greg k-h
>
>
-- 
Best,
Chaoyi


