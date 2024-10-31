Return-Path: <linux-usb+bounces-16880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9B9B74D7
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 07:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E4851C2486D
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 06:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4621487ED;
	Thu, 31 Oct 2024 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sgC4VISz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC91482E8
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 06:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357957; cv=none; b=pg6y9OvtW22HhJqnZd078AMdJedQTvHQ7dQ+Rn2yktmPvPDJnkdb3aROrrxZIs+MR2zffuiBvtlpcTYPHWJWpnK1gdC95dOlqnm3e7iWXaHv485mDvTv8woWsxAu2QoG6Zel+TsQq2TeOJWN/93PWR4SQ8PpMY0VLQlpgTRQTHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357957; c=relaxed/simple;
	bh=PyyjjuExWf96KMWOS6hJ3XmzDi/kwD2m5Mi5FCrS1pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpT4WXQdtTmhOiCENHyPz1LPM7w+zKU9CLrcaoI10bOH4OoDYr1y5oAmjeOw+sBbn3kZiQ42lbjPV6/6PxnKT9RVuR2WPOfzlxQfY7dPH+K7S6DnBzKXuwbw0oY8WKBhfxAref4RNAS3TVbkWg0aRhJhimlg0Fz09UB8NlEMzZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sgC4VISz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315abed18aso4858935e9.2
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2024 23:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730357954; x=1730962754; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYp7pAy5IN7AxvqS2KXRE6LCucy8VMk2vKZ6AdwjDR8=;
        b=sgC4VISz6xwRIA+Gp5jLB/LcplaRidztubdeezdtSL3/esHFC3w2T3cIgjOuPSVv1t
         9Tvq5f/uFcd2FjkIsjlH8V4b9swwiwCsJjOcd+npg+1SPb979MluqeAuembEqB9bSV0c
         s56GAgS/XTa1eIccPd/wfnbmx8uHQ5/fRvJBnafZGosDhusSQrFWmOnyZT3JcDMIv3R3
         Cn4JwUEGKE29VUjbweWt57J0sMnVGvKQ8xdq05PCWA9JkFDmlz0fZPYTzNJQ8Pism3rO
         ZVHV8IuExjQu7StvzcrzkNmlJOVVUczbZ26BH2MeeXoEJt8NMauKU0IrUUhzHEKGGbck
         kYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730357954; x=1730962754;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYp7pAy5IN7AxvqS2KXRE6LCucy8VMk2vKZ6AdwjDR8=;
        b=KTCYtsNrwSP4KxQ5fcwOrkVpFLloHoJYvAZ11BV8f/f9dwQ36c507SAYvGvQWSVDfu
         RLUIz79tLeUKhssqwg5vZxgljqHzBgY+Ew0D6naP0eRqg1jwjyCssfzyguXOX8WBPHpl
         Nr8fantJz5mDDSrLtNtiAcC18HOnmQ7NQidAv2RzkHS3ss0FqCQ9+s8eDtvKzKEvMkaH
         Bqkc67Eqy1eSLcdkYGmgyB1XFVM0StwJoEwoQEcA4WrL8o71psf1ON+Rk0gKvsj9Cm37
         0TAiVNe75BHvdvhaeAB7S5H5u2lIMgPSglbIkCK9nrpizgknSGrLfjSMfPpUBAD9QS5t
         EGRA==
X-Forwarded-Encrypted: i=1; AJvYcCXkjuc/YVMmqEs7kAe/pRpVhpgsAUIUWzg3GtXM7Z3kQ9FR2sLqxkjtg4odHiSJKgFRceCYtm1QibM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmS+n1P/CbBuv5iRcoD5ALTu66eOEP+qGzug9Zqg4eOfEPVqD
	KW2vHwl2PNnIFebKzpd777+LozgdJwcuGc3bcPcmNpk/dst/39kjCza61AFbiYQ=
X-Google-Smtp-Source: AGHT+IFKaEwGg+0PuPgAA9ujK3FLjHCzdGExL+Pb47x2feN1KVIOIBbkvnxqClFIGSOpI1sC1rLkPw==
X-Received: by 2002:a5d:60d1:0:b0:37d:501f:483f with SMTP id ffacd0b85a97d-380611e76bcmr13051516f8f.44.1730357954152;
        Wed, 30 Oct 2024 23:59:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abb5sm1114069f8f.100.2024.10.30.23.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:59:13 -0700 (PDT)
Date: Thu, 31 Oct 2024 09:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: serial: Fix use after free in debug printk
Message-ID: <7d0481da-5852-4566-9adb-3a8bb74cb159@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The dev_dbg() call dereferences "urb" but it was already freed on the
previous line.  Move the debug output earlier in the function.

Fixes: 984f68683298 ("USB: serial: io_edgeport.c: remove dbg() usage")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/serial/io_edgeport.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index c7d6b5e3f898..b8f1bd41fb24 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -775,7 +775,10 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 	atomic_dec(&CmdUrbs);
 	dev_dbg(&urb->dev->dev, "%s - FREE URB %p (outstanding %d)\n",
 		__func__, urb, atomic_read(&CmdUrbs));
-
+	if (status)
+		dev_dbg(&urb->dev->dev,
+			"%s - nonzero write bulk status received: %d\n",
+			__func__, status);
 
 	/* clean up the transfer buffer */
 	kfree(urb->transfer_buffer);
@@ -783,12 +786,8 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 	/* Free the command urb */
 	usb_free_urb(urb);
 
-	if (status) {
-		dev_dbg(&urb->dev->dev,
-			"%s - nonzero write bulk status received: %d\n",
-			__func__, status);
+	if (status)
 		return;
-	}
 
 	/* tell the tty driver that something has changed */
 	if (edge_port->open)
-- 
2.45.2


