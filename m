Return-Path: <linux-usb+bounces-29838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0E4C19D78
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 11:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACF5C188AAE0
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAEB32F759;
	Wed, 29 Oct 2025 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="GmeuiUAx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com [45.254.49.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BC32E15A;
	Wed, 29 Oct 2025 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734234; cv=none; b=mTHEUNUvdy2akbdi1SbE+QQNHf3IGRRucRqU4OL7lyqJv/eukv50P7Bw1xj8GPCANjc/hXeDUBFjJwme//9q8/RJbdhIjQgm0YePWXHcIUO/8nAxlDfzq7KPcTmXcLLwqXybJzYkC6sdvH0J1QT4hrXH3VJf4iW94sCLrw89tQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734234; c=relaxed/simple;
	bh=P2NiPidEnQFByT+RVIM7L2lvzhmA6l9uXK5U21d4lYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1ZEYrRGn+WNRiIzng0t5nrQn5+F13QT41szxZ9EHb/kbmv+H6mWzcVV+QE9wAMf3tnEm1Szh3WvroVl6hRDIiNDiY2gySQWJB3HDP3UdTb1+vxARbQFKZzdvwfST01RAakhuLDpowuq+3k6Ah7L/FRrOvIUjJNjpuOuNb0oiJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=GmeuiUAx; arc=none smtp.client-ip=45.254.49.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27a23665c;
	Wed, 29 Oct 2025 18:31:58 +0800 (GMT+08:00)
Message-ID: <e0c5bda3-7428-49e0-9955-fa23f1e4f35d@rock-chips.com>
Date: Wed, 29 Oct 2025 18:31:57 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 10/10] arm64: dts: rockchip: rk3399-evb-ind: Add
 support for DisplayPort
To: Peter Chen <hzpeterchen@gmail.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
References: <20251029071435.88-1-kernel@airkyi.com>
 <20251029071435.88-11-kernel@airkyi.com>
 <CAL411-o6mF71oBeRsJ-OPZNbLegn4iJ_ELN9xVdppTM3ssUPOw@mail.gmail.com>
 <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <cc8b583a-77ec-4a7f-97cc-2d148f7fee9f@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a2f863f0e03abkunm89a9d527348c30
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4eGlZKTh9OSx9CGk1PSBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=GmeuiUAxP7J2yuWygBp95hV/mCOru5SA8EQF6k8V2qpQmRXW7S/ggyYk6FWN6PZ5seE3nppmtySOiZU0C0yx32P3CLk2gGfF+2QjP0ShL16frucKFSI9rXy8+y7T7ReuyXgssIptoyeDmznafg59sMOyB5abKFMpN1vtCMAK/P8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=x8PMAjpUzEpEObt1dire31F5Js78fV2X3/gBASmc8NM=;
	h=date:mime-version:subject:message-id:from;

On 10/29/2025 6:21 PM, Chaoyi Chen wrote:

> Hi Peter,
>
> On 10/29/2025 5:45 PM, Peter Chen wrote:
>>> +&i2c4 {
>>> +       i2c-scl-rising-time-ns = <475>;
>>> +       i2c-scl-falling-time-ns = <26>;
>>> +       status = "okay";
>>> +
>>> +       usbc0: typec-portc@22 {
>>> +               compatible = "fcs,fusb302";
>>> +               reg = <0x22>;
>>> +               interrupt-parent = <&gpio1>;
>>> +               interrupts = <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
>>> +               pinctrl-names = "default";
>>> +               pinctrl-0 = <&usbc0_int>;
>>> +               vbus-supply = <&vbus_typec>;
>>> +
>>> +               usb_con: connector {
>>> +                       compatible = "usb-c-connector";
>>> +                       label = "USB-C";
>>> +                       data-role = "dual";
>>> +                       power-role = "dual";
>>> +                       try-power-role = "sink";
>>> +                       op-sink-microwatt = <1000000>;
>>> +                       sink-pdos =
>>> +                               <PDO_FIXED(5000, 2500, PDO_FIXED_USB_COMM)>;
>>> +                       source-pdos =
>>> +                               <PDO_FIXED(5000, 1500, PDO_FIXED_USB_COMM)>;
>>> +
>>> +                       altmodes {
>>> +                               displayport {
>>> +                                       svid = /bits/ 16 <0xff01>;
>>> +                                       vdo = <0x00001c46>;
>>> +                               };
>>> +                       };
>>> +
>>> +                       ports {
>>> +                               #address-cells = <1>;
>>> +                               #size-cells = <0>;
>>> +
>>> +                               port@0 {
>>> +                                       reg = <0>;
>>> +
>>> +                                       usbc_hs: endpoint {
>>> + remote-endpoint = <&u2phy0_typec_hs>;
>>> +                                       };
>>> +                               };
>>> +
>> Why USB2 PHY needs to be notified for Type-C connection?
>
> I think the USB-connector binding require a port@0 for High Speed.  So I filled in USB2 PHY here. And I have looked up boards with the same usage, and some of the results are as follows:
>
> - rk3399-firefly.dts
>
> - rk3399-pinebook-pro.dts
>
> - rk3399-eaidk-610.dts
>
>
>>
>>> +                               port@1 {
>>> +                                       reg = <1>;
>>> +
>>> +                                       usbc_ss: endpoint {
>>> + remote-endpoint = <&tcphy0_typec_ss>;
>>> +                                       };
>>> +                               };
>>> +
>>> +                               port@2 {
>>> +                                       reg = <2>;
>>> +
>>> +                                       usbc_dp: endpoint {
>>> + remote-endpoint = <&tcphy0_typec_dp>;
>>> +                                       };
>>> +                               };
>>> +                       };
>>> +               };
>>> +       };
>>> +};
>>> +
>> .....
>>>   &u2phy0 {
>>>          status = "okay";
>>> +
>>> +       port {
>>> +               u2phy0_typec_hs: endpoint {
>>> +                       remote-endpoint = <&usbc_hs>;
>>> +               };
>>> +       };
>>>   };
>>>
>> There is no switch and mux, how to co-work with Type-C?
>
> I checked the phy-rockchip-inno-usb2.c but did not find any switch or mux. Does this mean that we need to implement them? Thank you.

Wait a minute, actually we have multiple hardware interfaces, one of which is Type-C, eventually connected to USBDPPHY, and the other is micro-usb connected to U2PHY.


>
>
>>
>> Best regards,
>> Peter
>>
>>
-- 
Best,
Chaoyi


