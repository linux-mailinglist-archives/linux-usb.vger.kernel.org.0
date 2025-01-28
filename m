Return-Path: <linux-usb+bounces-19825-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D52DA212C1
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 20:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBAE21636BE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 19:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C11C1DC99A;
	Tue, 28 Jan 2025 19:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FGXB1ZZ0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="prLnukCL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CCE1DE4E0;
	Tue, 28 Jan 2025 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738093903; cv=none; b=hpu1RTDkRqrjXxhodXhuFIs+Q7bKiLRBHs0Ar7OXJhZYSDs88Rij9UIl0ZRRoLIkpcfgr9OaHvgnuwJrwrZfAXyE+l0Xld+YxotLOgVHJefx9sbAwpr+GaaEdIjb9CIXA2OiUL62eSiv+7A23U7hGxz9ULCloumUvdQvQ5f1sxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738093903; c=relaxed/simple;
	bh=kWGLIt0oaplmKDVN3ugSsFX6lPglSD65FfmwkPzvPmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SrxmvNIKrGYLV4jAngiHdVSN+oSQEIE6VE7901jW5O50Hlg/XABAjqW0d0LRb1DwcFWb2wclKGmivfckNGyBcFVFo0wN9UPtIru1kvuS0ehqM/M7qichIWPHM9MzXn9zvg7uwKjH3656dnauzAuKDat9mbsPMdR4uLwJdEwQ+5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FGXB1ZZ0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=prLnukCL; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YjGBZ2pgJz9srX;
	Tue, 28 Jan 2025 20:51:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1738093894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uox7WyiWP2Uu3zeQ1FBGfl+iWQMcfnL4gJwzvJ+zVKE=;
	b=FGXB1ZZ0ceiTu9VcptnuM6MWI5cmpDGhXGcfy1BELKN5j2+BS4h+u53nBUn6EhQ0VxfFVW
	YCz3xzgAOb1VVdncwYVo673c8v4ijQFysiysFrDje4u8GAV+xIAr6V7UU3uk5NOp1tGwBr
	amDh0ngULMgjQNohFaA09rinnZMqzLp6OuHLj+yhPCEi0pEpDBLoB/GcL8TBjmuudA0v/I
	VlXKI3HaakoTZixOncJRQuj0yen6wSfnWbivBjxFXwlo07bxhM/jmgQE3Jouopqi/bIXfd
	0afGk+v+lb+8SLekqDCOPJ6NrQsuCrz1nj3uf+Q6Zz/yWYkvaBhSGGNT+/zK6w==
From: Alexander Stein <alexander.stein@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1738093892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uox7WyiWP2Uu3zeQ1FBGfl+iWQMcfnL4gJwzvJ+zVKE=;
	b=prLnukCL2HrzwC6LHVCYddVQ48QpbuqbeRq3BiwuO4rOtza3d3XIFTxwyN+qshBq8tIVjy
	fSO6pmaRqGoUU7A3y0aay/BaK+ZHwQ0cxjvck5JEaco8s9QNWEeNLS1g1g30gMwtbB5wPc
	kIMQCxWlR7qOaGwHbJOBksuV8w6M4RG4lccHxfhgVe/0s9odWU4epo6BxiYrJ8wMkU5MAC
	Rc6esuNF6y0FoNx93wSF+2xBg9YtR1j94TR6ZgliR5FmRY1RLoBqsrdoqZVI4gas7+3vd9
	1hs/dwzzjEIlPU88yHeWTumfp952qnxYi5tbNW1wUbvS25M5b9QBV3iFwyCyvg==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] usb: host: max3421-hcd: Add missing spi_device_id table
Date: Tue, 28 Jan 2025 20:51:13 +0100
Message-ID: <20250128195114.56321-1-alexander.stein@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b8arghpudrnayjbzmg3g7sa4otmdwcdf
X-MBO-RS-ID: c6ea0132cbe23c2093b

"maxim,max3421" DT compatible is missing its SPI device ID entry, not
allowing module autoloading and leading to the following message:
 "SPI driver max3421-hcd has no spi_device_id for maxim,max3421"

Fix this by adding the spi_device_id table.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 drivers/usb/host/max3421-hcd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0881fdd1823e..dcf31a592f5d 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1946,6 +1946,12 @@ max3421_remove(struct spi_device *spi)
 	usb_put_hcd(hcd);
 }
 
+static const struct spi_device_id max3421_spi_ids[] = {
+	{ "max3421" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, max3421_spi_ids);
+
 static const struct of_device_id max3421_of_match_table[] = {
 	{ .compatible = "maxim,max3421", },
 	{},
@@ -1955,6 +1961,7 @@ MODULE_DEVICE_TABLE(of, max3421_of_match_table);
 static struct spi_driver max3421_driver = {
 	.probe		= max3421_probe,
 	.remove		= max3421_remove,
+	.id_table	= max3421_spi_ids,
 	.driver		= {
 		.name	= "max3421-hcd",
 		.of_match_table = max3421_of_match_table,
-- 
2.48.1


