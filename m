Return-Path: <linux-usb+bounces-8422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F5388C69E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47D2A1C3AC48
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAF713C827;
	Tue, 26 Mar 2024 15:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdhUEsSl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16C13C809
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466218; cv=none; b=ZoeAaemU3WNQK5kneigHfAxQf3hNzghRD/2J1AvxOqUttVwG1cyDw6rVwKnozku8KkwQilrQrN2vqU4/6k5d4mQ3303iCRFaIWSWmF6MiQ+o+0B6GLQ5i2tZsPLO7msjMYmfIRsH5nS47zJtqB6PulnqzbOETQaSwQk/0PV+dio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466218; c=relaxed/simple;
	bh=fjTS6gtlllNalP0QOGaKGn3S/Z8yvGZ7I+FGF9k5M5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deirOv8IwQ+97nI6qnY2eZHNQIMZSBeNB74yLPeb86lGtaRRLKTvLBqnrgX58/xPvBhH968HvpnsNjACSQm4TaY+YbUXzv8OxglhSx+UEZN6NJsdPOiGefBe8pGpinPQqk/WyHoAaAdxkAzsN5fTBIDyarihhVnFy/e+5FzqpcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdhUEsSl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e74aa08d15so3836623b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711466217; x=1712071017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uum5vz08f/AeAkxK591s+92guLMsYWdqso+gZlXAqK0=;
        b=SdhUEsSlWbd3zsqEFK3VVwXyDeuN7o+FSnan/MFiPKnfEhUOMfQ2z1vSAuyPY3acw7
         ULm3xb6omWzN26qWUWGcdZb2Wb4OGMHjtnLj2grmfrnB92BFNCYwNupheyQ72tR9wQEC
         18ukpa/d7QWtO2QUgYUGX6bRrvGdSFjlQlLxCn3EkkRSOw/xJIOBEI1PM1OoW3ZAU1XN
         mA9QDjVKvGrnw9ixyAw8IzmGVjw2OefI5u+y6j5Xr/3Xtsc9jjgH7ZuclmLEtyMjRFC1
         je7kM+eiHtJKI6JrSuqA3jWT5tc3CAi/kCGwRKFPk9Lqs3Fi3D5U+Wf4ax8w+gVbB8IW
         dsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466217; x=1712071017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uum5vz08f/AeAkxK591s+92guLMsYWdqso+gZlXAqK0=;
        b=rxxArjYn2qht0jFji5Su+QhQYuEvefgsr6sO5qddyJAxUms5dUSG2rTirmAqk7VeRa
         K4JppJ9v1p2lbAnDRIbWjpPJn5MT1THlTIlOKl4x+hOBt+ZwyJp6yZTwxa3t4z3qBEq7
         RPCUTnC+aXM6q/HcJ9pEFWsBUZXDvrgO5+8I6l4rM8SycPgfQJEeCQg83IMbTGM6Jlqr
         l6GTl1sTepyccEhJaW7f98xSAuFl9kSwmbPMXcxCCJCfwY11LsO/hc03IrKoAf5HbBep
         WMjrVj3XvuJln0tdezt/7F/ebAPx8leAqwexBAoWx/jm0XlF50/7KJCfhfP1bMr5GTUg
         VJgw==
X-Forwarded-Encrypted: i=1; AJvYcCVmgefQYnWlDW2lrHI1/FAk9Fzo7834JGNyoJUcjs3ZgatH5jQ7bZPsOrDQQAkLTmHRQpWBJWGo7izHNc4CY4RtWgRKUqEJBsdd
X-Gm-Message-State: AOJu0YzWkPNyjnhG+osDTdixj4EMqM5vLPu6TH0mZQCBycuEq+L6kKsW
	r2bz9ERGmSFt49CiMsJ8MW6qlxaqpvBJBbf2qcBIJtjbPm6j2C/d
X-Google-Smtp-Source: AGHT+IGdeqkd37VnZ2ziWiWIOxHtW7ouo53G2cVQNLtllhZFpFA6y7Ihhlzz9pzoOa6iULl2dGu58A==
X-Received: by 2002:a05:6a20:7005:b0:1a3:7e88:2262 with SMTP id h5-20020a056a20700500b001a37e882262mr10483304pza.34.1711466216982;
        Tue, 26 Mar 2024 08:16:56 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::c91])
        by smtp.gmail.com with ESMTPSA id s3-20020aa78283000000b006e631af9cefsm6073126pfm.62.2024.03.26.08.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:16:56 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us,
	gregkh@linuxfoundation.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH v2 2/4] usb: misc: uss720: document the names of the compatible devices
Date: Tue, 26 Mar 2024 09:07:09 -0600
Message-ID: <20240326150723.99939-3-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326150723.99939-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
 <20240326150723.99939-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Information about 04b8:0002 and 05ab:0002 is from commit e3cb7bde9a6a
("USB: misc: uss720: more vendor/product ID's", 2018-03-20). The rest
are from <http://reboots.g-cipher.net/lcd/>.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index 1c940608deb5..32caf3ca300f 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -767,14 +767,14 @@ static void uss720_disconnect(struct usb_interface *intf)
 
 /* table of cables that work through this driver */
 static const struct usb_device_id uss720_table[] = {
-	{ USB_DEVICE(0x047e, 0x1001) },
-	{ USB_DEVICE(0x04b8, 0x0002) },
-	{ USB_DEVICE(0x04b8, 0x0003) },
+	{ USB_DEVICE(0x047e, 0x1001) }, /* Infowave 901-0030 */
+	{ USB_DEVICE(0x04b8, 0x0002) }, /* Epson CAEUL0002 ISD-103 */
+	{ USB_DEVICE(0x04b8, 0x0003) }, /* Epson ISD-101 */
 	{ USB_DEVICE(0x050d, 0x0002) },
-	{ USB_DEVICE(0x050d, 0x1202) },
+	{ USB_DEVICE(0x050d, 0x1202) }, /* Belkin F5U120-PC */
 	{ USB_DEVICE(0x0557, 0x2001) },
-	{ USB_DEVICE(0x05ab, 0x0002) },
-	{ USB_DEVICE(0x06c6, 0x0100) },
+	{ USB_DEVICE(0x05ab, 0x0002) }, /* Belkin F5U002 ISD-101 */
+	{ USB_DEVICE(0x06c6, 0x0100) }, /* Infowave ISD-103 */
 	{ USB_DEVICE(0x0729, 0x1284) },
 	{ USB_DEVICE(0x1293, 0x0002) },
 	{ }						/* Terminating entry */
-- 
2.44.0


