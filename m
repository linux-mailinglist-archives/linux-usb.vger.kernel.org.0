Return-Path: <linux-usb+bounces-34905-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKlrFBbXuGn9jwEAu9opvQ
	(envelope-from <linux-usb+bounces-34905-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 05:22:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95D2A3888
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 05:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31A45302731D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 04:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD1736AB6C;
	Tue, 17 Mar 2026 04:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiHX7FOk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE18361DA5
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 04:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721356; cv=none; b=Z4gJcsSOxRgAWZfeQ3jXyVQbZtd0LcDmzrjzSODxzQYjDV82z8FNTEb6277elk3EdBTUjqf8YdXFNxAupdatbq7Z42FC+ULagXKfEUJOfv9K6bioJwAbdRM+cQdm+QwHK5POnnforJBvH3oHxYmdC3LhEC9jM1FPgx29avz20x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721356; c=relaxed/simple;
	bh=6DzbO4Ml1aHb3e7Sda0Z2wIyPUN3e5Y8nB2T9Ja5BYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pOFMl8c33uYO0602OzzlhVT2t5b6oyxC3MRfB2Zf9/CwXUdhmuVTWzDsMj7FhP6DYN2gFbbw/iapU8s58fay3OIvMwUPfcgyWfxxwVzg//PNjPt4LC5qQS972TDhr7qzBwPuYxH2gTM+evY3j96hf00H2c5BRo6n6YSDg6bE5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiHX7FOk; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-126ea4e9694so1945462c88.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 21:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773721353; x=1774326153; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbNGfKsBjjjuyphN4yp+QwSP8eo9AaRUsQZLKwzJdEM=;
        b=XiHX7FOk1TpEtw5BBENjN5R5OVa6XYyUQSXB6QrzFn71XWClOoKBqQjPZkO6JGMAPj
         +4SGnRb3Xs5XIDDl9frE00M+MPtd8BMesunVXntsReaXaVlVEz68nyAP2B5+aSzPAsmX
         YDSgG0badPp4lNgKHCZFVVCdEhQURKnYhokparstxPF3tpxl7BdbA8oO2pPFXA2JN50h
         pnrTSjlf+OTiqIDbEL47s0eRHgws7XFBdADqrE3Fdn5dg3lvQ2CqokkJhCNosOZXe7zY
         3f/ZfUqziuxz9elv87bj2XAu2R8nWxN7q7q7f50cDixuToLlMP52hsZFZYdhUcl1hTra
         rPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721353; x=1774326153;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbNGfKsBjjjuyphN4yp+QwSP8eo9AaRUsQZLKwzJdEM=;
        b=jZjLUQBNl6Kvprbug//tI0zX/FVWs/hTi/2VktOTkqSs0AcaIoorOThnE796FNmiNk
         uTCs2YcdoYJOAUlwFTnKOW3WdF/LOfGZSLJJP+sGP+rMFKdmgFwXjH94FQKDe7X/L+bC
         X/jpZaR8dvGFuxaiRRxQQfQL7a9HlxXAP5kur/skJzPjpKAVIc017dSenP8So5KtKj6y
         GhYPeGQ/cUEUbMG+MmljjT5ImNxSnrkHmQkTWs1fN47RhaaBCyGFmkBJo1PFJEwHH3LY
         iaDCJbGK487eAmBkHR9IARxrbxSxfieZvz5dbypMArWG+fTn7wOlPhmUIaNRRDTUSuWU
         hjGg==
X-Forwarded-Encrypted: i=1; AJvYcCVklDbVtga0rPPUYA4sv6b15Dt4MrmwxSjLLKOV/oTFFFckCHZErOsz/hoLfo6S5hZLQQmNyXvPHkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMtetg0wVcjpN+6paNYUUrc9BVBbu1/50aZowvN9kjRKm4dWLv
	RNSmhO57MQB+q6qkgDobjctpYAhQhVpCS3rjPw8ZGi9oOQCo1t09TDqI
X-Gm-Gg: ATEYQzys/fJJiqhrD9hTsxVUDvFGvb8gx1GobHU6YqS76ssL40qvGr0b0ijyVaVQ8wp
	eKmLnkgZNFd/IrhTu16H8ayEXutvEMR5An9VyhTXjOYAVAW1L94d+yPhaPSazJQThhaInollHf0
	6ssMspGnVIIjzVUfP2sQ8AJPSesrhek84zLrKvcZwjI4FpZcmSAdxiqdEFOVsOFHONF+74COpPR
	Ho2DpU19n5LUmD76zhA2SFrWtg4VYZYn3JaUl91HM4F+g/hRITOpXtxMvrgfJVsKj7rymvumpKr
	ijzSZPfgkEqU1OF8Qi7AJhMWkv+oncDDVwVj1rgvcjnoOj21Ev6bliB+8LvqNvEFbO9FGnSM+av
	Z6mShr58yOKAytyCQM36lfpTm+a81iLUs+GrezReQNtMqHHK9n8moUukb1z/5bphuEXcbYJVNav
	HTiHim4XSckPH5Cu/Qq7hK7+3kNcOsVizT7q4/Eylbez+e+B/lN2rw2qAmf4QYuLPE8r2qGrslV
	GMG
X-Received: by 2002:a05:7022:301:b0:127:33e0:ea44 with SMTP id a92af1059eb24-128f3e1a5b1mr7993213c88.29.1773721353075;
        Mon, 16 Mar 2026 21:22:33 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128f6295ebfsm14583318c88.4.2026.03.16.21.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 21:22:32 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 17 Mar 2026 01:22:04 -0300
Subject: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNSw6CQBBEr0J6bZv5GGRceQ/DooEBOvJzWoiGc
 HdHEpcuX6Xq1QriA3uBS7JC8AsLj0MEc0igbGloPHIVGYwyqbLaInVCOEuBNb/wMXO4x4hJ0Ls
 ys0oVlNkU4nwKPlZ29S2P3LI8x/Denxb9TX/S03/polGjNalzLqvPVNG16Ym7Yzn2kG/b9gHVn
 m6kwAAAAA==
X-Change-ID: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5086;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6DzbO4Ml1aHb3e7Sda0Z2wIyPUN3e5Y8nB2T9Ja5BYI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJk7rrN9v1Jj+COX62ziN5NbNxa+0fsucCb0o2Dg/VN+k
 3W/O6SmdpSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBEgn8yMpy0u93Atk1oQYpV
 5FaNOa0KNiF3JRZEqi959/ag5TlV8/WMDAvOuBRWSvYfdj8bt1QyaoXRissnJkfPnC/+ZW6l/fG
 IywwA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[perex.cz,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34905-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DE95D2A3888
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
usb_audio_ids[], but it currently checks only the vendor/product pair.

This is weak for quirk table entries that also depend on additional
USB_DEVICE_ID match fields, such as device or interface class,
subclass, protocol, interface number, or bcdDevice range.

Rework the alias lookup so that it still uses the aliased vid:pid as
the initial lookup key, but validates the remaining match_flags
constraints of each candidate entry against the real device and
interface descriptors before returning the quirk.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- drop the temporary usb_device_id reconstruction approach
- validate only the remaining match_flags explicitly
- pass struct usb_interface * to get_alias_quirk()
- Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
---
 sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 8 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index fd81f32a66fb..153085a77d43 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
 	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
 }
 
+/*
+ * Match aliased vid:pid first, then validate remaining fields against
+ * the real device and interface descriptors.
+ */
+static bool snd_usb_match_alias_entry(struct usb_interface *intf,
+				      const struct usb_device_id *id,
+				      u32 alias_id)
+{
+	struct usb_device *dev = interface_to_usbdev(intf);
+	const struct usb_host_interface *alt = intf->cur_altsetting;
+	const struct usb_interface_descriptor *intfd = &alt->desc;
+	const struct usb_device_descriptor *devd = &dev->descriptor;
+	u16 bcd = le16_to_cpu(devd->bcdDevice);
+
+	/* Match aliased vendor/product */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
+	    id->idVendor != USB_ID_VENDOR(alias_id))
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
+	    id->idProduct != USB_ID_PRODUCT(alias_id))
+		return false;
+	/* Match real device descriptor constraints */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
+	    bcd < id->bcdDevice_lo)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
+	    bcd > id->bcdDevice_hi)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
+	    devd->bDeviceClass != id->bDeviceClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
+	    devd->bDeviceSubClass != id->bDeviceSubClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
+	    devd->bDeviceProtocol != id->bDeviceProtocol)
+		return false;
+	/* Match real interface descriptor constraints */
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
+	    intfd->bInterfaceClass != id->bInterfaceClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
+	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
+	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
+		return false;
+	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
+	    intfd->bInterfaceNumber != id->bInterfaceNumber)
+		return false;
+
+	return true;
+}
+
 /* look for the corresponding quirk */
 static const struct snd_usb_audio_quirk *
