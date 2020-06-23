Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF427204BFA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 10:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731563AbgFWILR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 04:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbgFWILQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 04:11:16 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34A7C061573
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 01:11:15 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id e11so8758689qkm.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2020 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qCWT4Rez6gTH/At6pqm53ZNSkYPIxNCg0x7So6JeOV0=;
        b=al8nOOns96CUqCq6TqVlPU1GXWeC6dpPRFJuDNS0dAuJhTixUB8DTTlD7PDNPmXg5x
         51BhPgDKU/kqX4gp/E9k456oicb2exOLQp2zJQVkGcIciA32lgywu0pL30iKR7LJWp77
         /YB65ltg12A+T2esTpcFngmg07+OD0OfPsBoG8h0OgtKxnQ3aSONnBBeEcQWMiJxrTCQ
         VpRPZ5wKBBqB/4VDKHkzTK37znQwSa8PfssmOMf6H49lL17rfV0Na2ouoejBn4tEhkSp
         W7g1ctC7OgZqD7+vaU8M/jQVyLqgCgYwktdmuhSxS7IgngY0Oa93UaOdY6VqvZ/EYAAQ
         9e2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qCWT4Rez6gTH/At6pqm53ZNSkYPIxNCg0x7So6JeOV0=;
        b=icTzU9e/BCi7cGwoEMoYjfkR73WdExb5LHQKoxtgL3OqCdMGoaVXSxH/465q+hcwJy
         +cwuqL11FB5+3QazbZvbIqRIa+ZcZ1nZ5krhQfp5xWWFxBrlw+WWo/Sw6amOhIC5BaQg
         xpv4V1Tiyeob3YfbT8IAj+I9rpbYWSCfkeI0YnZTewEcDe9otD8zFqYXVIbxLldeszkM
         Lt/SIujjmJVfJ1P4qqo6y7aVa95e5WjDWjqRdrb3JSy6ZrUrhNPCKK0OyU9Wvzf8UID+
         EkFaZRRA1jC97+NS13cejEmF7JkjLbLxgECWxUD8w7YyFqhm96jlWA0jo6m2sbwUkl5q
         BpzQ==
X-Gm-Message-State: AOAM533UHerU/dlL5qDYplH/QXFacT2xqTVoSL+9KwX5wZdyTTO6TBpl
        ex5Wt9MATEVYVEEeS8qxPn44UllUrQw=
X-Google-Smtp-Source: ABdhPJwEnaGL89gP+Zt5E19Fhso4nTuJdYzwG9zjbrIEmSrkT4RCALZ0xPifvY23ZrE7NeCMdT8+zQ==
X-Received: by 2002:a37:dd5:: with SMTP id 204mr17581984qkn.438.1592899874863;
        Tue, 23 Jun 2020 01:11:14 -0700 (PDT)
Received: from Titan.localdomain ([187.112.22.131])
        by smtp.gmail.com with ESMTPSA id h197sm5448965qke.51.2020.06.23.01.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 01:11:14 -0700 (PDT)
Received: by Titan.localdomain (Postfix, from userid 1000)
        id 8E4DD3E1853; Tue, 23 Jun 2020 05:11:11 -0300 (-03)
From:   Igor Moura <imphilippini@gmail.com>
To:     linux-usb <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: serial: ch341: add new Product ID for CH340
Date:   Tue, 23 Jun 2020 05:11:11 -0300
Message-Id: <20200623081111.288952-1-imphilippini@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add PID for CH340 that's found on some ESP8266 dev boards made by
LilyGO. The specific device that contains such serial converter can be
seen here: https://github.com/LilyGO/LILYGO-T-OI.

Apparently, it's a regular CH340, but I've confirmed with others that
also bought this board that the PID found on this device (0x7522)
differs from other devices with the "same" converter (0x7523). 
Simply adding its PID to the driver and rebuilding it made it work
as expected.

Signed-off by: Igor Moura <imphilippini@gmail.com>
---
 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
index 89675ee29645..8fbaef5c9d69 100644
--- a/drivers/usb/serial/ch341.c
+++ b/drivers/usb/serial/ch341.c
@@ -77,6 +77,7 @@
 
 static const struct usb_device_id id_table[] = {
 	{ USB_DEVICE(0x4348, 0x5523) },
+	{ USB_DEVICE(0x1a86, 0x7522) },
 	{ USB_DEVICE(0x1a86, 0x7523) },
 	{ USB_DEVICE(0x1a86, 0x5523) },
 	{ },
-- 

