Return-Path: <linux-usb+bounces-8590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F343890D0E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 23:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E0D1C2F414
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 22:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A111411C4;
	Thu, 28 Mar 2024 22:07:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700E14039D;
	Thu, 28 Mar 2024 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663622; cv=none; b=jEdtSLB6cBwKz9tqUGPyk5Jl1yyPQR2o003hsCx3KkmBOKflPt0fj7qgn7/6a7bHfBCw03YkT8gODso1ll61NOEuE/2fBDTXU9Mg/C7LXa4kzZwgHiF+LJtAoSysvuZipWVniL4wfD/iN/qJ+mmJMb+5QhibBDg0+xMlXgZF1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663622; c=relaxed/simple;
	bh=nPFgOR3I25kBXuuX2zyEGKSAewHNGT6mKKXJEo6ADQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLB00YBvUo/VAnQCS4zdiKtz6RnCQ+5R6vASgHzvEkT+wj99lUsulgdh2WwVh/h0H30EuTB930hPULuehQ/LOMlTeiUnBzekRiFkxEKC8kfH72V6hgXE+Fi5hCwtgUZnP14HwQqNGZ8XKFYaEfJj+r6N+tdiZADFShGLl3GZbrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E61C433C7;
	Thu, 28 Mar 2024 22:07:00 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Mar 2024 23:05:52 +0100
Subject: [PATCH 14/52] USB: serial: generic: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-module-owner-usb-serial-v1-14-bc46c9ffbf56@linaro.org>
References: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
In-Reply-To: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=707;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nPFgOR3I25kBXuuX2zyEGKSAewHNGT6mKKXJEo6ADQU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBenHZiauymtyDQm2wfnYtg3Iua6jrB/gURFo5
 NBMB/xbWlWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgXpxwAKCRDBN2bmhouD
 1xPFD/0Xkor42T/K6f+NBuhu6wrF8kS4fWDg5SzMxDOQC9vN1w6Cnck3g6nMgaM7/36IO3QDs7w
 YroRAE1mQjFME4JZ+Hk3XQ5sV3i/oa3EM49Lx+1XMj9kowU8mJRLtiaWok5XzevtHpS571+W/5e
 8UVZPm/yqMrPJLKXZbJK0OrHeUc+4J4IODm6ogKMBQbjVKLccvi+DpXf604pU7FJxoPS8w+3L+0
 1XCj9jhmwLIXPO9GgksiqCNWA0he0AgtIp1qIYArdL43AoWxEsFofpcyXZl5px0xHdMOBSQeehU
 NtNLNV9vpMEqsx/zkPCF2qbKY++/fDx9srKhNUI8DCbLEMUSjDbikHQZoVWV8QrHM2OiBfl+t0+
 NB/lzh7g0HZpHF3DFwLAEbGp8mri0AGivsEaft5EKePA2PYRekp3FvXeFKdkN+GjKzQyccApU/p
 3Ca2FOJ0GIGRYG7pzf9gWXwHFK7fkfKRkAgydHoVPnzk2yE62GY/64p2rGA3i1NuY/lH82ADwDK
 rZhP1x2YuQKkQM5Cmizqv/r4LJ8xpFKIXi8mGUwZ3e6vMjvHovNAzDGvN7+3FNpiQPeCCzDob3k
 iaRGMUxo/0pX3EpMN/uEnSFv4eQP+SfhMSnF/xseUjbhOc4todQzkKeik1JIShsDn15/OetI7iL
 GAkeHJt74ZE0GXA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in usb_serial_register_drivers() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/serial/generic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 15b6dee3a8e5..757f0a586ddb 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -63,7 +63,6 @@ static int usb_serial_generic_calc_num_ports(struct usb_serial *serial,
 
 static struct usb_serial_driver usb_serial_generic_device = {
 	.driver = {
-		.owner =	THIS_MODULE,
 		.name =		"generic",
 	},
 	.id_table =		generic_device_ids,

-- 
2.34.1