-get_alias_quirk(struct usb_device *dev, unsigned int id)
+get_alias_quirk(struct usb_interface *intf, unsigned int id)
 {
 	const struct usb_device_id *p;
 
 	for (p = usb_audio_ids; p->match_flags; p++) {
-		/* FIXME: this checks only vendor:product pair in the list */
-		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
-		    USB_DEVICE_ID_MATCH_DEVICE &&
-		    p->idVendor == USB_ID_VENDOR(id) &&
-		    p->idProduct == USB_ID_PRODUCT(id))
+		/*
+		 * Alias lookup only considers entries anchored on vid:pid.
+		 * Additional device/interface constraints are validated separately.
+		 */
+		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
+		    USB_DEVICE_ID_MATCH_DEVICE)
+			continue;
+		if (snd_usb_match_alias_entry(intf, p, id))
 			return (const struct snd_usb_audio_quirk *)p->driver_info;
 	}
-
 	return NULL;
 }
 
@@ -927,7 +983,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 	id = USB_ID(le16_to_cpu(dev->descriptor.idVendor),
 		    le16_to_cpu(dev->descriptor.idProduct));
 	if (get_alias_id(dev, &id))
-		quirk = get_alias_quirk(dev, id);
+		quirk = get_alias_quirk(intf, id);
 	if (quirk && quirk->ifnum >= 0 && ifnum != quirk->ifnum)
 		return -ENXIO;
 	if (quirk && quirk->ifnum == QUIRK_NODEV_INTERFACE)

---
base-commit: dcf16b3bb87632a80ef344433980539c2785dfd4
change-id: 20260313-alsa-usb-fix-quirk-alias-e9c8300ba836

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>


