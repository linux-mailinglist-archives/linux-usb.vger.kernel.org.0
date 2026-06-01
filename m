Return-Path: <linux-usb+bounces-38265-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAdKImwTHmrugwkAu9opvQ
	(envelope-from <linux-usb+bounces-38265-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:19:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C4E626485
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 01:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA094304C755
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 23:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42174349CFE;
	Mon,  1 Jun 2026 23:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMVleSNg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA43815E3
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780355760; cv=none; b=l4C4RhVNuWFTIWzFamDSLrdMkU9xWmgvICsivr2bTzEwPfzIPesvIgmqjjoEIQ0Slq3jF6gphHqvs1qU8KftPp5H+QC5Gi/PFc+HDQ9azo3g4MAZ1ejdlpcXZbMHnHa91c+Uus9q7ohWqjOGRNzOeuwz0gGw/k9wgDFMpDeb7Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780355760; c=relaxed/simple;
	bh=uzHEC8gmAxO8h2736QEykyhvl3Sb4cDm5wxPO1UPc5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XEJ5oljfP3MxmTugQ0NKnNJPMECre+ErgocwFuHIqLZzHbtE9sm9OVceWSzCQlj9e22SotxnvXiW7f6kvX8N4WcAF5p2YkseaR3P9CTtGLPHkx3a7F5hDtrRKNXq3SqVSROjaBN331sKJZpHTbugbdGjwp3RhgqRZv3IxXXde5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMVleSNg; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf237e1433so37026135ad.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 16:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780355757; x=1780960557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEGOFfHWeLdHXhuCkKkw3VwMtN/iTVupSierNalI6tY=;
        b=RMVleSNg7SysWCVkIwV15Cs9NIe155+C6D0hH2rdk286QD0CYLMowHSAFHOMPmTvn6
         RjDPw2pDBBNKZ2FiSX2jVxnnCyFZlkHZxf6NJzwrQ+RHQyY8P7nj0d4T3oc/ePfKCo26
         BZaC/9b0G7ErUrx4IHolcs513omlBQJ4exBbxyBYZD+rC64UmZTsDvPpBUjnJ+5I97b5
         QgDA1/pjqb3zJWUZM7ZoMAs5qJdC9IlnBBGphTczAQ6mumBRlJo+FdHPk9lf+GLYXhkf
         3S3KcdJ48E5gWZp5T6ky2J2Hqdb9SiFLTjBuoEoC05cxislC0GjnRLD2KiiJcd6YgS3T
         dgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780355757; x=1780960557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vEGOFfHWeLdHXhuCkKkw3VwMtN/iTVupSierNalI6tY=;
        b=WYfKg7vaf3VQZvW4SlTzG1oqwGR4pM8ilvrYbPJy97zn4ECWCj8V3UIBxEzgg7ZE5G
         glDL58GWsrH7UNhkUis7EEMEEftHL+1QjsYXt0zXlBVgOI7Uz3Ra+3P6QrQIXXMmM2IG
         JTrrn2JNELXPswvygyOLj5kvs6bFW3xLrR/Ja3AVETpT+SYWdUqOnlAybtM/jtDjv7pv
         HEJdMh0aLZzSq4xJDaaDIas5v5SGRXAdU4P2jAbkN24SHyPDMNLL/ho1VMsXh5Wv2g9H
         8qkUfwdonZE8xGrt88efCEgk3uWPz2lDQRzPt5Cv+QzY4B3uEjyiSMe6UScyAc6EG/IC
         lHEw==
X-Forwarded-Encrypted: i=1; AFNElJ9u0XZub0OiPgkC9Zj6g3ag+uLfT2kmWsahdT0KGKJ1EX5cbQ0qQo2+Z830pjAA2t2iiEwCvKEC/i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvoOJWli5rzL3jruJqnlRFG8Atud8yIufT0NN9yIcU9DUOInFI
	gUN8bas8QBnxDSxWC0s4jQ7m0yeD7d+31jMDLe8FzjO7Uguc5pE1/KRiZN/ApCw1ZXQ=
X-Gm-Gg: Acq92OGLRv23DyAkKoA82wDvOm1JhAfSUnYL7xMuGYzWYzs0wGtKNqvIU4ev5QsJ2LH
	AKEgc/UmvhZes3iEK9pMoTrpKbQywf3V2c8XfAncQefWOGNojSBJpSP8BB4NOpyWwvsfdFqBTc8
	7Ve3LSJeL40z4KlQ9AoPJkE8UXgFUBc3gao8WsSrZwVZHK6W/uZxQDIq1Mb2t7+FoYK9hnPN9yM
	6Cne2ZAVkRDGFQoWtROUOfsPIvCLtunGMU07YsAosDtv30ojCVI9D8KyD8HBqk6xeKy/Ii1BqdU
	YJUoZh/Q47ukYjAyX8BI6hztFWSLCiLQ3BnrMEjOQus2dqWNPGV46wnwVcRo7jASg47H6vctIbQ
	Dfp3GuKXQE21ArSzitWTlOqRPjMqmbAhJWNq29VOq/UzL5y5i/qzRxcnZk/oJCEPoZyHdCSqZ6i
	5P6rH1O2a9JgoeU3ERPEXYaSd0XGmzO7jeojLuNR7HiFtnu7DGtYz12nr4PtD3wjHWjdfiWryyy
	/Pkt7RCC2BmueGjObBd
X-Received: by 2002:a17:902:cec4:b0:2c0:bb2d:a321 with SMTP id d9443c01a7336-2c0bb2db260mr104962495ad.37.1780355757465;
        Mon, 01 Jun 2026 16:15:57 -0700 (PDT)
Received: from tomriddle.canterbury.ac.nz ([202.36.179.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm143815355ad.20.2026.06.01.16.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 16:15:57 -0700 (PDT)
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
Subject: [PATCH 2/3] usb: dwc3: add reinit-phy-on-resume quirk
Date: Tue,  2 Jun 2026 11:12:35 +1200
Message-ID: <20260601231236.20402-3-oliverjwhite07@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601231236.20402-1-oliverjwhite07@gmail.com>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-38265-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oliverjwhite07@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 08C4E626485
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some platforms gate the USB2 PHY power domain during deep sleep
(S3) even when device_may_wakeup is set, which causes the PHY
register state to be lost. The DWC3 fast resume path (taken when
device_may_wakeup is true) relies on phy_pm_runtime_get_sync() to
restore the PHY, but this is a no-op for PHY drivers that do not
implement runtime PM (e.g. the Qualcomm eUSB2 driver).

Add a new boolean quirk 'snps,reinit-phy-on-resume' that, when set,
forces a full phy_exit() + phy_init() cycle on each USB2 PHY during
the host-mode fast resume path. This ensures the PHY registers are
properly re-programmed after power loss.

Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
---
 drivers/usb/dwc3/core.c | 25 +++++++++++++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 161a4d58b2ce..82baaab0d1d1 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1854,6 +1854,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
+	dwc->reinit_phy_on_resume = device_property_read_bool(dev,
+				"snps,reinit-phy-on-resume");
 
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
@@ -2561,6 +2563,29 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 			dwc3_writel(dwc, DWC3_GUSB2PHYCFG(i), reg);
 		}
 
+		/*
+		 * Some platforms gate USB2 PHY power during deep sleep even
+		 * when device_may_wakeup is true, causing register state to be
+		 * lost.  Re-initialize the PHY to ensure clean signalling.
+		 */
+		if (dwc->reinit_phy_on_resume && !PMSG_IS_AUTO(msg)) {
+			for (i = 0; i < dwc->num_usb2_ports; i++) {
+				int ret;
+
+				ret = phy_exit(dwc->usb2_generic_phy[i]);
+				if (ret)
+					dev_warn_ratelimited(dwc->dev,
+						"failed to exit usb2 phy %d: %d\n",
+						i, ret);
+
+				ret = phy_init(dwc->usb2_generic_phy[i]);
+				if (ret)
+					dev_warn_ratelimited(dwc->dev,
+						"failed to init usb2 phy %d: %d\n",
+						i, ret);
+			}
+		}
+
 		for (i = 0; i < dwc->num_usb2_ports; i++)
 			phy_pm_runtime_get_sync(dwc->usb2_generic_phy[i]);
 		for (i = 0; i < dwc->num_usb3_ports; i++)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index a35b3db1f9f3..f64cf709e194 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1403,6 +1403,7 @@ struct dwc3 {
 	unsigned		dis_metastability_quirk:1;
 
 	unsigned		dis_split_quirk:1;
+	unsigned		reinit_phy_on_resume:1;
 	unsigned		async_callbacks:1;
 	unsigned		sys_wakeup:1;
 	unsigned		wakeup_configured:1;
-- 
2.53.0


