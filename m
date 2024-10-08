Return-Path: <linux-usb+bounces-15878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A421F995833
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 22:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F2AD1F21E95
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 20:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AF5215004;
	Tue,  8 Oct 2024 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="QgN4srhA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512B213EFF
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418245; cv=none; b=st9ZbdsF9rQV41aNk5ppmGO5PtVoDFMiWtw0gGs4Ej/hddEE9/Pks18OBwMZst05i3JYLH0KnrCjILxfsIvQInT7XuMgp4gH/L7k+Jhn/DS3mAHnL1VcJ1W8Z20+XCilqwCfMVCSWuTQCGYFoZ49Hkf7oWqGpT6TEB2im2P6Ld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418245; c=relaxed/simple;
	bh=wPWy6AB6BqRQIOq7T/xwM/mO3B7Hm8hW2Pmc0xFKs44=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N3lfGvL/dmI3CPjlvOM+oVZVLNBn67kW+CQQO77YDSXkGTiwm7SXs23MXaTOPv6uHcg1XL2+XzBxRW2SJco8YJnjpUGu36g5WFkHo/MWJsKjM0HyTHUqcNz6apDbqsPfyWctZtBVS2RU1JMiR73Taaw6U+mCrONcnoRBPICK1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=QgN4srhA; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1728418222; x=1729023022; i=wahrenst@gmx.net;
	bh=wPWy6AB6BqRQIOq7T/xwM/mO3B7Hm8hW2Pmc0xFKs44=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QgN4srhAqdWyFISGR+p6TySEg0U4jYrGp2d5klkeUFUz3PuA9lmmE89ORCN705nS
	 vKhETboOkdN4T46mjQsyyWDy0j/7CJcu/6Svl5mB5P21Vo1LVVV+oD4PUIvnoxwkN
	 0YLDQK37IRPmMUyur55PXpzabHUPldxBBk7T7wW0EfA6xMKwuVYg30B4npb/Gcnuw
	 LU1A0PjwkDUo2a5JvaIBqXzWzrEoLlPbRk7mD5qdtIPullRmrqiks6bueHkmXJrLJ
	 vnV57r5FiF+fceEeVNLOTYTY1DaA5YyKJIoPbWfSZ3B3Pysr5TrFN8pBv29KKKp/Z
	 /Bpu5vyDOJq668a4Rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBDjA-1t8lRg0n5q-0098t3; Tue, 08
 Oct 2024 22:10:22 +0200
Message-ID: <324b1a66-714d-4bcb-87d7-ec45e86dd55a@gmx.net>
Date: Tue, 8 Oct 2024 22:10:18 +0200
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Tomas Marek <tomas.marek@elrest.cz>, Shawn Shao
 <shawn.shao@jaguarmicro.com>, Douglas Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Minas Harutyunyan <hminas@synopsys.com>
References: <a4cb3fe4-3d0f-4bf9-a2b1-7f422ba277c8@gmx.net>
 <2c9b6e0c-cb7d-4ab2-9d7a-e2f90e642bd1@gmx.net>
 <68428f15-73ad-4d42-81ce-ed28f1387028@gmx.net>
