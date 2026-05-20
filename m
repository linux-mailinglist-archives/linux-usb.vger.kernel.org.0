Return-Path: <linux-usb+bounces-37811-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBCRL1VFDmoM9gUAu9opvQ
	(envelope-from <linux-usb+bounces-37811-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 01:35:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867859CD03
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 01:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0430333A655
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 22:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8833C276B;
	Wed, 20 May 2026 22:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="crWfsvE8"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB43BE645;
	Wed, 20 May 2026 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316391; cv=none; b=CINFo+Beida6QwbLMth720IoAAPA4OhyOc72TjYNS1RjauFfsdkvDh3HplZb2v2i3nborTeenLIYQ3OrsU3KfFJvKdwwwOOut4VpldfxkqFJpo+eLLrapozEHn8abg9urcWzCbSmdKAqtNnpDqN3EInhsp8kSuIaaW+iVoothW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316391; c=relaxed/simple;
	bh=5/1R74shK3Tn8Bck/o5/nxjVx9PnnRDhcbkZzc/d5kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ixIFUYuUhznNuM9DySicl3CHBfEAqEM+C5sHzL+GArWkzU5eJBBOybvUvWgKA9PCH5JKHx9qQyWOh4xCnyOOXEAccpmiwi5Zk0O+9ts54oF/PD9jpDZYPhvf0gX9KRHVSbZhCRVtOTiiPTZwJp8JUB8azuYIujv9QjMqjBHd3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=crWfsvE8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n83U7pzz5XNbi+6U2kC2vS+HbDYB7ASKXOCxhhwOLnk=; b=crWfsvE8qOzGgW+9r5nxuTdGAo
	GtGORhILPHDEfqwevZNw78Y/W4qXslGUuqBpHo3KkrxDOcJZcUWgSH6AJyJjLKuzq6o6AiRRfaVrH
	Xzccq9eVPNtUv/Ky1TctzjwEeRfaTNy0Ap1iuEDyE4ApOvOUuBMCGX7WMvO79X1zBYp0uRwx30vty
	XQVE6aU0ggvPV+Ds69Ro1eeAekkcdNfX52Qp3ymDTilc47jOx0xB/eSvDKQ1xkNEmiHEtUMmj+oFR
	8OHIVi0HbS2lReaKXGes1/sabOQHy+/ziN+1IFpN/43N1PiY7FB0rEa5OxQP7ZjG1uSistM89osvl
	z0Pxwbfg==;
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPpTM-0043AI-TI; Thu, 21 May 2026 00:33:05 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 20 May 2026 19:32:51 -0300
Subject: [PATCH 2/2] usb: atm: ueagle-atm: remove function entry/exit debug
 messages
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ueagle-atm-cleanup-v1-2-010c8bc7b214@igalia.com>
References: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
In-Reply-To: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37811-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,igalia.com:mid,igalia.com:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 4867859CD03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the driver-internal function entry/exit debug messages
in favor of existing kernel-level function tracing mechanisms.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/all/2026051657-scruffy-embark-45ea@gregkh/
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/usb/atm/ueagle-atm.c | 56 +++++---------------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 71559a934133a82ddb23d255e0f04d018c13c583..ed2611aacb252fce829b4a33589c47912aadbe67 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -51,12 +51,6 @@
 				"[ueagle-atm vdbg]  " format, ##args); \
 	} while (0)
 
