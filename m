Return-Path: <linux-usb+bounces-659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FA7B0B60
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 19:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id B56651C209F3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 17:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB694B209;
	Wed, 27 Sep 2023 17:57:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C9F14F69;
	Wed, 27 Sep 2023 17:57:29 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711A1A1;
	Wed, 27 Sep 2023 10:57:26 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so13821665a12.1;
        Wed, 27 Sep 2023 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695837445; x=1696442245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V1C5NoxWdrmo2WR3CcVLRiRtgNXMmf8SHNkj8akGdeA=;
        b=SVDmJAy0EZYbh/oN5RJ0g/inrduKu6DmnuAT2itgRhv6RVFeQA8msZoerCvTme/7r8
         ffoHUM4vuXBJkGntOzEh7Et6zNrYtL/W4m/Kyau5Yh7Texb4PFlehltZBWO0L3ACx8VQ
         dQ6nDeXR2HZhKfr43N6AReugZ5nAhT23b7Lb/RO864vtXNzuAfjFLLPMr/BGjETKZP9H
         yIg3RHe9XuAm1YGqGUZ12LhPpBIdJI21J6ypik7HfuvOBnZIqocyzpU8dLGgSA/UuCsE
         hqcRqRPKPPSYrGWJqNXN0fFRZl2WFVn5qet3ZBbNmRXQu0x5BWUoW/4WjlQoRzskyPgQ
         loHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695837445; x=1696442245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1C5NoxWdrmo2WR3CcVLRiRtgNXMmf8SHNkj8akGdeA=;
        b=UJrcc0owCYPlAINwToPMu35+30Paf5hRPkijI4MjqBQZsPFvVCrx/3VORc4FReeob9
         1I+AqWlwDJ2/ZKmjSbI6eMKvxnZvZY4vZyIEgKeZMHuD//J8yc6gD8ALJAnJY3JYRtEy
         aMCAU8Bi4UIGJHZYv8Pswy6FW9HOn9C1YIVxKO4ncNg0pcmPSd18pxjtLzz0i2VHYfTQ
         SqfzKoDuJQVqeMbkIbp6HBZ1lHlzS6Dx5lXcH9gaou8cg+j3scryBi5DlhGovhuKmScT
         GUqaA1f1Cvk+Fdm+aXMhPkme4uBgrXerQZvkQVqVeCliLxgZ53OgXP4JKpEvte8Tn0cA
         crRw==
X-Gm-Message-State: AOJu0YzXAOjpdt0YH/vpW5/0wKRyOS/ewlxYNGUY8dQnEDeMr4lQBmxa
	iRz3jX5gflIu68l+nqaLF6g=
X-Google-Smtp-Source: AGHT+IFv1U4GuNVN7D9gIfVsHA6c6ZTVTBoJcd8l4Iq+OlFaL4DuuXjeE8AWJU3OV53Abc7VbIMbUg==
X-Received: by 2002:a17:907:2cc1:b0:9ae:5fe1:ef01 with SMTP id hg1-20020a1709072cc100b009ae5fe1ef01mr2121403ejc.37.1695837444660;
        Wed, 27 Sep 2023 10:57:24 -0700 (PDT)
Received: from primary.. ([212.34.12.50])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906370400b0099bd8c1f67esm9654593ejc.109.2023.09.27.10.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:57:23 -0700 (PDT)
From: Abdel Alkuor <alkuor@gmail.com>
To: heikki.krogerus@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan.eleceng@gmail.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: [PATCH v7 00/14] Add TPS25750 USB type-C PD controller support
Date: Wed, 27 Sep 2023 13:53:34 -0400
Message-Id: <20230927175348.18041-1-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

TPS25750 USB type-C PD controller has the same register offsets as
tps6598x. The following is a summary of incorporating TPS25750 into
TPS6598x driver:

- Only Check VID register (0x00) for TPS6598x and cd321x, as TPS25750 doesn't
  have VID register.

- TypeC port registration will be registered differently for each PD
  controller. TPS6598x uses system configuration register (0x28) to get
  pr/dr capabilities. On the other hand, TPS25750 will use data role property
  and PD status register (0x40) to get pr/dr capabilities as TPS25750 doesn't
  have register 0x28 supported.

- TPS25750 requires writing a binary configuration to switch PD
  controller from PTCH mode to APP mode which needs the following changes:
  - Add PTCH mode to the modes list.
  - Add an argument to tps6598x_check_mode to return the current mode.
  - Currently, tps6598x_exec_cmd has cmd timeout hardcoded to 1 second,
    and doesn't wait before checking DATA_OUT response. In TPS25750, patch 4CCs
    take longer than 1 second to execute and some requires a delay before
    checking DATA_OUT. To accommodate that, cmd_timeout and response_delay will
    be added as arguments to tps6598x_exec_cmd.
  - Implement applying patch sequence for TPS25750.

