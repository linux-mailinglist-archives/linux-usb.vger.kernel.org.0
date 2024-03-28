Return-Path: <linux-usb+bounces-8603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84448890D28
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 23:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E725A28B5F0
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 22:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF839144311;
	Thu, 28 Mar 2024 22:07:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9713BC10;
	Thu, 28 Mar 2024 22:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663649; cv=none; b=kcXYtrnCIl40nDuRJASGGWEeZlLgMARvtgsxsfBLaF1umhGybFoDPxeJ0hp65E/yr/ORD6poXBcjsdBnnUcFX/X3acHhizS4chE3JPQ6pIds6KwveYtFjjlzQnyOFb5NzTlAy8Yvh4Tp8gRykdJ6URX+1W2hKhqZ+2FFXUcl+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663649; c=relaxed/simple;
	bh=WOr8Czy0foJPhuAzHIOJ3j+HXPc31DBymE3EoC/5kd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu7b2uxpwHct1PI0kSvMo1tEeKRp2i3xN/WlVz2gvCB6YSU6gGlpUwUP/m4khCTLD5JYZFhhOmNwSO1OjuSIVqYaysO60Et+XjyXQvkByxtSjXDclwei6iH+Y4ZPcq6RX7B6qHgwiIbukN93noLd4Q6cLsu5zZEXJyu6F6kNL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A2C43390;
	Thu, 28 Mar 2024 22:07:26 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Mar 2024 23:06:05 +0100
Subject: [PATCH 27/52] USB: serial: mos7720: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-module-owner-usb-serial-v1-27-bc46c9ffbf56@linaro.org>
References: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
In-Reply-To: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=713;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WOr8Czy0foJPhuAzHIOJ3j+HXPc31DBymE3EoC/5kd0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBenSy6CwZmf4f0/zLxLvL+SLMkrX+KOXwtOoE
 +gtix6RDsCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgXp0gAKCRDBN2bmhouD
 12WUD/43VjZEJZLb9fa0i2QenQNcDDX1b3QU/poc5mvhpstMy7TKOGV8qY36dwMk4ggO6NisBZ7
 Zo+UjENt7mwa6Mi8rDzbg8oqIIOfno+GUulv1Uf/SQD4QxzWF4UgZ4RX2c1Lxrkd8KFQjfl1NHQ
 5/QDpygnqFgS43xF3Yqp5/Rqy/VgkgNfOKZjXeIp+qved0pKS/N9Zm8itLCcYpuUfMMwxLKcGUo
 bAV6A4J7Q0MmoaUkqMkj2zJmub8YTo/IzGhA3nwzAhhCcsq6PBjIIcHxjawuUhQHL+tdIFHTLsN
 SvEgmJqlwQdRJPzs+TgrkWFB6G/o6upl4vOGJ+6XagY+THQ7wKQMIGkGiugFxzjsq5um6loSKOa
 SO5xT/xF33Y5HvwwUGnMHwT8gSeUqGxMGczuMbOGMcu36tuLqeMZS6bJBE/zyetHEHR0ici2COG
 FhYTCYhZBnoNYSwfwEw+MhGqLsJypG4m9oPM927l/PnzdWy7e0fPwMyaPQOXu8pjruUNDstja5+
 WTxO62tLNDFNwKlSN/9/FrzYqhdXgA6Q9YCJHku1q+7tJrrN010CwHl9Y3o0UqYV7tOJYrGGxjQ
 +2IK9gmiVaNz/J8hbbji2ubBhfhB/XS1a15Q3fjso1Cv12AWpXfswXKvcq/+45ob6ZxP53AqFf0
 yyrMuIEZVcVgWdQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in usb_serial_register_drivers() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/serial/mos7720.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 23544074eb1c..e59bfa7c8030 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1724,7 +1724,6 @@ static void mos7720_port_remove(struct usb_serial_port *port)
 
 static struct usb_serial_driver moschip7720_2port_driver = {
 	.driver = {
-		.owner =	THIS_MODULE,
 		.name =		"moschip7720",
 	},
 	.description		= "Moschip 2 port adapter",

-- 
2.34.1


