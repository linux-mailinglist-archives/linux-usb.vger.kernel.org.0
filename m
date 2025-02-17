Return-Path: <linux-usb+bounces-20720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73469A384E6
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 14:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 287157A358E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 13:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F75E21CA10;
	Mon, 17 Feb 2025 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cDDmFWr7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933782185A3
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 13:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799721; cv=none; b=RDdFmUTm4nTyeeK3KupigkGCfR7G0zjibuAw1o3I1vY7ERMik9eE5+P0N+qHY3LLX9IWIMysWJP9xt/A7rSogI2WgWlQIh1cDeYR0oy76zosVs+XUfuDZBWBG+rvSr4EFFjIlTBR1sS6ilrUusuTuQXPKoxLwZDiFrPUrruJmJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799721; c=relaxed/simple;
	bh=fhyJwPRa3XnBmf6wTquJoay9exRZroYKCtEvRVXNviI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OfUfRiUinjUxXhSrh4hR4plv6+IculKnT6TeC7U2XBE0c1Nv1S/OJYjKFFEzv3F2cfhHOvDYbNAVCZ2n2TAGKs1eQjcxUqHTgHA83Ap7DpUnjcQmX45NH7lYt44aKz5X2RWniiyqY8QupPhBBA+m8TJxz8iO6yZnvhZoxT3D7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cDDmFWr7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739799716; x=1740404516; i=wahrenst@gmx.net;
	bh=9n6Xh5tNA6Lo754p4NxvbSLbqirZz2kDoCHbo7rPufU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cDDmFWr7MA0UtpJaLf3leVhJwgBSWT9bJUHucUrXPc52QJL/jdEhDnPSqGzjNQHw
	 BhJ9v4m+d+gdhktV0rg8wWjolu3pfisg9eFnxd9bg6AYaxAGRdGWmA/Za2GVe03EA
	 P0Rp9kkt2TWWEwcrzrYp0EbyhA4nucMHoctKC0tOigbMdfjMTq51BXIojqUC+WtO2
	 /heHs7A8P5eDMCVUQD4OBAwTOLFfMeQ0GzWuzuGte6wsRmltne3pkK/3jCNi7PtJT
	 9Lm45+Vhe9WRz2FWX3pOX7bfaJbc68LdiLW2sHUt6HMs3iM2mhfG6kq1UEIynarRX
	 NGqrhwImVpzbUaazDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkHMP-1t42mo49yT-00g4wp; Mon, 17
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
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V6 2/3] usb: dwc2: Refactor backup/restore of registers
Date: Mon, 17 Feb 2025 14:41:31 +0100
Message-Id: <20250217134132.36786-3-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:qh1HomvCGNAlKzubJV3LKfJ4nmnq9rMIsxM4sKBlwRxkjXBU6KB
 98L8GA2ZVgFnqgoI+OKsmDto8to77dGqYGNoYU9g/DHmsuFOJf0QR9g7qnHyKMPjmu3Rqym
 m/48QcKyERSFXMMltiqesgGI4iEZ5G8P2NJ4c/knxR+4b0lqTdDkEauVHyBaOfda6lDjSa5
 bEzMPsK34TcAbPP+aCWTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P8qKTjSE+nM=;dBXYgqpvB8ZDZZxY7h/vR0VaBpS
 dA01Rj6J6ClOHXOrVtA3sjpZvAlJU+bEwzmdksUtfiVbCvMKNV3rbp35WAViBk74M9xGKcO76
 64ZL4zzRKv8dG3JWICUfqHPPKtM1PmCPfK+3nI9U0mQOBv3K/bvNqONIHst10C8kgtLBy6KD5
 NVsFARHQIOcN9kyPZ1zduLmJkklziqd5a3XMojGZO1opi0CYyncb4Coxu5CL9gQrjFtvgtWKx
 Voeg2M60ya0oFW1PX18AL/mmUx2VYoM9T9PuxLIl6bxL96iTDYc70P41F75TU7P6I4adaEY8h
 Gztm9JwS5SPz+Dzw7YAHJOxIo+z07qiwGUX0P47smLJpts1gKYrXPYS4H8QdiB/7j/afXYCKo
 H+vNzaqk4gJ/8TGPGwGv5urR0rbwW+TLjyOhzxPvV/T1CE35ObCy1SrU9xVgqtc2VZufZyJoO
 MIryO3NO57XUBIuq6Q7CrYV8Jpdll8BzIgvpo7mqztjDYpo60b0Qo6pdGvZJE+cXPyC3dNbsZ
 ph6djVlNH7ha1OsWaqXvnQwF7uNitO93O06EMmAqq179s1mmXLVAGM8JnkZcv+Ovk2ntm3oHe
 DS07H40OcfjwSrarRjlkqHkMZz6UGBdRDzDcEX9S4IOqdNBULYM4g/F72sJW/G8DJCSQ1xWmc
 bbl+QHQOeKO13uDIocQl69JMadnmiKuGlQzxFmXIzpDBQjox4KXGgqxsKuDWBIXeFIpTujN3p
 7mdEDP9RmEHedieGLewRmmn16axtSYfYkN8ok8Bj6hHDx1cZS0ry/ZwXagSPlr53GlGj9NO/V
 X/0K3CinuCDYFBb8rm3/1Rky+SFoF6113oL1KQsULzP1YBt5ywk4ZvRfMju147N2UlB42yJOI
 KBP+fVz3FUHB1d4ER9rMS2Gi2kMOpux7GLs8L/YBnEtvXBRSXHTLPU/SD7PPSik9A/hxyv3Sq
 iXyA1MpXuhehddNeaP70uo7B0pdTOStlZHYqtlVwGnotag4FXQ/KDJ+UZw3M0WELaxLWujkAe
 yKs++v9IWGMbJG5w/jFldT8R2JzQh6STsbxzRj3e0x8lR4NVyTzTDv6WCq5u6blkbIL6cOsOh
 Bmi61Fapc2Jv0+j8Nzjw2okBiun2JZu4rC08/OMoamWc/P5IScQVhlCEoyMBSw68JngspXTqX
 BolJ9lP5bwg0CTiZDybSP1uy1Gcw/PBZM7iGZHlTxCay3UVgECUUjsC2QblqvAxhaGpM8H4yn
 /ebSwxMp/MFr2qdzSUR9zI3SuxWCLqq9/k9tvmLOBZ3/SCp2g1u2DQBa5hEQSEYdcyXc2Clek
 bTcoYBUC49DQZi5QxOrMoUMkh6CWFwJ/Y3H1xKWmo9U88JVGCfZ7MIChLB0MIlSFNdT8IwUB/
 iG3mGNm9ALkfNUJocnK84xTyI/9ISC13wlGqiDpp4lse/E0xjm+L/ZgtM+

