Return-Path: <linux-usb+bounces-2542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF97E1083
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 18:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F681C209DD
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 17:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E7D2137D;
	Sat,  4 Nov 2023 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T7Kbglq1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34063C34
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 17:51:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DD231BF
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 10:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699120270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2InhoRozGwNKzFgFyfI0JbDDC1X2LyaRZu/RGVo2iDs=;
	b=T7Kbglq17lkJg1kl1fxPpVXb/urPCYD6456j0ApgW75t6Z8dfsTJsJUhqRLmux0x1iVUuW
	B8ZQgJ1c9+jbvK1Dv4pQsFZSrOq4JHSKyHh9LDIfLRLU6c8LhCKRGhEZtxA/8Uc4QFl5vB
	Ckw8tB2h/GWN/yeRppg3ZVuZD3IyH9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-Pkp8hz2XM3KmFCsN03XQYw-1; Sat, 04 Nov 2023 13:51:07 -0400
X-MC-Unique: Pkp8hz2XM3KmFCsN03XQYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 915A480F92E;
	Sat,  4 Nov 2023 17:51:06 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 204692166B26;
	Sat,  4 Nov 2023 17:51:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: misc: ljca: Fix enumeration error on Dell Latitude 9420
Date: Sat,  4 Nov 2023 18:51:04 +0100
Message-ID: <20231104175104.38786-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Not all LJCA chips implement SPI and on chips without SPI reading
the SPI descriptors will timeout.

On laptop models like the Dell Latitude 9420, this is expected behavior
and not an error.

Modify the driver to continue without instantiating a SPI auxbus child,
instead of failing to probe() the whole LJCA chip.

Fixes: 54f225fa5b58 ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Small commit msg + comment fixes
- Add Fixes tag + Cc: stable
---
 drivers/usb/misc/usb-ljca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c9decd0396d4..a280d3a54b18 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -656,10 +656,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
 	unsigned int i;
 	int ret;
 
+	/* Not all LJCA chips implement SPI, a timeout reading the descriptors is normal */
 	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
 			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
 	if (ret < 0)
-		return ret;
+		return (ret == -ETIMEDOUT) ? 0 : ret;
 
 	/* check firmware response */
 	desc = (struct ljca_spi_descriptor *)buf;
-- 
2.41.0