-#define uea_enters(usb_dev) \
-	uea_vdbg(usb_dev, "entering %s\n" , __func__)
-
-#define uea_leaves(usb_dev) \
-	uea_vdbg(usb_dev, "leaving  %s\n" , __func__)
-
 #define uea_err(usb_dev, format, args...) \
 	dev_err(&(usb_dev)->dev , "[UEAGLE-ATM] " format , ##args)
 
@@ -606,7 +600,6 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
 	u32 crc = 0;
 	int ret, size;
 
-	uea_enters(usb);
 	if (!fw_entry) {
 		uea_err(usb, "firmware is not available\n");
 		goto err;
@@ -670,7 +663,6 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
 	uea_err(usb, "firmware is corrupted\n");
 err:
 	release_firmware(fw_entry);
-	uea_leaves(usb);
 }
 
 /*
@@ -681,7 +673,6 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
 	int ret;
 	char *fw_name = EAGLE_FIRMWARE;
 
-	uea_enters(usb);
 	uea_info(usb, "pre-firmware device, uploading firmware\n");
 
 	switch (ver) {
@@ -710,7 +701,6 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
 	else
 		uea_info(usb, "loading firmware %s\n", fw_name);
 
-	uea_leaves(usb);
 	return ret;
 }
 
@@ -1137,7 +1127,6 @@ static int uea_cmv_e1(struct uea_softc *sc,
 	struct cmv_e1 cmv;
 	int ret;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	uea_vdbg(INS_TO_USBDEV(sc), "Function : %d-%d, Address : %c%c%c%c, "
 			"offset : 0x%04x, data : 0x%08x\n",
 			E1_FUNCTION_TYPE(function),
@@ -1164,9 +1153,8 @@ static int uea_cmv_e1(struct uea_softc *sc,
 							sizeof(cmv), &cmv);
 	if (ret < 0)
 		return ret;
-	ret = wait_cmv_ack(sc);
-	uea_leaves(INS_TO_USBDEV(sc));
-	return ret;
+
+	return wait_cmv_ack(sc);
 }
 
 static int uea_cmv_e4(struct uea_softc *sc,
@@ -1175,7 +1163,6 @@ static int uea_cmv_e4(struct uea_softc *sc,
 	struct cmv_e4 cmv;
 	int ret;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	memset(&cmv, 0, sizeof(cmv));
 
 	uea_vdbg(INS_TO_USBDEV(sc), "Function : %d-%d, Group : 0x%04x, "
@@ -1199,9 +1186,8 @@ static int uea_cmv_e4(struct uea_softc *sc,
 							sizeof(cmv), &cmv);
 	if (ret < 0)
 		return ret;
-	ret = wait_cmv_ack(sc);
-	uea_leaves(INS_TO_USBDEV(sc));
-	return ret;
+
+	return wait_cmv_ack(sc);
 }
 
 static inline int uea_read_cmv_e1(struct uea_softc *sc,
@@ -1295,7 +1281,6 @@ static int uea_stat_e1(struct uea_softc *sc)
 	u32 data;
 	int ret;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	data = sc->stats.phy.state;
 
 	ret = uea_read_cmv_e1(sc, E1_SA_STAT, 0, &sc->stats.phy.state);
@@ -1438,7 +1423,6 @@ static int uea_stat_e4(struct uea_softc *sc)
 	u32 tmp_arr[2];
 	int ret;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	data = sc->stats.phy.state;
 
 	/* XXX only need to be done before operationnal... */
@@ -1805,7 +1789,6 @@ static int uea_start_reset(struct uea_softc *sc)
 	u16 zero = 0;	/* ;-) */
 	int ret;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	uea_info(INS_TO_USBDEV(sc), "(re)booting started\n");
 
 	/* mask interrupt */
@@ -1873,7 +1856,6 @@ static int uea_start_reset(struct uea_softc *sc)
 		return ret;
 
 	sc->reset = 0;
-	uea_leaves(INS_TO_USBDEV(sc));
 	return ret;
 }
 
@@ -1889,7 +1871,6 @@ static int uea_kthread(void *data)
 	int ret = -EAGAIN;
 
 	set_freezable();
-	uea_enters(INS_TO_USBDEV(sc));
 	while (!kthread_should_stop()) {
 		if (ret < 0 || sc->reset)
 			ret = uea_start_reset(sc);
@@ -1898,7 +1879,7 @@ static int uea_kthread(void *data)
 		if (ret != -EAGAIN)
 			uea_wait(sc, 0, msecs_to_jiffies(1000));
 	}
-	uea_leaves(INS_TO_USBDEV(sc));
+
 	return ret;
 }
 
@@ -1911,8 +1892,6 @@ static int load_XILINX_firmware(struct uea_softc *sc)
 	u8 value;
 	char *fw_name = FPGA930_FIRMWARE;
 
