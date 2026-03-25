Return-Path: <linux-usb+bounces-35454-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMV+KevPw2nuuAQAu9opvQ
	(envelope-from <linux-usb+bounces-35454-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 13:07:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEB332470D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 13:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABD8D30A7785
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 12:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8329B3D1CA8;
	Wed, 25 Mar 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOI426Is"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C723D16EA
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440097; cv=none; b=oc3TyT1Ey6UX3BDi0q0s/5sAOF2o3g5nfA6/xPZk2EXjqYDRBjVNCLa2Ys96D+PeigJ+OY2dw1cvJW57zvp7cRE28hUD/9d/K+HV6gRyJNFY2zhz6KxaykUuPWPXs38uln4ID5M8lZ5NYqOsJlI1RqMQwDFM9WMptmO3VslJtQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440097; c=relaxed/simple;
	bh=4pXEQcfBSwWBzkcvnY240q/0WTgdZF1RZkoOfmqBMNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NYAIkTxMOfW8QRjQ02DFTpNNwAezTUQCv72yd19BN+nx1aqLq2mxM9JIB+LHjjuAGj6Bh4LQ0+zW7nyT9hAB4zNu1Yi9xN+AYbETbuD3VyQTPCy3/wI1HJ3sIT/PeHwelUhURPPoI00fP1Wnve1nQOpa/2Q00ZD31z7nL2AjZcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JOI426Is; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c70f91776fcso1081837a12.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 05:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774440095; x=1775044895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zee+zuKEUvehelRwJdwhKr5qacJeb+q6OMEUGMCVW7Q=;
        b=JOI426Is2aP5tlsZCA0fnKNxVH2VfjMdlND6XN2sOSG1FViJBJv8GKZgQXyfY3mhBv
         I9zI9OJFzxEOgJOdyXFFN9ciLPZNLb8pQjxNEdsxt0qNoN6XC6Nf+zsn4KIKrhWs9umu
         9hUxyzu1jBVJennf0WKR6bjKYsjyNIm7F0JXvTd63k+tb3qYiyY3zsdz+QJnyNTjiaHf
         G70wBJJd0aMrpUsbH+soXlWC8RQ7C4hqqrWTkr0TN4HrEyizO0GvebBRhebqtwzjiDs2
         IGRM/C4Ak0hK8ZQr/cGq6KIy7lVRKr0CZWZO1LnI3qV+Hq0hVTZdSJe44jvtdkt7gmX5
         +vLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774440095; x=1775044895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zee+zuKEUvehelRwJdwhKr5qacJeb+q6OMEUGMCVW7Q=;
        b=cHuVa9QvoPyRXvUyqW8ElEFtbAAvxgC0X5yoZ/azEToHcNC+xbbx25bVTwBJ3wXOTm
         S2RazLs6ZbPWON/oFAu0pcHk9GPU4T9umszxm4hG83GaquyZfFez7dnz8+/aWsHy6lPl
         zF8Fw+mSnIqfyNxF+z4dU3aNznwRHNFDLnUkk+3BPJ0OI3MtbETt/rJSB9VyPxYcxFmi
         XlaIjGe2hdvjJI6yQJS+AW2NAlPpfz4In268WW4r6Ji7/6aHdw1oadnSGNAvO88LlfyJ
         dRkPWDhAc+/iZy9ehCjG4a3S3urAZ1Cz29ivudOAoPCLc3pp79BM3Z4iPgkYI2/IwdJP
         MVOg==
X-Forwarded-Encrypted: i=1; AJvYcCUHMysxuQAaLURFHkfZhsQO0X+qokETrQQIzdZr8hshTDmOUE6rId2j9qeRoJ+MkAScr6auvaUuWCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLtMRTuaFrNk0Fg3Ij3TpZttBr35ZUMEFpZnH4FacNBQRffRW0
	MfpoBhkW4ZCaodkgQovgO4NTMdfZ5ix7nU1JDtrwPTYY2dh8nkB4eXYi4B1Fl04r7ts=
X-Gm-Gg: ATEYQzwkzhAc7T1JfSztQI2sMPLThPEzBDom9kIMnbBCTJUvLsLjU62t2EMg4WLKJ6U
	j7a8TTrXB362E+fm0wePvUX6vcsz0444yWE9GO8iObwI4KQE6rEMnbFMyXUzT/e5v5YIKUEunQ4
	iK0Pfc70n4J/hAHK0wnT+QP8BjNXwycS7ouDkXOF4lDT+jvAEGRnx573D2h6ADxVS1FlL2+Vr0w
	yYmWfDgTTEFTQeJs4PwvfkbvQPA6fYfMQVY/9eOP6LzqV9p/lbbjTR5WsgnGUAVHQX24VNaKLA1
	UR6O5X43EA8Kyg00mnDMplWRAjqXfgPH6c9KSMC38dm/ZopbwATEZGL7VWTdQau9qL4ai4ASBKr
	ULETukpBy60BgWRMjFrpUZQcH/XAIfevasZppb9c0P0EpLYPvVhAPqY3n12cqhwp8qew/l23Uai
	d2H7bBREf5jzVt3RDnCACnhd5HaJ9hAmCoh+ODLzn6sY8wSXhLrNrQMPL8pH0gAXPHHsfjw+SnV
	B3nzzQwgS7SKac43WUB/s5RiWNDcIx0eeed6UqhQOyQ/D2R62g=
X-Received: by 2002:a17:903:3808:b0:2b0:4c8b:7d33 with SMTP id d9443c01a7336-2b0b0af993fmr35206905ad.51.1774440094791;
        Wed, 25 Mar 2026 05:01:34 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-3815-168d-c433-fd3a-4c65-de00.dynamic-ip6.hinet.net. [2001:b011:3815:168d:c433:fd3a:4c65:de00])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836556desm240332135ad.47.2026.03.25.05.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:01:33 -0700 (PDT)
From: Charles Yeh <charlesyeh522@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-usb@vger.kernel.org
Cc: charles-yeh@prolific.com.tw,
	Charles Yeh <charlesyeh522@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] USB: serial: pl2303: add new PID to support PL256X (TYPE_MP)
Date: Wed, 25 Mar 2026 20:01:23 +0800
Message-Id: <20260325120123.1989-1-charlesyeh522@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[prolific.com.tw,gmail.com,intel.com];
	TAGGED_FROM(0.00)[bounces-35454-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charlesyeh522@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 1EEB332470D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the PL256X (TYPE_MP) device by adding its PID.
Also fix an unused variable warning in pl2303_update_reg() reported
by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603250523.9ktgw2Ju-lkp@intel.com/
Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
---
v2:
 - Remove unused 'struct device *dev' variable in pl2303_update_reg()
   to fix build warning.
---
 drivers/usb/serial/pl2303.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
index e5bbda1d63b3..67b78d2fcc92 100644
--- a/drivers/usb/serial/pl2303.c
+++ b/drivers/usb/serial/pl2303.c
@@ -347,7 +347,6 @@ static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16 index)
 static int pl2303_update_reg(struct usb_serial *serial, u8 reg, u8 mask, u8 val)
 {
 	struct pl2303_serial_private *spriv = usb_get_serial_data(serial);
-	struct device *dev = &serial->interface->dev;
 	int ret = 0;
 	u8 *buf;
 
-- 
2.51.0


