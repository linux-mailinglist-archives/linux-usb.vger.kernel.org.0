Return-Path: <linux-usb+bounces-15584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F7989A83
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 08:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D9228318D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 06:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2409E14E2D6;
	Mon, 30 Sep 2024 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oWovJ70g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7348B23BE
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727677704; cv=none; b=INe1PxIwcw0r9mMlCGCI66ZBPYudLmMOY7a30V0A5I1p4USiv6864Dcan2me1M7KxZRmO/eovkaEKS11bHF1UNYQ8VJmsBoGCvm2bL1E9NfgvznPxyR8JYtLg9iDpxtz1Bu6lUkbNXkepnlPttUCskizcrJLH8OaHZUKuXjNZ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727677704; c=relaxed/simple;
	bh=28sCY7RXlzAHyYbzfzm/H79ON0URHufdO7m+fCIo5wY=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=n/BfORcmbKpe+xxFoQkMhmZdXNT55eKle56g+QqsV5H4+G42D/zZwe3h7o2vSe/EH9p8EsscYGiG+F0LKQf7j0udtP/L93bay1Rw5wOglCjRgzAd3NGu1p8Fgu51rnSQowuXCOlBUdXosHmOI6BoW52msXfpEqt7QLR696Eu2VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oWovJ70g; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1727677666; x=1728282466; i=wahrenst@gmx.net;
	bh=28sCY7RXlzAHyYbzfzm/H79ON0URHufdO7m+fCIo5wY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oWovJ70gYycAco81566qIMDwcp8+cBgtEhvx3PoXYYj0Tzk4IViAS6kStlFOFPlu
	 mV5E8KzENLgUUt18/vLpXwDGdBKdF28wcifBQRkBzePEqJe0btjwH/P78OQvyfF1z
	 c7/74O1nZWQ6HoC4izSYF5nhY+YZYhqJiAqVbG6/viYfDPXIqKrfVt8Xx5gXEUyS8
	 leM4mNJh5JGXxTc9Jcubq8C7M4YLI8NSuuE9454b9yn9D+9oSUxQFLF3NEUu7DNJs
	 bfW6jXiEVLNUBsnroPNunkXkZA+nm6VGqzJbDm2KVRRR9ZNpm1cCBojZ0dmwNbiPj
	 QW/Br0URuTGVSH/3ZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.104] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6siz-1rpum640sB-013FhK; Mon, 30
 Sep 2024 08:27:46 +0200
Message-ID: <a4cb3fe4-3d0f-4bf9-a2b1-7f422ba277c8@gmx.net>
Date: Mon, 30 Sep 2024 08:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Minas Harutyunyan <hminas@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Marek <tomas.marek@elrest.cz>, Shawn Shao
 <shawn.shao@jaguarmicro.com>, Douglas Anderson <dianders@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: dwc2: Raspberry Pi 3 B Plus stuck in lx_state DWC2_L2 since Linux
 6.12-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FC+CA9ZVJktszDMt9Wblneo49+nTATlps8D9MuzNQQZ/P6h+K4C
 THaCwWqajclYiZ+64QvCcUnlqhXOrylfm26sDzk5WhllQuaphL8sIWWnN6eHtiCdsHAkbMs
 JwvmtixOM+W39/DvH51yQCNvOdmtb/6cd9lPq8nbPPs24juawWkT+bMY6SGEb5B3CAMxzzC
 nb4e5npmIAGmQEesUKniA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8cQS5vT/ZE4=;2QUTgSnVG0X4Xg2zZKWwdnMOcWL
 fhr9yalZrqW6FpStPiFV9qOSCpT5C08LMdYevSPRcjPfK+idKzd2cRzust+mQUu4y3jPRmqI+
 AeU0zJAt3FvVRYZxk3F0a1s6rbfvEm+NZl3F4UY9I/rv1kKkV5KwbR65TYK0As3r7uaCGLLI9
 eHmrYwgFAvC53FGwtcmAMriFxyB+72fwSuhXc33jyha+6lIHe6pU5/TkdDDyibRUQNl0iqvDR
 /8E2PxwFkVnNLqzL5VGYweTqg6Ganpc2oyVql9bprFPolgJXqPnbkThRA7zW+nYunTYSrNeoZ
 Cn8m8V4Wg/YKKOwJFni8P+UO9bPXF+ABsYeD+xKR5GYDozHaVz5PJNBmHDeQAwcNAk+7ZhecG
 zlP+G3+U+1riEAQbk2/scBY0gFL62l9TRMZF/d7AMp2SuJUlF8xIxwwdPrexwRUaU9Hw1knL3
 ddu2UDMErDo5M/3jcRumZMD7CeD/M3LNqKABAPBc2EK+PolhGmZ3U2lk/cff7xQeYmuvhyHVu
 GNvRst7BQl9NxrZ7wbeanI7GRD3pt6VUJgnhnqmzzYMRf+JDX9e2HEVXq88QFIAtu2zg7/+h2
 THJcmQZikNM6lZEeOk0IlRT/bQjMfwFt9iGeSNnayEKm/HAenc/CK2l11J/+zfaK+dGgIaUxr
 TmRg3vOiWoBYhqDftQXFOz9FMlRcfwuT+XU8dMXa0YLESCtyBHnWaHSS4S7u3odBy2QB4yEL3
 xLeABNQvmkF8VWGSSxjBaMlaIY8ese4wQKyEEj+YR/vqwyeCkHP7vfRUB5+c2Kyw52Z7sTZPJ
 W8wCiWTJACy1n0qF/oJEFKew==