-	uea_enters(INS_TO_USBDEV(sc));
-
 	ret = request_firmware(&fw_entry, fw_name, &sc->usb_dev->dev);
 	if (ret) {
 		uea_err(INS_TO_USBDEV(sc), "firmware %s is not available\n",
@@ -1956,7 +1935,6 @@ static int load_XILINX_firmware(struct uea_softc *sc)
 err1:
 	release_firmware(fw_entry);
 err0:
-	uea_leaves(INS_TO_USBDEV(sc));
 	return ret;
 }
 
@@ -1966,7 +1944,6 @@ static void uea_dispatch_cmv_e1(struct uea_softc *sc, struct intr_pkt *intr)
 	struct cmv_dsc_e1 *dsc = &sc->cmv_dsc.e1;
 	struct cmv_e1 *cmv = &intr->u.e1.s2.cmv;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	if (le16_to_cpu(cmv->wPreamble) != E1_PREAMBLE)
 		goto bad1;
 
@@ -1990,7 +1967,6 @@ static void uea_dispatch_cmv_e1(struct uea_softc *sc, struct intr_pkt *intr)
 	if (cmv->bFunction == E1_MAKEFUNCTION(E1_ADSLDIRECTIVE,
 							E1_MODEMREADY)) {
 		wake_up_cmv_ack(sc);
-		uea_leaves(INS_TO_USBDEV(sc));
 		return;
 	}
 
@@ -2004,7 +1980,6 @@ static void uea_dispatch_cmv_e1(struct uea_softc *sc, struct intr_pkt *intr)
 	sc->data = sc->data << 16 | sc->data >> 16;
 
 	wake_up_cmv_ack(sc);
-	uea_leaves(INS_TO_USBDEV(sc));
 	return;
 
 bad2:
@@ -2012,14 +1987,12 @@ static void uea_dispatch_cmv_e1(struct uea_softc *sc, struct intr_pkt *intr)
 			"Function : %d, Subfunction : %d\n",
 			E1_FUNCTION_TYPE(cmv->bFunction),
 			E1_FUNCTION_SUBTYPE(cmv->bFunction));
-	uea_leaves(INS_TO_USBDEV(sc));
 	return;
 
 bad1:
 	uea_err(INS_TO_USBDEV(sc), "invalid cmv received, "
 			"wPreamble %d, bDirection %d\n",
 			le16_to_cpu(cmv->wPreamble), cmv->bDirection);
-	uea_leaves(INS_TO_USBDEV(sc));
 }
 
 /* The modem send us an ack. First with check if it right */
@@ -2028,7 +2001,6 @@ static void uea_dispatch_cmv_e4(struct uea_softc *sc, struct intr_pkt *intr)
 	struct cmv_dsc_e4 *dsc = &sc->cmv_dsc.e4;
 	struct cmv_e4 *cmv = &intr->u.e4.s2.cmv;
 
-	uea_enters(INS_TO_USBDEV(sc));
 	uea_dbg(INS_TO_USBDEV(sc), "cmv %x %x %x %x %x %x\n",
 		be16_to_cpu(cmv->wGroup), be16_to_cpu(cmv->wFunction),
 		be16_to_cpu(cmv->wOffset), be16_to_cpu(cmv->wAddress),
@@ -2040,7 +2012,6 @@ static void uea_dispatch_cmv_e4(struct uea_softc *sc, struct intr_pkt *intr)
 	if (be16_to_cpu(cmv->wFunction) == E4_MAKEFUNCTION(E4_ADSLDIRECTIVE,
 						E4_MODEMREADY, 1)) {
 		wake_up_cmv_ack(sc);
-		uea_leaves(INS_TO_USBDEV(sc));
 		return;
 	}
 
@@ -2053,7 +2024,6 @@ static void uea_dispatch_cmv_e4(struct uea_softc *sc, struct intr_pkt *intr)
 	sc->data = be32_to_cpu(cmv->dwData[0]);
 	sc->data1 = be32_to_cpu(cmv->dwData[1]);
 	wake_up_cmv_ack(sc);
-	uea_leaves(INS_TO_USBDEV(sc));
 	return;
 
 bad2:
@@ -2061,7 +2031,6 @@ static void uea_dispatch_cmv_e4(struct uea_softc *sc, struct intr_pkt *intr)
 			"Function : %d, Subfunction : %d\n",
 			E4_FUNCTION_TYPE(cmv->wFunction),
 			E4_FUNCTION_SUBTYPE(cmv->wFunction));
