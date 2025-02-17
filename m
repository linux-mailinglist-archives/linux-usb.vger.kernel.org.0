Return-Path: <linux-usb+bounces-20721-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48FA384E7
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 14:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3791116C8C0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 13:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA1F21CC6F;
	Mon, 17 Feb 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="sKJKpTWF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD721CA0F
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 13:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799724; cv=none; b=Gl8tVWn5g11RmWEnXmY3JtBTV0JEBfL6qi8FUECeAn8W/OylqxbOrjezmy62nzFuApw6Er6y1J4qCCD8wWjf6/7PQOgZ3P90Zkn9rOZeEfCSkcbtUBT6FHsYPKseS4UD26yhjM+LBsxa9a/6t8lgOlsx308sPl9dSIukiaehRRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799724; c=relaxed/simple;
	bh=IvMTw8Bm0UQaioDvRA7NEQqJ7IGmXoVL6JYNK0fT5k8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S5xot3FSpe+avcpWNyi3HPe2qMl/9AGX1h5FTfCn1L+CrBhifOj1e1TDMameysKG0/y9PAw1oBgeKid7Zbee5d+nY2oop0WlsmivuXJ8GVSucfLZ7uMkEwK0/VbNHF8GJAkjntyJnVgiYIVScf8m4gARUpyvTamZgVCxrELKfDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=sKJKpTWF; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739799715; x=1740404515; i=wahrenst@gmx.net;
	bh=ksXilSpfUt3B+VZR+agmmrI764/uolVU4VhWitsUDBI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sKJKpTWFNFQn6ukHhIXrrs8KUtTtZp3kxnljaXqhwFg9NhimHkbRT2fbb2JFyFb1
	 CYetnBNtaA3TS2+bRPUK7cRlQj4A4L0yUfkycxGTLOsa76KIk955JstZeTwfv+xnt
	 RDuYN3lS0ytAHfrldaxNRHMcVNZpNpJEVOjxB5VsLqzGU/tmq81M6IlEfgi9ou/Bl
	 UQvdEds8ivtIVTXlD6GVpiZbZFC33Tjf448OmgQrEGt0LpuM6rV6odaUyhJ14dYSg
	 YJ558BYZwZFcby+WtFUaLQvT2ZHxxGU2s7ZGLBsy2Whf4QBDTFpamUn1Lk2VEVu/N
	 C4+pnUKi8oya5rUkKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqJmF-1swt7I0l87-00a3KX; Mon, 17
 Feb 2025 14:41:55 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-usb@vger.kernel.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V6 0/3] usb: dwc2: Implement S2Idle for BCM2835
