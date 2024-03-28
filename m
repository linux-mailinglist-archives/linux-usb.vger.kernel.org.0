Return-Path: <linux-usb+bounces-8602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A63890D26
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 23:13:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E5D28FD4A
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 22:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446621442FF;
	Thu, 28 Mar 2024 22:07:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36C13BC0F;
	Thu, 28 Mar 2024 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663647; cv=none; b=UiA9zZb9Oq6cqaMshwV8OxN1eG32eZ7F92Pz8fnc5igcPlpRly+6icWvm4WZzHxo91LumVvIuk101BJewX4bvlk6vPpCygGEZ/WtgzT31EQ70JgdyFDyX3cwE8ac773f96gpwDFgPENfoYy6boaKB7wuHOvWWEec9Kh3PAJTlkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663647; c=relaxed/simple;
	bh=J69GSGSJAO0dn043Y7UYb92aFLf5KMOkdW+17znIiQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0XkHLzXhQJTEoMkgaglU5phJMDMnWSPMd4/0o33YKa46xKnYeN0TE+icgWJCyvjUDSOP26iPqiEnkL6oS7jMuqM+b+DAE11505wnXz0bL1+5r9UEwH7rWoh4QtOC3D/6Js9xYgxAnL+KWtRmYNxuBxOVmLvv6AWmugi5gUvdtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A29C43394;
	Thu, 28 Mar 2024 22:07:25 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Mar 2024 23:06:04 +0100
Subject: [PATCH 26/52] USB: serial: metro_usb: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-module-owner-usb-serial-v1-26-bc46c9ffbf56@linaro.org>
References: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
In-Reply-To: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=706;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=J69GSGSJAO0dn043Y7UYb92aFLf5KMOkdW+17znIiQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBenRVI53i6I8Ws8TlnoOc7thMDKNTudaRdxQl
 UMJBZ5YEqWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgXp0QAKCRDBN2bmhouD
 17VYD/9v/wf1iWoQNLH0Xa0IXKCB8CAygfg1U1jallplKgpNNz8n0BYoR9I7XR1/TA8XfEohjZt
 vOJV2rcrfJuiOPQYMpTccLA/TOsPtz/iZiU5skb1gYs/zXZlKn6KXsPofpGNxafKa8BJatVZyWD
 TTX9hDO78OCDmriNUznFSNUJXAaaURT6ES5o/n1QSwKhSA4idveE8Mbq0NPDO35aFkqPfAqpohh
 PorESmJQALsOXzwUzL+g8Gwx/VhDfxvvRts5WOWao8BKbozffDmw9M0fnWy8ctPzMt4gSWxe2+n
 GJxXXLqehThlZjMiMYR5hCIkFJWuKInUU/tRxw6ExVh8456tzSaaySGamSXCyyrwAkKjb7guksS
 1PrzoDs6ZI+e+vdCvNRsySOD62EucvsRYnVRLVlA6W1LROzZ7tmQ1TznqJpvuVAwnc1RPlT+lfb
 18GeZ4hCV54VoTwL3zfapwYuatfgkx3ykvQKU5R0r1SNx7BDQFdqcPVsv/+VIrFFAWvLF928Dn7
 5wfZi0cueWw7GLxlLA/sGZOW4UU1t3igI/mlUIBmA40PHw0NrHGKzKqBbW1XUEsM4JYVFn2f/cc
 5PkbonS4zGL8jmP2TiYy/SuxcfYHG1akGzGx+w73H4oa29Vt36vRF2rSHLPnODM7UMv5BYTDghw
 aD068qn65bm/Prw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in usb_serial_register_drivers() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/serial/metro-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/metro-usb.c b/drivers/usb/serial/metro-usb.c
index 30ab565e0738..028878292901 100644
--- a/drivers/usb/serial/metro-usb.c
+++ b/drivers/usb/serial/metro-usb.c
@@ -341,7 +341,6 @@ static void metrousb_unthrottle(struct tty_struct *tty)
 
 static struct usb_serial_driver metrousb_device = {
 	.driver = {
-		.owner =	THIS_MODULE,
 		.name =		"metro-usb",
 	},
 	.description		= "Metrologic USB to Serial",

-- 
2.34.1