- In pm suspend callback, patch mode needs to be checked and the binary
  configuration should be applied if needed.

- For interrupt, TPS25750 has only one event register (0x14) and one mask
  register (0x16) of 11 bytes each, where TPS6598x has two event
  and two mask registers of 8 bytes each. Both TPS25750 and TPS65986x
  shares the same bit field offsets for events/masks/clear but many of
  there fields are reserved in TPS25750, the following needs to be done in
  tps6598x_interrupt:
  - Read EVENT1 register as a block of 11 bytes when tps25750 is present
  - Write CLEAR1 register as a block of 11 bytes when tps25750 is present
  - Add trace_tps25750_irq
  - During testing, I noticed that when a cable is plugged into the PD
    controller and before PD controller switches to APP mode, there is a
    lag between dr/pr updates and PlugInsertOrRemoval Event, so a check
    for dr/pr change needs to be added along TPS_REG_INT_PLUG_EVENT check

- Add TPS25750 traces for status and power status registers. Trace for
  data register won't be added as it doesn't exist in the device.

- Configure sleep mode for TPS25750.

v7:
 - PATCH 1: 
    - Define reg at top-level
    - Remove description from reg-names
 - PATCH 2..7: Add tps6598x to the subject
 - PATCH 8:
    - Add tps6598x to the subject
    - Create tps25750 interrupt handler
 - PATCH 9..11: Add tps6598x to the subject
 - PATCH 12: 
    - Add driver name to commit subject
    - Call trace_tps25750_irq directly from tps25750 interrupt
      handler
 - PATCH 13-14: Add tps6598x to the subject
      
v6:
 - PATCH 1: Use reg property for patch address
 - PATCH 2: Use tps6598x_exec_cmd as a wrapper
 - PATCH 3: Return current mode and check it directly
 - PATCH 4:
    - Don't check VID for tps25750 as the VID register doesn't exist
    - Remove is_tps25750 flag from tps6598x struct
    - Get patch address from reg property
 - PATCH 5: Update eeprom macro to use TPS instead
 - PATCH 6: No changes
 - PATCH 7: Check tps25750 using is_compatiable device node
 - PATCH 8: Create tipd callbacks factory 
 - PATCH 9: No changes
 - PATCH 10: Add port registration to tipd data factory
 - PATCH 11: Use tps25750_init instead of tps25750_apply_patch in resume
    	     as it initializes sleep mode
 - PATCH 12: Add trace irq to tipd callbacks factory
 - PATCH 13: Add trace power status to tipd data factory
 - PATCH 14: Add trace status to tipd data factory
v5:
 - PATCH 1: Add tps25750 bindings to tps6598x
 - PATCH 2: Remove tps25750 driver and incorperate tps25750
 	    into tps6598x driver
 - PATCH [3..15]: Incorporating tps25750 into tps6598x driver
v4:
 - PATCH 1: No change
 - PATCH 2: Fix comments style and drop of_match_ptr
v3:
 - PATCH 1: Fix node name
 - PATCH 2: Upload tps25750 driver patch
v2:
 - PATCH 1: General properties clean up

Abdel Alkuor (14):
  dt-bindings: usb: tps6598x: Add tps25750
  USB: typec: tsp6598x: Add cmd timeout and response delay
  USB: typec: tps6598x: Add patch mode to tps6598x
  USB: typec: tps6598x: Load TPS25750 patch bundle
  USB: typec: tps6598x: Check for EEPROM present
  USB: typec: tps6598x: Clear dead battery flag
  USB: typec: tps6598x: Apply patch again after power resume
  USB: typec: tps6598x: Add interrupt support for TPS25750
  USB: typec: tps6598x: Refactor tps6598x port registration
  USB: typec: tps6598x: Add port registration for tps25750
  USB: typec: tps6598x: Enable sleep mode for tps25750
  USB: typec: tps6598x: Add trace for tps25750 irq
  USB: typec: tps6598x: Add power status trace for tps25750
  USB: typec: tps6598x: Add status trace for tps25750

 .../devicetree/bindings/usb/ti,tps6598x.yaml  |  81 ++-
 drivers/usb/typec/tipd/core.c                 | 622 ++++++++++++++++--
 drivers/usb/typec/tipd/tps6598x.h             |  36 +
 drivers/usb/typec/tipd/trace.h                |  92 +++
 4 files changed, 762 insertions(+), 69 deletions(-)

-- 
2.34.1


