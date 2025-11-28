Return-Path: <linux-usb+bounces-31034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C24C90ED4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 07:15:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0990A4E0508
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 06:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696432D0C82;
	Fri, 28 Nov 2025 06:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="epBLNkdb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49225.qiye.163.com (mail-m49225.qiye.163.com [45.254.49.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7112C236B;
	Fri, 28 Nov 2025 06:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310523; cv=none; b=pdpmddtQc+5P8oYwgZPnrRnvRcA62u3HQkQI18zAT+ft4Be5Gk7oQlRvV0YgLUFvAlhwvGFSDmbCFd0WT+ZJwidJ4GN/q1eKiYlplqxAcVDFF/O1N32cOLzlaBaR/qTTzRd9Mwz0NMpuOiAzYujPbf8StmTCkuWWgVIJrNS5DJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310523; c=relaxed/simple;
	bh=B5GtWU6w8veNmcByHDucbIqv5dS/DRp2ynbL4nPQtiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tOQtAflxw4VuHI0Th7eO5p7q4/FBsCtVS41BO/YsOG97HUPi/gJQVyvLXWAxpeJdkIyPSFIvusBdVbViYh6S0IdyiZ0gOl5w+NMH8F+fqReakiuRX/XoIv1xMqSiwNf6Ey3V27mJBzzzufsubMq8gaZGZzFu66If5eZDLRyvfDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=epBLNkdb; arc=none smtp.client-ip=45.254.49.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b39a5a25;
	Fri, 28 Nov 2025 14:15:08 +0800 (GMT+08:00)
Message-ID: <5520827b-bd13-4b32-8266-83a4eaa233c3@rock-chips.com>
Date: Fri, 28 Nov 2025 14:15:07 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/11] usb: typec: Set the bus also for the port and
 plug altmodes
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
References: <20251128020405.90-1-kernel@airkyi.com>
 <20251128020405.90-2-kernel@airkyi.com>
 <2025112846-italicize-handled-84ff@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112846-italicize-handled-84ff@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac919e25d03abkunm620e070778961a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNKSFZDTB5PH0MfS0hPQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=epBLNkdbptb9cHtQ3AJCdjD21s5e//NrMhZ4LYQDQDZbqbyIEeKSKuXV6MlTHYxDLxLUS7vdWxJHsBY8X1bhIQLB4RecIM+hZIQY8C/r7BdQhoU6OKecoXikDVnuSw+ExyzNoqJiD0bVwvgDiAD2VnV3OvKJXYXaY52duX1B1n4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tzMR4kh8D+qHm/CH7X1zLsU1wQXss4anvJFfayQtBy4=;
	h=date:mime-version:subject:message-id:from;

On 11/28/2025 1:51 PM, Greg Kroah-Hartman wrote:
> On Fri, Nov 28, 2025 at 10:03:55AM +0800, Chaoyi Chen wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> The port and plug altmodes can't be bound to the altmode
>> drivers because the altmode drivers are meant for partner
>> communication using the VDM (vendor defined messages), but
>> they can still be part of the bus. The bus will make sure
>> that the normal bus notifications are available also with
>> the port altmodes.
>>
>> The previously used common device type for all alternate
>> modes is replaced with separate dedicated device types for
>> port, plug, and partner alternate modes.
>>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> ---
> 
> You forgot to sign off on this :(
> 

Sorry for that. If there are no further problem on this series,
I will resend it.

-- 
Best, 
Chaoyi

