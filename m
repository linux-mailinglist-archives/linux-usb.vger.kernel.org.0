Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCFCDC2196
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 15:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730977AbfI3NOp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 09:14:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36380 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbfI3NOo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 09:14:44 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so5609668pfr.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2019 06:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tJEDDw3yOxrb71VC5CKbXIkJUsvnUza1w90ltv46DTs=;
        b=K+x5g7khunftljJLZIgmeOIpYH76mPtnLXbqVBZ8KuZUPtvYEvPR5MMwAVAXUvIoB+
         aj0ZxkQ/wNglDyyCC7rsb+rJdZztc0wE0+Ta93IibSp2jERAyN/ubwz6UwedyyXC1vaV
         NAUTqsvmvozN33SaaEtxruvbbbl54D2zsxYsJ/PkhodkeOvz4WdyWR3jEW6oumrmagyX
         Dz0kjYGzDnNHGTei2kZhyCGaVd4bDMFayuPXGgXZvnNPoRHCdUNK0mcHIqWZNhCXS6b/
         Jl/iURDz1vUuzMfqRmLw5hJ+zkDFnAiqdDVY/cyy3kcVhHbFQ7KeF+nOPsARPsal0Ok/
         Dk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tJEDDw3yOxrb71VC5CKbXIkJUsvnUza1w90ltv46DTs=;
        b=ko+j3ybm498eEiCYZuN7A8KuOqFFL6lMCVa4c8fbasp/MkxZVDCKTgBrzO9yLxJQrZ
         yKcg3TYNTKuaMFzn+JVxfthuF8dj4iEkJDv95qitycA+yfCFZYrJ+ORl/yjnezzzHYhL
         YvyTFZtIC9aCkPAJjr3MKGjh+UtwaOWszlxTSdijRe1mHGM4ebMXvGM33tYDYoz2DZTa
         MWVzfOFYN6F0MQsYqQfS6F1sqpW9nZDgmh5UBply/YqI3945ihldCmkX1tTjCEqx7PNS
         8hBg5IjmlmuIIxMKRbGGCmebrC9uuxbMyzI9p9umWYjYUjRP+HEmcjT+Rto1M7mrZW3O
         KTxw==
X-Gm-Message-State: APjAAAWQq/MnjJNbb+SHAYcGIxFVi3L4UXjzLsYaukkFuEaH8+jTJT8f
        sR8EOO9IYqlczauQ+XYbZ8Y=
X-Google-Smtp-Source: APXvYqwNpnOToFvHsZh2/ycIPEob2UFuQ9nps8f4cvU29tuzJvkiFqNGKyqPvjt3syNYDIHPQP+FCA==
X-Received: by 2002:a63:5f09:: with SMTP id t9mr24244532pgb.51.1569849283679;
        Mon, 30 Sep 2019 06:14:43 -0700 (PDT)
Received: from voyager.lan ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id e14sm12542848pjt.8.2019.09.30.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:14:43 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH] usb: gadget: Quieten gadget config message
Date:   Mon, 30 Sep 2019 22:44:34 +0930
Message-Id: <20190930131434.12388-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On a system that often re-configures a USB gadget device the kernel log
is filled with:

  configfs-gadget gadget: high-speed config #1: c

Reduce the verbosity of this print to debug.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/usb/gadget/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 76883ff4f5bb..b49ec81194c6 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -780,9 +780,9 @@ static int set_config(struct usb_composite_dev *cdev,
 		result = 0;
 	}
 
-	INFO(cdev, "%s config #%d: %s\n",
-	     usb_speed_string(gadget->speed),
-	     number, c ? c->label : "unconfigured");
+	DBG(cdev, "%s config #%d: %s\n",
+	    usb_speed_string(gadget->speed),
+	    number, c ? c->label : "unconfigured");
 
 	if (!c)
 		goto done;
-- 
2.23.0

