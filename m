Return-Path: <linux-usb+bounces-8606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E8890D30
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 23:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE11B1C3029E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 22:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099AD14533C;
	Thu, 28 Mar 2024 22:07:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF112FF95;
	Thu, 28 Mar 2024 22:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663655; cv=none; b=hp+YiFmJk6a5MbXFUTi43vM5dUA+xCR2QMgym3ClBdZV/XKwGh+sdY4KTsBUQwbdDVe3JsOt7v46xsMrbLOV2ZQhXNy+4JBhxdF51u4DlKMQ/DHpKHP5/FDD/lnuKnE+sxN0vNA/NR9jrJHkMKf3cfZFEmsboACOcW1y5hGvEic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663655; c=relaxed/simple;
	bh=R8aVkbaePRyyMH7NWkmb2YcbGr4+qe0AXZpHnNzJDEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBewzQNsquIN9oUA5AAl1krp27kNGfesTxwCFhTcJWi+E+ADY9KvF204K2vafwYdste5AlW9MjCd/REUvmsGCccZlKgbTRRSZjEU5frVjQVV/80n+Uja3Vd+6IP4jfa+fs+2ZRcp/E7OVBYwan4l9tHkepFzcYmbp9nQSRIUjrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2373DC433C7;
	Thu, 28 Mar 2024 22:07:33 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 28 Mar 2024 23:06:08 +0100
Subject: [PATCH 30/52] USB: serial: navman: drop driver owner
 initialization
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-module-owner-usb-serial-v1-30-bc46c9ffbf56@linaro.org>
References: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
In-Reply-To: <20240328-module-owner-usb-serial-v1-0-bc46c9ffbf56@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=685;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=R8aVkbaePRyyMH7NWkmb2YcbGr4+qe0AXZpHnNzJDEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBenVkIzevupQyno7SIR5K6zypjwhwjz2bQs3k
 g9DFturXU6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgXp1QAKCRDBN2bmhouD
 18kvD/9SRh7wH4o2PHD2W5SJ0KpeDpbRfaY1RgcSdX5lWDiaNkOaFPDLhMzpVQPkvsB48q8kn7g
 iXxEIZU/GSnkrsQH6/ZqaTIK1ifTiMKGqLFEn5lD0KxKDAupMZ4EB+LIrwxZH+DoiyRxh3hbm5k
 qLPcA1rXws1tsW3OMmAw6yZbpLDETTT+MAHbmSis7iyvYo2XGFjeYwXKZjeXTYCsEEx+AZesg/4
 hSX0XSBu2awQxRz6KiA6xLCkUDGngZTAKx6J5FauM09gtUkV3sDc6PDjs5aIwjddMlB7zFXzJoV
 mfb9yWI4FXLQHsJiZA2l66JL2GqWSRJdcd6sunv6HrV3jrhxj7sxjd/56C0+sreBruK4eHQ2XUb
 FWnN4SESbYmuVnBhl9AirEPwYR95uKL8OzWKo0d+hXOWovwKlGbYaRjldEbIYghyO/GVPXkHEAn
 os6mbv4cRxO6RDAwQDFJtqV7azqSpNxlPdx3y6OT9wUkIUNTwLvkfz1GchH+sya6KvaVo5qlWvV
 CDwBlBfwn7ZmeG4fODwrWCNwWTRHT678ng6r/qfsUO+DJ4YoIEJi/A3NH/WOVqtSsdqO4Wox9QT
 AKM7HOR3oK74r/k9mdxa4kOfxIxs7UGLryNkxxokpdTSXtrvgejz/quLW+Zf0r4nN5IuN3XMe+f
 0qhtfvDH8TAhbOA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in usb_serial_register_drivers() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/serial/navman.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/serial/navman.c b/drivers/usb/serial/navman.c
index 20277c52dded..99b633051729 100644
--- a/drivers/usb/serial/navman.c
+++ b/drivers/usb/serial/navman.c
@@ -95,7 +95,6 @@ static int navman_write(struct tty_struct *tty, struct usb_serial_port *port,
 
 static struct usb_serial_driver navman_device = {
 	.driver = {
-		.owner =	THIS_MODULE,
 		.name =		"navman",
 	},
 	.id_table =		id_table,

-- 
2.34.1


