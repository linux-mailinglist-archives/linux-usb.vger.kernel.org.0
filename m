Return-Path: <linux-usb+bounces-24181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5D9ABF666
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 628803A51D4
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE5126F46C;
	Wed, 21 May 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HVIAlG2t"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56EE1DA21
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834893; cv=none; b=Bdvf7R23kvicQHqDLz12fl6eIw3MRlChqAaBqDbYUlYjKJrBjlrsoZJlUN7Q4ndPAYuLAY6+GDtJ/1dQuwxRPULzM/2nzOw4Y8hmlKwXuNNrSx6pywp1pGxH5k4o8zqvRr+b17JxyyPdoqdJWt8ztPcx5LaIB+xN+tm3yeqfd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834893; c=relaxed/simple;
	bh=287VX51UgQRv+9PrcTjv1bu/1zU/tFtCjrlfP8Ehe2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=awT0ZSkw+oamn05dhuZPpcoDCCU7015sYO29nXzroeahfBMv118/QMCVLdfcAIchzDAdobFvcSUTqO5xJWi4YwaJt8wbOTXrTrsxNIGq34ooJtapNH+ifssI4RsPvTFHniZ9uvADJYR+dSw7PS82VRfRHu6C31m12NwFDOhz7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HVIAlG2t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FCCC4CEE4;
	Wed, 21 May 2025 13:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747834892;
	bh=287VX51UgQRv+9PrcTjv1bu/1zU/tFtCjrlfP8Ehe2s=;
	h=From:To:Cc:Subject:Date:From;
	b=HVIAlG2tmOZmG0NT295rRCu248gauTWtPI246dtujIuuLWl36rwYwJtjz3OqFY6KR
	 b+fVzuIZMW6RCD6UMuVaWFnAbgVUKtPPlTAUf2wSmj0/GrNkz52wiCtPB7aVJx08bo
	 vCuzCjvPUzxr4bHr3zn+URwlOwbUo/gH9ITL165c=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] USB: typec: fix const issue in typec_match()
Date: Wed, 21 May 2025 15:41:27 +0200
Message-ID: <2025052126-scholar-stainless-ad55@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 28
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=287VX51UgQRv+9PrcTjv1bu/1zU/tFtCjrlfP8Ehe2s=; b=owGbwMvMwCRo6H6F97bub03G02pJDBm6N9iO/4kun+b65ki6uH6L1THfLKGIsmx2ad8p166ub ElUmm7REcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABOpWcswV3S31PWWu5Hzpwex /ftx9szbo1lu9xkWLHnqZS+TfYcjZ8YpCYcZmVWH24+xAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

typec_match() takes a const pointer, and then decides to cast it away
into a non-const one, which is not a good thing to do overall.  Fix this
up by properly setting the pointers to be const to preserve that
attribute.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index ae90688d23e4..91eae95d6fa4 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -449,8 +449,8 @@ ATTRIBUTE_GROUPS(typec);
 
 static int typec_match(struct device *dev, const struct device_driver *driver)
 {
-	struct typec_altmode_driver *drv = to_altmode_driver(driver);
-	struct typec_altmode *altmode = to_typec_altmode(dev);
+	const struct typec_altmode_driver *drv = to_altmode_driver(driver);
+	const struct typec_altmode *altmode = to_typec_altmode(dev);
 	const struct typec_device_id *id;
 
 	for (id = drv->id_table; id->svid; id++)
-- 
2.49.0


