Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC2921D414
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729639AbgGMKzd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:55:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33978 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729543AbgGMKza (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:55:30 -0400
Received: by mail-lj1-f195.google.com with SMTP id q7so17094841ljm.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=amd6ZzL2zl5Mr3FET4bOw9yCxlz8hu0f5v053nQK0h0=;
        b=PCaXqcbWmeR6zTSC/jL7jlbdSU97TlhmbuYNakV91ADFO2DRNgOYhbYs6BsG6AhFJd
         2qpYSh00T4nichcVbRXHdqh3akfOBOANW0Ud16yM8rT+pP9Cg9jDL9qHr0SIeNu8s1bP
         jHV319pxwtGQM8xygb+iLUrdSwPtKQF1tiLbIcGHvJndxqMgjqI2lZnYe6BD9pLh28n8
         rl2yz61wEMNmhwj7xnzOnl+SSkqeY4O32xOMrb6Qg7qsY2ISlKMoJ+5vclaLnBwOJirX
         P9BMZ22tUQN/5JGCsGilh1HDPgerZd1zPan7wXGaBxu8C8rx1OasfIEyLxyB+kghAzqU
         RHJg==
X-Gm-Message-State: AOAM533wLy75PIsxe41Wdf7nJRwGekO93aPxgx+OD0QWaKrr0R9o7UGH
        7QSIfmhMnC593K4l7VQku82BI/m0QoU=
X-Google-Smtp-Source: ABdhPJwBJUZOFU2RPme4foPfhHSGM87raXYkY8/J2nRilnHmOcODq/VLgxbeR5pf7Wtai/v1UuDa5w==
X-Received: by 2002:a2e:81d7:: with SMTP id s23mr46370918ljg.398.1594637728031;
        Mon, 13 Jul 2020 03:55:28 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p8sm5469753ljn.117.2020.07.13.03.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:55:27 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1juw7S-0007FX-Db; Mon, 13 Jul 2020 12:55:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Jarom=C3=ADr=20=C5=A0korpil?= <Jerry@jrr.cz>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 5/5] USB: serial: cp210x: use in-kernel types in port data
Date:   Mon, 13 Jul 2020 12:55:17 +0200
Message-Id: <20200713105517.27796-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The port data is not exported to user space so use the in-kernel u8
type.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 09445b7a8f64..d0c05aa8a0d6 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -266,7 +266,7 @@ enum cp210x_event_state {
 };
 
 struct cp210x_port_private {
-	__u8			bInterfaceNumber;
+	u8			bInterfaceNumber;
 	bool			has_swapped_line_ctl;
 	bool			event_mode;
 	enum cp210x_event_state event_state;
-- 
2.26.2

