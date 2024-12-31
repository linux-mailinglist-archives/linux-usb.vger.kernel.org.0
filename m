Return-Path: <linux-usb+bounces-18928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6799FF099
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 17:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5015016219D
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE481A0714;
	Tue, 31 Dec 2024 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htUQxoMS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFFD1A08B1;
	Tue, 31 Dec 2024 16:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661779; cv=none; b=Xmr2q3yrkQZRg/mCGsZ9o7dZG+nCWyxD/tFsq5kppPR1SWCSq6wIqXEX++sVaV870R+tCkGKQ3tbqYs43LDYFV7AE4DfvnoQFCZ4MaihU2LqJIdiCFl2B8P0bhTTmMyrdOQE4bFCwbCyTSDnmEeO0lnAFy/po581bGECBq1rQqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661779; c=relaxed/simple;
	bh=PSdqt7Y/tIwrl3WnVX9IixMIvKpHmDpIHFSEp9o6zzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CitljLIN0Q0mGW4vgVUBqFIJMRZt597JlP5PZM86b00qxIjqUxuQRpQAIa2wnVodA3REd+JrEDzI/48KwyU59kNfANIT9dW1Nt+beP7e3UwQXg7T0ky1QTrXcRZULX/kymXW/fSjJHyIx4zWrdMbnRlG4e1QZuF8YuFpG34opeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htUQxoMS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb95317so139209635ad.1;
        Tue, 31 Dec 2024 08:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735661777; x=1736266577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgT2qaWJQsuqcHxB3ftyO4fAWw0KLNTkRJ41HpRQi5A=;
        b=htUQxoMShNFPx/DQ8jYyuDEQ7mFk5NXHFo/ecURy5hg7rvMa0S3h0yNvOWjecW9BL4
         44ZvhzU7NQpL8QU62E9ewRTxUYDrKmfoyd4wjvtn8XdApd/DD/k5AJidzsXlKRVoMm6h
         xNn5b1MUdZVaOp4W0wiW46v4Kq64eZXP+Wp0PavfwA1cBL8i6zabeoWMRBqLI04uTuWz
         Ulm9ipdMnlKKEj7MHtKmRCqtIQd8FhLKCgNoNvOspteSnItuD9f41HrvU/0+Zi4YvNQD
         snvOO6Xj0z4qfHfSAqcjgJ74VoEK2DynDi/04uGP4F/YidrF3PlDUHq0ZExhxtrlxGoT
         xn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735661777; x=1736266577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgT2qaWJQsuqcHxB3ftyO4fAWw0KLNTkRJ41HpRQi5A=;
        b=nF1+lzMa+ElyD7TO3AmKngBGgYhPjBiEfkkbMt/tG3LpJ3ZCuiibFH3Q1WiEnmvUVX
         lX3cHUUVCFqyXOymfRyGqItRfTlbcMagQrLtXATXVl7KxHwkJWawpnvGxzxWaZB8b4b1
         89xkj0AfHWuQQXsqi9zlEKfbiXPXNedAN4gspc9N2qfmU1Tm55zP+jaOuO60LHfmEzgV
         HGTILsadp2Rd33aMFRbI8Y+nvpZGKZOx0cHAhZU9wdCUxGBROC/iPbWnBdgwq4+64pCz
         oy5fi2t7NKYXlycIkTvM8kDYMryprUV3OTsZL6PbQ5TXzNlucjkutJ/GWNLfkzYgoeef
         EDnw==
X-Forwarded-Encrypted: i=1; AJvYcCUypXTluH0AD4Wb6P8SZxuiI19xnQC514X6MZIjk6QGAD6mOWhgIqQ33c/7p53ieSZr7J2K7bHLiSHk@vger.kernel.org, AJvYcCV2PpBRimxu6SJ5IDsYaAeF5FkfJmSkGjq6Ve+fDlNpmRa82aPcAqzWhxOKdQmf87JXBnyyx/pdeFM69bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOTghvhouw/MqWCOnKztPexbOMRLiLqZ/bVV3qAPPE5Nvu8qAz
	7/dIUioL+VsBABNXbHUoryfu/5/Blc7/kSc+j5zA6cBC1vnB7Xmk
X-Gm-Gg: ASbGncsbml+ETyFMZsGgh8zBtTV/73Pq+Mg9EyN2ef7XZs0vKNX5yMGw25+QF7Ex+HK
	qkC5T/LDBcULp/72LuHyan9KYK9qZRGAmxeSbpu+JumA+6vCdkx6JcCQHtE6UR2NnmKFQ/5gRRg
	ln+2AGkJyLj+2ira+hvU5i4GvJNcut3bby50ALmwqf7i0C7/Pcrgc3wbvYhoCk6k9zpJuUOEBpM
	7Loj6xUpV7ochdkIstN74UFcQAvMHh6AV+hC1qiKUue5N4kUX6DtsMxGdOOfSAWXw==
