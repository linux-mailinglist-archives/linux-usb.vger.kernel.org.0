Return-Path: <linux-usb+bounces-38263-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMMLExcTHmrugwkAu9opvQ
	(envelope-from <linux-usb+bounces-38263-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:17:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE822626441
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BB20303CF84
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 23:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7495A38945D;
	Mon,  1 Jun 2026 23:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+ljZqSw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD63822A6
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355734; cv=none; b=uR3aQlBP/UewcHlayBSBc49h28vd7uudWH4Sv9HgjnsjVrLw/oSRlXByJMdn4naZ8j0T7s3YjwaKP1yxdPbDd//7k0nUBGIBcqlZSglIlemX8KzLcBwUqg9tPsWyHJD4aKbRRQhhAucd5hIXKS9sKbJPzKi4+oOP4kh5/GaFtSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355734; c=relaxed/simple;
	bh=5C0NvkvoNVW1GzuiitG2zF83G0Py8AToQX3X0I6RQCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h1C0gExNBJhPVSkybLwLT1voEoPFtcAMF7/k7C80p9M1ixxBb9BjRKVonDgZ5JLPX+AKT6fCxLyD+tNxEmi0WYltIYs7UxTM/ItZfsLzB6qEus1nKHJdP2TjB4E2P0sOJZWlmnzIVaTtmdDoH7oKsBG/ihOhLCDyZNweqU4tD2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+ljZqSw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2d792c8so12346345ad.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355732; x=1780960532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=Y+ljZqSw9sDHUZce/xTH9q9LSh3fNE4l3hvu0SZbMWkj6Q46tZTsYGIu39OBw82Gmk
         XJt24n2rhpyEDWIGsIbQ3XPe/lOD24AheQlZTQSMXs2pFAnh9oS6NclNY1KxMubXuokf
         FLCNLSlCEGLVSQr7S59ClOUtQt6L5tktWaFwkAlC4SG25c8hL3NzGCxu6mDGPskpuAVP
         GS85Z1RwBFENN3iGMVN+iQTsd2I6rFhsoBBlUD1d80S9Sj0TiGxvOPa7rka+KmnK7sTz
         alWD7mtZPMqJsxEtbmy01odXnjRlQIU+98ZHCcFnDsWWiU2aSHEbeqRB7MafZCbK69zY
         zM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355732; x=1780960532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Qss5GDiUGvvZMzZ4WxtI6WP7Gai0GoYtE3oLWnkhZc=;
        b=c1IRQFQFV2MyDHaAhq7VIABFetCd7J/Sxv6VPiKBnnMUCDLZhiD237BlMtVlUXBElz
         OLoWKnMEAx7GbnswnRwxzg6f7/yDp9a+0iRzAef/n+hRpbu7gDMIiQ08nPYwnvrzRP+j
         AXRLPMypN5dYWdNP5phkAu7nj0MOb/bkHEEImoioHSEARgMuj3Ytd1+u0kTNbuhE7JqN
         WxsHnnvHHNkGHOs+uZShdIxpptBJf7hNIzRFUWnm9r/sv1PkcIDaZO3pMthOi/mUrFjb
         /AVH/ZfvRA7WwR+hnpehK69Q4XC5eCqcxT6Xx2vlJuu0no7cBQRyv8BC7HrLILmeZElw
         EbyA==
X-Forwarded-Encrypted: i=1; AFNElJ+tvxaExOFIdsjWt2/FWUnH5C07SEZdIFule8M3/5WfuNogfdOVtYvLLBa9b0pHKUSA+QfIg/Ad3dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/jQHePOlIhKeQZkekyi1JvMiB5n5UnTmdtLs5G5PcHMi5eQOd
	kUvSCZ9z1GPW2wlhBgawHDNpcPTfXzds4WGFRt7OFZofw4SFzbyCfNyU
X-Gm-Gg: Acq92OGZ9IQJtP2Oh8nTWE4uGRNUu+Y/98I9FKbz0EDfVkz6M9SUEOszJ+/X++yqtkh
	cvo18XrOhXeOMEtJODzoeaa1vRjk4kPMJNtw7kIOqF5V1UrTdoAiZFa1TJHNSP6g1/x/hnfIpxs
	Wmob6w8TeAOFue5fiEXW2Q6WYFZ/rsXCIYzidn2uut0H3YEUfCt9MO649zVEr2ObkpldQVCx2ip
	luZariHHURKYUzhdA0co/o8we9pjje5S9a44ZGB2iHkzzUgbfpV5MK6I4HuyhZ+xey2LqRXzbw+
	wR5WD9ccpXZxkTC39+WdtTi5d+56f1Tv5PV9OFoXQzCqWEpWwlhp+O754pKjKJNVe0iVRYakGI6
	YUC/4eHU3ts/ZU6Q4b/2JDA1IHF+FezmrAqcwm/UYD7IW4lTaqiSYZfD0eeVubH3U6bzsG5EBv1
	ZyIN1yhTo/0VO5alJOs25ysVCq06Aa3V0TShgyAbC3JHtGN9mGvbBqZuRVVWfwCc09dHWPpYwmS
	cxFxlJLpWypTFXlCBSw
X-Received: by 2002:a17:902:e88c:b0:2bd:9803:9308 with SMTP id d9443c01a7336-2bf36878d37mr136499995ad.36.1780355732165;
        Mon, 01 Jun 2026 16:15:32 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:31 -0700 (PDT)
From: Oliver White <oliverjwhite07@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Felipe Balbi <balbi@kernel.org>,
	Oliver White <oliverjwhite07@gmail.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc3: add snps,reinit-phy-on-resume quirk for USB2 PHY power loss during S3
Date: Tue,  2 Jun 2026 11:12:33 +1200
Message-ID: <20260601231236.20402-1-oliverjwhite07@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-38263-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DE822626441
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Surface Laptop 7 (x1e80100-romulus) gates the USB2 PHY power domain
during S3 even when device_may_wakeup is set, causing PHY register
state to be lost. The DWC3 fast-resume path calls
phy_pm_runtime_get_sync() to restore the PHY, but this is a no-op for
PHY drivers that do not implement runtime PM (e.g. the Qualcomm eUSB2
driver), resulting in corrupted USB2 signalling on resume.

This series adds a new DT quirk flag that forces a full phy_exit() +
phy_init() cycle on each USB2 PHY during system resume, and enables it
for the Romulus board.

Patch 1 documents the new dt-binding property.
Patch 2 implements the quirk in the DWC3 core driver.
Patch 3 enables the quirk on x1e80100-microsoft-romulus.

Oliver White (3):
  dt-bindings: usb: dwc3: document snps,reinit-phy-on-resume
  usb: dwc3: add reinit-phy-on-resume quirk
  arm64: dts: qcom: x1e80100-microsoft-romulus: add phy-reinit-on-resume

 .../bindings/usb/snps,dwc3-common.yaml        | 10 ++++++++
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  4 +++
 drivers/usb/dwc3/core.c                       | 25 +++++++++++++++++++
 drivers/usb/dwc3/core.h                       |  1 +
 4 files changed, 40 insertions(+)

-- 
2.53.0


