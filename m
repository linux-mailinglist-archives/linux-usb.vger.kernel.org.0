Return-Path: <linux-usb+bounces-30202-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A5C408DA
	for <lists+linux-usb@lfdr.de>; Fri, 07 Nov 2025 16:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 602BC188D8D0
	for <lists+linux-usb@lfdr.de>; Fri,  7 Nov 2025 15:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FE632ABCE;
	Fri,  7 Nov 2025 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="DOWjP9nZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ECF23507E
	for <linux-usb@vger.kernel.org>; Fri,  7 Nov 2025 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762528413; cv=none; b=aSA3so8Bdg+S6yFLA5yvYte0k3axaDq/ebgoSKZtzPlkd+Xtwl+2zmLY5+vO/rTNyJ5ILT3mubAMpxl7ASpCGX4TEMg9zeUbJ7HgQMtWTRAF2Jhev4IuwKki4SNTARmgOVsHEZCruKeG9rNo1Btcvx6qMMOQpbzEVMJjsY4lIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762528413; c=relaxed/simple;
	bh=I8bOHsKF9JBWrRe/laJ06lO1WJwj5tKRZLUGW/t5oLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VzRQ0kaPKHPvxFJrH4k0EAqZN9N5W18fl+1sOaQAWoFuCkPPHsZX3N40n6AssoZ5T6VGDtGr+YoTpEZAr+r50W2UMKn2DJSuUnIIwFo9woEwl0cSwnu6yCZEwG9D3lrqAQOVLO8vNI+toxZ9QwcncHOkqtMk+JICtLPlo2RIySc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=DOWjP9nZ; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=DOWjP9nZbPfwDe09aTsWO7TLZHHNPRt/yR7hy+MbZJ90wf0CHBksZ/3uU0yWNrIFLCLnApeKLAB4deanZnWvBN8qzJayIPVGC9mFXZDrI43z0V9xzCvB/XWUk35btsK4Y3fQjhYydB2ba/+kkvn27pdBrqw942yvdO/EumzRBQ8SZnVBytHDsaditgxv9yWKZZYIOk3hFgaGqrHjLaXsfJN5OmnWtNX1whr9mAl6CWuqMjhQf2TAmdlA1t6rC+hcGcbtKT+MD7gIB4ZkAgPWO1d4H6gGBB6bW9ov4ilfIago34UjEOB8VeV+8HXf1GyTarFBg7wpMNEKqlOfaVNIWQ==; s=purelymail2; d=purelymail.com; v=1; bh=I8bOHsKF9JBWrRe/laJ06lO1WJwj5tKRZLUGW/t5oLM=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1502108556;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 07 Nov 2025 15:13:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@dell.be.48ers.dk>)
	id 1vHO9K-008lf3-2N;
	Fri, 07 Nov 2025 16:13:14 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: javier.carrasco@wolfvision.net,
	heikki.krogerus@linux.intel.com,
	neal@gompa.dev,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Peter Korsgaard <peter@korsgaard.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: tipd: mark as orientation aware
Date: Fri,  7 Nov 2025 16:13:10 +0100
Message-Id: <20251107151311.2089806-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

The driver contains orientation detection logic and correctly calls
typec_set_orientation(), but forgets to set the orientation_aware
capability, so the orientation value is not visible in sysfs - Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 drivers/usb/typec/tipd/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 2b1049c9a6f3..d561032a2970 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1695,6 +1695,7 @@ tps25750_register_port(struct tps6598x *tps, struct f=
wnode_handle *fwnode)
 =09typec_cap.data =3D ret;
 =09typec_cap.revision =3D USB_TYPEC_REV_1_3;
 =09typec_cap.pd_revision =3D 0x300;
+=09typec_cap.orientation_aware =3D true;
 =09typec_cap.driver_data =3D tps;
 =09typec_cap.ops =3D &tps6598x_ops;
 =09typec_cap.fwnode =3D fwnode;
--=20
2.39.5


