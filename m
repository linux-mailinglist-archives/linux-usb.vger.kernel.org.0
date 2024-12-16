Return-Path: <linux-usb+bounces-18517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B769F2842
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 02:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 041F91881692
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 01:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FCD17991;
	Mon, 16 Dec 2024 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="i6PiGfpb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F7EAD5
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 01:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734314149; cv=none; b=eZHWO1xVpgO1S+J2UgYfdDi65gjzzgjOFdhtqxoSG/L9beCp0z26txr2Ey0RM/h6XtJK7CZrOpmPR8e7Xni6F9I6MlqEamot2soNMJ2CihylOMFoFdmcTt3nX2XuPpykg2+YEyZjSZo9yNzfjC+JaIlOirwi3lBaJc/wDutk5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734314149; c=relaxed/simple;
	bh=TCpfm9gNYyeEAUajZEJgeVz3y+h4GZWeBYqd24ez5ZY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VufL6zpseG+vVHU7Bhn+T8GxEb3MeqR5yF4T3xqwK/piM2/1lNAkFHcAfvmhMbC3BO/hIsjyXfWep/aGEN281FxhjOqRGbtG+gQQzQF5ph7IsxnxfCdPvZyt0Aawe+9VqkcfCzHWKpMI5SUS6PA0/YxfjU1MQmGIb72R5DQa/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=i6PiGfpb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166f1e589cso36698865ad.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Dec 2024 17:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734314146; x=1734918946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzM676k1DKJkU9oLGeHVpaSFbuH7S+Pq9zqIC4eZblU=;
        b=i6PiGfpbwEOSRz09i8/AabCnQljjRyKL2vAu0RapgBj6r4VksBHjIy+TY/7UDtHMfr
         CMBW+KdM5FhkUV4+XZ2pImqntdzFQY2HRUC6NCmbk+4JEbYPbu4RVbrmVjKLvwYWN7J8
         NssmJR2VmYhTrIukY4Y6GleiemL+ctORR2zirvPPx516qNZRRJQrFUqXo04ZenZsM+XI
         OZRT5U8nBhaL3MHwMd6r3t9QUjRbYO6D4bzx2hYhLs1ozfZpqxoXaJdC8vhuVyfY8Mxb
         tq/Klm9RPMyIZF6GFY3nRpfXIz173Iu5Ma2JUkW75Lx38LE3MG9NDBOdc8t2LOtxYzO2
         +zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734314146; x=1734918946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzM676k1DKJkU9oLGeHVpaSFbuH7S+Pq9zqIC4eZblU=;
        b=rwZT9jry2OSYy91VA/Oz2rCmrc4my7SzW5I9pSAqN9cG/VmTY0NZqDOuDIuKtSX19f
         fzVr9zII7ICo1hlpYAZdwmuKurnGIXVUy8fbFv9BCXuiKlkOfHwyAx2aezn9bdGg5c0m
         9o4kyAS0nuSBEWQkHAVviLjcAmBeDyDc2WoDWfyFOSfH6RxYvGMhHJuCsaURRPI7reDO
         G5OyP08R04/7KmvH0SX37CoybgJYx4DDQ2BcwOu+PEN5AjAsI9CRXHIMOs4zY2Hvvam3
         uSe4fil1OsmXVIsBpSru0lneF73aT9+RuvFt36DzQqsvJUbhj6KTO98C8E2GrwvHcTfw
         AEkQ==
X-Gm-Message-State: AOJu0YwfrjOXCI1usyxaOt1IiRRCSLLLQcih9upqxz8/4WsTQ8FMpq11
	CBb0nGJkUk0TyFPiDgFP/ERbQpfJDvSskBcYsd4NIC9sXO1pKDwtQ1ECuZeTDSo=
X-Gm-Gg: ASbGncs9hvvmGRf/hawDKH/EFrTUkEtm1/TB8u5GyYCqrF65G/YDqpdwHLNm5oRo5ew
	3yhFbq2LqFwJG7mIVMoAFpgBUsCmZQFcqE30Sj9N4u6uzptIRdRu28pkG6sxUWenxhTUSLEIals
	T6HY+sQmOXCWjWPYAjRoHkW0IvHsaOl0hsYdxEhNybmza6YMI+ZKegBsx4uvFma4OaWO1FcNRAI
	khphpYx4DJ3F1th0B50ZgSAMZPi3sgN22L77PGOoJ2vqpM4I/r4/bAHVhY4gufzDfmcI+vZiIKJ
	yja2n32fK++6visp2P2Ecj6/cbE4UjskEF19GWxc8Kk=
