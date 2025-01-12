Return-Path: <linux-usb+bounces-19217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97784A0A835
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 11:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A30516501E
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 10:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E58D19DF99;
	Sun, 12 Jan 2025 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="iWPBCl59"
X-Original-To: linux-usb@vger.kernel.org
Received: from pv50p00im-ztdg10012101.me.com (pv50p00im-ztdg10012101.me.com [17.58.6.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF73E499
	for <linux-usb@vger.kernel.org>; Sun, 12 Jan 2025 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736678063; cv=none; b=ilvj5JOJsfnaT5xisxLrT9PCAYkoqEtod55rMyhxwQt+27hnPqODAfeKN1geblA/epbhrzzOaenaoh+Jj8IBmeMS7NkswPsVCC8frPLwJBDfNbR08B5cIorCgncQYdmTQ5N7YLQ4L7BwfhqICOF+qIT1UekM/8B4to2Ba+pKm/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736678063; c=relaxed/simple;
	bh=3FHViZNhsnIGyl1B07yO21MkDv2x1odcdNhOic7TRxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=or3HnZXybYokZ4nIhh9U6pIq4yO3+V51/n8g+V6pkvbn7YUQezPyVJpY7EtHgsNj0TB60dutaBKydILAOGoP834Y8a6NJe4zLiLqrg5VG0THS6e9FyqHV5+WKM5P+Lmclne3DIkgz3P9+25yEDF2+8VD1Y7xX0QcIXyuMEcoVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=iWPBCl59; arc=none smtp.client-ip=17.58.6.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1736678061;
	bh=8jMXg0idzjhO9yKUsQVdQUgEnwemCWgYliWqvHMBjlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
	 x-icloud-hme;
	b=iWPBCl59XMzTpNRbCNQ3Br6g2eU5eIt2Ne7+2ZWSJ+VIwLWocW0nxIE98HizKyfwN
	 Pg0GHPsFlGGUiQFXcDfj6VIGGNkT8esQ1SDKpr2Xuz9EPTKc3NYYSGPeoUmjGijw2O
	 /duPK1lWMtsYqxI6YYk+Ut/HrVuQzk589KO1oGyBbW7r9KHJ6yhcPaeb8jY05RNCvx
	 E4IYrJ9r0ZQZ4JzChRvyzk9kOAd+G/DaOCFDmvNAvne0gNEBh4NF6Gubl4zrO95HQ6
	 B5JAbGfbjP+s6Y9dY0hEIsg4IgKx96QBU/AXoIDm7rpwvt35qz2Nko7CWGJzK1CJnx
	 Dfk4ItnZQQDVw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012101.me.com (Postfix) with ESMTPSA id 130417402EF;
	Sun, 12 Jan 2025 10:34:14 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sun, 12 Jan 2025 18:33:52 +0800
Subject: [PATCH] usb: phy: Remove API devm_usb_put_phy()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-remove_api-v1-1-49cc8f792ac9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAI+ag2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Mj3aLU3Pyy1PjEgkxdiyRTw8TENDNLU9MkJaCGgqLUtMwKsGHRsbW
 1AEv/tfFcAAAA
X-Change-ID: 20250112-remove_api-8b51aaf6955b
To: Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: yabnjCFcLoJiaOwQ4gLPzDE9uhHMGQk0
X-Proofpoint-GUID: yabnjCFcLoJiaOwQ4gLPzDE9uhHMGQk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-12_04,2025-01-10_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=828 spamscore=0
 clxscore=1011 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2501120094
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Static devm_usb_phy_match() is only called by API devm_usb_put_phy(), and
the API has no caller now.

Remove the API and the static function.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 Documentation/driver-api/driver-model/devres.rst |  1 -
 drivers/usb/phy/phy.c                            | 26 ------------------------
 include/linux/usb/phy.h                          |  5 -----
 3 files changed, 32 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index d594d0ea0e9dfaf30f9ef805b0a0272763a4601e..d75728eb05f85eca4e0fbf7961bfa8181106a778 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -404,7 +404,6 @@ PHY
   devm_usb_get_phy()
   devm_usb_get_phy_by_node()
   devm_usb_get_phy_by_phandle()
-  devm_usb_put_phy()
 
 PINCTRL
   devm_pinctrl_get()
diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
index 1ce134505cee86102eb2d93ca1d09a52b684d3bb..e1435bc596622ce40f64355573f82f57bc8282bf 100644
--- a/drivers/usb/phy/phy.c
+++ b/drivers/usb/phy/phy.c
@@ -346,13 +346,6 @@ static void devm_usb_phy_release2(struct device *dev, void *_res)
 	usb_put_phy(res->phy);
 }
 
-static int devm_usb_phy_match(struct device *dev, void *res, void *match_data)
-{
-	struct usb_phy **phy = res;
-
-	return *phy == match_data;
-}
-
 static void usb_charger_init(struct usb_phy *usb_phy)
 {
 	usb_phy->chg_type = UNKNOWN_TYPE;
@@ -614,25 +607,6 @@ struct usb_phy *devm_usb_get_phy_by_phandle(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_usb_get_phy_by_phandle);
 
-/**
- * devm_usb_put_phy - release the USB PHY
- * @dev: device that wants to release this phy
- * @phy: the phy returned by devm_usb_get_phy()
- *
- * destroys the devres associated with this phy and invokes usb_put_phy
- * to release the phy.
- *
- * For use by USB host and peripheral drivers.
- */
-void devm_usb_put_phy(struct device *dev, struct usb_phy *phy)
-{
-	int r;
-
-	r = devres_release(dev, devm_usb_phy_release, devm_usb_phy_match, phy);
-	dev_WARN_ONCE(dev, r, "couldn't find PHY resource\n");
-}
-EXPORT_SYMBOL_GPL(devm_usb_put_phy);
-
 /**
  * usb_put_phy - release the USB PHY
  * @x: the phy returned by usb_get_phy()
diff --git a/include/linux/usb/phy.h b/include/linux/usb/phy.h
index e4de6bc1f69b6287cb49882c3235b824bb474d13..0fa9885a1038bf747fe462982b4097a3fb1a8ec5 100644
--- a/include/linux/usb/phy.h
+++ b/include/linux/usb/phy.h
@@ -223,7 +223,6 @@ extern struct usb_phy *devm_usb_get_phy_by_phandle(struct device *dev,
 extern struct usb_phy *devm_usb_get_phy_by_node(struct device *dev,
 	struct device_node *node, struct notifier_block *nb);
 extern void usb_put_phy(struct usb_phy *);
-extern void devm_usb_put_phy(struct device *dev, struct usb_phy *x);
 extern void usb_phy_set_event(struct usb_phy *x, unsigned long event);
 extern void usb_phy_set_charger_current(struct usb_phy *usb_phy,
 					unsigned int mA);
@@ -259,10 +258,6 @@ static inline void usb_put_phy(struct usb_phy *x)
 {
 }
 
-static inline void devm_usb_put_phy(struct device *dev, struct usb_phy *x)
-{
-}
-
 static inline void usb_phy_set_event(struct usb_phy *x, unsigned long event)
 {
 }

---
base-commit: 594c82329eef335ad90f5276ae0d2dff4d6d2668
change-id: 20250112-remove_api-8b51aaf6955b

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>


