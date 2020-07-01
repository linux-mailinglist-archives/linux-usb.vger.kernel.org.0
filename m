Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C36321114F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 18:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732526AbgGAQyZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 12:54:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39792 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732800AbgGAQyO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 12:54:14 -0400
Received: by mail-lj1-f195.google.com with SMTP id b25so24405663ljp.6
        for <linux-usb@vger.kernel.org>; Wed, 01 Jul 2020 09:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GsuJHQuVKWW6KYu9kg+y/tvbPJCBGFUHU6+jphg7ArU=;
        b=FmiFVsn2pyZZDYNrWpmilInyfIS2Ts//uo5wopFGVaci9fQixhNXJin7L5Osd/m8iC
         MEV+T1PZl8yRXyoj6sCGLvZLHlDxjNNSFornIfOTH+XXBK+dh16s2LGI7IJr9vz1Al0y
         wHKj6s9uhp9/HioV88gwgTqY7gDuVXMcI6MsY7fpNnKvzfYUuia9GQYORXsHgQOjTL5Q
         5sQW7oD0YVHG8rF+6yuQAlKOdDSsCdjsPRyCrrOYTgVjVqVjPlzD0cLEM4R5/sixWO3B
         IlE2B6kS+JQK+8IO3XIyAj3Ms6v8K+OvDOhT+LOySx3R+u+jB8ZJ6McGTeFrh2BuoXTH
         hgBw==
X-Gm-Message-State: AOAM531TRENJAOLqGdPaFr3/Lu4siCFgUXrHt4w+dddLJF9Xy4wHgDlS
        ObJ2J+0r1i7G12gCrYzL0oU=
X-Google-Smtp-Source: ABdhPJxFHokf46U/QfGYCLpht6ZXHXFufLk3B7BQLx9VbPdpsMU7GtEyE6GrBpEDDifxrnfPAOgTIw==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr15099543ljn.263.1593622452447;
        Wed, 01 Jul 2020 09:54:12 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z7sm2014329ljj.33.2020.07.01.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 09:54:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jqfzq-00042F-If; Wed, 01 Jul 2020 18:54:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 3/5] USB: serial: keyspan_pda: drop unused firmware reset status
Date:   Wed,  1 Jul 2020 18:53:40 +0200
Message-Id: <20200701165342.15448-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the unused firmware reset status which would already have been
logged.

This suppresses the corresponding W=1 (-Wunused-but-set-variable)
warning.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan_pda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_pda.c
index bf988f77d400..c1333919716b 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -664,11 +664,10 @@ static void keyspan_pda_close(struct usb_serial_port *port)
 /* download the firmware to a "fake" device (pre-renumeration) */
 static int keyspan_pda_fake_startup(struct usb_serial *serial)
 {
-	int response;
 	const char *fw_name;
 
 	/* download the firmware here ... */
-	response = ezusb_fx1_set_reset(serial->dev, 1);
+	ezusb_fx1_set_reset(serial->dev, 1);
 
 	if (0) { ; }
 #ifdef KEYSPAN
-- 
2.26.2