The DWC2 runtime PM code reuses similar patterns to backup and
restore the registers. So consolidate them in USB mode specific
variants. This also has the advantage it is reusable for further
PM improvements.

Special care is taken for DCFG register during device mode restore.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/core.h   |  15 ++++++
 drivers/usb/dwc2/gadget.c | 108 +++++++++++++++++++-------------------
 drivers/usb/dwc2/hcd.c    |  99 +++++++++++++++++-----------------
 3 files changed, 121 insertions(+), 101 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 48f4b639ca2f..265791fbe87f 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1128,6 +1128,7 @@ struct dwc2_hsotg {
 #define DWC2_HS_IOT_ID		0x55320000

 #define DWC2_RESTORE_DCTL BIT(0)
+#define DWC2_RESTORE_DCFG BIT(1)

 #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_R=
OLE)
 	union dwc2_hcd_internal_flags {
@@ -1437,6 +1438,9 @@ int dwc2_hsotg_tx_fifo_total_depth(struct dwc2_hsotg=
 *hsotg);
 int dwc2_hsotg_tx_fifo_average_depth(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg);
 void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg *hsotg);
+int dwc2_gadget_restore_critical_registers(struct dwc2_hsotg *hsotg,
+					   unsigned int flags);
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg)
 { hsotg->fifo_map =3D 0; }
 #else
@@ -1484,6 +1488,11 @@ static inline int dwc2_hsotg_tx_fifo_average_depth(=
struct dwc2_hsotg *hsotg)
 { return 0; }
 static inline void dwc2_gadget_init_lpm(struct dwc2_hsotg *hsotg) {}
 static inline void dwc2_gadget_program_ref_clk(struct dwc2_hsotg *hsotg) =
{}
+static inline int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg=
 *hsotg)
