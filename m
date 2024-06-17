Return-Path: <linux-usb+bounces-11360-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA090A99A
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8B01C213F0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 09:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C951192B83;
	Mon, 17 Jun 2024 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x0OO7ZoJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33016192B88
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616697; cv=none; b=mEJbBjZy7X1Ug7ExrpkMGrGYUniFDajBvlu74bNvl1lS4wohnhjSYlrNFH0VOnr035hJwUM/A0kT/hwftaeomH8NQ2YNYB4ZKuJe4jRm1rJt1CdaXhdRZ2nJ1V/H4x7l1K1+T1sx4ZpeajabrPUAGGq5fp4ran+78dRha4UbpSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616697; c=relaxed/simple;
	bh=fRmLFWtad0MeVfCzJRA49BbTleCC61mmZxAFsL6FegQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mguaJcEtLW6qyf9cK1BUkYY60GQLwrupQyGbzd1qjoMEQim6sYuaZ6vKPrvjnO8sQXvWtrwkNSgJurG9Vn+ngtpno11pZwsh1mKylj26QDVYQhVBxC3hy/FNU648l5sKZy3Jhs/+z/rqG2LN8Mk+FpVs0FJDCNdnv18uturSC5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x0OO7ZoJ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebd421a931so40402391fa.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 02:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616694; x=1719221494; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dIKWXjEnV/JvaI/YdcZiIYzxlyFqw0Iq/qRXLaIf03Q=;
        b=x0OO7ZoJl49oJhq0ieXzpJJr+3gLU1YvJuDb3UA61aLIlPef09wrEnFtAcAEVEhssv
         T5aAin03VqfyFkWmBAvbnMTp28Ea8DwukfEuMKhtID/45UdJrZTITMYVD3n+RALPUTpn
         Uhqziz6kB4AlR9gMYjItAuohJK4+6vj/nROl1we/5iMIPmTlDsFVGjfDMvZa+sh1flPY
         PVY4cE5dJ4sF3oMKTzwhPK55TEiSxHmiRi1glIxpI+sUoX8YJatxZxp6GsPAik0Kb9sw
         /1ukV49jpq7HOzzFNhsXjAlhFJaSYChu7GY6UxUtB7NW2Hc4EfNk0J5NBTI8gb7YD0eP
         bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616694; x=1719221494;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIKWXjEnV/JvaI/YdcZiIYzxlyFqw0Iq/qRXLaIf03Q=;
        b=iJY9ht+wmgpMxxo6uPWTMdOO9JCLHXa3Mfar7spL5G1qrLN83saDcpjWECoA4Nx83i
         NOKO/84ldaptSBRp5EOBk75dIPEqr44jBNlwN/5V+kb2faNI4+MJZLE2zwkqreN5aHjK
         GwTmenudGFPbvlv5CtZt2LSrGLectCpYqkKWhn5Ycde1OCCH25t4LSUJArLZowYIBI3q
         dd9rQ6mNft3MLANLu6um8xzOthY38tIciR/gXR28GyiJ9RYFu0qNobKMywIJ8e/jiZif
         oDBVgvXpGaL5pnbBmJ4N9ZWxou+Lzy7MUlGrAmGxKXlj79p5+z76Mte56gw6PXd35RyQ
         ulyg==
X-Forwarded-Encrypted: i=1; AJvYcCUbvhFWR7NJcoj1j1qD/khRgZOC67VfMRyeCE3cH7d7AJaF0u6iocnWdDtQVlc1iXGIdwn0h+pgoNT2KXm/GkKs96szGix78d14
X-Gm-Message-State: AOJu0Yw1CgmW+g0vQXRY0CfRaAhE3ZgMOoCgQSc2yEr3IBhQQIwUrNtC
	LfN13l1GBpRvA0hO1DH64nzVuYobRL1SF9oySo4NuchKCJrP3NFVhBAFKEyNiEL+of73bolw7MZ
	q
X-Google-Smtp-Source: AGHT+IEODBDEsxxAci2aBLEEjswUYh1kr6DsZMBMYgj0029fdsBS+kjBKhpqZUVlxzZYUPOZnGGZNw==
X-Received: by 2002:a2e:9217:0:b0:2ec:2617:ad4 with SMTP id 38308e7fff4ca-2ec26170c7bmr29025681fa.43.1718616694419;
        Mon, 17 Jun 2024 02:31:34 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4229447eaa5sm186875575e9.48.2024.06.17.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:31:34 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:31:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: musb: da8xx: fix a resource leak in probe()
Message-ID: <69af1b1d-d3f4-492b-bcea-359ca5949f30@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call usb_phy_generic_unregister() if of_platform_populate() fails.

Fixes: d6299b6efbf6 ("usb: musb: Add support of CPPI 4.1 DMA controller to DA8xx")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/musb/da8xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/da8xx.c b/drivers/usb/musb/da8xx.c
index fcf06dcf2d61..953094c1930c 100644
--- a/drivers/usb/musb/da8xx.c
+++ b/drivers/usb/musb/da8xx.c
@@ -560,7 +560,7 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = of_platform_populate(pdev->dev.of_node, NULL,
 				   da8xx_auxdata_lookup, &pdev->dev);
 	if (ret)
-		return ret;
+		goto err_unregister_phy;
 
 	pinfo = da8xx_dev_info;
 	pinfo.parent = &pdev->dev;
@@ -575,9 +575,13 @@ static int da8xx_probe(struct platform_device *pdev)
 	ret = PTR_ERR_OR_ZERO(glue->musb);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register musb device: %d\n", ret);
-		usb_phy_generic_unregister(glue->usb_phy);
+		goto err_unregister_phy;
 	}
 
+	return 0;
+
+err_unregister_phy:
+	usb_phy_generic_unregister(glue->usb_phy);
 	return ret;
 }
 
-- 
2.43.0


