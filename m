Return-Path: <linux-usb+bounces-35050-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM34MW22umlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35050-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:27:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A942BD1D6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E674830B691D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9C93D9DD9;
	Wed, 18 Mar 2026 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AyCaYtSs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAF3DC4D6
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842948; cv=none; b=B6I8llMBNMMYTbZKPQRNj70dYJxrgr7VDlAuLe8ERPh5BtXlzEN2V4G8Z+UD7kS09aQNt1hq4JJTXQFS8oqQOoYd2K8uMl1LTCaHSMXxNLxN494zgEGWogF5ccskc9AZ/i6m8QU0L6m4KxtXSu7kMnCMvrRAewyQroPfyCdLepo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842948; c=relaxed/simple;
	bh=wr7LrT6fALB4lVXF73Hai9QLyEetrJK3WCbgjM24ot8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ETCHh8e6kK5G1YqsP87sSpyXdy2YCHHxNOjeAEircfLWZ6D9zfT5euD+ESUh10j4kxDeowj6qEbNRDvFHVS/NzlpuagqxzEWHVOkbjEn+kwUddqRkby1DIC1usRqg3r5JGDiCt2yvJ1GbSlJ0GZ8O4JlCdZxwzEeSuVMm0ZxYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AyCaYtSs; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so5337503eec.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773842945; x=1774447745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiGU7ACiFofzigZYkO+A1ibMgdUGeFsuYvqwX0/Mjy0=;
        b=AyCaYtSs2ciNpP8k8K1eFH2RfnNMmKFHYh/eor1VoVamg5N1vazD4v+lelFrSQD9+C
         n2i4ohEusTg9Aa2AytM5soGzVULAjo90+oFcyronKKoAaf0oXaqpID9RAvBBv/Q5AJtT
         P3yrBHCNuzJmrkqG8rUMRX3h7e890Sy1+lm1j3UhLC2gxlkhhjfIghfrLCGPHjv29OmV
         3cQwKXAVLQEWZSwiELEoMQ8Q+VcaH4x/Z9UQXzxVGiPX0R1Sq9VQ18THsUr0AkCekeCX
         OyZForEtF32zesLRaBzRyI/yiNpLo69I/BgAOWEz8yzUMVIJjYSo94cVeWkS1noM4Ahe
         O0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842945; x=1774447745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiGU7ACiFofzigZYkO+A1ibMgdUGeFsuYvqwX0/Mjy0=;
        b=iqNSClEi2NuWE9019cY06ZPLsJdfYmOSosaAoUCus6kZQYQ1d/UeNaLx8Lg/FJLpJ/
         PQhZYUbLujrZB9wyb/gXL/QiTd0/BfQ2PrpjmoVxCW5EyY6USODC3h5O6dxEBpHGr/ru
         llhrumUBhW6d1I6JBk4f/PPFdPCwh5hW2IKKJhb5z/MFqFudAjZA6xeXY6W9t1ks1Y6c
         1R58wh3PVOCuzf21K+zgNPLthmnQhlNmUI65C0A7t/WQdcCyHdgzzNp8HgwGLKwvZDuT
         ETcni6kdDLnT2HWNviXGuo+Hpdvz6qJmO/eaaZgqDyJsWNLs+KGA4fJLBqcf31CsQtwo
         vzxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlDEntoP38k/fSj8JnT9kGVVXPl3TcGhWGEr+GR6QusXxtcZB1FUT2O4nBgMYcWWxX9kb59BPlwfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQsyf9PSwhBXZvLHqVcKl7earzvMDQEH3yN2edCTUhWDSwQCp
	CMkkTXGWmKAm1diIy5pAdkREg1cNpxO+0YKjKO8NDGT7YSsY9C9L9UE3
