Return-Path: <linux-usb+bounces-28159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F124B59B71
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 17:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96757526980
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C782D73A6;
	Tue, 16 Sep 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxIhjYTM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C19307AF5
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034983; cv=none; b=EiIcF9XsBaG/SbGySySMqnnksguXMX1WhDJyxcW7yGwsRIT9dAZTA0u8Cz9o6L1hSpTJATqCkgemoADJBaETbRCycW6CnK+XKsKEpWtCB/ddalfX2XkAhnjXIPRi9qSEJxFVEdFvj76t2jzv+cx8d3b+aZRE2omLNewVCo614Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034983; c=relaxed/simple;
	bh=q+Pk+Q6rv6DpDXCQuOBOKOpK1ZLg4Cz5C74JWjudbjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZW/qKgJwKuOkRHsncA2hLXj+fb9serknXQtCD2r8ol2h+C9w/h+xOopmsjdvcoH1381/jhrfLo/oovZERdgwSTZSSDy0SiAqQmgnN9JmKmkJCb9D5T3pu/UpniSun0AS7fJAp7YsHHIVyo46NqSEoC8sKhufcAGQ44WuzXxIANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxIhjYTM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e7636aa65fso5049165f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034979; x=1758639779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHTUiWhUtK8pTHI8ct46YFhk9JnDX+h/5/AhlzM+H8E=;
        b=fxIhjYTMnEzi3zaqOj/t2TkrWOqdTnlbhAgO70U4xqIr5V19KAFbpGH93BWicGuk18
         E00pEaf3QzHjvKsH7cjOYC3ZUMH2tWqBlijxrieAGeA50zHjfQS4jD9ZPouiblloGjja
         DzKrdOYzNzU+i1c5vvrQpJJrfG/ZyJLWvzTuKnG22EUKsbgqFapO9AWxbEFoG7C5WDRe
         Pd4JCZZ9qYhLW6UjU39wdhTlia1m7FHqwhWfDxFDoFKWLnzYR/rBoG+5TvgFcrKtTkLD
         ToeTJr4T8KBwbXxDgIZ4VCn5vWcHKfhPdGfZWlkfAnyc7WsEjL7F1EImnAPen/RZUIBT
         0sYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034979; x=1758639779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHTUiWhUtK8pTHI8ct46YFhk9JnDX+h/5/AhlzM+H8E=;
        b=YyUOmrmk0h9l4r78VYJbC1VAfJYDtDItuyicUiHLFk25VWHPwEs9hb7kEQ9j4FzPMC
         1vkYR3ovqRnHoQlZoLkoi13JnMzcjUBLdmeobdi3TxcHKLS8OzpQ+F6GfCa/zvWYcYQF
         +l+uXuVjwO8VsTOACrpYgCAlrrlvZOlXh2VJubF0ooRuxJMgodyIH0UnCbXNwU8A75zK
         cQD8FdunIZNDiXXf9nzxV+5gbfzPKvACvMXedC/f3IpPQrmjyen2P9i00sp5ZvAsdUfU
         WguJGPrLX2WmdU47iL3njj0kBwOgsUakTNlaze2SuRggqzVhWJgZTBfvvvesPAZFqWKE
         jnaw==
X-Forwarded-Encrypted: i=1; AJvYcCVUY2y4kvuF7NiJtVfHE5QxVRmBmkdEllvntUQ7DQAzUlB+trqQe7dof9n49ypCL9a2GvOLUtfr8pI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDQvbsfg1DQYta0T7NC+RxtOquiiYMdcwItOyr9YyGs5X0Y8FU
	N6lIuAFGZu80OwDEKZ+vJqiJZY1zOVd0G5JooY7F+MwhZYtWDJTWvCiH
