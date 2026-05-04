Return-Path: <linux-usb+bounces-36897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB20My2z+GkdzAIAu9opvQ
	(envelope-from <linux-usb+bounces-36897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 16:54:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 549904C02EB
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 16:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E538730AEBAA
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 14:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A843DE440;
	Mon,  4 May 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcZOt15s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C4C1922FD
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905941; cv=none; b=n+GNBxWIJDUTElGuz+Td+eASDO4UJ28+gEZK55WClxuxpeGzXyGYto2rvOFJJhph9Mq4U4tf/LQn6yuTIw2+UAu9/F0VMuE4Z8ItzyDCBi++5u1sB21JuEWQJAKyNcYtAqSzBv4eX3BGpfMe8k11wN3s0bthj54lSIKCZIaUAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905941; c=relaxed/simple;
	bh=vz7C4bwaSFfLhKG9gF3cmKLpQFT3PfcjksWFrcQpjpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J8aZXKwxH/Jx87GjfrHGCu+hTRvJGLeGNjRO739yYw+ARjwplh8j9JYZbyePaVoO4lmgY6fIZroSSxNCOAr2gn9k+vSxLhyqGEuOF6j5v/51VFpPqTk9iAJTdkwVukGPD0JesjmF3YQ65/3i5weWlBm4IcqjR5q/Y56p12j2rQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcZOt15s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so659794766b.1
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777905939; x=1778510739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=636wrJxyrEfAh6bHhln+FR+4YriOY+vbd6ZYe/7NrIM=;
        b=XcZOt15sG7x25N45ATnMMFI329CY1CQI7CWehHiVF1MQZdrOoHSCezAzKSyFHl5tGQ
         /ga5mombJzsDGsB3Lq1llLWGEtTmcFjHj1B8AO6yKL5dOtJxk8hSxGDPkvO7wXk98gpI
         7r/u6lb78NOmdjIhLGEHollJnjS0JhSWFC90/M4Viqi6bXEpX/jXYkeIOtl4xEiZYwkN
         8CszYLYFpG2V6VLVcHVmv/MsypUk/btWkXg5NLU43Pbmc8jo3yHJLmuT5Udj4TRRV8pF
         ptKm4fT7RDlJl3mz3c/iAJxiDqfZgHEW/Lo6jFVJ/XSTaGrW2fQy5DQHHil5Nw7YkGDl
         oSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777905939; x=1778510739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=636wrJxyrEfAh6bHhln+FR+4YriOY+vbd6ZYe/7NrIM=;
        b=kYgGkELviipV7dxD3RtbFXfwaxo0QThDu0ztfY5jJib9Pkn6q9/TJX5Y/bwaTbg1As
         Xvq7PruaAyyH8B2OLJjiRMpvOd4Sp946XsZ0Hj4ZpFXO1+uA86bGOBMpK6kCVtEd5tWn
         gdqPukwNiLybYSG3mBlX+RDtpLFSaqUR7r9K1Sox06QPSv/q5Bl/68LI3vFOHAVBInXd
         7ZIeKbd+i/6He3bQca740/T1fMWVm0k9KpixAHCcbxJ3lrLiELaVrQJwAaS8RFD6kjD4
         lE0+r2ZazfDhaCE9XkRnrzXuHqgbL9mFPp949qwZ8U5fmx2b5vdEmqWq7l9tgpANuukE
         t67A==
X-Forwarded-Encrypted: i=1; AFNElJ87163030PRcLHMmN7imUzuarf59kXMEMIH7jhntGQOoQLzPai6lI2nJSbEwmDrV79733i0NEuGKcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOglKMWzBZAPqvqt91vxsK3nzW5VlGR2EKyTIxgPkYRWLn+/dA
	reWdmSW3IGnAxzGnjFHxcHnq85cqg3nfs7Md7zMY0IOws7k2OIdV6w1W
X-Gm-Gg: AeBDieuHJqRLTNckLoysH3mzzQ589Zvar+Ij9+gN0eg0hBqbjt7pG7ouqA3x4uMvm+5
	D5i9LwCnLm4NR88hqqQs03tH8g0ifGtos0y9H68Au+55s+C/XOAO5xea3AFDoVxaQxqwxSZ7Jo3
	mksONDoYtiyhCPBM44QYlp5av8V39B0nLbhJ1Z0mjLgttLyTtXtWSnoxWpLC7hqo7ojcf1rHngE
	7lGRiLk45p8JKW3HI5nE1TXABjKuSHPEGylBH+GAg8LCKFrbsPh3ziToiHhqKDlTOwVrHppksIA
	gIyDCfRpXeMAC5Jn04eRKElUkUtfSawacEPu9ije42VNoz7K3RZu75l1c7N1qE0fUnhWeR1WRS1
	GRKreVWQx4knObJmzHUfiA7odAw+bv9NcUCEkbxxQmVSOQnX0ONCIg7yTr3ioonRt8Wu9pby+T9
	szn4O1MfpEKmpUPOalm18D2TMiJ5sVSCV1NEPoSsTqKgY+oayBjeLj7eDKdLFU5KSGv13NEkdHk
	P8+WO4N/bAIf00Dcod8XGEj2FZGx06em5PaBi/aDt5CB8s6lh9SaCHTpuil80ZRxVTO
X-Received: by 2002:a17:906:9fce:b0:b9d:6cef:95fc with SMTP id a640c23a62f3a-bbffdbca512mr534069366b.35.1777905938255;
        Mon, 04 May 2026 07:45:38 -0700 (PDT)
Received: from nick-GTR-Pro.arnhem.chello.nl (2001-1c00-3281-1680-7a55-36ff-fe02-cdba.cable.dynamic.v6.ziggo.nl. [2001:1c00:3281:1680:7a55:36ff:fe02:cdba])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6ab4fbe7sm405761366b.28.2026.05.04.07.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:45:37 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [PATCH] ALSA: usb-audio: add clock quirk for Motu 1248
Date: Mon,  4 May 2026 16:45:20 +0200
Message-ID: <20260504144520.699522-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 549904C02EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36897-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nick83ola@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

The Motu 1248 (and probably other older Motu AVB interfaces) take more
than 2 seconds to switch clock. During the clock switching process the
device return that the clock is not valid. This is similar to what
already implemented for the Microbook II interface. Add the Motu
1248 usb id to the existing Motu quirk.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 sound/usb/clock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 656cfdc95c48..af71e4b02070 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -208,11 +208,18 @@ static bool uac_clock_source_is_valid_quirk(struct snd_usb_audio *chip,
 	}
 
 	/*
-	 * MOTU MicroBook IIc
-	 * Sample rate changes takes more than 2 seconds for this device. Clock
-	 * validity request returns false during that period.
+	 * Quirk for older MOTU AVB / hybrid interfaces
+	 *
+	 * These devices take more than 2 seconds to switch sample rate or
+	 * clock source. During this period the clock validity request
+	 * returns false, causing ALSA to fail prematurely.
+	 *
+	 * Affected models (all use vendor 0x07fd):
+	 *   - MicroBook IIc          → 0x0004
+	 *   - 1248, 624, 8A, UltraLite AVB, 8M, 16A, ... → 0x0005
 	 */
-	if (chip->usb_id == USB_ID(0x07fd, 0x0004)) {
+	if (chip->usb_id == USB_ID(0x07fd, 0x0004) ||  /* MicroBook IIc */
+	    chip->usb_id == USB_ID(0x07fd, 0x0005)) {  /* 1248 / 624 / 8A / UltraLite AVB / ... */
 		count = 0;
 
 		while ((!ret) && (count < 50)) {
-- 
2.51.0