+{ return 0; }
+static inline int dwc2_gadget_restore_critical_registers(struct dwc2_hsot=
g *hsotg,
+							 unsigned int flags)
+{ return 0; }
 static inline void dwc2_clear_fifo_map(struct dwc2_hsotg *hsotg) {}
 #endif

@@ -1507,6 +1516,8 @@ int dwc2_host_exit_partial_power_down(struct dwc2_hs=
otg *hsotg,
 void dwc2_host_enter_clock_gating(struct dwc2_hsotg *hsotg);
 void dwc2_host_exit_clock_gating(struct dwc2_hsotg *hsotg, int rem_wakeup=
);
 bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2);
+int dwc2_host_backup_critical_registers(struct dwc2_hsotg *hsotg);
+int dwc2_host_restore_critical_registers(struct dwc2_hsotg *hsotg);
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)
 { schedule_work(&hsotg->phy_reset_work); }
 #else
@@ -1546,6 +1557,10 @@ static inline void dwc2_host_exit_clock_gating(stru=
ct dwc2_hsotg *hsotg,
 					       int rem_wakeup) {}
 static inline bool dwc2_host_can_poweroff_phy(struct dwc2_hsotg *dwc2)
 { return false; }
+static inline int dwc2_host_backup_critical_registers(struct dwc2_hsotg *=
hsotg)
+{ return 0; }
+static inline int dwc2_host_restore_critical_registers(struct dwc2_hsotg =
*hsotg)
+{ return 0; }
 static inline void dwc2_host_schedule_phy_reset(struct dwc2_hsotg *hsotg)=
 {}

 #endif
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 96d703f4c509..2e071a0342f8 100644
=2D-- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5223,6 +5223,9 @@ int dwc2_restore_device_registers(struct dwc2_hsotg =
*hsotg, unsigned int flags)
 	}
 	dr->valid =3D false;

+	if (flags & DWC2_RESTORE_DCFG)
+		dwc2_writel(hsotg, dr->dcfg, DCFG);
+
 	if (flags & DWC2_RESTORE_DCTL)
 		dwc2_writel(hsotg, dr->dctl, DCTL);

@@ -5309,6 +5312,49 @@ void dwc2_gadget_program_ref_clk(struct dwc2_hsotg =
*hsotg)
 	dev_dbg(hsotg->dev, "GREFCLK=3D0x%08x\n", dwc2_readl(hsotg, GREFCLK));
 }

+int dwc2_gadget_backup_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_device_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int dwc2_gadget_restore_critical_registers(struct dwc2_hsotg *hsotg,
+					   unsigned int flags)
+{
+	int ret;
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+	ret =3D dwc2_restore_device_registers(hsotg, flags);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * dwc2_gadget_enter_hibernation() - Put controller in Hibernation.
  *
@@ -5326,18 +5372,9 @@ int dwc2_gadget_enter_hibernation(struct dwc2_hsotg=
 *hsotg)
 	/* Change to L2(suspend) state */
 	hsotg->lx_state =3D DWC2_L2;
 	dev_dbg(hsotg->dev, "Start of hibernation completed\n");
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-	ret =3D dwc2_backup_device_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	gpwrdn =3D GPWRDN_PWRDNRSTN;
 	udelay(10);
@@ -5485,20 +5522,9 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg =
*hsotg,
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);

 	/* Restore global registers */
-	ret =3D dwc2_restore_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore registers\n",
-			__func__);
-		return ret;
-	}
-
-	/* Restore device registers */
-	ret =3D dwc2_restore_device_registers(hsotg, flags);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_restore_critical_registers(hsotg, flags);
+	if (ret)
 		return ret;
