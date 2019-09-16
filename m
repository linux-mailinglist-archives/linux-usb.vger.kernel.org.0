Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5101DB38F5
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfIPLEB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 07:04:01 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46199 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbfIPLEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 07:04:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id a3so1770324pgm.13
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iQ30jDPI9tgHQ/2F34EOHXtGRlocpS3nnuynT47dxE=;
        b=N8Kp3LilmEnKiRu0sB+3Adup8kK/9RPkdCAOz3mj744UGXSfmdM9hX9TCF6S18Ta5x
         FoRb1mox8Vkw6cFaX29zUnmWbjW5gpGFo1cAYYpposW6g0kYs1QfT84S1FT62SixN8XJ
         CyI5fbv6mf92OVA/DkHm1ACRnQH5MVq2xUmm2od44Rn+bIS6I26hM+SSAxU8IWZq6tWL
         FkmjhHFtMBBxGdm3kY+b+WJhHzOqcF2ko3xoTbavNZk60fRXbFkEXR6n5WKugBR0TWf1
         6Wq9/pNVTFjO/n99oE31lvdIb9LXT3wRkuc9IC14P6KeqfKi8yZNfRFyvLCXtu4snn5u
         8Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iQ30jDPI9tgHQ/2F34EOHXtGRlocpS3nnuynT47dxE=;
        b=mBkbgzNM5hd41LFbda7fITOYrQ/fl/U7yovIo7GpHyjHiSiehaqFbX+gyAqviVixvY
         Y67YKqyPv+4S1vG+Hp6yaEAPKkW5wwLRR31bPwjjiCbggm3JiXec4L2m/YwQ2tWY1BbF
         nx/3F32SIPmFoDcF/Dk7L6xRwwGXW3uFDB1pGXxf4Nf5GUWbDjKGtzHZJcFuR7uAsVYM
         4lOeMoANDmTCg9h36BZFIsKVIv8OD667EWIpVgJvlQpuZg8l9mPh/c139ubVo2THvVB7
         NDWVQ761+LgtNDXFK0AB5/2UFaQW8U+qtkJuetfNp5VcX+QPMG4OBmHB8wDpAr4UhKMO
         VCzg==
X-Gm-Message-State: APjAAAUDz0jyz81Qf3fv+bWslIS5opd/xgzcpWz8cldaR2wOcRR9M067
        tv7no2HBCHDmvUqsNEvaDHg=
X-Google-Smtp-Source: APXvYqxAuu6uyuNG5fCrzaoNdygH+p30tCiFMPl9KB7NPgWt+8XcWhnWKVY7WSjSaDjygUSHEsDycQ==
X-Received: by 2002:a17:90a:e290:: with SMTP id d16mr2626716pjz.86.1568631839848;
        Mon, 16 Sep 2019 04:03:59 -0700 (PDT)
Received: from localhost.localdomain (180-150-79-77.b4964f.syd.nbn.aussiebb.net. [180.150.79.77])
        by smtp.gmail.com with ESMTPSA id l62sm59620663pfl.167.2019.09.16.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 04:03:59 -0700 (PDT)
From:   Rhys Kidd <rhyskidd@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-accelerators@lists.ozlabs.org,
        Rhys Kidd <rhyskidd@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 0/1] myriad-ma24xx-vsc: Helper fw driver for AI inference accelerator
Date:   Mon, 16 Sep 2019 21:03:40 +1000
Message-Id: <20190916110341.1310-1-rhyskidd@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So this series is an effort to start a conversation in the community, with
the intent to free the Intel(R) Myriad(TM) ma24xx stack, as found within:

  * USB Intel Neural Compute Stick   (ma2450)
  * USB Intel Neural Compute Stick 2 (ma2485)

What this patch series is:
  * RFC for a helper driver that loads a (currently) non-redistributable
    firmware binary blob for this hotswappable AI inference hardware.

What this patch series is NOT:
  * Kernel driver that provides clean API access to this AI accelerator.
  * Any usermode support.

Hardware:
=======================================================================
The Myriad ma24xx in the USB Intel Neural Compute Stick and Intel Neural
Compute Stick 2 provides an API to accelerate AI inference calculations
on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
by one or more LEON SPARC v8 real time cores.

This VPU chip is positioned as a specialised low-power processor chip for
computer vision inference applications. It contains a dedicated hardware
accelerator for neural network deep-learning inferences.

It was originally designed by Movidius Ltd, who announced they were to be
acquired by Intel in September 2016.

Boot process:
=======================================================================
The core chip is housed within a USB enclosure (there is a different
variant embedded on a SoC over a local bus, but that's out of scope).

When physically connected to a host system, the accelerator card first
needs firmware to be loaded for the device to be useable. An uninitialised
Myriad ma24xx presents with a distinctive USB ID. After firmware
loading, the device detaches from the USB bus and reattaches with a new
device ID. It can then be claimed by the usermode driver.

Current software stack:
=======================================================================

+ *
+ * The firmware is non-free and must be extracted by the user.
+ */

Intel packages and distributes a downstream vendor Intel(R) Distribution of
OpenVINO(TM) toolkit [0] (under a limited proprietary license) for these
devices which, amongst other binary packages, contains the Deep Learning
Deployment Toolkit [1] (Apache License Version 2.0).

However, the non-redistributable firmware binary blob that must be loaded
onto the Myriad ma24xx is not available under a suitable FOSS license.

There have been periods of time during which support for non-x86 host
platforms (e.g. Raspberry Pi ARMv8 64-bit) were missing or delayed in the
Intel-distributed downstream vendor fork OpenVINO.

Whilst Movidius was an independent company, a separate (also non-FOSS)
"Myriad Development Kit" was made available for developers, although it is
no longer actively supported nor new features developed for it.

Let's try to open more of this stack to FOSS mainline, on any host!

This patch series would provide mainline Linux kernel support to load
the Myriad ma24xx firmware, were it to become freely licensed.

As the linux-accelerators list is forming as somewhat of a home for Linux
AI accelerators (training and inference) subsystem, I have copied that list
as a heads-up to the larger effort to integrate this hardware into a fully
open stack.

May the RFC comments flood in!

[0] https://software.intel.com/en-us/openvino-toolkit
[1] https://github.com/opencv/dldt

Note:
Intel, the Intel logo, Movidius, Myriad, OpenVINO and the OpenVINO logo are
trademarks of Intel Corporation or its subsidiaries in the U.S. and/or
other countries.

Rhys Kidd (1):
  USB: myriad-ma24xx-vsc: Firmware loader driver for USB Myriad ma24xx

 MAINTAINERS                          |   6 +
 drivers/usb/misc/Kconfig             |   8 ++
 drivers/usb/misc/Makefile            |   1 +
 drivers/usb/misc/myriad-ma24xx-vsc.c | 171 +++++++++++++++++++++++++++
 4 files changed, 186 insertions(+)
 create mode 100644 drivers/usb/misc/myriad-ma24xx-vsc.c

-- 
2.20.1

