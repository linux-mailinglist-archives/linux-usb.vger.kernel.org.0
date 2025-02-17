Return-Path: <linux-usb+bounces-20722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BD1A384F4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 14:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D09D188D9BF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 13:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E965821CC76;
	Mon, 17 Feb 2025 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="p8DQtCas"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3021CC60
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799725; cv=none; b=nsrrr8QIKgY8WuBhO1HK9uVy9HL/fmt1PsMWiKemf7ucm/Db0EQsHSIX8qq8M2RzP89+6y2iaI7O36tKwffPQhrpi0+XGiHOEExBVjuYSgyOtfqil/Ewr7SMzypOZ5nXE7I4hqbhpC0hLFoWcIJNjaqIeORN2rxg0r+LQyXS7mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799725; c=relaxed/simple;
	bh=NLJhKND256gSjgqz5+jXNVwCkHAy7Lhhbara7R1G0Sk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qSV+K6l8jycFsAJfxtz+7Vg57zCoGiTTiwkUZa1D57QptgIb37OFOfoVpYMwxytGXM4nyhzPCT18iKWdlUI+C9koyuiW7JpfN4SmDhJkZqO5X3tK0Zsy60UIqfHthqtxT47n7wh71GSVtDaWiHDe0aLckQcS1noTUyH4YksFE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=p8DQtCas; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1739799715; x=1740404515; i=wahrenst@gmx.net;
	bh=JRrp6JLKk7ZewfhLxhmIMUVWuQ9FaYJ7taL+ewhOlow=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=p8DQtCasxpbiAkqDMqwWSv2jP7pVNr0lVG8MFKy61mdF1wZVEwJugPGc1YlW0m2+
	 Jp4KAQPwQ0lVPnOU8KEI3Lw1MefDg8LXwfvSE3ODl4yR9Hjcok02ICqL88wsSgGfs
	 co4gNlX5+z2ffUJdYNSmE39GkPAMmSlcuMVO5IWQx5vCxm/3EwcgQZ7ERjAZKxNLK
	 cL/6YTRnOe9V+FTZA+G2/E1IA4GDVO0M1Mga7AteUy+qQvbM0S8wUiVv05I7OX+cu
	 bXFQxofzVpT1mldPVbv/jkUTe47FJC4d/Sd6bJv87RVUacDWXee/Yuxt3KSmCf+Wi
	 tTJVwrmQWuKTapxxXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1t3Dq32XXo-00ei26; Mon, 17
 Feb 2025 14:41:55 +0100
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
Subject: [PATCH V6 1/3] usb: dwc2: gadget: Introduce register restore flags
Date: Mon, 17 Feb 2025 14:41:30 +0100
Message-Id: <20250217134132.36786-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:DAtspM6ApsVscXD8RxKAvYGuRjPdiNmHX0lerypzGMsPzepb3Ur
 AUXc9M4pKIvIq0XZ26XoTPsMOqKyEZzvZBcaBQabwIMD8Rh6Ls9fLqAyJqnjSos2C/86ZZV
 TjB8jW3Hg4v33P/EqqgEfwpRKK5P7i66fO0jKC15Mz/Mx50YAo9nJ6QGGRakVVkJxP+5qDN
 01OnBMAWoWsTPPAF1xpog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HFRa0NycnTw=;YRRDXTYZjJo8aC6mDxURqiWbctT
 kxUeI8nWeU9X9JC7AVuCb3fubMDykz6weQgqp0yZ+wpz/5ff25t/kmoLVBPIZh2kPnGzBR7hr
 S9AHdu4A9DWPcS/SBupBeoCcViSoYQpsUlfU7E7ZN3H6ZJabVMHIk74WUrSbuezu9MAmc6gl8
 Tgy0FoSrSEqQ/0CJ5VamE9nI76vcY4EB+gcMPoe366AtEnrl7xRYPf/CEtAM2JLUJmk6NzxqB
 aTntQ080OUIO+ZT9KtoKjFTvNZUEs5IEEG4uTecOasKNUOTNTgakudYcUloo9yAJmB50ybJiM
 OtKpgCsE7QyB4AP9X4F0ghL2tFGGKKW0knh9J+l9YygU4WwypJ9Q1K+RyyBYDp6L5zIozcmYg
 aPu9g6wvTJwCfLT9b5Dcwahb7vbWYW2+19GGeSdae13NlWbX+xYyXw2M+7tXRGYCBK7D05ta9
 cWDXIvUBgYwlHjsgworru2S/UIpm0dxPYeaAadUSelIhQrjK14JF3sfa8U/s0qrEIDaue5uWH
 LCAqWNBPGQLupV0bcuPyylNWWaURHqLUoOO7gakn/JBdzsDuCliwxE/+BnlFGo55ATAM6VWRK
 4mGg9YcWoNTEwxMmdKC6lbrhZz70EJdTCb/m5rp6jeR4XMEOVmxR7Zs+v11YICkBmDJ8Ma8mG
 oRfmItr4KBL+HzLC92FKXsf8h551ccwuVkl1sZIw6HBI/tLfr1C7XtlzGUoefEVZWzRctYQdF
 UCnt+n06c77RD2bY+KZbDWGp04Lbzr3miWc2KgZ7CkzPOdPmZjMvzfUnhU6+E2tjvHSFuueK5
 d/ojFxlm4C5uppyE6aAkPW64w2Mmy3nghauHaeZp71meouxiqiT6CKvktMRhuc6YDoiXshD5+
 y0lLcT81UfPLeun9WSP8m50SYKN/g3NsY7gfa7n3mpQA/Slrya2C3gax2dJ3Izf5bDdkhZtnE
 INcA/NorEKwDrfWlSOtR1avJ0xsgm3RO1ByIsYOqIyLkHBH/3tMzJsEikOFf+pKH3JUSIl8F7
 Kebqfk0rrtvKol71EYDYEaGPsrrbqveb2zBjf9qCq+juiGUO/R/vDxBqjrOUYWPFHqI20bTes
 hZlMBQ57mB0TsUxBJLnid5Ru2OFjslnF8sMgVCLpjAe8l6aVP48jS1NNeUMq7C9v01BcvO1es
 X7saFKWZYkc1Z+6VdDngEKp+jMH/uQOAwFcFagOSSLIihpUGCkioevSCREdgf53QbjSMVURl5
 ZmlgQhudHoC1TCKK0Y0P6cK8tPDbtbRa8jnbfvC518ncpKUWUDYepnLDvIW3MY3grUa6ApSf+
 inMMmWH+rJ6EUpFze46CAUk8yymw+Kf9+Nd50YtnS//RJuNTLJELAheP45T6fhF5oF1m++S5O
 9diavOVC9ttqpzzGnc1DR/tNXLjfKv8qts+eai2zfrbb8tv6kd9tsWLa6D