Content-Language: en-US
In-Reply-To: <68428f15-73ad-4d42-81ce-ed28f1387028@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oLyC/d38+xZhAPlTHoCSy+OM3atBOepMTvvoFIlhYYyp1rPZkBl
 KjadH2Tkdr86znSCj/z0B++1jt5OCwUVjSRd00Q5v4y7rSMOu26K/uY5koy3Pu/ggJSRkcx
 5yF6urhY1+KFRh1T2WpPihxSrh2C0BWx7gd6WiNflQ9uiD+QkTm2U1gl2iaQljdLRQKbmsk
 pdc3PsSjfImGBmeaay8wg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h7/slJIEthM=;8cFPALOVTpel83FWqjVFvF+abho
 Z9R1zQZ6CtT/Ak3eKiujV3XxhlRJT7cA+a73977etYq+lesVHpCF4Z7BpSdf1FqH7K2tFUrlP
 2sFicvoZbZt9avckHwoaiGXNiLN8tJdfSUhNC6f3FqMv6k6yQuuwOMpKEgZKk77wx+3PE43HQ
 6neL6vUWxigdtnMsXh2gP785TB/rG3bsBHcphNIAWEzAF7SJJkkHF0jB/Hf9JVYiNWHHKBp4A
 dZScpEnYQh9cjc3A510kMExQ5rrZ9998pny86Wz2Rbrk5+QSGNsSto4hHWQWKkksFQkilDCWw
 O8YgKUzh00sc8WN02j8UUD6cRqdMsHFcKYF9jr5QYUgNmOVElRjdSTgGbeicjT4vPP44HWBan
 vHkUB+7sGFuSC73KlXfnF+TyXQGs0QK+g5i1v2zGC88b18Ld/dWoTWQThi8kj/8tlQp2keuc5
 k1ZDyyGq+b4nA4EBve4Qtu5eZT3ZUjCEQ75Fvfi6U9tHo0X8SwWWl5U+l929Mi1Y03toJhueM
 bSfh9KvdrB2+lSOCI+01Wx88t8B/juzklzWo/p8FoIw85pPcIecb/AAd3Wu9woLQJqknIQpod
 c9r74R2TFjmo1PgDnpo32HH7/NYm6pWI7qrb5RE1hgp6hzJymR3vVSj9GmYVo7pyHbTNaR5+C
 jC8prUHiF5bDtDLXzA1bpgXDl/dttR20Fg5JCrHkvZCSvdr7claWCMe+sqzOFhro8fyQ3vnT1
 GJRQqRjEU7OAoI8q9cRfaG63q5NhhS1iG7XU3ne1BfM0VPlG1jrtuc9EzrXj/qiNTJaVU/CFp
 Vx5ZLYzgbsqI16YLQdSoWhJw==

Hi,

since Minas didn't replied to any of my last mails, i hope some of the
other USB guys can help here.

Am 05.10.24 um 23:46 schrieb Stefan Wahren:
> Am 03.10.24 um 13:21 schrieb Stefan Wahren:
>> Maybe this is a relevant side node: in the bad case the onboard
>> Ethernet chip LAN7800 is also not probed after startup (just root and
>> the hubs). It looks like a race between LAN7800 enumeration and
>> pm_runtime.
>>
>
Okay, now it's clear that the missing enumeration of Microchip LAN7800
is related to power management, i enabled DEBUG for drivers/usb/core/hub.c

This results in the following kernel log (bad case, LAN7800 never
enumerated):

[=C2=A0=C2=A0=C2=A0 2.344302] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.351797] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.409961] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 2.414821] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 2.422040] dwc2 3f980000.usb: irq 51, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 2.427698] usb usb1: udev 1, busnum 1, minor =3D 0
[=C2=A0=C2=A0=C2=A0 2.428501] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.432384] hub 1-0:1.0: 1 port detected
[=C2=A0=C2=A0=C2=A0 2.436401] hub 1-0:1.0: standalone hub
[=C2=A0=C2=A0=C2=A0 2.436415] hub 1-0:1.0: ganged power switching
[=C2=A0=C2=A0=C2=A0 2.436427] hub 1-0:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.436440] hub 1-0:1.0: Single TT
[=C2=A0=C2=A0=C2=A0 2.436453] hub 1-0:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.436469] hub 1-0:1.0: power on to power good time: 2m=
s
[=C2=A0=C2=A0=C2=A0 2.436536] hub 1-0:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.436662] usb usb1-port1: DeviceRemovable is changed t=
o 1 according
to platform information.
[=C2=A0=C2=A0=C2=A0 2.436681] hub 1-0:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.443963] usb usb1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 2.723887] usb 1-1: new high-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 2.920166] usb 1-1: udev 2, busnum 1, minor =3D 1
[=C2=A0=C2=A0=C2=A0 2.921003] hub 1-1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.924983] hub 1-1:1.0: 4 ports detected
[=C2=A0=C2=A0=C2=A0 2.929105] hub 1-1:1.0: compound device; port removable=
 status: FRRR
