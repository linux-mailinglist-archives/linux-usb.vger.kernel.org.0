Return-Path: <linux-usb+bounces-37259-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJEPFlTjAWoqmAEAu9opvQ
	(envelope-from <linux-usb+bounces-37259-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:10:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC4050FC66
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09F1E3011F5D
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADED3FB7D8;
	Mon, 11 May 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6s1o+Eo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D03F54AE
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507848; cv=none; b=RX4oFs9KRHiYoZZk4vPBY4SLA8tg7XwEjIq5y31ROOArn5+UMwd8jZFwX2ox+5KaahAvvqCFEmG+bseJfvvMmPxEwHW0TX+yehbbviH3Zb3ZIANk8oSJ0HW6g3yk3aTRr2UP2xlYNOKdrTwT0lahpKG1N1JGdNDAnF9mvjOY7DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507848; c=relaxed/simple;
	bh=kC4DSO7lEOOKLgNDNQTeigNoYcFvo7FOe74XyG/nGrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EXypnxsepe+vtfNDsSbOz+u5Pjsg0MMRXbSuplZcxy3zH+MztVa5grOzOPUiOHMm9bIH2tB1sNUGzSgQ8y2IJilXqvgT8J1B1h/Zcr8z48PP4l7IlnINTegvHPU6IBXoLpD54sIvQmBGCG1lErUk8v88NjvxN29snMme4whk0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6s1o+Eo; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so7059546a12.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507843; x=1779112643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKhdwsAy/86G+JOwXd2p+pdbXnbrja7bwh3PVXwh7m4=;
        b=O6s1o+EokPZ/vWnPsmsKyx5Ei9uZcDJWti+ZFv8hC+jHsWr6oAPXk0pIAR0Cqv8fDu
         Xy8CkOJJ30Mx1ekmPtxKUg28YkVeziO8oiMX1cH2iEsMAOdXbKVE1QC+ShJvh2MyHyoQ
         uuPgIU8AVRu0cNLHP9g3Gi6bkV3ZVIIOWN5vcKzQvxDofG/oXfh0H0NAB6RnQz8H8pTa
         +5ZGui77KCjsXMSqI4NYjoRgePzAwsJt6xWhVuiDAgm6R8XD5+YqdM3IIjbLF4OtbnnN
         IC13ErPxw0Ai3qnXNMwbDQ6G67Mlnz4Es9JHQHTLjJl43kEzW7ZYAF7pu9r4Vmq1pRF6
         I/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507843; x=1779112643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKhdwsAy/86G+JOwXd2p+pdbXnbrja7bwh3PVXwh7m4=;
        b=YOiSBu5++Np9DsPzZeQidEZDdedUb0ROuL3LihucFsPY4Zr3nWranOrEP09qUGE/kI
         nc6IXRTEHXqyybZf3YV/9T+USKeE3uKWh9nE2UzYtgIgOftNpINBgJ95MzXbvi7Qouzd
         pZr7OYAhFfeUqL61qf2eUsiOzStUbpcFKmXg3K9+0LFPCOtmIM6ZMecCvyV1SbiPp6Yc
         tG7z35IxYRvWdv73fvatyAomxL5z2qg1gehhtT9NXaAeo2sBQaYv1CYWurm9evfNRk2W
         lWnMrm4EY+kFjBXjrlbB7+jotlwrNZ7MoaCnKIyz84x+JodFsleYa+BYJVGgXkNBRwZl
         aWVA==
X-Forwarded-Encrypted: i=1; AFNElJ+wEXT3wrhGj2TiIoao89HdKTJIh0cCJiE2Ngc+2WlTqIn6ste+7n0przZ25JOR20vqTj6+SnBlGas=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywap+i2R0g7r6/aOgMumrRLe5730LfjK6ukbbDIixenDeqcgCMR
	QZZ25B2Wnp0FL4mriGt/xZTolGieKej5X4Hu7cla87yMkLV80T/Q+jgl
X-Gm-Gg: Acq92OGYolYd+YwjVv5Aw4rYFrtweE38b5vMcbVoKE+E1Eo9hrefphSBTwKKEimLvoU
	5hwhMvmv2VDHjW/iHh2Lq8mHtSdHm0M+Px957ON3DWW7MPH5pJhdfT5srt1S0PLVDX1CNY8PPFp
	FfkWwVLC969ur0fs9fpAZ1lTdbw9b2B+vVugrzcvv2PDkH9s98M5wSB7c4xCyhZEDlW995lrG1w
	H0XRwpYZOqADMltkwzKHdySZH4NAvdM7LqWeDjtwxexgx7lJO6DaHyDw4zqA0mDleaDIJk8h9KF
	PDSx42exiBW9i1xGYGf7C73cloCuYFyr7YhLvcBT9mAab4ZnROxxAvDHDEXCR7Ucipc84ya/hYt
	3KBonM7diwetk9lSSQMpTQb74GRtLVHe8sgYK2mb5IaRx+K6jHQGzJQaJb9hYdiLLJ8vHyn5pyr
	QE9I0HVLHPX1xp
X-Received: by 2002:a05:6402:278c:b0:67d:a63a:deb1 with SMTP id 4fb4d7f45d1cf-67da63adf40mr11744584a12.5.1778507842405;
        Mon, 11 May 2026 06:57:22 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
Date: Mon, 11 May 2026 16:56:55 +0300
Message-ID: <20260511135703.62470-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9AC4050FC66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37259-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,nvidia.com,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
for smartphones, data cards, and Machine-to-Machine (M2M) applications.

The modem is typically connected via the application processor's USB line
in HSIC mode. To function correctly, the modem must control this line, as
it requires precise timing to initiate or de-initialize the USB connection.
This control is necessary to successfully enumerate the next stage of the
USB device loader (moving from firmware loading to the actual device
interface for example).

Patches 1 and 2 adjust the Tegra-specific portion of the Chipidea USB
controller to allow for the disabling of automatic PHY and USB controller
registration. This is achieved by adding the nvidia,external-control
property/flag. It does not affect any existing configurations, but it
allows the USB line to be registered or deregistered by an external
device — in this case, the modem.

Patches 3 and 4 add support for the generic portion of the
Infineon XMM6260 baseband modem, which was used in many Tegra-, OMAP-,
and Exynos-based devices circa 2012. This driver provides power sequences,
manages initial communication with the application processor, handles the
SoC-specific modem PHY, and verifies that the modem USB device appears
correctly.

Patches 5 and 6 implement support for the Tegra-specific modem physical
layer, which handles the registration and unregistration of the USB
controller.

While current support is relatively basic, this configuration already
allows the modem device to appear in the dmesg of my device
(LG Optimus Vu (P895)):

[    9.427014] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    9.431488] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    9.457197] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    9.460370] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.16
[    9.468470] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.475597] usb usb1: Product: EHCI Host Controller
[    9.480508] usb usb1: Manufacturer: Linux 6.16.0+ ehci_hcd
[    9.485913] usb usb1: SerialNumber: ci_hdrc.1
[    9.490862] hub 1-0:1.0: USB hub found
[    9.494005] hub 1-0:1.0: 1 port detected
[    9.657191] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    9.844726] usb 1-1: New USB device found, idVendor=1519, idProduct=0020, bcdDevice=12.74
[    9.850530] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    9.857594] usb 1-1: Product: HSIC Device
[    9.861606] usb 1-1: Manufacturer: Comneon
[    9.865627] usb 1-1: SerialNumber: 0123456789
[    9.908739] cdc_acm 1-1:1.0: ttyACM0: USB ACM device

Svyatoslav Ryhel (6):
  dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
    property
  usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
    controlled
  dt-bindings: net: Document Infineon/Intel XMM6260 modem
  net: usb: Add Infineon XMM6260 Baseband modem support
  dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
  phy: tegra: Add support for Nvidia Tegra XMM6260 PHY

 .../bindings/net/infineon,xmm6260.yaml        |  72 ++++
 .../bindings/phy/nvidia,tegra-xmm6260.yaml    |  58 +++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |   7 +
 drivers/net/usb/Kconfig                       |  15 +
 drivers/net/usb/Makefile                      |   1 +
 drivers/net/usb/baseband-xmm6260.c            | 335 ++++++++++++++++++
 drivers/phy/tegra/Kconfig                     |  12 +
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/phy-tegra-xmm6260.c         | 144 ++++++++
 drivers/usb/chipidea/ci_hdrc_tegra.c          |  36 +-
 10 files changed, 667 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
 create mode 100644 drivers/net/usb/baseband-xmm6260.c
 create mode 100644 drivers/phy/tegra/phy-tegra-xmm6260.c

-- 
2.51.0


