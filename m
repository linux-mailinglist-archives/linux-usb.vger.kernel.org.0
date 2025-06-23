Return-Path: <linux-usb+bounces-25017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C74AE463A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 16:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3692A17E865
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 14:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B10145FE8;
	Mon, 23 Jun 2025 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="vZWa1JKq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5EF82864
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687851; cv=none; b=c3Lf5Pj0cpzZArsuTeKow0VLzjD7MD+tUlTmMZsAX62AQcElN5OX1Wu5vwasD1xDJ9+jwXJSSAqi4/Y1a5VHwT57zC5jze3BsdnumF2yRIzK1w8KOOVq5yJwT1o4eMOMbqz1FW0KVSknviV4af4SMwMYB1LSzCbbVBgLK+ItEys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687851; c=relaxed/simple;
	bh=nIC8FW1qrw909l8wvSt3cY7s7lffa33yp1Dh6OvbuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XwV4L9sMw8OUhH2wpgAQARyaWe2mPO7qX5K9+jttQyelNm+Zt/gcK4T0Xxh5qfuveDTVAtza0pfS9BSlcyWPVmOc/YyyQ2VsAQ4pBGaoRM0g0vUP+gIYtFUGT1TJ9DvXNtS733AWXI6xQr3ClUkmxdVVPhF8HyRpGLn/L6uIqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=vZWa1JKq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so22215135e9.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750687845; x=1751292645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=vZWa1JKqa/wYw/utO/1wjqGcZ4ZohAM8LZ972zak2/DN75RrW2rhCoPO3n8Dhiu3Zy
         L/VyAkn+ccsLLBJdVmK/tMV+dUMNMkAOQjN641JCdGGvZiwbGzSF4ZrJuzRei4iyFwDJ
         YP7XJfj0uar0AXlapnX6b+Wwe08i9z5/yWX1zXtdrMWG1kiYQPu/b/i5NibGYccakKM/
         Y1WEBoEiBJHEzSJ06Z5uxJOKAyVlmkBu5xF+8lhZHHFgjgqFb4zh8apGpBCbtr8Orbxv
         RKrLOwUpyY5d5hS9Jp8StbfEJc5D8zX94LUUBE/kxYa8QlAo4ij/OQVd2481Z0dnDXJy
         LRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687845; x=1751292645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=bFUZeBzJiMMF5Hl9NStbaNpVaXg9ynPTXvPiXkYJ0aVR85z2R+eEH4x2IAoBzMSo9d
         lMXqF2ZOYglbsXg+KitOmt14awJ7YLgyltv/sPgiVMqUcL+V4kRH+LDmr7sazgsvqwyc
         bCr8wXs/V3+R21PsWrpu1kHujjKwLChzmAf9U1avO6zIWRZjmhG90+/aNwfEjt5B739a
         PrmykdygdeLAZ/V6z5p6JcsrjYEgUPnNA1meTn7iJOFJOz8xdJlj5MiW7olZ+Fw0MJU9
         rLgjM6esIELpEr3xN26O0ZScp+iZq4fB/i8LVlR5HEZKr+IOlKXjM2kA886hZeVNPshY
         06aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxzYpaX2Q0U1WoXtqputQbDCZVdOFtwaxxWxP5vqfuj9dnW0U/PJjwh8CEki2Boot+hi8A41zpCkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8QJQYSPCxX3h0d6Bgu1M6u5GC0+Y24Icf/zs2/XqVWycuEiZ
	RkPZ0ww2caLFo/KlfEx9n2WqUNYP+jJzjkYXmnkUvtlF1Np2mSgiN/EjlmQLQ4NjXjQ=
X-Gm-Gg: ASbGncvobVzDX96DUUh9YhCvKiE6lLpQMuaI7CL/h7nFBAKHzwFevwTkEnOdjGT8tta
	3HPh1CpEr5qDQ78J79pYj+csQ29caXY3GV/UUoWaKEWeNG+hJKr8kqYfJjjDITUH0L8PtJwHl4C
	FZ4OG3OKkzcMZgRSv2CE5ipp0YTa4lHy8t1u3R8myle+5PoptcBmEjgctL5bervHjj3yZky8cik
	I1SD/22rqHN9uXzsc6ZLGSYVRvKWgKamkhTER4Kbl3RxK2hRWWZ+ErWsfLUwXKYT07C3nCUzZJs
	1XMQNkrvGF7UB0cRORuzSKkbNlxtK99C0Opo9nfm9QbrgbwaPm6hTe7YXL0Ag63QSLPhnTrcKkU
	hPv4GEpLlKRUJe6VRVFelxP5J
X-Google-Smtp-Source: AGHT+IHu8ThU4fWbJ971kUhXyTgqaaI7W/xvc9ZVSFaTQKtizCrSIiXqe5WNuEKSna35IWIMP6agnw==
X-Received: by 2002:a05:600c:871b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-453659d0a9bmr130173895e9.15.1750687845066;
        Mon, 23 Jun 2025 07:10:45 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:8310:8165:973c:45af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c02fsm9695584f8f.50.2025.06.23.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:10:44 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Mon, 23 Jun 2025 16:09:50 +0200
Message-ID: <20250623140950.61568-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
 - Removed unnecessary curly braces as per style guidelines

 drivers/usb/host/ehci-sysfs.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..5e6b545c30e6 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,17 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
-		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
-		}
+		if (test_bit(index, &ehci->companion_ports))
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +66,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0


