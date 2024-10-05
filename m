Return-Path: <linux-usb+bounces-15775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC0991AEE
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 23:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84C8FB2051D
	for <lists+linux-usb@lfdr.de>; Sat,  5 Oct 2024 21:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CD416132F;
	Sat,  5 Oct 2024 21:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="MHRVKdaF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD79156677
	for <linux-usb@vger.kernel.org>; Sat,  5 Oct 2024 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728164791; cv=none; b=isqa0iVZx+3AHtRyT8chBTvogmByEGCyYlNKbh8buN9gLogzZwy7cBR1W6irWDT3Oed0Dh1O1iHtv+37Lb35cY4CmlwpUYKx/gjPn7/Y1M6P35KpScGsg8RMtmHjU6QL8lm0RBUMjFnx9ZWNb3lPpwsk0jQGEUkr6iNH96PUhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728164791; c=relaxed/simple;
	bh=oWYMObDSlV5YQZb5xh3kIHUnI6weW0WdV3EbHzEB0wA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rLxpbzD+NwtEKO6GbfOY4PhqMyz9pPAwMQMxISvzL3b4OY0oZmJzWJpYQcUGbBpOmQV8GYzUsJgY0PMEZlaD8mzFIBeDdLra2vATHzIuXUMAeHMcXrPxUaM8TeIVSxPpiQe7T7FUwYJlGkzXZN1gb3utqhBCHi7v/W4SauRVCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=MHRVKdaF; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1728164768; x=1728769568; i=wahrenst@gmx.net;
	bh=oWYMObDSlV5YQZb5xh3kIHUnI6weW0WdV3EbHzEB0wA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MHRVKdaF1CM7844feJayKutY8NDDbN1somYOA9tV7gyqXzJBvIYajFsd5ow7gyKX
	 jgyQPsC4DX2PR6wkObW0H/ErEjXqtxq5CcsaKKH7pFzLW61HZQioD1aIw6MAJ6+OT
	 nZqBbR20OUAcpZyhWMmtcyGbRGBRautQKdRTFufxZ3pGplP/iILzEsYjoEXVX9ELE
	 ljgVklHS8iBdIF0WhPDO5RHmWvaKWUuRxB89ZPCaoMcnZd0IyPXc0VQv9s3sCk1/S
	 dHyOKignzjwbiC7Gl4TxxhmkQvUd/kOitMigL5ZRrWPXx0V4vw7NgDKD9gnlY/kNs
	 Xw7okHnsSWQV7KyUiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOGU-1trn4A1Ayc-00ysIV; Sat, 05
 Oct 2024 23:46:08 +0200
Message-ID: <68428f15-73ad-4d42-81ce-ed28f1387028@gmx.net>
Date: Sat, 5 Oct 2024 23:46:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: dwc2: Raspberry Pi 3 B Plus stuck in lx_state DWC2_L2 since Linux
 6.12-rc1
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Marek <tomas.marek@elrest.cz>, Shawn Shao
 <shawn.shao@jaguarmicro.com>, Douglas Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <a4cb3fe4-3d0f-4bf9-a2b1-7f422ba277c8@gmx.net>
 <2c9b6e0c-cb7d-4ab2-9d7a-e2f90e642bd1@gmx.net>
