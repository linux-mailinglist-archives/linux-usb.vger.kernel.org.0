Return-Path: <linux-usb+bounces-11553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871D9133F0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 14:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB920B23281
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8808016D4D7;
	Sat, 22 Jun 2024 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="oxrD0x+6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564C915217E
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719059037; cv=none; b=LSNxyxmDqKD3cnp0Zkjo6rszfkmLpp5tZaa13TckNYfw8ijS3LF67yU7QFc+yJkjOkSB7FOBSdr4LXYsFKMwtJDtPV0pHB4Z12iKaDqtKt4hvE3l9sXEjgxrToZIfISkwjrtY11czG/zhRXKfuyQwnr5OCsBYHQ3rwlISkKQWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719059037; c=relaxed/simple;
	bh=8i9bK6Sz84PvKUMtsR28QczX/wh+Rndor401qvy0tsA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BgA/MrXyyU19ghszBDRUGczirVzI4W2KLOZbY1pq9YapPNqYCKCT+Q11jnB70dhSXmWor3XPptuK5lpnx5bvsknZaqG9DbYxyYaO5rSBXy8n+WH/4tcLm+wWRzNzQh7/Jyyv1B4UUecdoaXfXeRvWEuCaQ4xrdTGbtlz8DJacYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=oxrD0x+6; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719059015; x=1719663815; i=wahrenst@gmx.net;
	bh=8i9bK6Sz84PvKUMtsR28QczX/wh+Rndor401qvy0tsA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oxrD0x+6CALuffHo1l+ccuk4cH46ezHLTAgiNzFu06nuwZDedRSudVpm+6IQ7NGi
	 3GHjkbuQn063+3R+9uo9lC3Re/WgiHlHOXyS0dYua9Z1uY2OoaGo9sG36iX1Ez6hN
	 osrSmuVQCrYFowBbtPYvVxR4Y9/7EuJR2VWbluGNBd/4kYvoC/MuNo894z2kTVsXr
	 WfBfdyHmMWEVu9ajSX/7y/0gxrRbvGruIFahCHdxbfOWJK/p7NaCOyJ9AgDUyMowP
	 6C/vSk30OYK17r5C+13BPuLhu2ALL56uXGHpmFV9zaFdmSW4LNZMJfsInY2KTFWo3
	 FqsfFIH4qTed9dtwhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Nv-1spwwx3mKH-00fbbi; Sat, 22
 Jun 2024 14:23:34 +0200
Message-ID: <2bcf7fac-8e8f-4d7a-a837-08805a0076e3@gmx.net>
Date: Sat, 22 Jun 2024 14:23:33 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Subject: dwc2: irq 66: nobody cared triggered on resume
To: Minas Harutyunyan <hminas@synopsys.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Marc Zyngier <maz@kernel.org>,
 Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6ox4TRHivnogMCDpukxMw969HEup5rGLYv+krcvrv0ZemaDa/sb
 s/37R0Zk1cosKKnIn3wUIRkgsfaMO/hd483sQy4PNAtm8efYX5nS60OLmJyYjvLB6D5jkud
 gZaFd1U2Phmh0IQWJsIwGpzrKJOTr0U+qsisKaEvPQ0DdFePFWaGUfwKxYl/EvODv2uEMtZ
 jn7vc7jKUCL31kMIwPQbw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kbBnIHuFhao=;aX0SWHJ3Cf4tlbFFFqaMjqQRAcw
 94lHgSlDU1xh51vf3FcyFDl+LSoh3oCothU5EQMkr7eoz0HU4sLGry2OsFztFxnAm+4TVbu+L
 eDA80Q6aw3abwSOCTqEuMeHvW1WNVieiD3ummHrrBjeziQuYDdmWkJJpC+DMb3CuymDaf8nuN
 sYKBVvhbsdLdYzwkoG903os5zWLtfK06yKI4xNxOL2vHBr26chE0NqAyjk+OO60lZHv58D1Gz
 pj3FTbtOk8c8zkki7BSiGVllhAJkDN0fnvuIslt3LRm1v1owofaodpYdPsRolARZsT53iv8Gk
 4i5sF1TCUduGieEqB4NDxa0PrXyW3oi3qsZAdsUQfk+1o4A9VSireMqS7oHNam4UyykmnR6pF
 mqhrRPC+YXuKWzi2mcFlS5uZWizuc7HB9i3LuzAEDywcA2mNxKW9gJputxX5BFU9OQYPRcEu6
 tS1nK7AAlkVP+NRxY3Z9q3ZlukoYBNsiEQX8uZGu2jsaUm3xTslCjJP1IIGra4gdmILsJ37JZ
 rjIECz9VcBSCe5BMnT0tjBccFAwsSe3brhK/VX8SEyXxgqg/tyTOOZ7OGaMutXKSpVzYsQIth
 iaxn4wjVKPtiqksaeWxC/j2uREG1m2QlOpLNaJTN3mA2tXfvssex1dszWMsUWCu15lRnSw3+5
 DnFVg8R4BpPZfHiHtS0YSlXPMsT4ojruIINe1n84vv7jIvwW0vclmcZm/DM/0PWbYJTWwl1aP
 /UhndeM1+IRO8ojaliTu+tRqlU07vDnirSJeIXtAGm0OFUMvwRHNjS5flFBmJpIEqrwy7rngl
 EYxv+/nONY+zOcreS2xs+/WaSEI8lsoygPSQ8VOvymOek=

