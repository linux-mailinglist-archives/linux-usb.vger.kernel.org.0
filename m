Return-Path: <linux-usb+bounces-37653-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N6EGO2pC2oGKwUAu9opvQ
	(envelope-from <linux-usb+bounces-37653-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 02:08:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6B575635
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 02:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D55C300F52F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6378161FCE;
	Tue, 19 May 2026 00:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTKgYWsy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B626299
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 00:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149272; cv=none; b=qhMOu3eoK9MrxGw3W/NU8f4zxa4oxYaq6L5j+PWAkrwNvVnxjUgl6AnbfIDPsiVnUOgB9gfqVhHgSHe23r4R/ZEof5WcBmLhGv+WwEp2pkiat5m3rVK/qCjsSouk7VBSiZme+tOuFuLi7hzLF/mTlvQh6hMQGX9I7S57PFOEGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149272; c=relaxed/simple;
	bh=Kiklfbf/mOtWhM3nzZ61qTH+SlUMKusCDgEcCZ/kXsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ECgGVnjnZNTqrwMGj0yJzPfTky8+wOdxOV/oGwuLixm6p7TvaoCmq/uI8c+Yd4Zg8EZfW5S3LrTrJd2329lurG+X9tPI5lJtDUXK6qX5NFUmoFbozYh/wanhludYrxhlG36bAlgH9/8FqH7sRd2nyzmOE5AaOCaAZ4Ucu+WnI7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTKgYWsy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-365eecc5885so2635987a91.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 17:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149269; x=1779754069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=VTKgYWsyEcNjJnNzMND/nDwD74GG3fjp/gGHyxHxBsRW2PnA4wZ++eGb3NqLGWUQl5
         GfsUrpgHNwmnweki8ASoZkxqwc3lwEf7NkWiyykNE7vN7Bj2gMXkrOEcwZrZr5lMBtEE
         JkR/ubwSd0J++7Nn4gi5ZSfUloNn8/oG3pBquQblwGI5bGEnOIbX7uC/5pgbQmq9tyjr
         CttxRLUpnDS5JLG9FTSf1dGZXGANEhOWssU7WJXDzvtY/p3gjuWwDBuZsBJ1SwWKRdVT
         FPGALtkzI4l9x3xV6o1HYIq1OXr7+ScVh53poiWDQghrNlE8vGa2zn4kFAvLQx1aEWQe
         5rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149269; x=1779754069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMisq1x8LSsDQmwweu++ThsrVVeqT8H4PNPNw49rVmw=;
        b=JVODPjzs4tlhUmwKH5oHQUq8XOvedueNKA0vEX7N9GJ0pK3fojXXUXEncwJi/xAUR7
         9AEphEAQ46Ytc+r2i1UAG4vP18R52szr4cNvKmm/xX2MB2GPZ0sn8Ufc2ndxDb1ors6J
         /VWqE2qwExw5FjxIftHK/VLyB42nl1KuYw2KZbmPlSQC15p+W0A3dubvoflxHVDjn3Ru
         EpKAYJn/ga9yRanQua5trHM2XA8LnxRpWiz0cIq2Kv+6h5aEXt7m3VBSw6hpLCMzp6XL
         uIyLKTSnkp0mI4AlLKva0nOPynUAUOdvq7+e+rxVsMvHB96OxnTPxoqH9+XtvtcgMmrE
         iT+g==
X-Forwarded-Encrypted: i=1; AFNElJ93L7G8x63tSj3ohV+vJq05OIAO2XbHLd/O/0TLmUowenroenPeo+D9bolFt3itmx5UDgvI2qfeOBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznb1NuQafrkwGXKuZJ0Zva8XBlVNZTGWK6S7Xv6+RnqskaGcOj
	AwpxtKPfxm/wOCZCQUL/wxhp/fki71Qm+vMusvQGJuWjfQc11VEwQ5r0zssb0vrogbg=
X-Gm-Gg: Acq92OGt7RekbUJ2dF0H4w1/2WEhKZnHRgvW6N/OBWjUNjjT7w3rhxg426Rkcpckp8H
	QAsiy9GSui0kYkx34XXloJvUZBuSWkj99RVgkP/oJ3tl+F0Iy9m4nOjtbwq7iJQCAXEgoPI5IAI
	KOWLIR3zy8aAiRjd9EU0uey5O0VcFr5CZ4FtLcgd81cUv8ulD+XjoEK4/5RzScwVeC4OdSi/Jk4
	KEpP5aMd801y1qrUYIinL8gQIn1fuEzLtBe/iiC17mgmdGTmJERJpZyr17Eekdfjg723ltZk8wp
	YheYQAJNEWNX84AAwcb1BrqETcTQfqdxZu05ypHMo9cJvimbez5qrJVifhz6voi2fc/YuNATVTD
	NkBhFnJNczd7ouZn8//TH9xp5SUyaof75JlV4BckJDioYn2/gdIjP6xE1Srq13iZNk8+5BCRWxH
	TFm2gZ0PyLT/zEwNx7NCjO5Q==
X-Received: by 2002:a17:902:db06:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd7e7bdd1cmr181280395ad.11.1779149268954;
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
Received: from mincom1 ([119.214.48.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm79021755ad.20.2026.05.18.17.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:07:48 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mario Limonciello <superm1@kernel.org>,
	Yaroslav Isakov <yaroslav.isakov@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v7 0/2] AMD Promontory 21 xHCI temperature sensor support
Date: Tue, 19 May 2026 09:07:30 +0900
Message-ID: <20260519000732.2334711-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[roeck-us.net,lwn.net,linuxfoundation.org,amd.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-37653-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hurryman2212@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BEA6B575635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Changes in v7:
- Tie the hidden PROM21 PCI glue option to the user-visible
  SENSORS_PROM21_XHCI option instead of enabling it for all x86 builds.
- Drop an unnecessary NULL check after successful xhci_pci_common_probe().
- Use a goto-based cleanup path in prom21_xhci_create_auxdev().

Jihong Min (2):
  usb: xhci-pci: add AMD Promontory 21 PCI glue
  hwmon: add AMD Promontory 21 xHCI temperature sensor support

 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/prom21-xhci.rst           | 101 ++++++++
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/prom21-xhci.c                   | 239 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   6 +
 drivers/usb/host/Makefile                     |   1 +
 drivers/usb/host/xhci-pci-prom21.c            | 137 ++++++++++
 drivers/usb/host/xhci-pci.c                   |  11 +
 drivers/usb/host/xhci-pci.h                   |   3 +
 include/linux/platform_data/usb-xhci-prom21.h |  22 ++
 11 files changed, 532 insertions(+)
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h


base-commit: 4d3a2a466b8d68d852a1f3bbf11204b718428dc4
-- 
2.53.0