Content-Language: en-US
In-Reply-To: <2c9b6e0c-cb7d-4ab2-9d7a-e2f90e642bd1@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ocb+y5V8DcP3ifCnFTeGiuJGmtl3p/q/qEdpFr7JkhLyGIH4ymR
 d8FtLx1IQiYBHI2GMRyVHaG8uuIva9tUnzyRC5TcLvCyjwzsgF7wFxD+iVrXprGpOx22pg7
 tg4VyHCbDtKCmKhuswCftfve+uFGNvo61Yzan+AZ/3ju7G++1VzOYs3mMp2BiC3hwkryEVZ
 pEaBOsqY9gtPkrTDcQfig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MIga5Wr9F9c=;d4n3zIAHQneW1L1rWWY9V/9wZus
 +qUPrfOBNqrKiLVTc6wTDeLzGWIWKlyGz6cn5i5BlwLTWJQHcv30HHdBsm64S+uvo9u7kqOAl
 pcyu1uC4gYXBTFS4dn9QxakLECEnVJ0gwTYZpEi15tDreVM1YSGG1D/i8lnW5CGOLwbEhwFvz
 yS4H4LWFzXfIOP09yK585o5giSvDOSgGryOkN8Tug5HSn6HpKrCqIHTEFx8BxtgtJO/AlizXt
 EYGVrOVZ7iDsfHI+vLeMp4mQ6oGz9NoQa7urcWsEdCr/FQgmSg7V58aqI1EoG5VMFtk4eWt1N
 JEuPTvu2WFFmBQCHkPG+Fb99R7HlYbrZebP9NBUTdUrQ34LDNCtir3a0jX/zCJ44WXtqpguco
 JkfUuBQt84XAxmIyXQ8pbXFHj8tmnrjYtV021VBEe0elGueJZaAwHljZ5d/OPlDZ8WxynQKbG
 OXmCV69nl9Fx06NUQQzrltPTPvbO2UE/45hvvxHMTNgq1NtbDjCSfc1Bss2ul7R3oXZzEZv5D
 9d5l8w9iFdxxZke5yDnRwh2e7o1rPo2xP7biygKaZFpHoAReENYz0ay7TUvS4obx1YphX6F79
 MNboOWuPS16uVebdByCl7Pgf0gi1j9yisGiun18wagK7knl129vT9s/gqghUGTYAT/WSbYjUl
 +g7jX1VNY81kQAWsWEXPc4phm63StY07d8BhqyQtXDyi7W5FJOhWG4KEWXSWuWJranDTDS5Xb
 kvoT/JXgHC+TJK3K5FGLoVdb/SMZz3DuZVAbQrrikbT+9pqaWqbH6g9kd9FI0U4gqpo+T7P/B
 tnLVAr2tqZ5KfS8KuzkpFfYQ==

Am 03.10.24 um 13:21 schrieb Stefan Wahren:
> Maybe this is a relevant side node: in the bad case the onboard
> Ethernet chip LAN7800 is also not probed after startup (just root and
> the hubs). It looks like a race between LAN7800 enumeration and
> pm_runtime.
>
Okay, here are more information about this particular problem. This is a
dump of the runtime_status from all USB devices on DWC2 tree in bad case:

/sys/devices/platform/soc/3f980000.usb/usb1/ep_00/power/runtime_status:uns=
upported
/sys/devices/platform/soc/3f980000.usb/usb1/power/runtime_status:suspended
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/ep_00/power/runtime_status=
:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/power/runtime_status:suspe=
nded
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/ep_00/power/runtime_=
status:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/power/runtime_status=
:suspended
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1:1.0/1-1.1-port=
2/power/runtime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1:1.0/ep_81/powe=
r/runtime_status:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1:1.0/1-1.1-port=
3/power/runtime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.1/1-1.1:1.0/1-1.1-port=
1/power/runtime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/3f980000.usb:usb-port@1:us=
b-port@1/power/runtime_status:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1:1.0/1-1-port3/power/ru=
ntime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1:1.0/1-1-port1/power/ru=
ntime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1:1.0/ep_81/power/runtim=
e_status:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1:1.0/1-1-port4/power/ru=
ntime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-1/1-1:1.0/1-1-port2/power/ru=
ntime_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-0:1.0/usb1-port1/power/runti=
me_status:active
/sys/devices/platform/soc/3f980000.usb/usb1/1-0:1.0/ep_81/power/runtime_st=
atus:unsupported
/sys/devices/platform/soc/3f980000.usb/usb1/3f980000.usb:usb-port@1/power/=
runtime_status:unsupported
/sys/devices/platform/soc/3f980000.usb/power/runtime_status:unsupported

3 elements are suspended and if i do the following command the LAN7800
is probed and other USB interfaces are enumerated as expected:

echo on > /sys/devices/platform/soc/3f980000.usb/usb1/1-1/power/control

I don't understand what's the real problem here. Is it that the USB root
(DWC2) doesn't support runtime power management?