[=C2=A0=C2=A0=C2=A0 2.929120] hub 1-1:1.0: individual port power switching
[=C2=A0=C2=A0=C2=A0 2.929134] hub 1-1:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.929302] hub 1-1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 2.929317] hub 1-1:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.929334] hub 1-1:1.0: power on to power good time: 10=
0ms
[=C2=A0=C2=A0=C2=A0 2.929487] hub 1-1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.929922] hub 1-1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.930446] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 00=
02
[=C2=A0=C2=A0=C2=A0 2.930513] usb usb1-port1: enable change, status 000005=
03
[=C2=A0=C2=A0=C2=A0 3.031980] usb 1-1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 3.135941] hub 1-1:1.0: state 7 ports 4 chg 0002 evt 00=
00
[=C2=A0=C2=A0=C2=A0 3.136174] usb 1-1-port1: status 0101, change 0000, 12 =
Mb/s
[=C2=A0=C2=A0=C2=A0 3.207894] usb 1-1.1: new high-speed USB device number =
3 using dwc2
[=C2=A0=C2=A0=C2=A0 3.228029] usb 1-1-port1: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 3.316285] usb 1-1.1: udev 3, busnum 1, minor =3D 2
[=C2=A0=C2=A0=C2=A0 3.317234] hub 1-1.1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 3.321396] hub 1-1.1:1.0: 3 ports detected
[=C2=A0=C2=A0=C2=A0 3.325689] hub 1-1.1:1.0: compound device; port removab=
le status: FRR
[=C2=A0=C2=A0=C2=A0 3.325706] hub 1-1.1:1.0: individual port power switchi=
ng
[=C2=A0=C2=A0=C2=A0 3.325719] hub 1-1.1:1.0: individual port over-current =
protection
[=C2=A0=C2=A0=C2=A0 3.325983] hub 1-1.1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 3.325999] hub 1-1.1:1.0: TT requires at most 8 FS bit =
times (666 ns)
[=C2=A0=C2=A0=C2=A0 3.326017] hub 1-1.1:1.0: power on to power good time: =
100ms
[=C2=A0=C2=A0=C2=A0 3.326268] hub 1-1.1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 3.326577] hub 1-1.1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 3.430578] hub 1-1.1:1.0: state 7 ports 3 chg 0000 evt =
0000
[=C2=A0=C2=A0=C2=A0 3.430627] hub 1-1.1:1.0: hub_suspend
[=C2=A0=C2=A0=C2=A0 3.431012] usb 1-1.1: usb auto-suspend, wakeup 1
[=C2=A0=C2=A0=C2=A0 3.443902] hub 1-1:1.0: hub_suspend
[=C2=A0=C2=A0=C2=A0 3.444117] usb 1-1: usb auto-suspend, wakeup 1
[=C2=A0=C2=A0=C2=A0 3.460127] hub 1-0:1.0: hub_suspend

After that i connect a USB mouse and rebooted (good case, LAN7800
enumerate as dev 5):

[=C2=A0=C2=A0=C2=A0 2.354524] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.361984] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.420112] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 2.424969] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 2.432193] dwc2 3f980000.usb: irq 51, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 2.437851] usb usb1: udev 1, busnum 1, minor =3D 0
[=C2=A0=C2=A0=C2=A0 2.438669] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.442553] hub 1-0:1.0: 1 port detected
[=C2=A0=C2=A0=C2=A0 2.446570] hub 1-0:1.0: standalone hub
[=C2=A0=C2=A0=C2=A0 2.446584] hub 1-0:1.0: ganged power switching
[=C2=A0=C2=A0=C2=A0 2.446597] hub 1-0:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.446610] hub 1-0:1.0: Single TT
[=C2=A0=C2=A0=C2=A0 2.446623] hub 1-0:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.446639] hub 1-0:1.0: power on to power good time: 2m=
s
[=C2=A0=C2=A0=C2=A0 2.446706] hub 1-0:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.446861] usb usb1-port1: DeviceRemovable is changed t=
o 1 according
to platform information.
[=C2=A0=C2=A0=C2=A0 2.446880] hub 1-0:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.453091] usb usb1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 2.557069] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 00=
00
[=C2=A0=C2=A0=C2=A0 2.557170] usb usb1-port1: status 0101, change 0000, 12=
 Mb/s
