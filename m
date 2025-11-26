Return-Path: <linux-usb+bounces-30964-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A70C8998F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 12:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7C573563CB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 11:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C553254B5;
	Wed, 26 Nov 2025 11:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jBANWdfC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m15597.qiye.163.com (mail-m15597.qiye.163.com [101.71.155.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DC1325482;
	Wed, 26 Nov 2025 11:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157910; cv=none; b=c/GT3mpNI1pEcH6pWtTJ/3wQWF6A6xz+9SQ6Wpvz1G4bYYP9Tn9EuVnQunbINslO8u2Cq7Q+T4A4IswcADYEuFiFNpNxo8FTUKgFzK4PHaDyiSfaIdeAOoCal0KiwY6NucJKpmEgE+7IuMsb9wRAubHe/Tdg7jstoF12HL1T9vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157910; c=relaxed/simple;
	bh=Qw0OrNg8ENNr6TE56GmukcIumLBGKpgi4DVBCw5ouDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bk0J2d373zDAeTdFTtbUmBT0DghWOZP3zOnoVI6oBZNphN6VKsCWaE95vNW1uuQ2qVpA1xvRNzwRUSE0rlt0Ckpvd0UO60N+CwNX1kpN3ff1MygIDmn+scSBycoiyaG/CTGxdw0gwZC+WS8TSP1EV9ZTWF/sTIQMOIX10jO20Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jBANWdfC; arc=none smtp.client-ip=101.71.155.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.51] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2afc8ccb9;
	Wed, 26 Nov 2025 19:51:34 +0800 (GMT+08:00)
Message-ID: <e48e1918-8ee0-4ffe-93d5-e096af241f77@rock-chips.com>
Date: Wed, 26 Nov 2025 19:51:33 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/11] usb: typec: Add notifier functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Chaoyi Chen <kernel@airkyi.com>,
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
References: <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com> <aSV_lQYJPxN7oBM-@kuha>
 <2025112554-uncaring-curator-642a@gregkh>
 <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com> <aSbLkwPG0dUzZvql@kuha>
 <2025112656-dreamland-retreat-2a65@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112656-dreamland-retreat-2a65@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ac001308e03abkunmdaa20eca5ea8c5
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk4dHVZIHUIeGBhNTRlNQh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jBANWdfCXUE5gDGcQIlQs4pqUaqXDsXzhdChC4iwSgqp3kPQUaUPgNli4XbRKmNmCnFKOqtpFUnKe9D+Kt7p8xXmLhuiJ9Cw18Swcx5cYBTi/Gz5LHMm7Y0xygV99pjgLmQ02+Ajw3beBLk0/GiLF/nG8ov6UkJaZYaaBF/MbrY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=h7ZJhr+0x5ygBrBW8UPFMD6T08Tpdt0hEWVktbHPqtg=;
	h=date:mime-version:subject:message-id:from;

On 11/26/2025 7:44 PM, Greg Kroah-Hartman wrote:
> On Wed, Nov 26, 2025 at 11:42:43AM +0200, Heikki Krogerus wrote:
>> Wed, Nov 26, 2025 at 09:46:19AM +0800, Chaoyi Chen kirjoitti:
>>> On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
>>>>> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>>>>> +{
>>>>> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
>>>>
>>>> Why look at the parent?  Doesn't the device have a type that should show
>>>> this?
>>>>
>>>> Otherwise, looks good to me.
>>>
>>> They have same deivce type "typec_altmode_dev_type".
>>> The parent device has a different device type to distinguish between
>>> port device and partner device.
>>
>> I was already wondering would it make sense to provide separate device
>> types for the port, and also plug, alternate modes, but I'm not sure
>> if that's the right thing to do.
>>
>> There is a plan to register an "altmode" also for the USB4 mode,
>> which of course is not an alternate mode. So USB4 will definitely need a
>> separate device type.
>>
>> So if we supply separate device types for the port, plug and partner
>> alternate modes, we need to supply separate device types for port, plug
>> and partner USB4 mode as well.
>>
>> We certainly can still do that, but I'm just not sure if it makes
>> sense?
>>
>> I'll prepare a new version for this and include a separate patch where
>> instead of defining separate device types for the port and plug
>> alternate modes I'll just supply helpers is_port_alternate_mode() and
>> is_plug_alternate_mode().
> 
> That feels like it would be better in the long run as it would be
> easier to "match" on the device type.
>

It make sense. But now can we first use the current "match" device type
operation and then modify them later?

> thanks,
> 
> greg k-h
> 
> 

-- 
Best, 
Chaoyi

