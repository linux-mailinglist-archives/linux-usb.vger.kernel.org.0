Return-Path: <linux-usb+bounces-30555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 576CBC6300F
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 09:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 323414E8C64
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 08:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC904321448;
	Mon, 17 Nov 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hOFtIT19"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m3285.qiye.163.com (mail-m3285.qiye.163.com [220.197.32.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F2D320A29;
	Mon, 17 Nov 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763369794; cv=none; b=P8fSuPZd/7rzFU/hLcEzge7ah/S5gcwbdjR6kjv3e5mgG/O/vXjvCXwb7Ah36QzCSTAIWj3Jmc+VcSvBiWPOULinSSrDpOKVX01N+9N+TNgzQkaUyJagL8nBGCGtoFVJpaK1qe1mE7Z7BAsCYxGXk50osCiidCHJN464zjypQNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763369794; c=relaxed/simple;
	bh=s+EbEDT1bM2jm0Uo+6FPZMVkzVuYa7P8MmADyL1dNtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzD28gYWkDgccmkc+mksK3R1pfZzMXuOtpCnL1MTz9rHkos+u+bjoleLeZ69XC+kVLOPP5LkCzjY6fvpQ3Mezdqo7HHgKb+HYecI+oMn2Lq3RtSlFFuyFHyamEeEp6Yiri/0aBSzvTM54JRG4S8m4q8YC3o2Zse6B1YYbryiFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hOFtIT19; arc=none smtp.client-ip=220.197.32.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29d41b62c;
	Mon, 17 Nov 2025 16:41:08 +0800 (GMT+08:00)
Message-ID: <a3d80b63-761c-4a15-b7fb-c8a3bba8a5bd@rock-chips.com>
Date: Mon, 17 Nov 2025 16:41:07 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] usb: typec: Add notifier functions
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
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
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-2-kernel@airkyi.com> <aRrd48unDVdtKYH3@kuha.fi.intel.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <aRrd48unDVdtKYH3@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a90f9990e03abkunm4cb37f2e8ef5d7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9LGVZMTEpKSElOTUgeQhlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hOFtIT19tQHGKm/AjIrU3dl9n7oTP30e+3028Vz/xpPVYhiRb5DY+GdzDQAke2B4uTj9X52JMiN7m3Q5PbecpuNBUkv1arKOXPCcGAo1RbjOs6PsLqyySe5MADqb96G35VF9Hr2XNq1Fuhgo/zOfm3gqq8ppid45A8xGVpVncIk=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tB5/oLgZQyjNeula29g1R0qnMwKqvTtythdvgE1DMgw=;
	h=date:mime-version:subject:message-id:from;

On 11/17/2025 4:33 PM, Heikki Krogerus wrote:

> Tue, Nov 11, 2025 at 06:50:31PM +0800, Chaoyi Chen kirjoitti:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> Some other part of kernel may want to know the event of typec bus.
>>
>> This patch add common notifier function to notify these event.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v9:
>> - Remove redundant header files.
>>
>> Changes in v8:
>> - Fix coding style.
>>
>>   drivers/usb/typec/Makefile        |  2 +-
>>   drivers/usb/typec/bus.h           |  2 ++
>>   drivers/usb/typec/class.c         |  2 ++
>>   drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
>>   include/linux/usb/typec_altmode.h |  9 +++++++++
>>   5 files changed, 37 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/usb/typec/notify.c
>>
>> diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
>> index 7a368fea61bc..20d09c5314d7 100644
>> --- a/drivers/usb/typec/Makefile
>> +++ b/drivers/usb/typec/Makefile
>> @@ -1,6 +1,6 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   obj-$(CONFIG_TYPEC)		+= typec.o
>> -typec-y				:= class.o mux.o bus.o pd.o retimer.o
>> +typec-y				:= class.o mux.o notify.o bus.o pd.o retimer.o
>>   typec-$(CONFIG_ACPI)		+= port-mapper.o
>>   obj-$(CONFIG_TYPEC)		+= altmodes/
>>   obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
>> diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
>> index 643b8c81786d..820b59b6d434 100644
>> --- a/drivers/usb/typec/bus.h
>> +++ b/drivers/usb/typec/bus.h
>> @@ -26,6 +26,8 @@ struct altmode {
>>   	struct altmode			*plug[2];
>>   };
>>   
>> +void typec_notify_event(unsigned long event, void *data);
>> +
>>   #define to_altmode(d) container_of(d, struct altmode, adev)
>>   
>>   extern const struct bus_type typec_bus;
>> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
>> index 9b2647cb199b..9d2aa3dd3f56 100644
>> --- a/drivers/usb/typec/class.c
>> +++ b/drivers/usb/typec/class.c
>> @@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> +	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
>> +
>>   	return &alt->adev;
>>   }
> You need to also send TYPEC_ALTMODE_UNREGISTERED notification in
> typec_unregister_altmode().
>
Sorry, I left that out. I will fix this in v10. Thank you.

-- 
Best,
Chaoyi


