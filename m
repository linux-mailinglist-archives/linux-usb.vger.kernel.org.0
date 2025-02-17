Return-Path: <linux-usb+bounces-20723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD06A384F6
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEBD518861A5
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 13:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427D221D001;
	Mon, 17 Feb 2025 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="UbGomlAU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B90221CC68
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 13:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799726; cv=none; b=gQxvBgLyFcly+4qRYTqIwE9gzTlN0loqdtQOaaKxosQAAY8XCRr9OJ7foWHfRVAN/3hPOIJ2lxbppTE+BjMw0YOe3nNlqN3vfoveL+uO1ySqyz1EjuhZZsb1vAsDTbxr0Di9CjlSZ7J6Q1tluqbgEKlOWufk8v7VQNcD1+oBP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799726; c=relaxed/simple;
	bh=ownj+UYxwDiCCZfK4nWMQ+nmSx6GAAHMQGHZSgIwmQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K49T0+ytjGSp87O4FMXiP3VxYYcrzFsAJsoq6J2GmUemgkJ8+sbchFFSCog3EN5j9C4jEL+c8HQon1B3l3Frzqn7jRUgIVnmXmeluJgPGoqZdDuWvlwJB98Njf99LWsEo1GunJlxiHXNsTscGwv8SeQ1V3W4iMDX8bXv6TKH0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=UbGomlAU; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739799716; x=1740404516; i=wahrenst@gmx.net;
	bh=Gl8Thwb1Ar0aw74KuIIw5mO+kO5zERWOsXwNBMsXCCI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UbGomlAURIFZBBAZtC+bglWpNEw55u2H51LTY8WEtjXKafjgqV3YL1Jx4uiR11o1
	 de2F8/GuURuo4NlvAw3SuaHZd7RaWTZxWBPnyJM/5TtFqkFssM9BQyYu3dIl5bneK
	 std9MVISZq0W93LsATDnAh2mG1HVGLXv/Mok/A2KdN+xNP8pDQxWJ8XE43xdF3ZM9
	 JC7c90uupu4OWDsa/MlGoZfVS1+h8K3TgwWlsiR56+0v3xXDZCKTYgq2vvqUOU2aj
	 rJpqaIPizBoUV+jPNJiAa6m2O/zpQwVIISkzRK7OSIMA+Iq4vga+fO6VYVdNuYjzE
	 Y2JbWbeR+pJiUFBmNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1tuUz025co-00OxXI; Mon, 17
 Feb 2025 14:41:56 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	"Ivan T . Ivanov" <iivanov@suse.de>,
	linux-usb@vger.kernel.org,
	kernel-list@raspberrypi.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH V6 3/3] usb: dwc2: Implement recovery after PM domain off
Date: Mon, 17 Feb 2025 14:41:32 +0100
Message-Id: <20250217134132.36786-4-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217134132.36786-1-wahrenst@gmx.net>
References: <20250217134132.36786-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UKsu8D7wxkynBRponImLhoOpmONk1Y8jfA4A2KTtetE5t7YdOGk
 53s2aPj4RVK/62/ohUW4Gury+9VzasHmzAYoD4HBCqrtN3ooS1tRdmsrl6htccDKX264nKA
 5r0LtBAf+brCVSbDwNhbf8aHwC7DwDisFyMgtb7BY2Iq74E+apy2M2T0CvCM165IUWDE8J0
 LjyMENZ41hG8fj2iiQ4pw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3UcTzYIlkoU=;yjVKemGy16zVYQscOsbk2QCCI5O
 NBuG1plYwrKjDuZJwDLwOkompn2+ls1NqNSFYsIILlOy0xtFUq4YLq4qvmiPQe28Grh0l/wX3
 aSuaKjIWVEoyyYJejYAKnJIKq9XwEKa+OeQQMD2DMLxaj8j3heq6UW2Ab9YDBpUtTvikWf4V3
 LZ6+wG/fyx4y/PKJgDFENYpZsJvVwYPPsP/CgZiBzGBvvZ+IPbgoCgPdoP8/iMWPUphQf7jh9
 qx/lI77OlBVdHpsV/D64z1Dzf7D3pbEBrisLhwHDBzeQnTrAkMePoXMcw42L1l0v5Edsy/WA3
 v9a0owjj+vdGyOx8LMkFcm0yFElSNjFlAKOMgm3x8TQgo8hp/naPn66pfnUUl0PSKz2VNd0Mh
 1oHPfDFTCH4Q8TXiALRMcYHGc4qsV0xA7mAcZaRc0X/YaxRQxpYmj1QF9Q9AymqgCDrUIgtTq
 lSGCTP4FKv+r8b3yNKhktU9iA+YdBGCy7whsJ75p0LKApAUqL1HIykYtQ9f1PiqhiXC2b8WGF
 pLjVzW98E0lC9wU3RjDyXGBxhpk4He/23Jdtz7GaKFyoFMY3CcQywJjTHgYPy6FsGIkR7Ah8r
 lHolF6wwJcb88e521OlsH0A9GAVZTHBcYMSBTyHlvOFajdSsmz2tQbJcVqDVN0a/W+iLUCJZn
 81h2uSdCwoZN9Pfv1aBGEE7JaU++xQDJX6I/MyFA4mjVGhn/gYwmuSsDkDbFi9RZ/EbfmDA5w
 +8J9if55VWGmUrirx2Hq/aaW9z8+QDYKE6SgBNx162yenURzAOhjV+Ym463bgug0fMLICI8nR
 TONieBUNDCQjk9bCcVpPDkVJJKKYiCfequwvHMDzStaxCZsDrd+VXzruaQ4UW9EHv/PD9lbGy
 jvec6gBi4P83COvY1zAf/5Vb2Zn4vjWcXr+Imztqi2ZjPCYtl2wnrTri6FHOSJmk3cer2Yaek
 NXzv/ysD6jKaEhmTmeBvWc50v4bDLZNKxy41K63wgmu1qYZ1S97v4mRvbni9clXKr0z0+lsTr
 1YabqlXleh3P3a4t+nq2/DBb4kFqUxy4Ncwp9oD3KaMTLxrszoDq8d7ZG4TLo3cCXrxYEV+t5
 zEq7dE7511XypgFDYU4zbH3pkgvWj3gHDIzGgPzojJ2+PobZZlUfEX0nPBvVBKe7MZ3V7D/Qy
 S7qap0wHnsbngjqtoqqn8gwG2uI39ZXkKqBN1WXgEC/fp5s5nOQGQ1dtR1jQvMJkArFjmOANa
 JtEMD7MELTlLMUslryg0z4EKdN5ySgGfRYisFTDOGDEE1Y6HIxj3RWPHNvSYwTls+rYR1Nh9n
 kyVjG9lZh8VzkrgXT/3Q/wuoobk2R5hMj7Zob8zRDootZ08KObVCLq/RN/1r3e6dx5VNlCOTy
 ummYgV8QS+H/Bf0tc6Rg+XQsJiehbw5QfiTkY8qgsoj6puJmBK1iprkaTH