dwc2_restore_device_registers() use a single boolean
to decide about the register restoring behavior.
So replace this with a flags parameter, which can
be extended later.

No functional change intended.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/usb/dwc2/core.h   |  6 ++++--
 drivers/usb/dwc2/gadget.c | 12 +++++++-----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 2bd74f3033ed..48f4b639ca2f 100644
=2D-- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1127,6 +1127,8 @@ struct dwc2_hsotg {
 #define DWC2_FS_IOT_ID		0x55310000
 #define DWC2_HS_IOT_ID		0x55320000

+#define DWC2_RESTORE_DCTL BIT(0)
+
 #if IS_ENABLED(CONFIG_USB_DWC2_HOST) || IS_ENABLED(CONFIG_USB_DWC2_DUAL_R=
OLE)
 	union dwc2_hcd_internal_flags {
 		u32 d32;
@@ -1420,7 +1422,7 @@ int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *hsot=
g, int testmode);
 #define dwc2_is_device_connected(hsotg) (hsotg->connected)
 #define dwc2_is_device_enabled(hsotg) (hsotg->enabled)
 int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg);
-int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wa=
keup);
+int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, unsigned int =
flags);
 int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg);
 int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *hsotg,
 				 int rem_wakeup, int reset);
@@ -1459,7 +1461,7 @@ static inline int dwc2_hsotg_set_test_mode(struct dw=
c2_hsotg *hsotg,
 static inline int dwc2_backup_device_registers(struct dwc2_hsotg *hsotg)
 { return 0; }
 static inline int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg,
-						int remote_wakeup)
+						unsigned int flags)
 { return 0; }
 static inline int dwc2_gadget_enter_hibernation(struct dwc2_hsotg *hsotg)
 { return 0; }
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index e7bf9cc635be..96d703f4c509 100644
=2D-- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -5203,11 +5203,11 @@ int dwc2_backup_device_registers(struct dwc2_hsotg=
 *hsotg)
  * if controller power were disabled.
  *
  * @hsotg: Programming view of the DWC_otg controller
- * @remote_wakeup: Indicates whether resume is initiated by Device or Hos=
t.
+ * @flags: Defines which registers should be restored.
  *
  * Return: 0 if successful, negative error code otherwise
  */
-int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, int remote_wa=
keup)
+int dwc2_restore_device_registers(struct dwc2_hsotg *hsotg, unsigned int =
flags)
 {
 	struct dwc2_dregs_backup *dr;
 	int i;
@@ -5223,7 +5223,7 @@ int dwc2_restore_device_registers(struct dwc2_hsotg =
*hsotg, int remote_wakeup)
 	}
 	dr->valid =3D false;

-	if (!remote_wakeup)
+	if (flags & DWC2_RESTORE_DCTL)
 		dwc2_writel(hsotg, dr->dctl, DCTL);

 	dwc2_writel(hsotg, dr->daintmsk, DAINTMSK);
@@ -5414,6 +5414,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 	u32 gpwrdn;
 	u32 dctl;
 	int ret =3D 0;
+	unsigned int flags =3D 0;
 	struct dwc2_gregs_backup *gr;
 	struct dwc2_dregs_backup *dr;

@@ -5476,6 +5477,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 		dctl =3D dwc2_readl(hsotg, DCTL);
 		dctl |=3D DCTL_PWRONPRGDONE;
 		dwc2_writel(hsotg, dctl, DCTL);
+		flags |=3D DWC2_RESTORE_DCTL;
 	}
 	/* Wait for interrupts which must be cleared */
 	mdelay(2);
@@ -5491,7 +5493,7 @@ int dwc2_gadget_exit_hibernation(struct dwc2_hsotg *=
hsotg,
 	}

 	/* Restore device registers */
-	ret =3D dwc2_restore_device_registers(hsotg, rem_wakeup);
+	ret =3D dwc2_restore_device_registers(hsotg, flags);
 	if (ret) {
 		dev_err(hsotg->dev, "%s: failed to restore device registers\n",
 			__func__);
@@ -5619,7 +5621,7 @@ int dwc2_gadget_exit_partial_power_down(struct dwc2_=
hsotg *hsotg,
 		/* Restore DCFG */
 		dwc2_writel(hsotg, dr->dcfg, DCFG);

-		ret =3D dwc2_restore_device_registers(hsotg, 0);
+		ret =3D dwc2_restore_device_registers(hsotg, DWC2_RESTORE_DCTL);
 		if (ret) {
 			dev_err(hsotg->dev, "%s: failed to restore device registers\n",
 				__func__);
=2D-
2.34.1


