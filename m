Return-Path: <linux-usb+bounces-37479-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBIRCiziBmrVogIAu9opvQ
	(envelope-from <linux-usb+bounces-37479-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:06:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2254C013
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88A86303CEC7
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CAF429833;
	Fri, 15 May 2026 09:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jA///pZl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE83427A0B
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835731; cv=none; b=X2Nhxsbq3sK+6bUt756hvKCTHFkV/GK6Qmg9/JbgijQEHiBVY6pZts2wGArcUdaa8glpQGhlTmJbb689suFRenGNM5+hGvR2JFx4Rn+xPQSm1JoFVcLTe15dJBwhSf/OhsVwVxsroZ5BBrXpN5ud5CJXKzrCktPW0u/K6vKKm3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835731; c=relaxed/simple;
	bh=bWc+EfUPJtEL5wZEtwgp5WJvNWmPURVY/3bNzMQXzuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tQY11OCTam6wcL0Y50QkgbDEeu+K0DaFuCFv+5mZqX2PYr9UriCoNs0XuwJGwKp1cregCtcQQlZQY3bSkTmg7NWUTROWku8RIoGtfnuVS72HF74CSJaqdxe7oLMx8tWkrAEru6tnhfJ/29q1WCVlRV4In4CiVB3KwPThLi6/Z9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jA///pZl; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso3797933a91.2
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835728; x=1779440528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=jA///pZlI/8YewolEwY6hjJAMGoTMWeyd1XPgdy+j8OojqskrL6mUUkTAqZWB5HtEO
         FLgbTH5LZKGkqFBD4aszwtNKG8zO8l5h9A7ucNeqG4XMVx+jEzmdhhQfUuTt7aTZzU2H
         jZmTy+N/0NDHQywvp60nWzSZ7ynS1wbVLWGlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835728; x=1779440528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeVtd5jgWtEcTyZTMUFtTZGp+FoBlkEpQv/hKwoH+Rk=;
        b=ChuDt9GlMej1S4KgX4cmOV/aMlBd49AvEMk8t95AfPsf3L4kqLL9Wk27ssrJk02wr2
         385Z5RmcOe92x7gebsuaoya2YbToziNPGWcGpk8NPIVKqKtRJXxwC0RC+aCIOmHwqFOC
         gH+TMIRVwQR1CzJtfgZMa9g/QTYjbOKbsRR95/AxBmldMbtkBRUjloqfFnFlKyhPQZm4
         AYB2Z7/DPJyeBta0dm8vWgpOGXGfcD5l7rFRjL0eEw7JEpiTkGGzFA8YtziwPRbgXjZc
         9EZH12A9dI6voeEpk4T47503XWo2DJBK5Z47YlAprazUO8L9AY0qbdDx/J6NeZSLA72G
         BzbA==
X-Forwarded-Encrypted: i=1; AFNElJ+1LDO1FOoZ1QDfEuZMQmaJlGh+ary4KjfDGPDmDW/rXrtdIMOE458Pdvz95CxtficGa5yI1xppOVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsaqTTx8c3f2HsEjqYfqqppEEKTHbIG5Yq6FYtK6NY1vN6kEkN
	dEm/oOBeyu1dbi0CtvR/IzU0pH9UapHi2/HjlgPpAe0/UcZUeGYzMX0/OA3HByGldw==
X-Gm-Gg: Acq92OF2LZazHW/YBpODyw5/S+bkiCbkK9JozQYS6s4gCuwWw+ijabihJgbq8bBViRS
	WYjE4hNexLw03wAYo5etjoFjGD1TI607xh9fW9QssJweG0olu52XuZnZTWONoFcmrjp5tHaMcqq
	sfEzkCca1s6Z7DiW/qrM992CLwk7So6FvITwHRc4+YGmPVV1As2kn+aWnu3jN8JGT+VUbfLTAY2
	5nJ1yDX9X6OIS+nuwatAGwwR7uiMpdpEELkKozT9MhVxo0QsZSzMQkaBug1obfjsCvcZ9W4eWuE
	1DGQkeEePrU+SIr89yUth8B3fESULjpAWI4mBRb5UAUn/RpzjaJPGDCjHRAK83OcCqPk3jtR32V
	t+N+2ID45UdIOjhvyQRFgz/sdlnc4YQvv61E5AqbuC2VNfHVBokoA83C8mznIuD2roP2Q8KlhMA
	dXJ5DgTT8BftictSu6si1JinFZpOFheVSZrvUdrWYyukKcWTq8nKmatN/cyCWuysXJeneeemwAR
	HBlTNrO
X-Received: by 2002:a17:90b:2d08:b0:362:e826:cefe with SMTP id 98e67ed59e1d1-36951ca6064mr3062453a91.23.1778835727968;
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri, 15 May 2026 17:01:36 +0800
Message-ID: <20260515090149.3169406-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D8A2254C013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37479-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Hi everyone,

This series is my attempt at enabling power sequencing for USB to support
the USB connection on M.2 E-key slots. M.2 E-key was enabled in v7.1-rc1
with just PCIe and UART supported [1].

Most of the series is based on next-20260508, while the DT changes also
depend on some other DT cleanup patches I sent [2][3].


Patch 1 reworks the power sequencing framework to allow matching against
different USB ports. The consumer API gains an "index" parameter (which
is the USB port number on the hub), while the provider API is reworked
to pass the index to the matching function of the providing driver.

Patch 2 implements the index matching in the pcie-m2 driver. Matching
only happens when a valid (>= 0) index is given.

Patch 3 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER.

Patch 5 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub.

I expect some discussion on this patch, because a) it adds some
OF-specific code into an otherwise generic (core) driver, and
b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
on the port twice, which negates the port reset part.