[=C2=A0=C2=A0=C2=A0 2.733021] usb 1-1: new high-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 2.929282] usb 1-1: udev 2, busnum 1, minor =3D 1
[=C2=A0=C2=A0=C2=A0 2.930190] hub 1-1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.934181] hub 1-1:1.0: 4 ports detected
[=C2=A0=C2=A0=C2=A0 2.938311] hub 1-1:1.0: compound device; port removable=
 status: FRRR
[=C2=A0=C2=A0=C2=A0 2.938328] hub 1-1:1.0: individual port power switching
[=C2=A0=C2=A0=C2=A0 2.938341] hub 1-1:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.938538] hub 1-1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 2.938554] hub 1-1:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.938571] hub 1-1:1.0: power on to power good time: 10=
0ms
[=C2=A0=C2=A0=C2=A0 2.938725] hub 1-1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.939128] hub 1-1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.939621] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 00=
02
[=C2=A0=C2=A0=C2=A0 2.939709] usb usb1-port1: enable change, status 000005=
03
[=C2=A0=C2=A0=C2=A0 3.041138] usb 1-1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 3.041367] usb 1-1-port3: status 0301 change 0001
[=C2=A0=C2=A0=C2=A0 3.145072] hub 1-1:1.0: state 7 ports 4 chg 000a evt 00=
00
[=C2=A0=C2=A0=C2=A0 3.145310] usb 1-1-port1: status 0101, change 0000, 12 =
Mb/s
[=C2=A0=C2=A0=C2=A0 3.217022] usb 1-1.1: new high-speed USB device number =
3 using dwc2
[=C2=A0=C2=A0=C2=A0 3.237176] usb 1-1-port1: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 3.325425] usb 1-1.1: udev 3, busnum 1, minor =3D 2
[=C2=A0=C2=A0=C2=A0 3.326447] hub 1-1.1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 3.330665] hub 1-1.1:1.0: 3 ports detected
[=C2=A0=C2=A0=C2=A0 3.334953] hub 1-1.1:1.0: compound device; port removab=
le status: FRR
[=C2=A0=C2=A0=C2=A0 3.334968] hub 1-1.1:1.0: individual port power switchi=
ng
[=C2=A0=C2=A0=C2=A0 3.334982] hub 1-1.1:1.0: individual port over-current =
protection
[=C2=A0=C2=A0=C2=A0 3.335237] hub 1-1.1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 3.335253] hub 1-1.1:1.0: TT requires at most 8 FS bit =
times (666 ns)
[=C2=A0=C2=A0=C2=A0 3.335270] hub 1-1.1:1.0: power on to power good time: =
100ms
[=C2=A0=C2=A0=C2=A0 3.335533] hub 1-1.1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 3.335843] hub 1-1.1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 3.336658] usb 1-1-port3: status 0301, change 0000, 1.5=
 Mb/s
[=C2=A0=C2=A0=C2=A0 3.349213] usb 1-1-port3: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 3.421017] usb 1-1.3: new low-speed USB device number 4=
 using dwc2