X-Google-Smtp-Source: AGHT+IFWaW7PEJFKy88T2byghRxIxgG/k6/aIZddt13gTDh3PLpybOqL0Slog8quci86fHUAbSdWpA==
X-Received: by 2002:a05:6a20:db0a:b0:1e1:ae4a:1d50 with SMTP id adf61e73a8af0-1e5e049f545mr66397028637.25.1735661776947;
        Tue, 31 Dec 2024 08:16:16 -0800 (PST)
Received: from localhost.localdomain ([221.218.161.56])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad90c2e9sm21791083b3a.180.2024.12.31.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 08:16:16 -0800 (PST)
From: Xiong Nandi <xndchn@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiong Nandi <xndchn@gmail.com>,
	linux-usb@vger.kernel.org (open list:USB OVER IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] usbip: Correct format specifier for seqnum from %d to %u
Date: Wed,  1 Jan 2025 00:15:38 +0800
Message-Id: <20241231161539.20192-3-xndchn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231161539.20192-1-xndchn@gmail.com>
References: <20241231161539.20192-1-xndchn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The seqnum field in USBIP protocol is an unsigned value.
So we fix the format specifier from %d to %u to correctly
display the value.

Signed-off-by: Xiong Nandi <xndchn@gmail.com>
---
 drivers/usb/usbip/stub_rx.c | 2 +-
 drivers/usb/usbip/stub_tx.c | 2 +-
 drivers/usb/usbip/vhci_rx.c | 6 +++---
 drivers/usb/usbip/vudc_tx.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 6338d818bc8b..9aa30ef76f3b 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -269,7 +269,7 @@ static int stub_recv_cmd_unlink(struct stub_device *sdev,
 		return 0;
 	}
 
-	usbip_dbg_stub_rx("seqnum %d is not pending\n",
+	usbip_dbg_stub_rx("seqnum %u is not pending\n",
 			  pdu->u.cmd_unlink.seqnum);
 
 	/*
diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index b1c2f6781cb3..7eb2e074012a 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -201,7 +201,7 @@ static int stub_send_ret_submit(struct stub_device *sdev)
 
 		/* 1. setup usbip_header */
 		setup_ret_submit_pdu(&pdu_header, urb);
-		usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
+		usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
 				  pdu_header.base.seqnum);
 
 		if (priv->sgl) {
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index 7f2d1c241559..a75f4a898a41 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -66,7 +66,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	spin_unlock_irqrestore(&vdev->priv_lock, flags);
 
 	if (!urb) {
-		pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
+		pr_err("cannot find a urb of seqnum %u max seqnum %u\n",
 			pdu->base.seqnum,
 			atomic_read(&vhci_hcd->seqnum));
 		usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
@@ -162,10 +162,10 @@ static void vhci_recv_ret_unlink(struct vhci_device *vdev,
 		 * already received the result of its submit result and gave
 		 * back the URB.
 		 */
-		pr_info("the urb (seqnum %d) was already given back\n",
+		pr_info("the urb (seqnum %u) was already given back\n",
 			pdu->base.seqnum);
 	} else {
-		usbip_dbg_vhci_rx("now giveback urb %d\n", pdu->base.seqnum);
+		usbip_dbg_vhci_rx("now giveback urb %u\n", pdu->base.seqnum);
 
 		/* If unlink is successful, status is -ECONNRESET */
 		urb->status = pdu->u.ret_unlink.status;
diff --git a/drivers/usb/usbip/vudc_tx.c b/drivers/usb/usbip/vudc_tx.c
index 3ccb17c3e840..30c11bf9f4e7 100644
--- a/drivers/usb/usbip/vudc_tx.c
+++ b/drivers/usb/usbip/vudc_tx.c
@@ -107,7 +107,7 @@ static int v_send_ret_submit(struct vudc *udc, struct urbp *urb_p)
 
 	/* 1. setup usbip_header */
 	setup_ret_submit_pdu(&pdu_header, urb_p);
-	usbip_dbg_stub_tx("setup txdata seqnum: %d\n",
+	usbip_dbg_stub_tx("setup txdata seqnum: %u\n",
 			  pdu_header.base.seqnum);
 	usbip_header_correct_endian(&pdu_header, 1);
 
-- 
2.25.1