X-Google-Smtp-Source: AGHT+IGgoCQ13pdlOw67VoMMX5O+6nchdoRA43p02Rv1YfssUVhyWfB3j/Sbk45VYRYFXB2PqhZjpw==
X-Received: by 2002:a17:902:da8b:b0:215:6f9b:e447 with SMTP id d9443c01a7336-21892a5d814mr132437185ad.30.1734314146034;
        Sun, 15 Dec 2024 17:55:46 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e5c9c8sm32137365ad.193.2024.12.15.17.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 17:55:45 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()
Date: Mon, 16 Dec 2024 10:55:39 +0900
Message-Id: <20241216015539.352579-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current implementation of ci_hdrc_imx_driver does not decrement the
refcount of the device obtained in usbmisc_get_init_data(). Add a
put_device() call in .remove() and in .probe() before returning an
error.

This bug was found by an experimental static analysis tool that I am
developing.

Cc: stable@vger.kernel.org
Fixes: f40017e0f332 ("chipidea: usbmisc_imx: Add USB support for VF610 SoCs")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
Changes in v2:
- Put the device in .remove() as well.
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index f2801700be8e..1a7fc638213e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -370,25 +370,29 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->pinctrl = devm_pinctrl_get(dev);
 		if (PTR_ERR(data->pinctrl) == -ENODEV)
 			data->pinctrl = NULL;
-		else if (IS_ERR(data->pinctrl))
-			return dev_err_probe(dev, PTR_ERR(data->pinctrl),
+		else if (IS_ERR(data->pinctrl)) {
+			ret = dev_err_probe(dev, PTR_ERR(data->pinctrl),
 					     "pinctrl get failed\n");
+			goto err_put;
+		}
 
 		data->hsic_pad_regulator =
 				devm_regulator_get_optional(dev, "hsic");
 		if (PTR_ERR(data->hsic_pad_regulator) == -ENODEV) {
 			/* no pad regulator is needed */
 			data->hsic_pad_regulator = NULL;
-		} else if (IS_ERR(data->hsic_pad_regulator))
-			return dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
+		} else if (IS_ERR(data->hsic_pad_regulator)) {
+			ret = dev_err_probe(dev, PTR_ERR(data->hsic_pad_regulator),
 					     "Get HSIC pad regulator error\n");
+			goto err_put;
+		}
 
 		if (data->hsic_pad_regulator) {
 			ret = regulator_enable(data->hsic_pad_regulator);
 			if (ret) {
 				dev_err(dev,
 					"Failed to enable HSIC pad regulator\n");
-				return ret;
+				goto err_put;
 			}
 		}
 	}
@@ -402,13 +406,14 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"pinctrl_hsic_idle lookup failed, err=%ld\n",
 					PTR_ERR(pinctrl_hsic_idle));
-			return PTR_ERR(pinctrl_hsic_idle);
+			ret = PTR_ERR(pinctrl_hsic_idle);
+			goto err_put;
 		}
 
 		ret = pinctrl_select_state(data->pinctrl, pinctrl_hsic_idle);
 		if (ret) {
 			dev_err(dev, "hsic_idle select failed, err=%d\n", ret);
-			return ret;
+			goto err_put;
 		}
 
 		data->pinctrl_hsic_active = pinctrl_lookup_state(data->pinctrl,
@@ -417,7 +422,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 			dev_err(dev,
 				"pinctrl_hsic_active lookup failed, err=%ld\n",
 					PTR_ERR(data->pinctrl_hsic_active));
-			return PTR_ERR(data->pinctrl_hsic_active);
+			ret = PTR_ERR(data->pinctrl_hsic_active);
+			goto err_put;
 		}
 	}
 
@@ -527,6 +533,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (pdata.flags & CI_HDRC_PMQOS)
 		cpu_latency_qos_remove_request(&data->pm_qos_req);
 	data->ci_pdev = NULL;
+err_put:
+	put_device(data->usbmisc_data->dev);
 	return ret;
 }
 
@@ -551,6 +559,7 @@ static void ci_hdrc_imx_remove(struct platform_device *pdev)
 		if (data->hsic_pad_regulator)
 			regulator_disable(data->hsic_pad_regulator);
 	}
+	put_device(data->usbmisc_data->dev);
 }
 
 static void ci_hdrc_imx_shutdown(struct platform_device *pdev)
-- 
2.34.1


