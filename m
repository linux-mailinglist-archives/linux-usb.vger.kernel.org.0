Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D02218809
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbgGHMuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:24 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36502 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728759AbgGHMuW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:22 -0400
Received: by mail-lj1-f194.google.com with SMTP id d17so39365583ljl.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FOKveVToAW+Q/aAOg46ZMWLgmRqlNJtzLcnTPuIwRJQ=;
        b=GpiC+3jIflD3qbWxs+m54UJu1FmVn63B9SE1J6mjt17I1fSIjDhCNDekGBNOXAu8Ib
         eK6fWiGqaJKP8vofsGLfT77rviny4hxaXbmbN+cmHQ6J7fDQOAMoqKM99yhbZNvmbEMe
         CVbbaCM6LgHyzy2NIrLkY7OVFkRg3f1B5XFEnxc44XA1xwG7mvjqaKsq6Fy27PWqJqtu
         zmcoLrnbnpKUfN59sQN17RqKx0XMhKNDb4e6V6OIhCBr1ToZ6FJj/ynIHCAxVOi0GGik
         HZumUPc8gdSChsogkPUEQ/kE+evYC6ieNn6bHBvWEckBw3nO2BvrEBZTg+t0FdRRbTZk
         YfsQ==
X-Gm-Message-State: AOAM532WXKsX8XqBFsZWR9jXSBYNoRebRIjrnznTfcQKq5mm+ArN+4dz
        ywP4cvAm4NFNQpjLIJ8Cbyl11RDmTmE=
X-Google-Smtp-Source: ABdhPJy06vz5kSkAIwvBzo78ycwxec/JO6zN+IQokGEC3WhpL6t5YUfEp26TJYrrikSv5jadmWZhMw==
X-Received: by 2002:a2e:9316:: with SMTP id e22mr31367994ljh.393.1594212619794;
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id x5sm886346ljm.132.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:19 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wg-00045q-Bv; Wed, 08 Jul 2020 14:50:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 05/10] USB: serial: only process sysrq when enabled
Date:   Wed,  8 Jul 2020 14:49:55 +0200
Message-Id: <20200708125000.15659-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Do not set the sysrq timestamp unless CONFIG_MAGIC_SYSRQ is enabled to
avoid unnecessary per-character processing for consoles.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
index 05a2a3aa3963..c5b35252c931 100644
--- a/drivers/usb/serial/generic.c
+++ b/drivers/usb/serial/generic.c
@@ -594,7 +594,7 @@ EXPORT_SYMBOL_GPL(usb_serial_handle_sysrq_char);
 
 int usb_serial_handle_break(struct usb_serial_port *port)
 {
-	if (!port->port.console)
+	if (!port->port.console || !IS_ENABLED(CONFIG_MAGIC_SYSRQ))
 		return 0;
 
 	if (!port->sysrq) {
-- 
2.26.2

