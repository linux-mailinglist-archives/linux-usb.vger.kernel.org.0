Return-Path: <linux-usb+bounces-23495-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA0FA9DCDF
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 21:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35200923B07
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 19:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCDB25DD1F;
	Sat, 26 Apr 2025 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9obGWJW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55B1A01B9
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694759; cv=none; b=NXx83FU9+QI31o09ulDAZDGCRiy1dKINual0wFyJD3pw+46ZACf7BkI1Uk/e3dP/he1jFHh8aFH0mwtzSPxKluh5/jcHujRPT6LPutWGmNETEr6yCyOpa7vjAiDmXLZheSrFfCZx5GoM8BaHLl7aUrnLlLOfwhENUY8xFiDSQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694759; c=relaxed/simple;
	bh=kKOgCO0HKEAf026MYKvl4Jivt3cvTd9sjml8fNfxc5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxpALkcmLZEW0HZ2B5sKhUtt3qZOxH0kZZR8JYXa3yEBwVhN3ia/aiHYjTPaAf0/c4DG3XjlU4XftRiI1/lhn0H5tPipeHdG9LWEQZVyST/DGyp19jqou0POwIXewsGO383FEZO9ZfgNPOMVPiVxxhKjNXShpmpcYbAC2GYaugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9obGWJW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so26062695e9.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 12:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694756; x=1746299556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uekpitars2okmTYCopbrvgCr1C4ukfQ67aYO7wZbHA=;
        b=N9obGWJWJuEfqG39mjMLxeTdX/zjV7c28f7pbYJCKFzhGnzbIcniaQ2lKikB0a9P0d
         rmMWshIJevf/3Ww4KQxPrAd1P9iYfzMt6VMAnrHc/WyJITd4DsIDR7amz1yjPeqTr11f
         Xsc429nuiX7yNC8HpvVRVbw4ugtHuTriu/311H/7xGLyK2+f8ta7Pzzk32XTGU0ZSItR
         ywNrkllRv1H/6N3y7hU0iU6sjwZcoHEWPKGJJDcAv/idb8qC97q4ypXH+eBhTqzHCm48
         YBQzAIdsYsZVgA+tb7UyoF0OpyCjzF9t8rKuCoGqqkv15zrobXpIcr7TWV+zx/lOqmXn
         l4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694756; x=1746299556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9uekpitars2okmTYCopbrvgCr1C4ukfQ67aYO7wZbHA=;
        b=aW1Y7FBvOBCGob5QGqnHkLPDLkaTFKXQ3QYLHmOqY0s9ASh/15PyWLbj+N7M/P/dQ9
         lugQxjLOosQwv9pWxQ6q4QzFplPobMDlQKtZs7+EBzV+0OxOUW1DNosoJqUC5uW7FpQ8
         W2Lu4TUqtEPAzSXHikGfS9H9V/9ymhzj8QkiOo/ybAZbcNY/FtzvLjHUyJFQvoFbD8pf
         l6i4Ymc3+ukuOmkePkbFExYmGm3huDDdRaeI2ti2EaHys8N0XOpp58X0dOogTdoHgRCf
         psj0Dx2Dmd4Xo5vXc07czMR1pk8ZsbjESGUqrftegkX2xVTyU+ApVuK78iOFRWPZd2g/
         n9cA==
X-Forwarded-Encrypted: i=1; AJvYcCVwgQ995iET0Jsm4YnPm+dl548NZ8+zCC1X5KUUOXx1kt9Ec7fZKQKAa/SZrneXn6sGK2K+P/i0mFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfg3yXS3QGH/WEWqcj/YVs9S+OjrRh+Zo94Q4CEgn5IiL+O3q
	6rWPwuqcMGFuvWluorx2DeEws/QJJHtXvc5Carts5XzVxg62r7+KsKdRospl
X-Gm-Gg: ASbGncuI9tDDyba1KVjpilrMdlWmkNmKIQ65AWnD/TwIT7q5ux5u3xjvso/GNoC+i4n
	FisZ4YYJidf3lQ+HRkDzHVh+OJ9NYklO02dJwxWw0KTrMa7Dl5IY2FUkrfhsv9ceL2l/zvTAWy+
	fo21jdwsMTxkazDO0ONA23Ra4bdvXTrL4brpacvu6/lCGU6f3qsI8omOerg3dIWhaWE4HaxfbFe
	SYWNXb+nOkpRrpdc/gpH8lF76n23d6DECijiNlLeAJge7jHOmKtTG5uAzoaYvPPYVSXnh1vdXPR
	VOlnSPX5H90du+ZKFqy8VAFoCYiNpSicubWXMMgnHr3m6MdtsWQgHsqSU54WhPHS9j8wVppgF8r
	D
X-Google-Smtp-Source: AGHT+IG8HgtOuBcHEKcz74TacLdDKXF5j1Gg3vz+8S0yQgZ1JtIGfrxvVEaDX9z+UPGnB6Yxyd6wsQ==
X-Received: by 2002:a05:6000:1864:b0:39c:2673:4f10 with SMTP id ffacd0b85a97d-3a06d6dc248mr9532327f8f.23.1745694756301;
        Sat, 26 Apr 2025 12:12:36 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm6473285f8f.15.2025.04.26.12.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:12:35 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: guido.kiener@rohde-schwarz.com,
	Dave Penkler <dpenkler@gmail.com>,
	Michael Katzmann <vk2bea@gmail.com>
Subject: [PATCH 1/3] usb: usbtmc: Fix erroneous get_stb ioctl error returns
Date: Sat, 26 Apr 2025 21:12:20 +0200
Message-ID: <20250426191222.13727-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426191222.13727-1-dpenkler@gmail.com>
References: <20250426191222.13727-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible_timeout returns a long
The return was being assigned to an int causing an integer overflow when
the remaining jiffies > INT_MAX resulting in random error returns.

Use a long return value and convert to int ioctl return only on error.

On success the ioctl was returning the transfer length of the
usb_control_msg which has no meaning for the user.
Return 0 on success.

Reported-by: Michael Katzmann <vk2bea@gmail.com>
Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/usb/class/usbtmc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index 34e46ef308ab..e24277fef54a 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -482,6 +482,7 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	u8 *buffer;
 	u8 tag;
 	int rv;
+	long wait_rv;
 
 	dev_dbg(dev, "Enter ioctl_read_stb iin_ep_present: %d\n",
 		data->iin_ep_present);
@@ -511,16 +512,17 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 	}
 
 	if (data->iin_ep_present) {
-		rv = wait_event_interruptible_timeout(
+		wait_rv = wait_event_interruptible_timeout(
 			data->waitq,
 			atomic_read(&data->iin_data_valid) != 0,
 			file_data->timeout);
-		if (rv < 0) {
-			dev_dbg(dev, "wait interrupted %d\n", rv);
+		if (wait_rv < 0) {
+			dev_dbg(dev, "wait interrupted %ld\n", wait_rv);
+			rv = wait_rv;
 			goto exit;
 		}
 
-		if (rv == 0) {
+		if (wait_rv == 0) {
 			dev_dbg(dev, "wait timed out\n");
 			rv = -ETIMEDOUT;
 			goto exit;
@@ -539,6 +541,8 @@ static int usbtmc_get_stb(struct usbtmc_file_data *file_data, __u8 *stb)
 
 	dev_dbg(dev, "stb:0x%02x received %d\n", (unsigned int)*stb, rv);
 
+	rv = 0;
+
  exit:
 	/* bump interrupt bTag */
 	data->iin_bTag += 1;
-- 
2.49.0