Hi,

recently i submitted the commit d483f034f032 ("usb: dwc2: Skip clock
gating on Broadcom SoCs") in order to fix an issue with suspend
handling. But this change reveals another issue at least on Raspberry Pi
3 B (arm64/defconfig) for the following scenario:

1. Power off and Disconnect all external USB from Raspberry Pi 3 B Plus
2. Power on Raspberry Pi
3. Wait until successfully booted
4. Connect USB devices like keyboard

The expected behavior would be that all devices are enumerated, but this
doesn't happend. Instead i observe that the DWC2 stays in lx_state
DWC2_L2 forever (bad case):

[=C2=A0=C2=A0=C2=A0 2.334366] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.341892] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.400027] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 2.404868] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 2.412087] dwc2 3f980000.usb: irq 51, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 2.711826] usb 1-1: new high-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 3.195838] usb 1-1.1: new high-speed USB device number =
3 using dwc2
[=C2=A0=C2=A0=C2=A0 3.435829] dwc2 3f980000.usb: dwc2_port_suspend
[=C2=A0=C2=A0=C2=A0 3.459914] dwc2 3f980000.usb: _dwc2_hcd_suspend
[=C2=A0=C2=A0=C2=A0 9.009743] dwc2 3f980000.usb: _dwc2_hcd_resume
[=C2=A0=C2=A0=C2=A0 9.030667] dwc2 3f980000.usb: dwc2_port_suspend
[=C2=A0=C2=A0=C2=A0 9.044137] dwc2 3f980000.usb: _dwc2_hcd_suspend
[=C2=A0=C2=A0=C2=A0 9.044222] dwc2 3f980000.usb: _dwc2_hcd_resume
[=C2=A0=C2=A0=C2=A0 9.354370] usb 1-1.1: new high-speed USB device number =
4 using dwc2
[=C2=A0=C2=A0=C2=A0 9.584095] dwc2 3f980000.usb: dwc2_port_suspend
[=C2=A0=C2=A0=C2=A0 9.599997] dwc2 3f980000.usb: _dwc2_hcd_suspend

The issue doesn't occur in case the devices are connected during boot
(good case):

[=C2=A0=C2=A0=C2=A0 2.339783] dwc2 3f980000.usb: supply vusb_d not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.347283] dwc2 3f980000.usb: supply vusb_a not found, =
using dummy
regulator
[=C2=A0=C2=A0=C2=A0 2.405479] dwc2 3f980000.usb: DWC OTG Controller
[=C2=A0=C2=A0=C2=A0 2.410329] dwc2 3f980000.usb: new USB bus registered, a=
ssigned bus
number 1
[=C2=A0=C2=A0=C2=A0 2.417546] dwc2 3f980000.usb: irq 51, io mem 0x3f980000
[=C2=A0=C2=A0=C2=A0 2.718563] usb 1-1: new high-speed USB device number 2 =
using dwc2
[=C2=A0=C2=A0=C2=A0 3.202560] usb 1-1.1: new high-speed USB device number =
3 using dwc2
[=C2=A0=C2=A0=C2=A0 3.518568] usb 1-1.3: new low-speed USB device number 4=
 using dwc2
[=C2=A0=C2=A0=C2=A0 3.722673] usb 1-1.1.2: new low-speed USB device number=
 5 using dwc2
[=C2=A0=C2=A0=C2=A0 4.086555] usb 1-1.1.1: new high-speed USB device numbe=
r 6 using dwc2
[=C2=A0=C2=A0=C2=A0 9.531834] dwc2 3f980000.usb: dwc2_port_suspend
[=C2=A0=C2=A0=C2=A0 9.546820] dwc2 3f980000.usb: _dwc2_hcd_suspend
[=C2=A0=C2=A0=C2=A0 9.547049] dwc2 3f980000.usb: _dwc2_hcd_resume
[=C2=A0=C2=A0=C2=A0 9.858583] usb 1-1.1: new high-speed USB device number =
7 using dwc2
[=C2=A0=C2=A0 10.030669] usb 1-1.3: new low-speed USB device number 8 usin=
g dwc2
[=C2=A0=C2=A0 10.234642] usb 1-1.1.2: new low-speed USB device number 9 us=
ing dwc2
[=C2=A0=C2=A0 10.643502] usb 1-1.1.1: new high-speed USB device number 10 =
using dwc2

Does anyone have an idea for investigation?

Best regards