[=C2=A0=C2=A0=C2=A0 3.437449] hub 1-1.1:1.0: state 7 ports 3 chg 0000 evt =
0000
[=C2=A0=C2=A0=C2=A0 3.440409] hub 1-1.1:1.0: hub_suspend
[=C2=A0=C2=A0=C2=A0 3.440766] usb 1-1.1: usb auto-suspend, wakeup 1
[=C2=A0=C2=A0=C2=A0 3.521800] usb 1-1.3: udev 4, busnum 1, minor =3D 3
[=C2=A0=C2=A0=C2=A0 3.526564] input: PixArt Microsoft USB Optical Mouse as
/devices/platform/soc/3f980000.usb/usb1/1-1/1-1.3/1-1.3:1.0/0003:045E:00CB=
.0001/input/input0
[=C2=A0=C2=A0=C2=A0 3.540708] hid-generic 0003:045E:00CB.0001: input: USB =
HID v1.11
Mouse [PixArt Microsoft USB Optical Mouse] on usb-3f980000.usb-1.3/input0
[=C2=A0=C2=A0=C2=A0 3.913456] hub 1-1:1.0: state 7 ports 4 chg 0000 evt 00=
02
[=C2=A0=C2=A0=C2=A0 3.929063] usb 1-1.1: usb wakeup-resume
[=C2=A0=C2=A0=C2=A0 3.945030] usb 1-1.1: Waited 0ms for CONNECT
[=C2=A0=C2=A0=C2=A0 3.945066] usb 1-1.1: finish resume
[=C2=A0=C2=A0=C2=A0 3.945405] hub 1-1.1:1.0: hub_resume
[=C2=A0=C2=A0=C2=A0 3.945533] usb 1-1.1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 4.053058] usb 1-1-port1: resume, status 0
[=C2=A0=C2=A0=C2=A0 4.053114] hub 1-1.1:1.0: state 7 ports 3 chg 0002 evt =
0000
[=C2=A0=C2=A0=C2=A0 4.053311] usb 1-1.1-port1: status 0101, change 0000, 1=
2 Mb/s
[=C2=A0=C2=A0=C2=A0 4.129033] usb 1-1.1.1: new high-speed USB device numbe=
r 5 using dwc2
[=C2=A0=C2=A0=C2=A0 4.149190] usb 1-1.1-port1: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 4.241681] usb 1-1.1.1: udev 5, busnum 1, minor =3D 4

Finally i applied the following hack and disconnect the mouse before
reboot (also good case, LAN7800 enumerate as dev 4)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 4b93c0bd1d4b..3111c0e60876 100644
=2D-- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5956,6 +5958,11 @@ static const struct usb_device_id hub_id_table[] =
=3D {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .idProduct =3D USB_PRODUCT_USB5534B,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .bInterfaceClass =3D USB_CLASS_HUB,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_info =3D HUB_QUIRK_DISABLE_A=
UTOSUSPEND},
+=C2=A0=C2=A0=C2=A0 { .match_flags =3D USB_DEVICE_ID_MATCH_VENDOR
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | USB_DEVICE_ID_MATCH_PRODUCT,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .idVendor =3D USB_VENDOR_SMSC,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .idProduct =3D 0x2514,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .driver_info =3D HUB_QUIRK_DISABLE_AUTOSUS=
PEND},
 =C2=A0=C2=A0=C2=A0=C2=A0 { .match_flags =3D USB_DEVICE_ID_MATCH_VENDOR
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | USB_DEVICE_ID_MATCH_PRODUCT,
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .idVendor =3D USB_VENDOR_CYPRESS,

[=C2=A0=C2=A0=C2=A0 2.350924] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.358389] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.416527] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 2.421366] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 2.428583] dwc2 3f980000.usb: irq 51, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 2.434245] usb usb1: udev 1, busnum 1, minor =3D 0
[=C2=A0=C2=A0=C2=A0 2.435011] hub 1-0:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.438893] hub 1-0:1.0: 1 port detected
[=C2=A0=C2=A0=C2=A0 2.442911] hub 1-0:1.0: standalone hub
[=C2=A0=C2=A0=C2=A0 2.442925] hub 1-0:1.0: ganged power switching
[=C2=A0=C2=A0=C2=A0 2.442938] hub 1-0:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.442950] hub 1-0:1.0: Single TT
[=C2=A0=C2=A0=C2=A0 2.442962] hub 1-0:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.442979] hub 1-0:1.0: power on to power good time: 2m=
s
[=C2=A0=C2=A0=C2=A0 2.443047] hub 1-0:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.443175] usb usb1-port1: DeviceRemovable is changed t=
o 1 according
to platform information.
[=C2=A0=C2=A0=C2=A0 2.443194] hub 1-0:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.449893] usb usb1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 2.553873] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 00=
00
[=C2=A0=C2=A0=C2=A0 2.553974] usb usb1-port1: status 0101, change 0000, 12=
 Mb/s
