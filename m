Return-Path: <linux-usb+bounces-37352-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLK2KVKeA2qF8AEAu9opvQ
	(envelope-from <linux-usb+bounces-37352-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 23:40:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0477652A779
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 23:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF78D3052B5F
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 21:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD2B387347;
	Tue, 12 May 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQWdnaij"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6D1386554
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622024; cv=none; b=GkR93smAAa8NFi4+Mjpp8nrI7HUnty7csjOnoNxhQiWH3X3zVJCb/2b2OZranlRiZLK1Pzk+vW7/2ZaH7PRgDMsxU2POsgzfGU8R+JB2gS+ZJt55yV7CQNVOHu0NBQmBCNme9zOZJT64fPyzlCvoOzFtt25/P3Tr5smBC7rZ8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622024; c=relaxed/simple;
	bh=sTJxJ/xasIqDRCeYM0JtmkGU7hXrTwpbCDass0bVHps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pH4aMTlSg1Qaits9OnQXvSqbsH17LcCsyhHox1QjOla9lNVQX4Zk+ZdMWwrLLUUdtS0hopwugq6/auxT3jwyTYTt0oH0e689Xo+5gWfNkJJRo5pgAiOtqzQJZ9QMg+aJLO7SWGK7n8+MURHM6K+iPRmfj9Qyvkix51R/fG8Ulxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQWdnaij; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c827313dac0so1580791a12.1
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 14:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778622022; x=1779226822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=OQWdnaijZ1h7L8r1EP1KKJUSbtDYxqsiw2/0vKLvMvQLdrb9ZVGnOOp2Gbe+jUMvYP
         PVCkgYSFZtaLFcaLWJxW4EL95IZznbDnPWDEsv845ZFoxjpn+JZSxi2ASVX/asrez5N3
         C++ah2Bt+sYUOE4mVfIa3Hiovmzn8uVee1VKr8VwD2DQFKyJ9B/UAWk4wH7g121HrhSb
         9EnoRB2tI4jdGbHrVW1IT0Q6ChG15TTtxdvMgF+15GAdv/tyoXrKB+reAvow7lj5cgx0
         e9IzOSlonqDlYRfOaIVga0qdurXUtBxkpjQKvhUPhCp7xT82X3TCCo/X0gP7wMsORNae
         mZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778622022; x=1779226822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuJpPqhDcONg49vri+mgJGghvc2o/ilLGU2ZfssziEI=;
        b=I4WOXpTZ9lIFO0xeqD1N+k125upQ+yg/P2YUa37/QNae4qgvM+80YFFv172C9xiJFU
         Tcrt0gKgoLDaKUdhXZfEdW4S6ftS6QnUMzj0pcEyr8570ZwJ5oe3yayFHcimCykKKvMF
         ty5pNCFcfmFaWDZhnODShGhfX/qdZJB26mcbue0ss5cjUZpuwtqz+LFPXcOct00+R1oZ
         TClyDHz8wS5j3L6C2HLB9qDyogBSQDbpee5Pv/GC6AMcKVCY+Buy0VLvhkPw5K7EkI6m
         4V8UaDX0CBDYjSdGqiuC0on/dY9Wq8I/NX6+O1YCppxmVVEuaf0bMfp3MKuZCiZd7nlV
         z9qw==
X-Forwarded-Encrypted: i=1; AFNElJ+/jbwKrTZhqzEAMHCbs5x4wjhNwZg/w3Sgsj/hjSuf1wcv1cDPEb8eAKx/lOcl/OFRz1E+5oSanHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nqITaJ1IeTIcCZpwci+JF0Th+sh1Zj/WE+MQ6PCXz4z6DtCP
	tbHruSJUJrkedcpuumAke0/QVuYGJWjZC1QThH4caW3TUMBNAflM8aOU
X-Gm-Gg: Acq92OEbIaZNG+4Qf9t9jZGhl3eKQsaA7u9m6NGZ190f3+jPJvZUEvFk8bCaKdNHxLr
	/9qdXfaHs3alvy9fP0w7TiWujONxZaeNblZeeyJQG7R30Z1UhGv2SKLmLzbPMooiocKatBJ157q
	+Txdkp/QJ6Vk+yXjS8RHvJw7kF4ExxDLW7KV/HHFUoQjFLR62UPCv0lB/P11f/iZkn7G5vFuxxF
	dAh5f1UTdDj93+TaLnbZ1s6GeJUbKXGiauhCITqj9m0UnyGyxai7U1q1ebsXTHEL4lTN3e0e6RU
	kH0aVKyTY+ht0k5dVcuqtkgpFUU32nz4rzuzOnlUVoIFauGH5+cFgr0mNjn89b3sAWFg29EVKD0
	fmkZCK76ctXDvuC7JDVbLNuls0f5dL5VXVU4ijThkMcAR4zFkIf/54TAa/hkAZaasCc/ZeSQH51
	qv07S/CzF+KoFvI1atnQcAMGI+JJ3+T+I=
X-Received: by 2002:a17:903:3b8e:b0:2ba:7617:a755 with SMTP id d9443c01a7336-2bcfd48ace8mr55972255ad.25.1778622022203;
        Tue, 12 May 2026 14:40:22 -0700 (PDT)
Received: from mincom1 ([27.232.220.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d409eesm143949895ad.32.2026.05.12.14.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 14:40:21 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v5 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Wed, 13 May 2026 06:39:08 +0900
Message-ID: <20260512213910.871859-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0477652A779
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37352-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

This series adds temperature monitoring for AMD Promontory 21 (PROM21)
xHCI PCI functions.

Patch 1 adds a small PROM21-specific xHCI PCI glue driver. USB host
operation is delegated to the common xhci-pci code, while the PROM21 glue
publishes an auxiliary device for optional sensor support.

Patch 2 adds an auxiliary-bus hwmon driver that binds to that auxiliary
device and exposes the PROM21 xHCI temperature value as temp1_input.

The hwmon driver reads the sensor through a vendor index/data register pair
in the xHCI PCI MMIO BAR. It does not wake the parent PCI device for hwmon
reads; if the parent is suspended, the read returns -ENODATA.

Changes in v5:
- Add support for AMD 1022:43fc PROM21 xHCI controllers and document the
  new PCI ID.
- Make USB_XHCI_PCI_PROM21 depend on X86 and default to USB_XHCI_PCI.
- Keep the PROM21 PCI glue built-in-only when enabled, while allowing the
  hwmon sensor driver to be built as a separate module.
- Move PROM21 xHCI PCI device IDs to xhci-pci.h so xhci-pci.c and
  xhci-pci-prom21.c use shared definitions.
- Pass the parent PCI device, MMIO base, and resource length to the hwmon
  driver through platform data defined in a common header, instead of
  inspecting the parent driver's drvdata from the hwmon driver.
- Remove the private hwmon mutex and rely on hwmon core serialization for
  this driver's callbacks.
- Clarify that the driver only serializes its own hwmon callbacks and does
  not synchronize with firmware, SMM, ACPI AML, or other possible users of
  the PROM21 vendor index/data register pair.
- Use readb() for the temperature data register, validate the value before
  writing the output pointer, and drop the 0xff invalid-value check.
- Use pm_runtime_put() after successful reads with the parent device active
  so the PM core can re-evaluate the parent device's idle state.
- Simplify the documentation and use more precise terminology for the
  supported device.

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 238 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |  20 ++
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 123 +++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 531 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h

-- 
2.53.0

