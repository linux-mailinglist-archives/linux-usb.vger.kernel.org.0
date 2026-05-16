Return-Path: <linux-usb+bounces-37532-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TkOvMZPxB2qbQQMAu9opvQ
	(envelope-from <linux-usb+bounces-37532-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 06:24:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455C55A267
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 06:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F65130098B2
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 04:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC262D63E8;
	Sat, 16 May 2026 04:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuIl8+4E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CE323D7C2
	for <linux-usb@vger.kernel.org>; Sat, 16 May 2026 04:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778905487; cv=none; b=tpYOJH2yNblSijNETz7MHHbdA12xuOhXQb46pQxjONHm/JBvQT4lPpZEUfAC1OkkNIUUlfOLDqzsn4lFABv2DIRXXWHSxpDZ0++vuSoskfZJq/70/5xwf6DtJ7O+FEsdFo6kv7ssy+n0kZCtSFsFrKSgmvH/QTB6aUHSZPlRDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778905487; c=relaxed/simple;
	bh=RNtkXuHkvir4GN5FlEl0r/gw9TngXQT5e+1Uek8o16s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U73DW4b64T8+3GGrc0AAaDCerFUk0EYY8HHfNSQn3AQvKDMFQM+nma1xdr+SIt6iIZt3IagV6sAB5uK1MSPKrf7kBFYkkZZi3Vam2tIxFOJDBTfscqanvVaJ7R6yoxzKnV94u/CY+QyJFXx4RlGU8mxS3Fo8qLXzFjF/VwMh4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuIl8+4E; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-838d0b7c950so400954b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 21:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778905484; x=1779510284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGxNuPoTYe3IW6E8h8wR1MIK1stWnjpQlV3rNbpzzR8=;
        b=fuIl8+4EcTyVdk9bav2n3kSiDYreDiCsIHVLb0ivhbeJKQZ+zY1/9nW4dCSY67gPrj
         0RtXbvF5CY1UpK4fBTIvxIPtmVoGLQzfGH0zFoJ660u30ewVgxP2hjy00oGFKWtUgahW
         qfr7NEdy9QobmlLnZOzviieKbFn06e4bAe0AoP1F8L3iibtrSDlKXwFl+qWSr5senCog
         XI0AN53Ba4XqU6jHuKYULUk7mqo6gtpeXrSXobhADGGXKfRAOdSCHGLp04iW+8yjZSjH
         0iXPuWKCSEGGJHSLD7L1cT1geDhXNY2qQU6qptbgrIGmJNS2IVA6yz9SufRqvSFtmOxY
         nP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778905484; x=1779510284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGxNuPoTYe3IW6E8h8wR1MIK1stWnjpQlV3rNbpzzR8=;
        b=jb2weIv9ukQ7C/o822QgtmBALap9PDYP93sEcw+agXLb5OD2QEkvJWPBVlT4dLcT/Z
         Bb+lGgcWfRrCId7josV56PSKQ3/P1On6DazZuHeXurpRsEaR1fM/TGdoGyM7hw17Kzqz
         Cnb0LdWWcwJRx8/3xyFPft/Sg/Bzq45HH3UllhdZQBnZ9kDzePlbJ7om74/5v7CaQ4YN
         Y6g+EwH+C/Q24X/sYn3bqmpRkLreIPk7aiQ+35NRWllzNRBo5rtaX+8vdT/6KPUHjmeO
         Gv9Q1DvBhKq+nH9TXpRlHYJ45fg3lpnvxLnhuFaeF8VIuIpuiqeCEG/eqNTXdYitDIAO
         TehA==
X-Gm-Message-State: AOJu0YykOWbbMxshW9rgBhZvgPdjJ1kEEInsiVQMcyujK3l2v++iT+wi
	aQ8hgXYCFOJRvjMQPibTtc7ftG38N3RyVWNX9bm2Xd3mS+vgrTc9LX8t
X-Gm-Gg: Acq92OHH/qWhyyAJ7oTUocqrQF2nTj1UPmcKgN8xEWLx0beBB0M8YNPnLApJRTN1hz3
	tK6m8VElexNGK8+NrwqDCqCQjg/OvyI+N6YnWomKdWxI/XGKsWKiC5amMjAY3aD29l0cHYuFLjv
	cdUpn1S2HCTpN73LKdN6yw/UJwixa959d5rRswwyKpyrDE5MOjVr60ht6AsdLOYe+WPB6ibGRm+
	HbPz260urze9+t6H56xiuCfVuQF/pRCD4KGcFzol7TtKMGbNfwI3U/BOo/THbKWGrb37K8rbnDK
	sgEeh+r7An2p5/lGBQJG3ND367lKwWTGtT4aTi3zqmKITO6rFDrw34i94sH8CsYaYRp3EPA2qIy
	sVYbo7jUME7jQG2Ya2/1EMaqE5wZPTFw8Vlp8Hk4rjO7afc4VIIMeqgf9n5Pf9Tk5xV61ptQe8M
	aUs2vjEmzvi4vCd9ZZ7lbATZaCjnZd6wY=
X-Received: by 2002:a05:6a00:299a:b0:82f:6e9:d1ba with SMTP id d2e1a72fcca58-83f33df4581mr7458522b3a.37.1778905484516;
        Fri, 15 May 2026 21:24:44 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f79b60sm8290059b3a.52.2026.05.15.21.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 21:24:44 -0700 (PDT)
From: Zhang Cen <rollkingzzc@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com,
	Zhang Cen <rollkingzzc@gmail.com>
Subject: [PATCH] USB: serial: belkin_sa: validate interrupt status length
Date: Sat, 16 May 2026 12:24:28 +0800
Message-Id: <20260516042428.3777524-1-rollkingzzc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5455C55A267
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37532-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rollkingzzc@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The Belkin interrupt callback treats the interrupt packet as a four-byte
status report and reads LSR/MSR fields at offsets 2 and 3. The
interrupt-in buffer length is derived from endpoint wMaxPacketSize,
and short interrupt transfers may complete successfully with a smaller
actual_length.

Do not parse interrupt status unless both the URB buffer and the completed
packet are large enough for the status fields. This prevents devices with
short interrupt endpoints or short successful packets from driving
out-of-bounds or stale status-byte reads.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

---
 drivers/usb/serial/belkin_sa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/serial/belkin_sa.c b/drivers/usb/serial/belkin_sa.c
index 38ac910b1082..a1e4173a2877 100644
--- a/drivers/usb/serial/belkin_sa.c
+++ b/drivers/usb/serial/belkin_sa.c
@@ -192,6 +192,10 @@ static void belkin_sa_read_int_callback(struct urb *urb)
 		goto exit;
 	}
 
+	if (urb->actual_length < BELKIN_SA_MSR_INDEX + 1 ||
+	    urb->transfer_buffer_length < BELKIN_SA_MSR_INDEX + 1)
+		goto exit;
+
 	usb_serial_debug_data(&port->dev, __func__, urb->actual_length, data);
 
 	/* Handle known interrupt data */
-- 
2.43.0

