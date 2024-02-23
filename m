Return-Path: <linux-usb+bounces-6976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC18619FE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 18:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2588A1F265E2
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 17:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9BE13A27A;
	Fri, 23 Feb 2024 17:33:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284628DBD
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709611; cv=none; b=tfhaqgSuCB4llJCCyYBXWYxSGdN5iqcp52HQFRLByUv96Gio4f6qvqRcM1f8PhwBwK+7DEcloOy/wvKPUzg9dvV59RLEZgaEWYvf4IOWED5GPyKOKLSySHe6D4UyO/8Lxq7UY5bHoszyArwRsrbW2GrvQKM5bjONPSGUhVhxO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709611; c=relaxed/simple;
	bh=xakyIdp3/WlfCuM9RKt0IMFj1L5vtcjFbSIxgwyFtt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J7bqcqltzYlOrI4CWM9qPjhLT5GzdMfaxa4wzSJtqUVsoTJMBr1UDYqwnnEdvagomsTIhgQcDTkx4czocApG1jfujgUAFejnr+JkruE+PeaTMoYVijkN5zVucCGbiB6vmDc5nTK+6ioFYosoDd1UjlCc9dnhyDK+zno7REIV5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQH-0000QH-AC; Fri, 23 Feb 2024 18:33:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-002SzF-I1; Fri, 23 Feb 2024 18:33:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-00AWsh-1W;
	Fri, 23 Feb 2024 18:33:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH 2/2] usb: gadget: fsl: Increase size of name buffer for endpoints
Date: Fri, 23 Feb 2024 18:33:16 +0100
Message-ID:  <6754df25c56aae04f8110594fad2cd2452b1862a.1708709120.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=xakyIdp3/WlfCuM9RKt0IMFj1L5vtcjFbSIxgwyFtt4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl2NbdKQ28w2uPegI4Te7XXRn1TSM6zGLBVjWbW tDcg4LgxMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZdjW3QAKCRCPgPtYfRL+ TklACACG42Kp+0YiOERFN4Tv8+EYFpUqhHNrA1cJQuDjg06rU80r8BHHXZRrJpQhbzYMUrRlakI 0P8Zk0pWb/a9GacqwW779bbf430xPBg4R7T7AhVOcjNWEQOS3do07yH7CWywhkVr7RZJhOZmOIS oothLatK1BF3XumzP4AKiuGHoDcgQ2fbZ6opwhx39Vw20iVNK6shuamj8kGjNXcWrmnRAxTINzh +EOVEmG3mex2r3WUE4AkDbVMxO+Uqubk+Repukh5wb6XYGeo0zLPgn7h3purDu4RZc7YQXtLufg Nyjeb1lG41zceYgIKL3yaO0CdnU1hWVahM9Pm/APc/TlvIfS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

This fixes a W=1 warning about sprintf writing up to 16 bytes into a
buffer of size 14. There is no practical relevance because there are not
more than 32 endpoints.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I hesitated to add a Fixes: trailer because the problem is never hit in
practise. Anyhow, if you think it's a good idea to add one, the commit
introducing the too small buffer is:

	b504882da539 ("USB: add Freescale high-speed USB SOC device controller driver")

Best regards
Uwe

 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 65346a322a77..b7e7ae5e051b 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2486,7 +2486,7 @@ static int fsl_udc_probe(struct platform_device *pdev)
 	/* setup the udc->eps[] for non-control endpoints and link
 	 * to gadget.ep_list */
 	for (i = 1; i < (int)(udc_controller->max_ep / 2); i++) {
-		char name[14];
+		char name[16];
 
 		sprintf(name, "ep%dout", i);
 		struct_ep_setup(udc_controller, i * 2, name, 1);
-- 
2.43.0


