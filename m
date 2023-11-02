Return-Path: <linux-usb+bounces-2468-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0C7DF7ED
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 17:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30167B21271
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 16:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008A618C2A;
	Thu,  2 Nov 2023 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eY4bEQ/m"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033BE6FAE
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 16:48:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8AF123
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698943710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oj/wcGEISd9nQKbpOoHkEUcKCK8VNrt9t/qCnP7HFec=;
	b=eY4bEQ/mxAGLzSx7FT2m76LTTuypuduaD04tRi4tUW8bHhXS+lvTbr34Te//hkzIBAWbLt
	M0bF93ynfx/Yq+HRhDLHfEyUYK+nm3wck01A+gumJcPTDXQBs718Fflhw9CaSHfYQXUAEx
	v6p6KPp7PfCL+8OrHQnC9vOd3ee8HsU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-FW61djOyO2yZJSp2N2KHcQ-1; Thu,
 02 Nov 2023 12:48:27 -0400
X-MC-Unique: FW61djOyO2yZJSp2N2KHcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79ADE2808FC9;
	Thu,  2 Nov 2023 16:48:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66CDB25C0;
	Thu,  2 Nov 2023 16:48:25 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: misc: ljca: Fix enumeration error on Dell Latitude 9420
Date: Thu,  2 Nov 2023 17:48:17 +0100
Message-ID: <20231102164817.547128-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Not all LJCA chips implement SPI and on chips without LJCA reading
the SPI descriptors will timeout.

On laptop models like the Dell Latitude 9420, this is expected behavior
and not an error.

Modify the driver to continue without instantiating a SPI auxbus child,
instead of failing to probe() the whole LJCA chip.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/misc/usb-ljca.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index c9decd0396d4..24f781782c56 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -656,10 +656,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
 	unsigned int i;
 	int ret;
 
+	/* Not all LJCA chips implement SPI a timeout reading the descriptors is normal */
 	ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
 			sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
 	if (ret < 0)
-		return ret;
+		return (ret == -ETIMEDOUT) ? 0 : ret;
 
 	/* check firmware response */
 	desc = (struct ljca_spi_descriptor *)buf;
-- 
2.41.0