X-Gm-Gg: ATEYQzyw+URZJLRf9YiIsxhAqRSU75Lvd/o4XVP7WGKfNXwCNzzGrF0Z8C8pyrd9NFg
	T/gdNSWRJ7E2216Szo1iCjGcXnmprk3zOM0C9IBwrH+C8zF4nHZmaQmClZ8lSYw8WVbAJePWoMu
	VgPuFjThe7qh191bwT+wvgO4/qDfRokm9KnvhoPl9d22hKJ3fUC+ZbIFIBnfQuozO3wL+Prfu9H
	5vEmTe9zDU+bvEw2eSv7+/cFXkFagZKQi3HQg2kYYUVjxxqJcW5AXUVtmLVoYdUOlbQlWrMGvxF
	pJYo1rMbecjpJqz1yMEjwLy8mCUzsqJWelWv/1pHwVt60e0ElBwOIcfJ8GxwNmvGt5WpOEzb8Ds
	DZMtm40EZ8ydDZ8XvJ/FWAF2BExaAjchNlohPbW0M6s+RLDDOvn/IcU8Lpx9SJL2q4BNJt42YSy
	8t57J+0gv0u+s8G9AagoPj7SYzRyH5VTp+QQ7YJL5hZdQJ7qz+i0vWjZvBjyJOYFgwBGHLpYBDT
	iY=
X-Received: by 2002:a05:7300:dc91:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2c0e4fb8e1dmr1782178eec.14.1773842945067;
        Wed, 18 Mar 2026 07:09:05 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55cd9cfsm3822404eec.26.2026.03.18.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:09:04 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Wed, 18 Mar 2026 11:08:46 -0300
Subject: [PATCH v3] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-alsa-usb-fix-quirk-alias-v3-1-bd3b17a32939@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33Nyw6CMBAF0F8hXTumDy2tK//DuCilwEQe2kqjI
 fy7hcSEjS7vzdwzEwnOowvklE3Eu4gBhz4FscuIbUxfO8AyZcIpl1QwAaYNBsZQQIUveIzob6l
 CE8BpqwSlhVFCkjS/e5dOVvpyTbnB8Bz8e/0U2dJ+0cNvNDJgILjUWqsqN6U5153Bdm+Hjixo5
 Fso/wPxBEl3FMzKvKJWbaF5nj95kxoNCQEAAA==
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=wr7LrT6fALB4lVXF73Hai9QLyEetrJK3WCbgjM24ot8=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJm7Nv51Xfvxi97dNVFyq33f2T0IVzkrvtTN3eHPUnEtV
 scrDxwbOkpZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiPl2MDAvk30zKEVlafnKr
 P1+3MZPzm07zg8vCl+0SL7mWKtf3/DTD/wJJHQNLKbuvzKce8KzwPpg+2XJ1oHJCSstv+cWcQYU
 MPAA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[perex.cz,linuxfoundation.org,vger.kernel.org,suse.de,gmail.com];
	TAGGED_FROM(0.00)[bounces-35050-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: E5A942BD1D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This is weak for quirk table entries that also depend on additional
USB_DEVICE_ID match fields, such as device or interface class,
subclass, protocol, interface number, or bcdDevice range.

Keep the aliased vid:pid as the lookup key, then validate only the
remaining match criteria of each candidate entry against the real
device/interface descriptors by clearing USB_DEVICE_ID_MATCH_DEVICE
from a temporary copy and passing it to usb_match_one_id().

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v3:
- rework alias quirk matching as suggested by Takashi Iwai
- drop the explicit per-field helper
- keep the aliased vid:pid check first
- clear USB_DEVICE_ID_MATCH_DEVICE from a temporary id copy
- Link to v2: https://lore.kernel.org/r/20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com

Changes in v2:
- drop the temporary usb_device_id reconstruction approach
- validate only the remaining match_flags explicitly
- pass struct usb_interface * to get_alias_quirk()
- Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
---
 sound/usb/card.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd81f32a66fb..f42d72cd0378 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -866,19 +866,25 @@ static void find_last_interface(struct snd_usb_audio *chip)
 
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
+	struct usb_device_id match_id;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
-		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
-		    USB_DEVICE_ID_MATCH_DEVICE &&
-		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
-			return (const struct snd_usb_audio_quirk *)p->driver_info;
-	}
+		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
+		     USB_DEVICE_ID_MATCH_DEVICE)
+			continue;
+		if (p->idVendor != USB_ID_VENDOR(id) ||
+		    p->idProduct != USB_ID_PRODUCT(id))
+			continue;
 
+		match_id = *p;
+		match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
+		if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
+			return (const struct snd_usb_audio_quirk *)
+				p->driver_info;
+	}
 	return NULL;
 }
 
@@ -927,7 +933,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: f803b7bb17dd19fbd84fe783683321f38834a1df
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>


