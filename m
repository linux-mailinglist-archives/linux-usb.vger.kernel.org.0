Return-Path: <linux-usb+bounces-32448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5A8D38D76
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 10:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4392330215F5
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6645334690;
	Sat, 17 Jan 2026 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWkvCtQ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4608E7260D
	for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768643199; cv=none; b=k0zP+lhR3Z7uHTmTeJcxiTiFBeonnjw84o3Gnke6rw5CXDAfqx91xa2e/OV4cz89MRPKkfvdNArD+TaYGKsmvGyqR8jECt4LaXu5gg6QBsLI7lsOQ6nOR/lc68lZh8NoJxoKFYLkxKS1dDZr1xyJvtsYc45+v0zaC4uWv0FijVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768643199; c=relaxed/simple;
	bh=dzuCEr++dzV7RGNmwdbO18PEnRRvlr6DRE7R+PtL5fE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNjpizI2F9Eff9TDCMXE3Hbw7KulbVkZ8bGhwfdA5f0ARxXV+u9UivMLG6kfJlaLaaAdugKwYwbCfYPccWIZV3GKkzCipHwdCWcFozfE6fJ16S5/bEPEBwln7CVQXRYMk1RyAGZTvF0WuQ867lsG7lEj+NEiAgQzRN7vgnt3zeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWkvCtQ5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso1597017b3a.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Jan 2026 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643197; x=1769247997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdRImgnlzumkwpGPWq3zB030HsmNVz+cDIu4+32/ft0=;
        b=bWkvCtQ5CCXza9jRk/LsSnKU0CUkDASpkMA4/s7W5pmuWUZQOyIc7G51lzsRFGWGFR
         eV+lkQUFA+96z8W012i/jp1woeHmebKSPLXCR147Mm1Ky6V7P0VqlZfh0iKDlM9drfC3
         LAT6htDHHCKP5ZnLbzbsCi0RQT4B6jcizgR6ABHz0HjvmtL0BYBJFqxZKJo80nNTxZdD
         XUg9/pBRP252AcAewqlzAUtByEY0I+4ewRg1a/39C3f7hKe001tgu5MqVtkl32PR56pI
         XNPW9L1mpHism8H2y5tYxLXwapa6ikrsI5XCQxB+Um77Y+GkMuXceRz7l4jyURL9LihP
         VhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643197; x=1769247997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdRImgnlzumkwpGPWq3zB030HsmNVz+cDIu4+32/ft0=;
        b=Nz/+ukPRSf2PHHcV1d9f4Sp/TIhTMyjnsMw9BeFNyfy1dsA+ac/VxsKXXLivsuumxB
         FToVg+nN6ucf9eizmSmqrcVkgkY8M72lCDVwfa8lW6jx8tHV2P73QN0qJn0HmA9DSy0w
         TDfSHM/eVkUtwMuMq3aR6TMSPe924w+/4fyUWADSriItAwwRjpA3dausb8tECwyC6++G
         btQVacmOAS9D6MAObe+HA9iNdxGRxEMmrknFVkCDodw5a+XiFJlNz6V1XGF7eGpiylmY
         VBdWfuBQ8w8Atqw3SYtbi3ALc3wr6137hLtGkQn0SsfDkeNwCmqE8CxW5l2z62GyIKu7
         kbKw==
X-Gm-Message-State: AOJu0Yz7UP378nxlDtvLhWUgPGNBjP8B09VQZFfWwIG6LX9LrnT6MR7r
	XHdyvt0HX7XQWJGXLOPxURfhHjtBRsa68i2VueVgqlvu6at1X5RhYU1w
X-Gm-Gg: AY/fxX62/0V/S29MeSNLSgCLV9jKTO4YO5OqwBZRttRxBnSgL69p3RLjn0sk7ZmvQoy
	1QQbb+9FJzRdq3QFXgEbx2+EcqzUMdgu8BXd2vr8SjOYMe2qyFrJyBkm3tCASAjeTf6dhOtr9QW
	T7PsNhOx4Xj7Vzpbdb7HOaG+2e/gF6EyMtwasMF2nAiV2LI3iHTW8F6NUbaEBmedzM53SrtWj5G
	pTTSBJzOZFTsMV8RhpX1WM2V143fVEmhClysNxOf98T8nXbLOhfbQITLIyiSkXBWLn58mS+1+QF
	iiEb3kfgAHjWnIYe36SxqJtUOUGhFgPg7s4RR0DXLqyfpMOnfwK0A9cNuTWQ4swVbApkgpfEC0D
	XyK3BErIzkh8NiFZf1GzmQHuCtDgFNEfEfKJT0D56X2TPXcILKN/F4iQ8u1Sm+1UlmhLvYL0YYZ
	em8Hfs05vVO92cHTDjndB7ZqMjPrVxxwyuRCDKyCNhPofW9fkcDyD+hMnfJCstd9AFqk1gRFMki
	udl20nZC9QPO+q3BhiqjyyU48wPsB0kUx+eFvwJUv7sdno=
X-Received: by 2002:a05:6a00:14c5:b0:81f:3d32:fe58 with SMTP id d2e1a72fcca58-81fa01ec336mr5335959b3a.35.1768643197568;
        Sat, 17 Jan 2026 01:46:37 -0800 (PST)
Received: from c8971f1abf06.ap-southeast-2.compute.internal (ec2-54-252-206-51.ap-southeast-2.compute.amazonaws.com. [54.252.206.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12b3165sm4063839b3a.60.2026.01.17.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:37 -0800 (PST)
From: Weigang He <geoffreyhe2@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] usb: xhci: fix missing null termination after copy_from_user()
Date: Sat, 17 Jan 2026 09:46:31 +0000
Message-Id: <20260117094631.504232-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer 'buf' is filled by copy_from_user() but is not properly
null-terminated before being used with strncmp(). If userspace provides
fewer than 10 bytes, strncmp() may read beyond the copied data into
uninitialized stack memory.

Add explicit null termination after copy_from_user() to ensure the
buffer is always a valid C string before string operations.

Fixes: 87a03802184c ("xhci: debugfs: add debugfs interface to enable compliance mode for a port")
Cc: stable@vger.kernel.org
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/usb/host/xhci-debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.c b/drivers/usb/host/xhci-debugfs.c
index c1eb1036ede95..1e2350de77775 100644
--- a/drivers/usb/host/xhci-debugfs.c
+++ b/drivers/usb/host/xhci-debugfs.c
@@ -347,11 +347,13 @@ static ssize_t xhci_port_write(struct file *file,  const char __user *ubuf,
 	struct xhci_port	*port = s->private;
 	struct xhci_hcd		*xhci = hcd_to_xhci(port->rhub->hcd);
 	char                    buf[32];
+	size_t			len = min_t(size_t, sizeof(buf) - 1, count);
 	u32			portsc;
 	unsigned long		flags;
 
-	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+	if (copy_from_user(&buf, ubuf, len))
 		return -EFAULT;
+	buf[len] = '\0';
 
 	if (!strncmp(buf, "compliance", 10)) {
 		/* If CTC is clear, compliance is enabled by default */
-- 
2.34.1