-	}

 	if (rem_wakeup) {
 		mdelay(10);
@@ -5532,19 +5558,9 @@ int dwc2_gadget_enter_partial_power_down(struct dwc=
2_hsotg *hsotg)
 	dev_dbg(hsotg->dev, "Entering device partial power down started.\n");

 	/* Backup all registers */
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-
-	ret =3D dwc2_backup_device_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup device registers\n",
-			__func__);
+	ret =3D dwc2_gadget_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/*
 	 * Clear any pending interrupts since dwc2 will not be able to
@@ -5591,11 +5607,8 @@ int dwc2_gadget_exit_partial_power_down(struct dwc2=
_hsotg *hsotg,
 {
 	u32 pcgcctl;
 	u32 dctl;
-	struct dwc2_dregs_backup *dr;
 	int ret =3D 0;

-	dr =3D &hsotg->dr_backup;
-
 	dev_dbg(hsotg->dev, "Exiting device partial Power Down started.\n");

 	pcgcctl =3D dwc2_readl(hsotg, PCGCTL);
@@ -5612,21 +5625,10 @@ int dwc2_gadget_exit_partial_power_down(struct dwc=
2_hsotg *hsotg,

 	udelay(100);
 	if (restore) {
-		ret =3D dwc2_restore_global_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore registers\n",
-				__func__);
-			return ret;
-		}
-		/* Restore DCFG */
-		dwc2_writel(hsotg, dr->dcfg, DCFG);
-
-		ret =3D dwc2_restore_device_registers(hsotg, DWC2_RESTORE_DCTL);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore device registers\n",
-				__func__);
+		ret =3D dwc2_gadget_restore_critical_registers(hsotg, DWC2_RESTORE_DCTL=
 |
+							     DWC2_RESTORE_DCFG);
+		if (ret)
 			return ret;
-		}
 	}

 	/* Set the Power-On Programming done bit */
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 8c3941ecaaf5..869245238d6c 100644
=2D-- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5474,6 +5474,49 @@ int dwc2_restore_host_registers(struct dwc2_hsotg *=
hsotg)
 	return 0;
 }

+int dwc2_host_backup_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	/* Backup all registers */
+	ret =3D dwc2_backup_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_backup_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int dwc2_host_restore_critical_registers(struct dwc2_hsotg *hsotg)
+{
+	int ret;
+
+	ret =3D dwc2_restore_global_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore registers\n",
+			__func__);
+		return ret;
+	}
+
+	ret =3D dwc2_restore_host_registers(hsotg);
+	if (ret) {
+		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
+			__func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 /**
  * dwc2_host_enter_hibernation() - Put controller in Hibernation.
  *
@@ -5489,18 +5532,9 @@ int dwc2_host_enter_hibernation(struct dwc2_hsotg *=
hsotg)
 	u32 gpwrdn;

 	dev_dbg(hsotg->dev, "Preparing host for hibernation\n");
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-	ret =3D dwc2_backup_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
-			__func__);
+	ret =3D dwc2_host_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/* Enter USB Suspend Mode */
 	hprt0 =3D dwc2_readl(hsotg, HPRT0);
@@ -5694,20 +5728,9 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *h=
sotg, int rem_wakeup,
 	dwc2_writel(hsotg, 0xffffffff, GINTSTS);

 	/* Restore global registers */
-	ret =3D dwc2_restore_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore registers\n",
-			__func__);
+	ret =3D dwc2_host_restore_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}
-
-	/* Restore host registers */
-	ret =3D dwc2_restore_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to restore host registers\n",
-			__func__);
-		return ret;
-	}

 	if (rem_wakeup) {
 		dwc2_hcd_rem_wakeup(hsotg);
@@ -5774,19 +5797,9 @@ int dwc2_host_enter_partial_power_down(struct dwc2_=
hsotg *hsotg)
 		dev_warn(hsotg->dev, "Suspend wasn't generated\n");

 	/* Backup all registers */
-	ret =3D dwc2_backup_global_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup global registers\n",
-			__func__);
-		return ret;
-	}
-
-	ret =3D dwc2_backup_host_registers(hsotg);
-	if (ret) {
-		dev_err(hsotg->dev, "%s: failed to backup host registers\n",
-			__func__);
+	ret =3D dwc2_host_backup_critical_registers(hsotg);
+	if (ret)
 		return ret;
-	}

 	/*
 	 * Clear any pending interrupts since dwc2 will not be able to
@@ -5855,19 +5868,9 @@ int dwc2_host_exit_partial_power_down(struct dwc2_h=
sotg *hsotg,

 	udelay(100);
 	if (restore) {
-		ret =3D dwc2_restore_global_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore registers\n",
-				__func__);
-			return ret;
-		}
-
-		ret =3D dwc2_restore_host_registers(hsotg);
-		if (ret) {
-			dev_err(hsotg->dev, "%s: failed to restore host registers\n",
-				__func__);
+		ret =3D dwc2_host_restore_critical_registers(hsotg);
+		if (ret)
 			return ret;
-		}
 	}

 	/* Drive resume signaling and exit suspend mode on the port. */
=2D-
2.34.1


