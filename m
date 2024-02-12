Return-Path: <linux-usb+bounces-6246-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF42851880
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 16:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFDC01C22276
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 15:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69FC3C47A;
	Mon, 12 Feb 2024 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b="Pxkb/jWE"
X-Original-To: linux-usb@vger.kernel.org
Received: from puleglot.ru (puleglot.ru [195.201.32.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D303D3CF52;
	Mon, 12 Feb 2024 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.201.32.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707753232; cv=none; b=PahyXOYamyiaGRzqnPBphrBxltpm60QNWM3jVpbsw96LV4onbR4QoecpuwcI1Pw4s86OMrhuPL6/bH7e4u12KK2IHsECPPauVACqG/jr1gUl2lw605CFbv3xuRC9uxu3ABSSPsamgguH4CCa0Ou8e568biBp5m5/gqjcpiGB8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707753232; c=relaxed/simple;
	bh=spy70HfjoheqAjWploJYPJrRSAN4AXykUGUgKoklCc8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rJIHF6JwxXv4G6kkIftpRtOJnulNOwb/BdgzZV5KokHqQ0zv7DrFoTyKqPfSn/mu+0k508pRuGCGW/YVeKAOyGTLknCCAenjL14TA9Lf1EyOh8mRJVtBL/MdzuPQr5ONRIE5imzeStYZpLvSv9G8qSR1Xmi9N/FRhhYDO85Q/lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me; spf=pass smtp.mailfrom=puleglot.ru; dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me header.b=Pxkb/jWE; arc=none smtp.client-ip=195.201.32.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tsoy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puleglot.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
	s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yUpIoVx1qo/FtfUPPy1ERNngaKI9xiKtsIUKmgw0teU=; b=Pxkb/jWERnVbCQtZNIMSGMidTq
	mbmODKjEWysQcHkMkFbStR0cSVg8djSN6A0Ao9wG9XDXJ7Y+gTFrWGm02NFSF7jMQ8pMl0wNcICUB
	Ov0ZQSwAv3b4tbna+y43S1xZsw9ms5D8FDCDxstcwx/bbo926fRBDcwWQ2aOvU9aUhiY=;
Received: from [2a00:1370:819a:f1b4:f5a8:7291:14f0:548b] (helo=home..)
	by puleglot.ru with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <puleglot@puleglot.ru>)
	id 1rZYEt-00000001IST-0T4L;
	Mon, 12 Feb 2024 18:28:59 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: linux-usb@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Nikolay Yakimov <root@livid.pp.ru>,
	Saranya Gopal <saranya.gopal@intel.com>
Subject: [PATCH] USB: Always select config with the highest supported UAC version
Date: Mon, 12 Feb 2024 18:28:48 +0300
Message-ID: <20240212152848.44782-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: puleglot@puleglot.ru

Config with the highest supported UAC version is always preferable because
it usually provides more features.

Main motivation for this change is to improve support for several UAC2
devices which have UAC1 config as the first one for compatibility reasons.
UAC2 mode provides a wider range of supported sampling rates on these
devices. Also when UAC4 support is implemented, it will need just one
additional case line without changing the logic.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 drivers/usb/core/generic.c | 39 +++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index b134bff5c3fe..8aeb180e1cf9 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -48,9 +48,16 @@ static bool is_audio(struct usb_interface_descriptor *desc)
 	return desc->bInterfaceClass == USB_CLASS_AUDIO;
 }
 
-static bool is_uac3_config(struct usb_interface_descriptor *desc)
+static bool is_supported_uac(struct usb_interface_descriptor *desc)
 {
-	return desc->bInterfaceProtocol == UAC_VERSION_3;
+	switch(desc->bInterfaceProtocol) {
+	case UAC_VERSION_1:
+	case UAC_VERSION_2:
+	case UAC_VERSION_3:
+		return true;
+	default:
+		return false;
+	}
 }
 
 int usb_choose_configuration(struct usb_device *udev)
@@ -135,22 +142,28 @@ int usb_choose_configuration(struct usb_device *udev)
 		}
 
 		/*
-		 * Select first configuration as default for audio so that
-		 * devices that don't comply with UAC3 protocol are supported.
-		 * But, still iterate through other configurations and
-		 * select UAC3 compliant config if present.
+		 * Iterate through audio configurations and select the first of
+		 * the highest supported UAC versions. Select the first config
+		 * if no supported UAC configs are found.
 		 */
 		if (desc && is_audio(desc)) {
-			/* Always prefer the first found UAC3 config */
-			if (is_uac3_config(desc)) {
-				best = c;
-				break;
-			}
+			struct usb_interface_descriptor	*best_desc = NULL;
+
+			if (best)
+				best_desc = &best->intf_cache[0]->altsetting->desc;
 
-			/* If there is no UAC3 config, prefer the first config */
-			else if (i == 0)
+			if (i == 0)
 				best = c;
 
+			/* Assume that bInterfaceProtocol value is always
+			 * growing when UAC versions are incremented, so that
+			 * the direct comparison is possible. */
+			else if (is_supported_uac(desc) && best_desc &&
+				 (!is_supported_uac(best_desc) ||
+				  (desc->bInterfaceProtocol >
+				   best_desc->bInterfaceProtocol)))
+					best = c;
+
 			/* Unconditional continue, because the rest of the code
 			 * in the loop is irrelevant for audio devices, and
 			 * because it can reassign best, which for audio devices
-- 
2.43.0


