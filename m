Return-Path: <linux-usb+bounces-37528-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJ4BJXKyB2pBCgMAu9opvQ
	(envelope-from <linux-usb+bounces-37528-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:55:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 170BF559764
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06227301A2BC
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 23:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE36E3F9A14;
	Fri, 15 May 2026 23:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cZdJPU8E"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29A3FF1CE;
	Fri, 15 May 2026 23:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889269; cv=none; b=a2u0ipfhcwWjjNx7DsyCbZZTjG94jOx7kEsQif3NIHF297LM7m7g6KZOxn6XmPsEHJxJ++2geHXcvVV08TktAdUMLunpk+Ye6RoNbVFVBgjzWEeDrTAF2hAgJ5+6I9w0jiCMO8FRAk6S/ophJNQwBxwHCCGO/d31mlX5J1sHCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889269; c=relaxed/simple;
	bh=fwL7PTtx3vxGhjnHCiVHxkZlvP9EF4h5bP89TuKQfko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guegKA9Lj5D942UAuqvwxD2dNwYZ65U+iYef94NVDa5jgnX1ixCxq5B7kA8DIwS4KFJQH1p0FaitH6GbUw7wmk+GgaxYsfDtxn9JsUsnpnZcbb2zEV4ByAiuYbn4Q4SHBbSX69dzsPWKgbBJ692p2hSnjeXqHqvKnSFRrdQknZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cZdJPU8E; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gEBQIDRdpRPBQruqycF40ehToFlzlQU47j8MfkVaqkA=; b=cZdJPU8EtQY0z2+u9NVeA2y+/R
	sZIgyJs9ZRmnbHTW+FRQchrfNvQ8LH1/n7iaXJX1AgJSwM8J6hvD+hzmynYtrAEyzYQG9HjWQyeO+
	af/69hnBTA5ctZ1huzQEoKs6WerYVABGynoJx0j7ftVamBpyop/J4VuPQ/oMwyn3Ve28zHJK2P5p6
	AM+SFXOf+q+XXaVhcLV5lE6KU3YQMp+05cWIByq69PSohuMuG4ojEiBzqR6fuM+OlRacbneSnXlk9
	1qjzDQtlp+v6aPvSAHgS+ncHuateJdiWG9VV7rGORC+7rsju+Zjx6hsZe1tf9dxMdwLi9MnyRw5VS
	INYNv+CQ==;
Received: from 186-249-149-153.shared.desktop.com.br ([186.249.149.153] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wO2ML-000keM-6X; Sat, 16 May 2026 01:54:25 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Fri, 15 May 2026 20:54:13 -0300
Subject: [PATCH 2/2] usb: atm: ueagle-atm: add missing uea_leaves() in
 uea_probe()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ueagle-atm_cosmetic-v1-2-9a15e5e45bd7@igalia.com>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
In-Reply-To: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-atm-general@lists.sourceforge.net, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: 170BF559764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37528-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.827];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Pair the existing uea_enters() (function entry debug message) with
a missing uea_leaves() (function exit debug message) in uea_probe().

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/usb/atm/ueagle-atm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 2730e7d41c89a354e115e38d97e314f888c62137..969d3d208680359c0c1a3efd581a8ce2fd8b1004 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2598,8 +2598,10 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	usb_reset_device(usb);
 
-	if (UEA_IS_PREFIRM(id))
-		return uea_load_firmware(usb, UEA_CHIP_VERSION(id));
+	if (UEA_IS_PREFIRM(id)) {
+		ret = uea_load_firmware(usb, UEA_CHIP_VERSION(id));
+		goto out;
+	}
 
 	ret = usbatm_usb_probe(intf, id, &uea_usbatm_driver);
 	if (ret == 0) {
@@ -2613,6 +2615,8 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		wake_up_process(sc->kthread);
 	}
 
+out:
+	uea_leaves(usb);
 	return ret;
 }
 

-- 
2.51.0