Patch 6 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller.

Patch 7 then adds a proper representation.

Patches 8 through 12 enable the M.2 E-key slots (used for WiFi/BT) and
USB type-A connectors found on MediaTek-based Chromebooks. These are
provided in this series for reference. The USB type-A connector changes,
while not directly related, have overlapping context, and was easier to
include. They were also used to test some extra local changes I tried
to convert the USB A connector from an onboard USB device to a power
sequencing provider.


As this series changes existing power sequencing API, and also uses the
changed API in subsequent patches, I think the best way to merge this
is for Bartosz to take the power sequencing patches and provide an
immutable tag for Greg to merge and then merge the USB patches.

The DT patches can go through the soc tree once all the driver and DT
binding changes are merged.


Thanks
ChenYu

P.S. I'll be at Embedded Recipes if anyone wants to discuss details.

[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260505101408.1796563-1-wenst@chromium.org/
[3] https://lore.kernel.org/all/20260514101254.2749300-1-wenst@chromium.org/


Chen-Yu Tsai (12):
  power: sequencing: Add index parameter for getting power sequencer
  power: sequencing: pcie-m2: implement port index matching
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Power on connected M.2 E-key connectors
  Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed
    EP"
  dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
  arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
  arm64: dts: mediatek: mt8192-asurada: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8195-cherry: Add USB type-A connector
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       |  17 +-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  93 ++++++++++-
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 139 +++++++++++++++--
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 146 +++++++++++++++++-
 drivers/power/sequencing/core.c               |  12 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  65 +++++---
 drivers/power/sequencing/pwrseq-qcom-wcn.c    |   6 +-
 drivers/power/sequencing/pwrseq-thead-gpu.c   |   2 +-
 drivers/usb/core/hub.c                        |  22 ++-
 drivers/usb/core/hub.h                        |   2 +
 drivers/usb/core/port.c                       |  54 ++++++-
 include/linux/pwrseq/consumer.h               |   6 +-
 include/linux/pwrseq/provider.h               |   2 +-
 13 files changed, 508 insertions(+), 58 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


