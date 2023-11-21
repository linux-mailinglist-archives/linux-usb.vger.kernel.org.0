Return-Path: <linux-usb+bounces-3138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 567A97F377D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10D032825B4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F295C55764;
	Tue, 21 Nov 2023 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M+hB1zia"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A87ED60
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700598734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g1AURt+ugmGBatqXZg8O5FjY9vBm0Sv0TBJTfoMcWtY=;
	b=M+hB1ziapNXWtsv7OynI3uxa8VAY0YsqsZT2Fd90siMdigOjnmyiClEQh+CtX5WqXfpTD7
	sxh7UwD1yQc+0llI6eCtcs76Nu6WZrCy1AtAp4G+Vnhv2DWQtjBS0ttTPom5dhsL4drot2
	pDQ2qyZxz2bChLM1EuP26GABBfEJopU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-lmxUKTilNO2zJfpMJYHgLA-1; Tue, 21 Nov 2023 15:32:11 -0500
X-MC-Unique: lmxUKTilNO2zJfpMJYHgLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FCF485A58A;
	Tue, 21 Nov 2023 20:32:10 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73E352166B26;
	Tue, 21 Nov 2023 20:32:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Wentong Wu <wentong.wu@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] usb: misc: ljca: Fix enumeration error on Dell Latitude 9420
Date: Tue, 21 Nov 2023 21:32:05 +0100
Message-ID: <20231121203205.223047-1-hdegoede@redhat.com>
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

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Wentong Wu <wentong.wu@intel.com>
Link: https://lore.kernel.org/r/20231104175104.38786-1-hdegoede@redhat.com
---
Changes in v3:
- Fix commit-id in fixes tag

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


