Return-Path: <linux-usb+bounces-34779-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLSfB3XXtGkCtgAAu9opvQ
	(envelope-from <linux-usb+bounces-34779-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 04:35:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C028B7B4
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 04:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6EC9301DBAE
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 03:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9C0314A64;
	Sat, 14 Mar 2026 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYUlaAV0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CF023E32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773459308; cv=none; b=Pb5zN+oEKW8nGq5Yx20iFO/Mjc5KTusavV7PJ7LR28Yiw6cFFr56n/2WhaTlT6SPYB1i4B697UjyrKOin5+hgTgssTS4HSQJxUrUg8/5c1yyhS4uo2JwW7P2sMvCaPJW0kK1MIvxf/psMCQYkh01WhieK2f3sR50NYcHxPZ4EDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773459308; c=relaxed/simple;
	bh=bCPDrfSIHgTotXmiaMzTBzeP1LSsPbI6BJ3CRFCDXwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WnI+OgOKA1BjAsvbLD1QTrb9qyw1qbM/M3xKfcFVWITtBFn1HpunUMWYhTz5skbA3NSVHgS/86QgfR7TS3YMjVxraMVGnXvMQxGprvrFSNqLz4/1z37NBgzGRE12YhVsEBNC8yEUmrkhUim5Ro6AQU4SAWueuhtc0/JHd02N4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYUlaAV0; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2be19f05d7dso2385500eec.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 20:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773459305; x=1774064105; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqNMCmmqJDcsaA0VdbH9eNtu9b3dBl63iWS6KS2e2D0=;
        b=RYUlaAV0bMpoTf486ZptLYTUHpWlSDRqTGG7OYYARYGBOt18DM/swXDxssmRPA/oww
         6NdAI99kMM3iRFbh3jMRG23HqMA7MhT6LaDpDnTD5iC8+w8vlZTTphgd2f/IT6fgXadc
         YGnTiPwVWr/3pJ4ovVan67CErLM+ZUq7iR4KexdmEy04VQq+VWJ6Dg+fK94Dow3FHfhc
         5Weug4HkLu14AHEu5dRtsnCTH9muUhkiMUzQJf5+HSg03LkIog9VRh2IlTz3bcS4+DA1
         rNsCv/NUTZMBpBpsY/DC5NbxiN2muKR1EOKBMWaBjd6dxGltzN60X7zXrQ+NlfaMtgit
         /Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773459305; x=1774064105;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqNMCmmqJDcsaA0VdbH9eNtu9b3dBl63iWS6KS2e2D0=;
        b=Xt7hxVJ4qQlKvoHiY5mgn3nyVLioyfP2p4wOzeW6YXDnYwxmmHlUZfvgRswMwOF0sw
         19BL3ABrMt9PC+BmJiUKBQ9hTUNvRSpv5K1TWHPw824xmPCWCBjdcxP6ZbwLFdN1LGHR
         jsmFAC2H38dK+l+mq1uauB2zXk4dkWkIp/tuyCJAa79SZMPDU8UIkbg2ME6wRRmPPGNU
         JQLcjUmLXG24j3Os/dj7gBiyIZ29YJ2fs019APzHHH4CJ953andCiH/GFuhOeldYYrRL
         Ebe1dZpAYRKMJ2Ss8E7nUZyLUdkXtlDbM+9rxQnyGD0d0k36h/ZdT5m8PJ1qLZ6mz/LK
         9ORw==
X-Forwarded-Encrypted: i=1; AJvYcCWW5nd+XI5k0255Ll3KrISuQKnPPJiij2OxmQFIu/cHfXc6jQ0xe+MV6fFP757bSkd32owkOqv+g3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG/jtLzgC/C1MAA9kiB94DC/p8p5tTV2nMsJi547TwNy+lABi6
	+dSNs0SjpDqrvLIlKv3+58eoZeek4zAFJuJ4EnCnGOIGij+00ntPGBGh
X-Gm-Gg: ATEYQzxqd+ASNfAliEObU2v5lG5jYkaLLSDGlvCN9Int4z5/V3zZQ+cjw3Zhn7vAVor
	mwV9WeVX+qLE8KFXhjnhUWsGfLVxNXyifECi/6ui/RFaP+hFS8kjeAejQXS8Nw/tF+tawJq5qIE
	zJHLjVPd4baOO9YR/WNTQD+RuLGDa4faz7JXHLq8EX0l9lthNgmgAD8E5en3JsLFJ46zRZIv3l1
	pHCIY22qssr2LythiA8CdOb42YTGh/jg45BQAnO6YnOoF2d/KVG1Z27OC1b9zBZFYO5itRa1KQD
	sUID5zSOD6tHilaDBU0JR2siT1HM7qt3g/+T/L9QG5l3JEgECHAvt+aXe4H9Acoj4YdC5UdSt1W
	sxMWSe/bKXhNHKQ2uoJF6WqLIg+7uHuKxc7prPsIWhROPhj8p9/MNVlMA+ABUhkTXpZldg4x++T
	TnCUayuxlM1vjIXc7gJEqz11X6Pb+XjwV7Q62zWGAVY4Jl81KOm0ANuwTGFW3P+4k9l+6xF3yb4
	nSR3uO0XjhRPDA=
X-Received: by 2002:a05:693c:3618:b0:2b6:aeb8:3d8c with SMTP id 5a478bee46e88-2bea55b2a69mr2536272eec.32.1773459304431;
        Fri, 13 Mar 2026 20:35:04 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-109.user3p.v-tal.net.br. [177.4.161.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab5702e5sm5917833eec.29.2026.03.13.20.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 20:35:03 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 14 Mar 2026 00:34:46 -0300
Subject: [PATCH] ALSA: usb-audio: validate full match when resolving quirk
 aliases
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M3QpAQBBGX0VzbWrZEl5FLgaDifzstFLy7iaX5
 +t85wHlIKxQJw8EvkRl3wyyNIF+pm1ilMEYcpcXzmceaVXCqB2OcuMZJSw2CSly1ZfeuY5KX4D
 dj8Cm/Ommfd8PW9tq8GoAAAA=
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2575;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=bCPDrfSIHgTotXmiaMzTBzeP1LSsPbI6BJ3CRFCDXwU=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlbrqdu/3TEWDb21XOHnc5MfF2fPGX9V3vZNt1RzJ3Vn
 fLv93HjjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIVU+Gv2KRrqb5Mhzfrl9x
 OiLTfmbFH4VNz7+deTk7qGrR/zDL9omMDEvVb5QoJvoFJUu6rew57WEq55OQrLZH1DhC5NxC++5
 bHAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[perex.cz,kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34779-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A76C028B7B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This can make an aliased ID pick the first entry with a matching
vid:pid even when that entry also depends on interface descriptor
fields that do not match the actual device or interface.

Fix it by re-checking each aliased candidate with usb_match_one_id()
against the real interface before returning the quirk.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/card.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 270dad84d825..ff4418017763 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
 
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
+	struct usb_device_id id_alias;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
 		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
 		    USB_DEVICE_ID_MATCH_DEVICE &&
 		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
-			return (const struct snd_usb_audio_quirk *)p->driver_info;
+		    p->idProduct == USB_ID_PRODUCT(id)) {
+			/*
+			 * Re-check the aliased entry against the actual
+			 * interface descriptors instead of matching only
+			 * the vendor/product pair.
+			 */
+			id_alias = *p;
+			id_alias.idVendor = USB_ID_VENDOR(id);
+			id_alias.idProduct = USB_ID_PRODUCT(id);
+
+			if (usb_match_one_id(intf, &id_alias))
+				return (const struct snd_usb_audio_quirk *)p->driver_info;
+		}
 	}
 
 	return NULL;
@@ -931,7 +942,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>