X-Gm-Gg: ASbGncvg+lAYLFmjFNKbSg1xQekb7g3bLYT8jzUzRZ5f1noANUy8j1Z8J9VUpaPHWuQ
	7NoZr3qv1h//4CyluMaLcMI71LN+RM2RAcebbTf/JatSvNTtfHJecj/t38/XbC6VavI7jgye/gu
	7SD9weaCTqBcYnGENaOJS4Q5RrkbnInlZ1U1obPKTcbB96cb5vqVGjBP+Jwz+WaoaNDdenxO6oV
	O0QlE8uFFPIdAnfgzEob2GmJjcTPAzWtSufrLvoDC0gUeGeivZ6ssX+7hiCVOZxL+gOxdBz9Gcs
	B0RpppFvwu84pMhwIlFkGNW8jqFfnvN4hXBwGrRXt4aJ17JD9nLZXLW7DfDybDdypjYeN/Se4aw
	dFiLcys7RRosVQsieBwnVGyxHj5lBq7nXprCkDJMe63PDH+bvSWBLA7hBpM4H8Y/qJJFvgnxCJg
	IyWQ==
X-Google-Smtp-Source: AGHT+IHLQiq6Ya6CNscfFEjZEvD6KmKZnLRsoKqMm1MOtE4+rnBEKT0hP0h7Er+bVJT9S1ifCBeLwA==
X-Received: by 2002:a05:6000:430e:b0:3e9:86f1:52f3 with SMTP id ffacd0b85a97d-3e986f1667dmr8919793f8f.35.1758034978493;
        Tue, 16 Sep 2025 08:02:58 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:02:58 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/9] Add RZ/G3E USB3.2 Gen1 Host Controller support
Date: Tue, 16 Sep 2025 16:02:36 +0100
Message-ID: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E USB3.2 Gen1 Host Controller and PHY support. The USB3HOST
is compliant with the Universal Serial Bus 3.2 Specification Revision 1.0.
 - Supports 1 downstream USB receptacles
     - Number of SSP Gen2 or SS ports: 1
     - Number of HS or FS or LS ports: 1
 - Supports Super Speed Plus Gen2x1 (10 Gbps), Super Speed (5 Gbps),
   High Speed (480 Mbps), Full Speed (12Mbps), and Low Speed (1.5 Mbps).
 - Supports all transfer-types: Control, Bulk, Interrupt, Isochronous, and
   these split-transactions.
 - Supports Power Control and Over Current Detection.

Merge strategy:
 Patch #1-#2: PHY subsystem
 Patch #3-#6: USB subsystem
 Patch #7-#9: SoC/DT subsystem

v2->v3:
 * Dropped clock patches #1 and #2 from this series as it is accepted.
 * Replaced devm_reset_control_get_{shared}->{shared_deasserted} in phy
   driver
 * Dropped remove() callback from phy driver
 * Added Rb tag from Rob for USB3 host binding patch

v1->v2:
 * Collected tags.
 * Replaced usb30->usb3_0 for clocks and resets.
 * Replaced magic numbers with macros iphy driver.
 * Added ref to usb-xhci.yaml in USB3 binding patch.

 Logs:
root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
131:          0          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~# [   29.148305] PM: suspend entry (deep)
[   29.152121] Filesystems sync: 0.000 seconds
[   29.157698] Freezing user space processes
[   29.163594] Freezing user space processes completed (elapsed 0.001 seconds)
[   29.170591] OOM killer disabled.
[   29.173827] Freezing remaining freezable tasks
[   29.179559] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   29.186946] printk: Suspending console(s) (use no_console_suspend to debug)
NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-169-g1410189b0
NOTICE:  BL2: Built : 12:53:12, Jul 15 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   29.219734] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[   29.286013] renesas-gbeth 15c30000.ethernet end0: Link is Down
[   29.299538] Disabling non-boot CPUs ...
[   29.303577] psci: CPU3 killed (polled 4 ms)
[   29.311334] psci: CPU2 killed (polled 0 ms)
[   29.318406] psci: CPU1 killed (polled 0 ms)
[   29.323605] Enabling non-boot CPUs ...
[   29.323818] Detected VIPT I-cache on CPU1
[   29.323865] GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
[   29.323903] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   29.324761] CPU1 is up
[   29.324861] Detected VIPT I-cache on CPU2
[   29.324883] GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
[   29.324904] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   29.325495] CPU2 is up
[   29.325597] Detected VIPT I-cache on CPU3
[   29.325620] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
[   29.325641] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   29.326324] CPU3 is up
[   29.351355] dwmac4: Master AXI performs any burst length
[   29.352252] renesas-gbeth 15c30000.ethernet end0: No Safety Features support found
[   29.354015] renesas-gbeth 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
[   29.355802] renesas-gbeth 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
[   29.373186] dwmac4: Master AXI performs any burst length
[   29.374076] renesas-gbeth 15c40000.ethernet end1: No Safety Features support found
[   29.375796] renesas-gbeth 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
[   29.377581] renesas-gbeth 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
[   29.424034] usb usb1: root hub lost power or was reset
[   29.424043] usb usb2: root hub lost power or was reset
[   31.583523] usb 2-1: reset SuperSpeed Plus Gen 2x1 USB device number 2 using xhci-renesas-hcd
[   31.770398] OOM killer enabled.
[   31.773535] Restarting tasks: Starting