[=C2=A0=C2=A0=C2=A0 2.729813] usb 1-1: new high-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 2.926128] usb 1-1: udev 2, busnum 1, minor =3D 1
[=C2=A0=C2=A0=C2=A0 2.927003] hub 1-1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 2.930960] hub 1-1:1.0: 4 ports detected
[=C2=A0=C2=A0=C2=A0 2.935075] hub 1-1:1.0: compound device; port removable=
 status: FRRR
[=C2=A0=C2=A0=C2=A0 2.935093] hub 1-1:1.0: individual port power switching
[=C2=A0=C2=A0=C2=A0 2.935106] hub 1-1:1.0: individual port over-current pr=
otection
[=C2=A0=C2=A0=C2=A0 2.935307] hub 1-1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 2.935324] hub 1-1:1.0: TT requires at most 8 FS bit ti=
mes (666 ns)
[=C2=A0=C2=A0=C2=A0 2.935341] hub 1-1:1.0: power on to power good time: 10=
0ms
[=C2=A0=C2=A0=C2=A0 2.935494] hub 1-1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 2.935875] hub 1-1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 2.936328] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 00=
02
[=C2=A0=C2=A0=C2=A0 2.936412] usb usb1-port1: enable change, status 000005=
03
[=C2=A0=C2=A0=C2=A0 3.037922] usb 1-1-port1: status 0101 change 0001
[=C2=A0=C2=A0=C2=A0 3.141878] hub 1-1:1.0: state 7 ports 4 chg 0002 evt 00=
00
[=C2=A0=C2=A0=C2=A0 3.142017] usb 1-1-port1: status 0101, change 0000, 12 =
Mb/s
[=C2=A0=C2=A0=C2=A0 3.213812] usb 1-1.1: new high-speed USB device number =
3 using dwc2
[=C2=A0=C2=A0=C2=A0 3.233999] usb 1-1-port1: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 3.322291] usb 1-1.1: udev 3, busnum 1, minor =3D 2
[=C2=A0=C2=A0=C2=A0 3.323214] hub 1-1.1:1.0: USB hub found
[=C2=A0=C2=A0=C2=A0 3.327362] hub 1-1.1:1.0: 3 ports detected
[=C2=A0=C2=A0=C2=A0 3.331651] hub 1-1.1:1.0: compound device; port removab=
le status: FRR
[=C2=A0=C2=A0=C2=A0 3.331668] hub 1-1.1:1.0: individual port power switchi=
ng
[=C2=A0=C2=A0=C2=A0 3.331681] hub 1-1.1:1.0: individual port over-current =
protection
[=C2=A0=C2=A0=C2=A0 3.331947] hub 1-1.1:1.0: TT per port
[=C2=A0=C2=A0=C2=A0 3.331963] hub 1-1.1:1.0: TT requires at most 8 FS bit =
times (666 ns)
[=C2=A0=C2=A0=C2=A0 3.331980] hub 1-1.1:1.0: power on to power good time: =
100ms
[=C2=A0=C2=A0=C2=A0 3.332230] hub 1-1.1:1.0: local power source is good
[=C2=A0=C2=A0=C2=A0 3.332529] hub 1-1.1:1.0: enabling power on all ports
[=C2=A0=C2=A0=C2=A0 3.434279] hub 1-1.1:1.0: state 7 ports 3 chg 0000 evt =
0000
[=C2=A0=C2=A0=C2=A0 3.691359] hub 1-1.1:1.0: state 7 ports 3 chg 0000 evt =
0002
[=C2=A0=C2=A0=C2=A0 3.691728] usb 1-1.1-port1: status 0101, change 0001, 1=
2 Mb/s
[=C2=A0=C2=A0=C2=A0 3.818035] usb 1-1.1-port1: debounce total 100ms stable=
 100ms status
0x101
[=C2=A0=C2=A0=C2=A0 3.889848] usb 1-1.1.1: new high-speed USB device numbe=
r 4 using dwc2
[=C2=A0=C2=A0=C2=A0 3.910007] usb 1-1.1-port1: not reset yet, waiting 10ms
[=C2=A0=C2=A0=C2=A0 4.002506] usb 1-1.1.1: udev 4, busnum 1, minor =3D 3

Does the last log provide some useful information about the root cause
why the hubs are usually suspended before Microchip LAN7800 could be
enumerated?

Best regards

