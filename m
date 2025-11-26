Return-Path: <linux-usb+bounces-30932-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F316FC87BF7
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 02:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B32423B1F71
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 01:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C712F6594;
	Wed, 26 Nov 2025 01:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ATpEd2pe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57375308F34;
	Wed, 26 Nov 2025 01:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764121591; cv=none; b=qEmoCC+XxrktL52PNglXT5UdlqmQncgeh+ntuueykfiS+0S0eWIQCGqonCk66Vb6UNSDP9GktO6nmp+8dJKDUJobzMjYZh+aPCxFrwmLYRtOETrBIsP/OM+2gTKDDk2EUs2aV1pyZrPdy6zZCsDAd5dvRwUc2I0Z6qkmOcndrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764121591; c=relaxed/simple;
	bh=/fGHbQS+hKaoMUCdIdSghj4cqUrqtK3xvd6C6paFFGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guo2ngJA3mGOyLWo26R0g94XjSQgQmMspRaH7VQDoEyI/A3Y6FaBKbnDAzG2tvoQ1bI4am7mNGWxZlpbcRE3wyTx8Wu1pmLsYZcytRsHQ8CqeOucNGQS8s3WJn5yiblg99nwWOZTYYdSfWY1g2FxunZNkzQLAV3cYMWNXsGtU0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ATpEd2pe; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ae663690;
	Wed, 26 Nov 2025 09:46:21 +0800 (GMT+08:00)
Message-ID: <cbb38c08-6937-4b7d-a0b0-d5ca6c17f466@rock-chips.com>
Date: Wed, 26 Nov 2025 09:46:19 +0800
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
References: <20251120022343.250-1-kernel@airkyi.com>
 <20251120022343.250-2-kernel@airkyi.com>
 <2025112102-laurel-mulch-58e4@gregkh>
 <462ad1bd-7eec-4f26-b383-96b049e14559@rock-chips.com>
 <2025112402-unopposed-polio-e6e9@gregkh>
 <a80483de-518d-45d5-b46a-9b70cca5b236@rock-chips.com>
 <2025112448-brush-porcupine-c851@gregkh>
 <c9cb7b79-37c8-4fef-97a6-7d6b8898f9c4@rock-chips.com> <aSV_lQYJPxN7oBM-@kuha>
 <2025112554-uncaring-curator-642a@gregkh>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <2025112554-uncaring-curator-642a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9abdd7181603abkunm097aa0cf565eb1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hNTVZMHUtOSR1DTx8ZHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ATpEd2peqV8kESMPjbf3DLHuOAl6CsCl20ltOYkox2RRSvunRK2u2jypMEBLL1VzgX6l9RPhBrbLO0wxxiKsmnmH148nSqotcKB1UTdgbjcic/vs7pkvSKUSgo5tanCci8foVksqRSRVq1sBJmUE4CKTJrgx7g/63nwCaXSG/4U=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=N0tG8/Nj0kl8vFA6L4W6Z+Hthet7cKPX1ZaAwkiqFD4=;
	h=date:mime-version:subject:message-id:from;

On 11/25/2025 7:49 PM, Greg Kroah-Hartman wrote:
>> +static umode_t typec_is_visible(struct kobject *kobj, struct attribute *attr, int n)
>> +{
>> +	if (is_typec_port(kobj_to_dev(kobj)->parent))
> 
> Why look at the parent?  Doesn't the device have a type that should show
> this?
> 
> Otherwise, looks good to me.

They have same deivce type "typec_altmode_dev_type".
The parent device has a different device type to distinguish between
port device and partner device.

> 
> thanks,
> 
> greg k-h
> 
> 

-- 
Best, 
Chaoyi