[   31.778136] Restarting tasks: Done
[   31.781617] random: crng reseeded on system resumption
[   31.786887] PM: suspend exit
root@smarc-rzg3e:~# [   32.135468] renesas-gbeth 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx

root@smarc-rzg3e:~# cat /proc/interrupts | grep SLEEP
131:          1          0          0          0 rzv2h-icu   0 Edge      SLEEP
root@smarc-rzg3e:~# 
root@smarc-rzg3e:~# cd /cip-test-scripts/py/
root@smarc-rzg3e:/cip-test-scripts/py# ./run_pytests.sh tests/test_xhci.py -k test_xhci_005
INFO     root:spl2_test_helpers.py:2261 DD performance with bs=32M count=32 is
Write= 401 MB/s
Read= 605 MB/s

INFO     root:spl2_test_helpers.py:2301 fio performance with bs=32m for Sequential and bs=4m for random access are

INFO     root:spl2_test_helpers.py:2306 b'   READ: bw=617MiB/s (647MB/s), 617MiB/s-617MiB/s (647MB/s-647MB/s), io=5024MiB (5268MB), run=8146-8146msec'
INFO     root:spl2_test_helpers.py:2306 b'  WRITE: bw=575MiB/s (603MB/s), 575MiB/s-575MiB/s (603MB/s-603MB/s), io=5024MiB (5268MB), run=8743-8743msec'
INFO     root:spl2_test_helpers.py:2306 b'   READ: bw=583MiB/s (612MB/s), 583MiB/s-583MiB/s (612MB/s-612MB/s), io=5000MiB (5243MB), run=8572-8572msec'
INFO     root:spl2_test_helpers.py:2306 b'  WRITE: bw=525MiB/s (550MB/s), 525MiB/s-525MiB/s (550MB/s-550MB/s), io=5000MiB (5243MB), run=9528-9528msec'


Biju Das (9):
  dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
  phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
  dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
  usb: host: xhci-rcar: Move R-Car reg definitions
  usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
  usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support
  arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
  arm64: defconfig: Enable RZ/G3E USB3 PHY driver

 .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  |  63 +++++
 .../bindings/usb/renesas,rzg3e-xhci.yaml      |  87 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  30 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  10 +
 .../boot/dts/renesas/renesas-smarc2.dtsi      |   8 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rzg3e-usb3.c          | 259 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   2 +-
 drivers/usb/host/xhci-plat.c                  |  14 +
 drivers/usb/host/xhci-plat.h                  |   1 +
 drivers/usb/host/xhci-rcar-regs.h             |  49 ++++
 drivers/usb/host/xhci-rcar.c                  | 100 ++++---
 drivers/usb/host/xhci-rzg3e-regs.h            |  12 +
 15 files changed, 599 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c
 create mode 100644 drivers/usb/host/xhci-rcar-regs.h
 create mode 100644 drivers/usb/host/xhci-rzg3e-regs.h

-- 
2.43.0