Date: Mon, 17 Feb 2025 14:41:29 +0100
Message-Id: <20250217134132.36786-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PqpM4+389j8Ta9VZ+CZodDAYgqf8lGVAgJw9AqdwgscoVePzyMa
 iBRvvC+r17QO7IdSfllx/vf+2ZLT7w006bZAeaNBpP6UYXbcawaJ+fsu0ey+K3JqfW4+4FT
 PXz6JCigqQ4qSCa2aTxJZs+t4GF5Rdb+LQpG71dyrWx8dT69gkwdbCzsrDC9Vs3KewvmpDA
 xd8c4uHYDQqxO83/LWXeA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b7HBKn6JhGU=;Sg7av3lo/ThreqSEE1x0ioSS1oN
 COsrLDC2ToOXUSwfWHrLO1I/lLDklLLbPtoEsQfxxXR+Nvg9uIV0AY0F/FEg5YEfe/V3IZ9lh
 p1GRVD6X5+tsjelG57wsFPMsnimJWxsoaYZCe1sDdHKWVONfyt10vJWhM/X5yRzGP5q42c5gM
 VZz/Bo2+G2kAwOQwlG7IkDWKL+XG3kEq3HpQI1OTtJdxeXdYxvp6hY8XRj+fqVJDEV02Gpo7K
 oIDcylndjA+lrgaSso4fir0or4sOR4yeqlWatrw1pO//OIV3TLT6mfuXcs9E4alH5yKlQftJY
 jdYd5HSVnfRf6+/iZcthvruOq3ERW9F/KFs2uEPTwxalzqzNozNCecgnFKH94eljDm2Gx9sM+
 9XjLpiaRVZf8mZ0XUIISmdifiYvZrrExExBTV4iacK+tHeqs+/pH/vbhf1GjOA2K24LER0/ZK
 R3BoedwSDedniAnvmjIzShhDIklWIwgBikA0oTbuR2ZD6hVrTOZ1ym9kdncYIXmtwTotjrPX/
 +3WOyAfihiBZGWUBY/J8lIjsIeA6+n6Ct/tSuF02/5s3GGoW1WS/JGrDLQYbVJ0cnGiytnj+8
 JvIyE8f2kWafysgISXOqTVj7zbx8ayUDful5BwYO3VKtxIkEuGlTk9Uqp1QdEul0yxkWsWsYb
 /27GmLx/Pg+FoRAfT12fFwER7QAHz9x30LOm94iY9bWA+KXarxYvM06t5ETO6tL6mV1P5DBO7
 mD8Ml0/d8ckz4YdOW+1PoygJx0nx16npkgOwMeFBvhk0Ap6aNIdulhbn6p+33D2yocovVlyUB
 iCww4gmuaPTLdxC6pAqO7LEIJDBzuZWM1Q+w17mag8eq4yUBY7BFUe/sgiX7sdK3xYtSvYyyv
 1KxXcsVWd+zHkTl5w6VpYqDAnnCrmfrHjIewXIpaebD/4tPMaBO8hiBHP4b6Xla+4n+gLVTOD
 68OXzDS3zYyHsFh1DWABimSdo8j/rKAIKFIUGMA//U/iBfX4hYYV/7SrsYWrdLruqSgRtAC/v
 TtuWYQDL9An14G7m/M1BdIZmV2qjRrYdUfXEGk/PmUXXuIy9b5BTMdZd0e9MMA/8789qZgDtw
 qD2MUAyXTHv97neoHN4tT4A78sFB652tpGwIWJ6f526rpFPcsteQMAPa2izKGHPsrrU4OSiyT
 4vWZD7V+wZFeyWFlMPTqs8Oii25dhtgwDN+yandpm/iwH80sFSQMDR0tR0kSBUNKgag+A8g8X
 OEZdFuns54cYRtwBoz86I5D84roRkQDH/VobDejMQFc8BrFZ89VLeqNsIwMErZWhlOjPLWH2s
 4twksDcsERSIlVttORApnFEj8PXvVcRlpw6v/G+fqMQN+jkC2wjmmGTsF6+KtIqyThKm2V/uU
 LqfM5ZyPDf54kVJ7LO1B6o1YG0c1fVlSzWcs+2DgkQlFHhju91WMJJcRMa

This series implement S2Idle support for the BCM2835, which is mostly
used on the Raspberry Pi boards.

Test steps:
- configure debug console (pl011 or mini UART) as wakeup source
- send system to idle state

   echo freeze > /sys/power/state

- wakeup system by console traffic

The series based on an idea of Doug Anderson. The USB domain is now
powered down and the USB devices are still usable after resume.

Here are some figures for the Raspberry Pi 1 (without any
devices connected except of a debug UART):

running but CPU idle =3D 1.67 W
S2Idle               =3D 1.33 W

In comparison with HDMI & USB keyboard connected (but neither active
nor wakeup source):

running but CPU idle =3D 1.82 W
S2Idle               =3D 1.33 W

The series has been successfully tested on the following platforms:
Raspberry Pi 1 B
Raspberry Pi 3 B+

Changes in V6:
- adapt cover letter to focus on DWC2 (was ARM: bcm2835: Implement initial
  S2Idle for Raspberry Pi)
- drop already applied patches and bcm2835_defconfig changes
- rebase on Linux 6.14-rc1

Changes in V5:
- add missing version

Changes in V4:
- added Reviewed-by from Doug
- fix DWC2 register backup
- add revert because of Raspberry Pi 3B+ regression

Changes in V3:
- replace old USB recovery patch with canary approach [3], which should
  work with other platforms

V5: https://lore.kernel.org/linux-usb/20241025103621.4780-1-wahrenst@gmx.n=
et/

Stefan Wahren (3):
  usb: dwc2: gadget: Introduce register restore flags
  usb: dwc2: Refactor backup/restore of registers
  usb: dwc2: Implement recovery after PM domain off

 drivers/usb/dwc2/core.c     |   1 +
 drivers/usb/dwc2/core.h     |  23 ++++++-
 drivers/usb/dwc2/gadget.c   | 116 +++++++++++++++++++-----------------
 drivers/usb/dwc2/hcd.c      |  99 +++++++++++++++---------------
 drivers/usb/dwc2/platform.c |  38 ++++++++++++
 5 files changed, 171 insertions(+), 106 deletions(-)

=2D-
2.34.1


