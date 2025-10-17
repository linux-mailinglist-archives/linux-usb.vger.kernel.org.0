Return-Path: <linux-usb+bounces-29407-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3BDBE7C79
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 11:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C44189537E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 09:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D542D77EF;
	Fri, 17 Oct 2025 09:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LgAyVtSd"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886D2D5412
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 09:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692792; cv=none; b=re3NLbdNAkPcKGwqfIaa5UaVpK/PeSv0UfqMGPxgj0nsLxjpsaSdQYOadPT4exbHZy+PM3IwXLFjTn+YLFmx3656c6a3593dZC0kQFoluApG2WXHa7XBYwcPPqummzqW3D2C5xhIzTxosXhaMIs9AgPkVM7kDpznzHzbB8qQ/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692792; c=relaxed/simple;
	bh=TAN49PljgOIRwCNTrarAEQheM4ReJHPqm9fxE35lhhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VGXHxVKRLp4POeIBJASw5LkeUqkuG5LDYMyT3OmsqTJ6vdH2vuKWe6lTN8O3FhUX4v9iv+YhZz0yQ1Gnz1fO38GIAeCOExnZDNtmqZh0Eb+XdjordWwnTuvM8SIq827+/nnPHJW5wKjO4YNRziD5Hhec8WhXsNC/oaVCfFRC6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LgAyVtSd; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760692788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dzrA7UgC3a9hSRK/NPg1hvdbCp2iwThLz63Xe0Wn0r4=;
	b=LgAyVtSdHF12Q3yL7cff6zt+nhR7jrLNbeyItAhrcX+A5Y9Zc+wVikOXDL1lSbp1amg3hE
	ytfqAYEffkGTpxAcnrX/87z2IPGnRT/vaiq++HYEM772Dd3qr4ITeO6vWlzuBSkxUN+1Q0
	jHUa9ygdBcZhSzGn4QvT9GEwZSegUaU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: Use min to simplify stub_send_ret_submit
Date: Fri, 17 Oct 2025 11:19:23 +0200
Message-ID: <20251017091923.1694-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use min() to improve stub_send_ret_submit(). Change the local variable
'size' from 'int' to 'unsigned int' to prevent a signedness error and to
match the resulting type.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/usbip/stub_tx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 7eb2e074012a..55919c3762ba 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/kthread.h>
+#include <linux/minmax.h>
 #include <linux/socket.h>
 #include <linux/scatterlist.h>
 
@@ -239,17 +240,13 @@ static int stub_send_ret_submit(struct stub_device *sdev)
 		    urb->actual_length > 0) {
 			if (urb->num_sgs) {
 				unsigned int copy = urb->actual_length;
-				int size;
+				unsigned int size;
 
 				for_each_sg(urb->sg, sg, urb->num_sgs, i) {
 					if (copy == 0)
 						break;
 
-					if (copy < sg->length)
-						size = copy;
-					else
-						size = sg->length;
-
+					size = min(copy, sg->length);
 					iov[iovnum].iov_base = sg_virt(sg);
 					iov[iovnum].iov_len = size;
 
-- 
2.50.1


