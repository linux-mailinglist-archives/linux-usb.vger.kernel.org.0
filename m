Return-Path: <linux-usb+bounces-31057-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA8BC96427
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 09:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6FEA3A32A5
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 08:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBD32FD68D;
	Mon,  1 Dec 2025 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dSoZRCD+"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A552FA0EE
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764579226; cv=none; b=fyCTr0SywicwRWGh1M7cuLV44jTfiEHkMjgcyD6s5q6LbjZX0je0nBSnNFq6MRXvI0s1LY2zFFXMPogSJspb2/lfbqCbuzcLw/HXD9A8kWl04OasS3vcfq+eeTpJ2U3PmPL0FwgAZKu6zH2LIo4qYFLoo7VCcuryBHL9GNKgE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764579226; c=relaxed/simple;
	bh=O7k9SHwmWRzOFSHGKgFTVaGi2iepILTkIiTF4Tj1OL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WauxeUvsszOugA/43vla9XBWrSlXe2vhJje8b6SmE/c285JIc6BZSc4vdOINyR9fiGe2HWNeUvHRLz1YmaE+dnqlbN7L6pkz9cXl37M0I8H3ZBfAa5xaZsMBo0QoWQEWORwl+IyOvOK6WILsOgYdbLUMTryfZQlMrQQ5LJUB70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dSoZRCD+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764579220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WncnBlJ4IbVOGh0bq32FxJHFQjNQVBSPsYGwwkkY/kU=;
	b=dSoZRCD+ePVfdOPXjVFHOpqyiy3DSV8f9sxL4pAYvMMwhd68MygIWyzqryF4i9tKALJHLZ
	stQuLGWibd76yEVTG19XatM0iLUslGbwKx+99PyaSD1LqK+YbcM0vLm6JNT+52gvTr3E4N
	9+WkKDAfIR/u8iZSJNAIy8Dj6yKkJzg=
From: Yi Cong <cong.yi@linux.dev>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yicong@kylinos.cn
Subject: [PATCH] usb: linux/usb.h: Correct the description of the usb_device_driver member
Date: Mon,  1 Dec 2025 16:53:09 +0800
Message-Id: <20251201085309.103379-1-cong.yi@linux.dev>
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
Use the command grep -rnw "struct usb_device_driver" to inspect
how specific drivers are declared.

Correct this part of the description.

Signed-off-by: Yi Cong <yicong@kylinos.cn>
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


