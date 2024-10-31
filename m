Return-Path: <linux-usb+bounces-16893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A039B77DC
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 10:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EFBA1F245F3
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 09:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4992C198842;
	Thu, 31 Oct 2024 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAzIx1n0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98A8881E
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730368117; cv=none; b=Nhb+dlTFyoKXA8u6FUzeKENL267W8gX8KbbmvtNd+VydxrU9VawmP8wWTN+EbLeOM1crA4rinSrLZm7jc+YhPFuVJ53Uip9oaDjrRGee3tCh6QchJG61swBKDWAQSVbh6dQU8TJULejz75ibvxzFNgAncroSI7aVmoHa+S1FedQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730368117; c=relaxed/simple;
	bh=hFyuHVXE7Cz0qm3Tp1AuH1uPL3q7XxKfNijEB1y1rRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ubMRDj2c+cLGp59dBN2928aXrI7+NaFpIAwlV3qfcSJ3+1q6XJI9MLg+BVrUD/sM2AUiZk7qoV0+x0d+e4PPCBp+pwQiot8ONB542e7sAqSlywl9+I9NR3MR+3eZooub4PRhSK7S6DxDFaIHyO6x25tdgUD4z690CQPoity20I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAzIx1n0; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37d4c482844so454805f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 02:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730368114; x=1730972914; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aa5olyViLFOojnVkbBw9OEdbllf8/WSVMeqMqmVU3qY=;
        b=FAzIx1n0LalqJbEpPVEW6D8y3W+Qm0r/LFHg3iaat9dhHTnT7yjUs1JxMtgwjJ+SSS
         f0FF8aKvjcuXXsZzIPTUWZD89/ctTY0GJr9OCenu2RMi5AzxGmsBgtSDVvRHGdvH9UAe
         K1hZItVRNrNgM9/bY8y2D/IALOWqJ3Qh64VehHAsLeRR3ne6fG4ZompxRAqz5H+acAnU
         Retk+MlXtu8wiJovnF1QACeff198pAnZQvg1xf1dsnM5IHYe2bnMdAKGUv8Mmkl2Fbmm
         zDb7H9q9TrFb2kGTdjh8JcOCdYUgdwtPRuWvsglBZeIBsHhjYE0BX5MtGom+kuPCu1wC
         tfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730368114; x=1730972914;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa5olyViLFOojnVkbBw9OEdbllf8/WSVMeqMqmVU3qY=;
        b=cOOEw7sodvE6I8tCZYDd62mP1L431jCwe3PM1e9nyauEeabm94/YrLWxLLaPX3YAVn
         2puzjEAWOFOAwueY30m4qB6Am+dNvOgcIP0j6DZ+eBEFJFDujFsL1TEKuMHh8bXznCoK
         D/y1yj7BmWEsk7VTimhy6+ULgFFlK9Td2c3gyIADDCAY5twvzEbk/3JHHpgFUUzkcfxX
         xlolBSB+20B3Z9sKzU9LKCHL+bfbzcAJQY7PVRdjF1tFYZcOE8Do6t635/bDU6Ihvyml
         R6wgvXz1pg+eoGLyPLa/maFb/7rcgqhjIUsaT+/RQelIIWg1qKR3MgSnrNluz9EsLVPW
         9x1w==
X-Forwarded-Encrypted: i=1; AJvYcCWEFfARQT8H8s26zZ/br4liKFm61ge2O5SwKrO7iEunlPY0MWImargdSKugDEKitbxUhjzUucZFw4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlqG0obQDQJ6ifJeGJNPXc6kyUdbEFe/xUZPBd1oqwuDKSfTim
	57KLncto2wsicw33OuNSpMCGmf+E4tqbXCmy0iyw8SZ0N2eNv8Wdginyqqcpi84=
X-Google-Smtp-Source: AGHT+IGDxQJ/A5r0ClIpNqfZIzOIlvOQbqpKCuPfpxpKxXQvewn/QL8mRGK7ukGONcoXjVByhTIArA==
X-Received: by 2002:a5d:5146:0:b0:37d:5496:290c with SMTP id ffacd0b85a97d-380610f255fmr13644733f8f.7.1730368114185;
        Thu, 31 Oct 2024 02:48:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d437bsm1589665f8f.30.2024.10.31.02.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:48:33 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:48:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] USB: serial: io_edgeport: Fix use after free in debug
 printk
Message-ID: <93490900-d2c6-45e6-b008-8d264e4c11b0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "dev_dbg(&urb->dev->dev, ..." which happens after usb_free_urb(urb)
is a use after free of the "urb" pointer.  Store the "dev" pointer at the
start of the function to avoid this issue.

Fixes: 984f68683298 ("USB: serial: io_edgeport.c: remove dbg() usage")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Fix the subsystem prefix and use a "dev" pointer.  It brings the
style in line with the rest of the file, and it's more future proof in
case someone adds a new dev_dbg() later.

 drivers/usb/serial/io_edgeport.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index c7d6b5e3f898..28c71d99e857 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -770,11 +770,12 @@ static void edge_bulk_out_data_callback(struct urb *urb)
 static void edge_bulk_out_cmd_callback(struct urb *urb)
 {
 	struct edgeport_port *edge_port = urb->context;
+	struct device *dev = &urb->dev->dev;
 	int status = urb->status;
 
 	atomic_dec(&CmdUrbs);
-	dev_dbg(&urb->dev->dev, "%s - FREE URB %p (outstanding %d)\n",
-		__func__, urb, atomic_read(&CmdUrbs));
+	dev_dbg(dev, "%s - FREE URB %p (outstanding %d)\n", __func__, urb,
+		atomic_read(&CmdUrbs));
 
 
 	/* clean up the transfer buffer */
@@ -784,8 +785,7 @@ static void edge_bulk_out_cmd_callback(struct urb *urb)
 	usb_free_urb(urb);
 
 	if (status) {
-		dev_dbg(&urb->dev->dev,
-			"%s - nonzero write bulk status received: %d\n",
+		dev_dbg(dev, "%s - nonzero write bulk status received: %d\n",
 			__func__, status);
 		return;
 	}
-- 
2.45.2


