Return-Path: <linux-usb+bounces-8956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDE8994DA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 07:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B500F1C2189E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 05:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33BE224CE;
	Fri,  5 Apr 2024 05:58:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2C28E2
	for <linux-usb@vger.kernel.org>; Fri,  5 Apr 2024 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712296704; cv=none; b=tqMi4J4HsJmNwElodvvCOUVpHeFDnavtm46Jfk+OMVYm5l0bkTfHkbWDVfW3h5wV5EWmoZGImFNpqN6lqj1FyR+odtw6tAiZIgsTxMg+OaKjjq/HJFzC4IxL/2uf08gpWyu9yH0G3ceToIOzNeN/CE++Ehb2m1n14jBPZ5If+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712296704; c=relaxed/simple;
	bh=kf9orjoQ8Bxu5EqYJ9PpGgn7d3GF4yiwX5T+VyocyIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cPJx90PfmtfMWYQwND2z9iK4cg8Rk9Z1TWZbAq0fxKjBa+F1GjABks9H+5hIAK9uA//cQ7qvDyICzh3er8c8KXaK8Zl0K1JrXiWHN4wjLhdyh4Qy3F0sBg+8D774Mif/mQqZ4raJnzjxc3cQiE/dl7JWnz402ndVxBUz/6/T2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rscaf-0003cR-2h; Fri, 05 Apr 2024 07:58:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rscad-00AVYY-Db; Fri, 05 Apr 2024 07:58:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rscad-00FMi6-12;
	Fri, 05 Apr 2024 07:58:15 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] usb: gadget: fsl: Initialize udc before using it
Date: Fri,  5 Apr 2024 07:58:10 +0200
Message-ID: <20240405055812.694123-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kf9orjoQ8Bxu5EqYJ9PpGgn7d3GF4yiwX5T+VyocyIg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmD5L01RltUknlCbcTue5FlXHyoL0YRhx6Xqxtx 7lzTN7ExyqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZg+S9AAKCRCPgPtYfRL+ To9CCACsbYYKtY3ChOxuA2NHaGSndRm86SckEG4HnlBzDG6IGxHLZ+ZTno24h84NyfVxDJ2S9PQ JM8d5fC30ihgzuPFQsdBKZOkhWDSiwdZa2YYPbEodZx478fn3mhxjrv9nUfi9Hv2E/8BFvmAAPG 0RMxgr5yJkHesjPtDBFwCp0b0djPQVL44aR/TNHvoyiNKSXS19uiD/EeiW3SnItLhOLLpAgopFb vb413wqsIJs/8LBXRqAU2ppZRwWooKa6rHTqipwpzFlt19hRb21nNOQclM1BdK1tiq3iGLNM8iY th5/sIZ2lGp/b5Tt6KYA/yUXgphAECAkg8/iuM9+cLlylbKW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

fsl_ep_queue() is only called by usb_ep_queue() (as ep->ops->queue()).
So _ep isn't NULL.

As ep->ops->queue = fsl_ep_queue, the ep was initialized by
struct_ep_setup() and so ep->udc isn't NULL either.

Drop the check for _ep being NULL and assign udc earlier to prevent
following an uninitialized pointer in the two dev_vdbg()s in lines 878
and 882. This fixes a compiler warning when using clang and
CONFIG_USB_GADGET_VERBOSE=y.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404050227.TTvcCPBu-lkp@intel.com/
Fixes: 6025f20f16c2 ("usb: gadget: fsl-udc: Replace custom log wrappers by dev_{err,warn,dbg,vdbg}")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

6025f20f16c2 was included in v6.9-rc1 (and no earlier release), so
assuming this patch will be merged before v6.9 there is no need for a
stable tag.

Best regards
Uwe

 drivers/usb/gadget/udc/fsl_udc_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index e82d03224f94..3432ebfae978 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -868,7 +868,7 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 {
 	struct fsl_ep *ep = container_of(_ep, struct fsl_ep, ep);
 	struct fsl_req *req = container_of(_req, struct fsl_req, req);
-	struct fsl_udc *udc;
+	struct fsl_udc *udc = ep->udc;
 	unsigned long flags;
 	int ret;
 
@@ -878,7 +878,7 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 		dev_vdbg(&udc->gadget.dev, "%s, bad params\n", __func__);
 		return -EINVAL;
 	}
-	if (unlikely(!_ep || !ep->ep.desc)) {
+	if (unlikely(!ep->ep.desc)) {
 		dev_vdbg(&udc->gadget.dev, "%s, bad ep\n", __func__);
 		return -EINVAL;
 	}
@@ -887,7 +887,6 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
 			return -EMSGSIZE;
 	}
 
-	udc = ep->udc;
 	if (!udc->driver || udc->gadget.speed == USB_SPEED_UNKNOWN)
 		return -ESHUTDOWN;
 

base-commit: c85af715cac0a951eea97393378e84bb49384734
-- 
2.43.0


