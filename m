Return-Path: <linux-usb+bounces-25895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9AB080A1
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 00:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3EE18957E4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jul 2025 22:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBB52EE616;
	Wed, 16 Jul 2025 22:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GT6jRbL4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BF228640D
	for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752705990; cv=none; b=rWaH/c81RNAPOtDzPuqTUZq++iHqzKxSIr367VoqFNuUUt6qCBw6YyTCF0pC3aRHM9e+zF/0YpI+2t8EBJvP3je7tjCvlIa2V3eyc3n9CuCCgFBmuQIIhqg9e0789LWCcU3N5PPcac63NzhlA8NaQxwdbvP6KE0RCFQNSLbiHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752705990; c=relaxed/simple;
	bh=R+Lhq1vCYha2kVC/gKYBwgMh0PCi0r6MdFv+dfqI1y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYVGk+iu9QJ7E+U/xSLe3h5AijGmdz1iX3j9P9GBZpokI7Oa97EjjOF0KNl8+dbLt3aOMMCw++hd3nK4vZzbiMFCpzi9KKFozA1gMSnLczOrarqcLq3V7GqxpsaDBZdKF0ZBnuoYbDuQihrr9+k09cZIJa4mVVbP8KA2AClCsRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GT6jRbL4; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73cddf31d10so213986a34.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705988; x=1753310788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=GT6jRbL4qOiV6P/ILHAW1NRvvZiBl9f87g9/hpGBhOPkOAN0ulLlSot1toIyw+j3x2
         sWDkcFjgvndDWTdBLSlWLHH5bQKNdvlbnRqagAd5o5PCR3Ay+wp3aItfPtLxQ+K5gj4G
         zlS3U9jv8fpFr1UqCGBw03Gnu8ZRGSZSYXBzCoUgF2PSTc/hd5hO6S5/z1Zh6HeVSIWl
         PtWPFfQ28bonR7oRDAu5jWaZXlOLPpQsV44EbNUKiBU66uWxxs8AQj4pq87X+DHqa16x
         Pqc0hR97vGRplkmbuChXpgYAE0DR36Dc0+sLijkfIrwGsa3SUd42/7Cil2lp7kljkP0A
         YFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705988; x=1753310788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=ZdP1moIDAGJMPSxM+GmSiqqPxn+d4RXmUELm6ku6Z7DGkdEjXTHvxDPPUT9tqTkCAQ
         MWUFTAmJqoQqN8W2UtvOKlG85Tc84Lhd43qz8ee7s+lddSj1YAB38MtiXh1NiHj4Uhwi
         zbWfmGk/LcNib8RXtZBDT1V07YjUHhx4psAzTvCt2o2TWHKuHMtYZLNJbmDS5EdMSo4z
         DlMd1AkiMVzM0kQ9v5C49M9doSde+nzclLqu/0NQ7UhR98M/FrbfVKPL1R2VFjHFzpff
         Mu5oPw5mu16NUi4Frz18YlECMBXDNGK2W3yumEefmxsb0Nkr+N2kD0/Pji3xGsJhhXhY
         FvCg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUDjfBp5FKmC+VFb1+SNV/1VneyO2arcH5HpHgzRLgg4TJJbahJ/asnmbAac5Xwb4Ah1z03YK8P8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBeDOna/+qYU7tf9KcLl1EnBcrFuMuiA88um23OGyTb5Y8eskz
	i2t2xQKRp3Jrb1z5eITjHbPwaul7UCxE4HcZbk3CpVrREqN5RwopCZMhSrsODLzTh4w=
X-Gm-Gg: ASbGnctyg69/oYDgRe2mCKfMvl4zyB1LLaTMjGhTACzXUes2WAcvgpFLyiyYhd9in7c
	jB0Y3DB0BlCHFJKDwuysnxcOzd+ptsTe4idy5tMiDpELAX8uTobNZE5zOF5FQoEKHkhTSV/FrO9
	17onTD49rvfhPcYNqoVth08og/AUvh3d0NzlGn6d347Y0Vg2coyoFKGe9Unh/wuBHaVWLsP7AvS
	NmfLrmvRO/AAX5BxTCffavnySmGRZv1fZzom61QZg16C896IumGGz1r9pJmuBOnELCIidLUsuOG
	PxFFo1C06zdcmp6+dnmWTLMpJ47VTcRdR/hGjXqaD1GQ5LDz73fSKgp2qMkQXr8S7d+5AkdRDOh
	wrQnW2Hsh9cCttZONt7pHZc4+QdMKaA==
X-Google-Smtp-Source: AGHT+IFOGaMrw9AqIgbXe/jwkCHgKj22Wqht7XROv3FQmVROEgsFQIi2GM+MArU/0+grsGQkVTtJVQ==
X-Received: by 2002:a05:6870:e412:b0:2ff:a860:3402 with SMTP id 586e51a60fabf-2ffb229c2b2mr3886783fac.12.1752705988172;
        Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11681bcdsm3928163fac.32.2025.07.16.15.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:27 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:26 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: chipidea: imx: Add a missing blank line
Message-ID: <36d1c961-319e-4457-bdc1-69f8b6bed33e@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>

Fix a checkpatch warning:
CHECK: Please use a blank line after function/struct/union/enum declarations

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 0b8b980409bc..3d20c5e76c6a 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1118,6 +1118,7 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 	else
 		return 0;
 }
+
 static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
 {
 	return 1;
-- 
2.47.2


