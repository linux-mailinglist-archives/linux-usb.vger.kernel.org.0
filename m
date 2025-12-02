Return-Path: <linux-usb+bounces-31101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640FC9ACC2
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 10:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B40D4E220C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45E23093DD;
	Tue,  2 Dec 2025 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V5wOAiBj"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D41BC08F
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666639; cv=none; b=mG+oYD9stU7HvKy6LI1MnljOYsCXvnhOIB7sWSKlYqqG1pEQy/RtBe/0Tq2ohC69iMzLYK3reD15SscZKvMaAYNy1wFmYUG/Bap3IeYEuApDzkdZctKugqT1NC7ZTkoJq2aKlqKxz9zggMuhlEd+kz8R0inkg7sgdfDeu/jEgfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666639; c=relaxed/simple;
	bh=nwkt4g67igwgD0iIanyZwRRI66tLAapM6oZnZ7oXTC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=osP04RCJJdLgt5PqrwWzuMj9dpAtXTZIxODqz22cgoD0W2lm7p0BvH3XC5zxgOwhh5lgZh2B//m0OHvOasjuCezaIJXOgT51fLS3j3lWrZjKT91IS5NS9ezGx23UPlsotOm368p+4Te+ZoDt/os1crQp09+gyNAQyZFJlAcvwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V5wOAiBj; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764666634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P0OXnun1cTU3b0TV9IIjL7ePyw5G4udRlrld/Da/LAQ=;
	b=V5wOAiBjAmHK4cjFzD8lD4M3J4KT9GptTgB40sMw4sWrWvGmKfYS/EN5EUGl3sQvZyon7g
	dPxOwFVcy3mXUU00U/7Xe5x5RLGYS7Zy5RJT/WlLPrAR6rDU1XmymuFcIofE9vGj31IJ+p
	5aI6Gm56EKHe1kRPAmlAiEOkHfJptzI=
From: Yi Cong <cong.yi@linux.dev>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yicong@kylinos.cn
Subject: [PATCH v2] usb: linux/usb.h: Correct the description of the usb_device_driver member
Date: Tue,  2 Dec 2025 17:09:48 +0800
Message-Id: <20251202090948.334809-1-cong.yi@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Yi Cong <yicong@kylinos.cn>

In the current kernel USB device driver code, only the name field is
required to be provided; all other fields are optional.

Correct this part of the description.

Signed-off-by: Yi Cong <yicong@kylinos.cn>

---
v2: update commit message
---
 include/linux/usb.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index e85105939af8e..fbfcc70b07fbe 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1295,8 +1295,7 @@ struct usb_driver {
  *	resume and suspend functions will be called in addition to the driver's
  *	own, so this part of the setup does not need to be replicated.
  *
- * USB drivers must provide all the fields listed above except driver,
- * match, and id_table.
+ * USB device drivers must provide a name, other driver fields are optional.
  */
 struct usb_device_driver {
 	const char *name;
-- 
2.25.1


