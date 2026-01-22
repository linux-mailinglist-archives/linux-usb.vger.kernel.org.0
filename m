Return-Path: <linux-usb+bounces-32629-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGXKFk8+cmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32629-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:12:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9968783
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E475C3000097
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5890D3624CE;
	Thu, 22 Jan 2026 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbOtJ5+D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE135EDD5
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094714; cv=none; b=aOHiOCl2beJtiTsQqH4mjTcEWKbEBqn0ILtXShRRj6z5/1bjax+6r0yb43dOzg7SA84Oy8w5R0ksP0zraazyRQi/a1QL6NGRWz5OpYKZkyIXPx5Tjyn6yRcBlqviCfSSjxvyWWpm3NkyqJruWyHRzY/pOjR5mzXwCGVnRwRcAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094714; c=relaxed/simple;
	bh=ZDy5yI9QqflnU3k5ABMZs1VkFVXrQ0H8SbViYLRUrYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=un/ox6pZEupOZFo7nANt/9VR5hKg7TvaNNhEUcL5sabjLczhCl/L+NoHJYUrJp+BxkOkfMhAW57K4tnD3Yb5SJn8ZivIKUcZEepcUx4iXZat+A8oAVZQCRlqUj9putQzfZLtqjQqSNR3Z9beN5Btbu0oeScMELLqh0vMA5Ay8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbOtJ5+D; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee974e230so10716575e9.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769094711; x=1769699511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6E8GtY3TTJfMWO98cB1PkgRGKTg/bOaROhT3qeSbC0=;
        b=ZbOtJ5+DkPcuFaJTGqhHzKVFgX89tDNzqdtGolLyHmtp14BN/4D6SNHNJ+4faJFnSh
         YY/zU9sx69bOEXixyiXonyNPUKr6UyoADzXOp0W74s4PUNrT5Ketppfgk5IqLZH/TLFW
         kAbp348jcmx19l16jV7TCAfvSly/ihOILNDxSFONjdW2FQs5kZPBQLL/Tlalw+qadvNU
         twkEsUQ6RI8aZ9zrJ0TrVTJEthGaXF8YQRfOPGPyFiPUWmM6ayID2hgX+1yeVHjwL3We
         MQmh6gYJL0b6DXZPpBACsc07oEBK3N9K4gB6YzeN6jPdjrkzaQOmvT4TjQWcQk2HxxMP
         HGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094711; x=1769699511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6E8GtY3TTJfMWO98cB1PkgRGKTg/bOaROhT3qeSbC0=;
        b=SUdrUACjpCaBtXvadiIM8lsbCle/W0YlGdqb30fbhat1aREPsk7HlZ0WB0Kb1SRcaC
         uJ27ywWhCNbHabFsRZDFCeC3tvcAPPAzBFlKW2AH7+cB7LUSw5gwKbjKtA0Dpb17dT6c
         YcGWI+NTv2rbF/d3i7s0gwUHIfSaCl63TXdGVuHz12BlqSKFPbNBEWqG1iftFAxzsHi0
         jEQVwHSewuquJdzi3m1oM3xzK/+j6xCNLTxF6NAf2A9knAXyW20+31yoH0gCLuMHXp/g
         /dlCCefcan2HKdnKCLAwguR/KNc00yzoMSYbZeh292fxmHuEu/3Gon8KqUQ2GNl/DzFr
         u7yw==
X-Gm-Message-State: AOJu0YwSZs0JD8S2g1bxu2wSkI8bSiqLxlQ89h55XBbr41hzGqQXsE2k
	X9bM0y5/KXgMHrr/KcWWzdOpsgFM1AJ9Z9cROu2RKVYlPsfwzfWKd+8S
X-Gm-Gg: AZuq6aJ47Ya5BQgFKRDHIedVTAuYs4qMLZOtQ+1wIk0DX8EEkLBm2ROKv5ILICk+gES
	yOkju6z1cN4NO9Wu8AoQouD7uxrFj0kDFwyY3OpBElS9TUpues+meDgzp1RlmLlYgKaBKgcNFNR
	PvAEYBM9BGyaDtmQlQMaBFCCLnDPxekHE9SBH7IobhrLsgvQUqOaokK6sTFV02sh5R0zVE5dpfM
	ulBVNCThzDSYVf/TY/7Yreod/kkwwcXvm26TKJ8W9K5hQ8FiiQewXKlgHQHSh5i9MzPraLie9Cg
	fI/eLPE20BFoxFRxVulaWKBnaKqxu2ptZuGsL0QEaxWAzY2LVxkabiTufqNHsLT+gbqALnoeU7x
	LgNF73wK3fSO4U7VbVl22egSl4WyN3SX8gMkaHRgCip2bANYBGoTT0po1S7cxctULWZs8jWTeIE
	Tr
X-Received: by 2002:a05:600c:868f:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-4803e7e853cmr95861425e9.23.1769094710557;
        Thu, 22 Jan 2026 07:11:50 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804704b4e6sm74861705e9.7.2026.01.22.07.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:11:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] usb: phy: tegra: add support for HSIC mode
Date: Thu, 22 Jan 2026 17:11:23 +0200
Message-ID: <20260122151125.7367-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32629-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,nvidia.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EDD9968783
X-Rspamd-Action: no action

Add support for HSIC mode into phy driver. HSIC mode is supported by
second USB controller in Tegra SoC and is used for connecting modem.
Linux kernel has support for HSIC mode in the controller driver itself
(Chipidea driver) but USB PHY part was missing until now.

Tested on LG Optimus Vu smartphone with Infineon/Comneon modem on usb2
line.

---
Changes in v2:
- initialized err in tegra_usb_phy_power functions
- rebased on top of 6.18

Changes in v3:
- initialized err in tegra_usb_phy_power_off function
---

Svyatoslav Ryhel (2):
  usb: phy: tegra: use phy type directly
  usb: phy: tegra: add HSIC support

 drivers/usb/phy/phy-tegra-usb.c   | 300 +++++++++++++++++++++++++++---
 include/linux/usb/tegra_usb_phy.h |   7 +-
 2 files changed, 276 insertions(+), 31 deletions(-)

-- 
2.51.0