Hi,

i currently experiment with suspend to idle on the Raspberry Pi 3 A+.
Supend & resume works expected as long as no USB device is connected to
the board. If i connect a USB hub to the Pi, the resume phase is
significantly delayed and the kernel disabled IRQ 66 which belongs to DWC2=
.

Here are the steps to trigger this issue:
- build kernel with multi_v7_defconfig
- make sure necessary kernel options are enabled ( CONFIG_PM_DEBUG,
CONFIG_PM_ADVANCED_DEBUG )
- make sure a USB hub is connected to Raspberry Pi 3 A Plus
- Add "no_console_suspend" to cmdline.txt and reboot
- Connect via Debug UART:

echo 1 > /sys/power/pm_debug_messages
echo platform > /sys/power/pm_test
echo freeze > /sys/power/state

Here is the relevant kernel log:

[ 1108.402522] usb 1-1: new high-speed USB device number 2 using dwc2
[ 1108.655864] hub 1-1:1.0: USB hub found
[ 1108.656029] hub 1-1:1.0: 4 ports detected
[ 1117.932573] rpi_firmware_set_power: Set HDMI to 1
[ 1117.932709] rpi_firmware_set_power: Set HDMI to 0
[ 1123.282825] PM: suspend entry (s2idle)
[ 1124.429959] Filesystems sync: 1.147 seconds
[ 1124.442720] Freezing user space processes
[ 1124.444205] Freezing user space processes completed (elapsed 0.001
seconds)
[ 1124.444227] OOM killer disabled.
[ 1124.444236] Freezing remaining freezable tasks
[ 1124.445409] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
[ 1125.487258] ieee80211 phy1: brcmf_fil_cmd_data: bus is down. we have
nothing to do.
[ 1125.487284] ieee80211 phy1: brcmf_cfg80211_get_tx_power: error (-5)
[ 1126.105119] PM: suspend of devices complete after 1658.658 msecs
[ 1126.105147] PM: start suspend of devices complete after 1659.719 msecs
[ 1126.106814] PM: late suspend of devices complete after 1.650 msecs
[ 1126.107207] rpi_firmware_set_power: Set VEC to 0
[ 1126.107279] rpi_firmware_set_power: Set V3D to 0
[ 1126.108303] PM: noirq suspend of devices complete after 1.340 msecs
[ 1126.108321] PM: suspend debug: Waiting for 5 second(s).
[ 1131.109573] rpi_firmware_set_power: Set V3D to 1
[ 1131.109636] rpi_firmware_set_power: Set HDMI to 1
[ 1131.109692] rpi_firmware_set_power: Set VEC to 1
[ 1131.109745] rpi_firmware_set_power: Set USB to 1
[ 1131.109996] PM: noirq resume of devices complete after 1.273 msecs
[ 1131.111208] PM: early resume of devices complete after 1.051 msecs
[ 1131.230277] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac43455-sdio for chip BCM4345/6
[ 1131.458687] irq 66: nobody cared (try booting with the "irqpoll" option=
)
[ 1131.458714] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G W=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
6.10.0-rc3-g7fd4227d1bd5-dirty #49
[ 1131.458734] Hardware name: BCM2835
[ 1131.458744] Call trace:
[ 1131.458757]=C2=A0 unwind_backtrace from show_stack+0x10/0x14
[ 1131.458796]=C2=A0 show_stack from dump_stack_lvl+0x50/0x64
[ 1131.458822]=C2=A0 dump_stack_lvl from __report_bad_irq+0x38/0xc0
[ 1131.458848]=C2=A0 __report_bad_irq from note_interrupt+0x2ac/0x2f4
[ 1131.458877]=C2=A0 note_interrupt from handle_irq_event+0x88/0x8c
[ 1131.458900]=C2=A0 handle_irq_event from handle_level_irq+0xb4/0x1ac
[ 1131.458923]=C2=A0 handle_level_irq from generic_handle_domain_irq+0x24/=
0x34
[ 1131.458957]=C2=A0 generic_handle_domain_irq from
bcm2836_chained_handle_irq+0x24/0x28
[ 1131.458992]=C2=A0 bcm2836_chained_handle_irq from
generic_handle_domain_irq+0x24/0x34
[ 1131.459024]=C2=A0 generic_handle_domain_irq from
generic_handle_arch_irq+0x34/0x44
[ 1131.459056]=C2=A0 generic_handle_arch_irq from __irq_svc+0x88/0xb0
[ 1131.459079] Exception stack(0xc1b01f20 to 0xc1b01f68)
[ 1131.459100] 1f20: 0005c0d4 00000001 00000000 00000000 c1b09780
c1d6b32c c1b04e54 c1a5eae8
[ 1131.459118] 1f40: c1b04e90 00000000 00000000 00000000 c1d6a8a0
c1b01f70 c11d2da8 c11d4160
[ 1131.459130] 1f60: 60000013 ffffffff
[ 1131.459142]=C2=A0 __irq_svc from default_idle_call+0x1c/0xb0
[ 1131.459167]=C2=A0 default_idle_call from do_idle+0x21c/0x284
[ 1131.459202]=C2=A0 do_idle from cpu_startup_entry+0x28/0x2c
[ 1131.459239]=C2=A0 cpu_startup_entry from kernel_init+0x0/0x12c
[ 1131.459271] handlers:
[ 1131.459279] [<f539e0f4>] dwc2_handle_common_intr
[ 1131.459308] [<75cd278b>] usb_hcd_irq
[ 1131.459329] Disabling IRQ #66
[ 1131.487617] brcmfmac: brcmf_c_process_txcap_blob: no txcap_blob
available (err=3D-2)
[ 1131.488107] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
Nov=C2=A0 1 2021 00:37:25 version 7.45.241 (1a2f2fa CY) FWID 01-703fd60
[ 1136.552601] usb 1-1: reset high-speed USB device number 2 using dwc2
[ 1141.832522] usb 1-1: device descriptor read/64, error -110
[ 1157.272527] usb 1-1: device descriptor read/64, error -110
[ 1157.612516] usb 1-1: reset high-speed USB device number 2 using dwc2
[ 1162.872518] usb 1-1: device descriptor read/64, error -110
[ 1178.312517] usb 1-1: device descriptor read/64, error -110
[ 1178.652516] usb 1-1: reset high-speed USB device number 2 using dwc2
[ 1189.192506] usb 1-1: device not accepting address 2, error -110
[ 1189.412512] usb 1-1: reset high-speed USB device number 2 using dwc2
[ 1199.992511] usb 1-1: device not accepting address 2, error -110
[ 1199.992768] PM: resume of devices complete after 68881.537 msecs
[ 1199.994145] OOM killer enabled.
[ 1199.994155] Restarting tasks ...
[ 1199.994833] rpi_firmware_set_power: Set HDMI to 0
[ 1199.994892] usb 1-1: USB disconnect, device number 2
[ 1199.996456] done.
[ 1199.996518] random: crng reseeded on system resumption
[ 1200.014632] PM: suspend exit

An ideas what causing this issue?