According to the dt-bindings there are some platforms, which have a
dedicated USB power domain for DWC2 IP core supply. If the power domain
is switched off during system suspend then all USB register will lose
their settings.

Use GUSBCFG_TOUTCAL as a canary to detect that the power domain has
been powered off during suspend. Since the GOTGCTL_CURMODE_HOST doesn't
match on all platform with the current mode, additionally backup
GINTSTS. This works reliable to decide which registers should be
restored.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
=2D--
 drivers/usb/dwc2/core.c     |  1 +
 drivers/usb/dwc2/core.h     |  2 ++
 drivers/usb/dwc2/platform.c | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 9919ab725d54..c3d24312db0f 100644
=2D-- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -43,6 +43,7 @@ int dwc2_backup_global_registers(struct dwc2_hsotg *hsot=
g)
 	/* Backup global regs */
 	gr =3D &hsotg->gr_backup;

+	gr->gintsts =3D dwc2_readl(hsotg, GINTSTS);
 	gr->gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
 	gr->gintmsk =3D dwc2_readl(hsotg, GINTMSK);
 	gr->gahbcfg =3D dwc2_readl(hsotg, GAHBCFG);
diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 265791fbe87f..34127b890b2a 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -667,6 +667,7 @@ struct dwc2_hw_params {
 /**
  * struct dwc2_gregs_backup - Holds global registers state before
  * entering partial power down
+ * @gintsts:		Backup of GINTSTS register
  * @gotgctl:		Backup of GOTGCTL register
  * @gintmsk:		Backup of GINTMSK register
  * @gahbcfg:		Backup of GAHBCFG register
@@ -683,6 +684,7 @@ struct dwc2_hw_params {
  * @valid:		True if registers values backuped.
  */
 struct dwc2_gregs_backup {
+	u32 gintsts;
 	u32 gotgctl;
 	u32 gintmsk;
 	u32 gahbcfg;
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 91c80a92d9b8..12b4dc07d08a 100644
=2D-- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -685,6 +685,14 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 		regulator_disable(dwc2->usb33d);
 	}

+	if (is_device_mode)
+		ret =3D dwc2_gadget_backup_critical_registers(dwc2);
+	else
+		ret =3D dwc2_host_backup_critical_registers(dwc2);
+
+	if (ret)
+		return ret;
+
 	if (dwc2->ll_hw_enabled &&
 	    (is_device_mode || dwc2_host_can_poweroff_phy(dwc2))) {
 		ret =3D __dwc2_lowlevel_hw_disable(dwc2);
@@ -694,6 +702,24 @@ static int __maybe_unused dwc2_suspend(struct device =
*dev)
 	return ret;
 }

+static int dwc2_restore_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_gregs_backup *gr;
+
+	gr =3D &hsotg->gr_backup;
+
+	if (!gr->valid) {
+		dev_err(hsotg->dev, "No valid register backup, failed to restore\n");
+		return -EINVAL;
+	}
+
+	if (gr->gintsts & GINTSTS_CURMODE_HOST)
+		return dwc2_host_restore_critical_registers(hsotg);
+
+	return dwc2_gadget_restore_critical_registers(hsotg, DWC2_RESTORE_DCTL |
+						      DWC2_RESTORE_DCFG);
+}
+
 static int __maybe_unused dwc2_resume(struct device *dev)
 {
 	struct dwc2_hsotg *dwc2 =3D dev_get_drvdata(dev);
@@ -706,6 +732,18 @@ static int __maybe_unused dwc2_resume(struct device *=
dev)
 	}
 	dwc2->phy_off_for_suspend =3D false;

+	/*
+	 * During suspend it's possible that the power domain for the
+	 * DWC2 controller is disabled and all register values get lost.
+	 * In case the GUSBCFG register is not initialized, it's clear the
+	 * registers must be restored.
+	 */
+	if (!(dwc2_readl(dwc2, GUSBCFG) & GUSBCFG_TOUTCAL_MASK)) {
+		ret =3D dwc2_restore_critical_registers(dwc2);
+		if (ret)
+			return ret;
+	}
+
 	if (dwc2->params.activate_stm_id_vb_detection) {
 		unsigned long flags;
 		u32 ggpio, gotgctl;
=2D-
2.34.1


