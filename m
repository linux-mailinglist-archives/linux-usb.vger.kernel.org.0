Return-Path: <linux-usb+bounces-34614-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOGuM+fJsWnvFAAAu9opvQ
	(envelope-from <linux-usb+bounces-34614-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:00:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327E269BDB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 21:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CADC430B3D66
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 20:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0378338237D;
	Wed, 11 Mar 2026 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jdc+2kVc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9A344DAA
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773259234; cv=none; b=n1nVFX03PEBnXA46urBHudQfuXrjGGODFZ8uv40406W3Ut8SEBeHZBXIOG4IR7xoTunJRqaW8fmBGoMUBQydAxqQyMqcm3nh0jNrl7XgIBv9QF0DXKv81cS08twK/EPQeaK4jAVeU64IycXuUh+z+Fc9RpPQUDtICaqXEUS0KeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773259234; c=relaxed/simple;
	bh=ACv21EToIQ3NVCRczaI+PEDm1EcsdyjZXJrYowQrVzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dM9801NBiF+lqVQnCrW34KbYtJlHIefgphI8fzH/GVcFHeKqMlMce9PjiZkLJO2sqRPQd/WjGdAKb55HeWzYXfuljoAR5WfGqxnl6mHkXF5TVOoNs/NOHFEkyX9wchqsWXRPszS3aSQnRZoX1L8AiT6qmOcGUIiL0QXFfIhh4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jdc+2kVc; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-56af73db66bso131016e0c.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773259232; x=1773864032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1r3InFvaXQHSB4+wPzQax9N8XbBVVdha9jMwVwxtnQ=;
        b=Jdc+2kVc2FcxAof7lfdF5EEVWX7CzYGyvQFH/tXsXKLgGWq9GZjA9/V5Nq94vLipXe
         doD5yqF9wFJz0oJKSL/oOAcRljLNlu5wf4gGNdJZPabXHHx+8pyqJ8i5iutu7VVgOAXN
         J9BjnzmmEgc8efDG7ziG0Ohq+d3/ZRQHDBIWMlYLgI3z2l2nWHY5IHRPxDD26PxXKp0t
         OpcDeicEAVp+zHBPbPtnJ0dbqRAPFOXOmbak4Nj8nvpwlA24tWOdwRFxlgdiGlttwD1p
         O4TTjYzjnNBmAXB7XsC4HNvHcZrb596FTv87rUtaW+FbPZbd19ipZC2XgDqFVm4XBU8x
         7Pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773259232; x=1773864032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1r3InFvaXQHSB4+wPzQax9N8XbBVVdha9jMwVwxtnQ=;
        b=CTcFLEE/Z4tKev0TtP8aHWSkcUZjQd0avP8HoxmYoKisjcPN9oODbFvBcYOQhNqkcK
         PVa5tv77Ut8MupcKcMdRM+yjPRZprgy+CssJKPM40t6hmh/pdCFhwYfF/Hf/V13ICevp
         KbmOXMgESigaEByMhYgZ1ldqnvvGZgWsW9ffObu1PBFSXJ3WIw43j3Tj3fK04stsMVLI
         JaRse357nInSBTHh2T6jRCbilNu/N9S/mh/yYW2paBDyyGDLILjOSB85gxgr4FWxhZBb
         JqqWkiH0q48BvXTNdl8QKnGK006Q+dPvIGAPmzPPSPGyFh8lDGvpFiqzTIk4+MXky8XU
         c1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMJRBiSvXNVT9MFb52yivjOLgLBdLSquoytGWjWYX3nS7D1F1/AwFNJKg93IPMZ4oQTZ6rTPB//OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjr21B+Nf2uuYbW6tHK/FqK9STEs9Yyof28nl+jesBNcQOq7sy
	7B0tNZPkIdK+/DKQFeLX9ln7e03rEErPeD/IoP4s4MkUIuL8VXaQFxAp
X-Gm-Gg: ATEYQzzzhNAqKeXt6AG7WNh1cm791GKtg8slu+TTFbPRPNr4Srv2+rObbsWW+pjTjh1
	d0hSTHY+gIjebnw9MRDGJNbeIiqQY6X5mdSE9/7K60036CUYIqN07wStwlFHFvU3L8hd8xjMGDI
	e3i54WH3hTmHDu/Ucj7wp5zpxnPVpnKXS0mZ01KKAmOMjAvo80PG27aI8q14gWEVW2R+JbCFsmP
	870P/hOcQ40xfVNFwJsy5rfxad2WnzDMn+QEhHozl9Xw2/fSrZwL1WfJ9jVJMheFcM6ZtoVQhW0
	kQRztwWs/MF5ZY0dfzlmMh+Yc3hWV8yOLZx66mPvEwteUy3jUjReNfaeXxtiP0giymh6aem9BMA
	a4RYP4BiAgo7dQCp5aApQaYkRShnTFuOkkA3Hs7Uq5KBjswPrRNWYyB0Wxmbpx9u7MvI2Q/pX/J
	cGvKKTmZNvxhAmorm2+A9RTmoExdnIKp9jQNWssgXfDXREFMz85tMlpiXp2N+2Jkc46hQUeDQcy
	Ap4Ucs=
X-Received: by 2002:a05:6122:508:b0:55b:9c3f:55f with SMTP id 71dfb90a1353d-56b476778eamr1273567e0c.18.1773259231967;
        Wed, 11 Mar 2026 13:00:31 -0700 (PDT)
Received: from ortodist (177-4-162-212.user3p.v-tal.net.br. [177.4.162.212])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b4634177esm1534327e0c.6.2026.03.11.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 13:00:31 -0700 (PDT)
From: =?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz,
	broonie@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH] ALSA: usb-audio: map UAC3 front wide channels in convert_chmap_v3()
Date: Wed, 11 Mar 2026 17:00:10 -0300
Message-ID: <20260311200010.103710-1-cassiogabrielcontato@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34614-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3327E269BDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

convert_chmap_v3() translates UAC3 channel relationship values into
ALSA channel-map positions.

UAC3_CH_FRONT_WIDE_LEFT and UAC3_CH_FRONT_WIDE_RIGHT currently fall
back to SNDRV_CHMAP_UNKNOWN, although ALSA already provides matching
channel-map positions via SNDRV_CHMAP_FLW and SNDRV_CHMAP_FRW.

Map these two UAC3 positions to their ALSA equivalents and update the
comment to clarify that unsupported UAC3 channel relationships remain
reported as SNDRV_CHMAP_UNKNOWN.

No functional change for other channel relationships.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index d38c39e28f38..2532bf97e05e 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -366,6 +366,8 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 			/*
 			 * TODO: this conversion is not complete, update it
 			 * after adding UAC3 values to asound.h
+			 * NOTE: not all UAC3 channel relationship have a
+			 * direct ALSA chmap equivalent.
 			 */
 			switch (is->bChRelationship) {
 			case UAC3_CH_MONO:
@@ -390,6 +392,12 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
 			case UAC3_CH_FRONT_RIGHT_OF_CENTER:
 				map = SNDRV_CHMAP_FRC;
 				break;
+			case UAC3_CH_FRONT_WIDE_LEFT:
+				map = SNDRV_CHMAP_FLW;
+				break;
+			case UAC3_CH_FRONT_WIDE_RIGHT:
+				map = SNDRV_CHMAP_FRW;
+				break;
 			case UAC3_CH_SIDE_LEFT:
 				map = SNDRV_CHMAP_SL;
 				break;
-- 
2.53.0