-	uea_leaves(INS_TO_USBDEV(sc));
 	return;
 }
 
@@ -2089,8 +2058,6 @@ static void uea_intr(struct urb *urb)
 	struct intr_pkt *intr = urb->transfer_buffer;
 	int status = urb->status;
 
-	uea_enters(INS_TO_USBDEV(sc));
-
 	if (unlikely(status < 0)) {
 		uea_err(INS_TO_USBDEV(sc), "uea_intr() failed with %d\n",
 		       status);
@@ -2130,8 +2097,6 @@ static int uea_boot(struct uea_softc *sc, struct usb_interface *intf)
 	int ret = -ENOMEM;
 	int size;
 
-	uea_enters(INS_TO_USBDEV(sc));
-
 	if (UEA_CHIP_VERSION(sc) == EAGLE_IV) {
 		size = E4_INTR_PKT_SIZE;
 		sc->dispatch_cmv = uea_dispatch_cmv_e4;
@@ -2188,7 +2153,6 @@ static int uea_boot(struct uea_softc *sc, struct usb_interface *intf)
 		goto err2;
 	}
 
-	uea_leaves(INS_TO_USBDEV(sc));
 	return 0;
 
 err2:
@@ -2198,7 +2162,6 @@ static int uea_boot(struct uea_softc *sc, struct usb_interface *intf)
 	sc->urb_int = NULL;
 	kfree(intr);
 err0:
-	uea_leaves(INS_TO_USBDEV(sc));
 	return ret;
 }
 
@@ -2208,7 +2171,7 @@ static int uea_boot(struct uea_softc *sc, struct usb_interface *intf)
 static void uea_stop(struct uea_softc *sc)
 {
 	int ret;
-	uea_enters(INS_TO_USBDEV(sc));
+
 	ret = kthread_stop(sc->kthread);
 	uea_dbg(INS_TO_USBDEV(sc), "kthread finish with status %d\n", ret);
 
@@ -2222,7 +2185,6 @@ static void uea_stop(struct uea_softc *sc)
 	flush_work(&sc->task);
 
 	release_firmware(sc->dsp_firm);
-	uea_leaves(INS_TO_USBDEV(sc));
 }
 
 /* syfs interface */
@@ -2495,8 +2457,6 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
 	int ret, ifnum = intf->altsetting->desc.bInterfaceNumber;
 	unsigned int alt;
 
-	uea_enters(usb);
-
 	/* interface 0 is for firmware/monitoring */
 	if (ifnum != UEA_INTR_IFACE_NO)
 		return -ENODEV;
@@ -2589,7 +2549,6 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_device *usb = interface_to_usbdev(intf);
 	int ret;
 
-	uea_enters(usb);
 	uea_dbg(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
 		le16_to_cpu(usb->descriptor.idVendor),
 		le16_to_cpu(usb->descriptor.idProduct),
@@ -2620,7 +2579,6 @@ static void uea_disconnect(struct usb_interface *intf)
 {
 	struct usb_device *usb = interface_to_usbdev(intf);
 	int ifnum = intf->altsetting->desc.bInterfaceNumber;
-	uea_enters(usb);
 
 	/* ADI930 has 2 interfaces and eagle 3 interfaces.
 	 * Pre-firmware device has one interface
@@ -2631,8 +2589,6 @@ static void uea_disconnect(struct usb_interface *intf)
 		mutex_unlock(&uea_mutex);
 		uea_info(usb, "ADSL device removed\n");
 	}
-
-	uea_leaves(usb);
 }
 
 /*

-- 
2.51.0


