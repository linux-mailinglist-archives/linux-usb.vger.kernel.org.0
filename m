Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F44921E19B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 22:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGMUnG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 16:43:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgGMUnG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 16:43:06 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D52D2C061794
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 13:43:05 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id y3so18801770ybf.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=u4BPyWh5yHs2Kab6PgpImYecSjjyYcaQmgcBiUoACx4=;
        b=mS3cZkkL4ytB2Rv9TXb6i3g2Jr9fxMLvGOFLgmKO9mjkEr2Y/YJXB0wtQJLK+1GUOk
         nu95u4fibL1kpfO/8a2bC1HCfJzeJp0nIGY9Y/mE7n8753iaBgxcgy6Sb77+8E+wOiXT
         kQw87UJdQEJlo2BV8MJb+FknKPXT2a6vUbZEFT0Lt5IXOX2gPrrkYCf93BhKjdM5bPtX
         FM4KoYL67nCmJccP4NUqatEwEDkkHIDJS2/U6Xup2+IyYS0WEtM+zmCqpW19mGTKAXiS
         Nw/l/lUA84twskulRUy5b0xMobsP53aJ+/mb537ln0Mk4IKTtxC7EAxxJLNUo749fkwv
         3f1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=u4BPyWh5yHs2Kab6PgpImYecSjjyYcaQmgcBiUoACx4=;
        b=RSwcyR8nLMRlBxv31K7tjjfQd8GF3LvnjHTtWbeax5Ox/9IvgtKzzUq64jtFYKN1qX
         iA2I/VDMAPogvc1oTInXMu0GTG+zmW6JMJGVHWQGJQQs7fakqPt7L50gMNn3RFLKfWWf
         JtSHN+IOPd5nTdqnaSrseLmVDiwD5vRt6IShSCdBhUZYYBz1Ipt61BXqwVwzEDOBQGqE
         N9OPaxphM3dF27zx5+wglx00szDPXbOjr39QAgt0Tt8NUfyCxG9z1gVVSPrPK1I3GKhh
         WtN+TXCEBdzaDhPO1OqsHIb5r1LKJuESeZsDyyruzooLTc+AUNsnKtBmCKthxW8ry0yc
         N3yw==
X-Gm-Message-State: AOAM533JuohjDgNplaSLpnlVXXVqAl7jTRjOCRWq9tQuQzR5Y7E+JVnw
        aO5dCxXgzI++d2/UIgvSRPtSuBzinAQ=
X-Google-Smtp-Source: ABdhPJzJrI8P+vDGu8F5oFZf2kl4M+ReMzqn9ChOp7gZBgsfRmaAQsCbSphkOs/bWdkme8nxrxWW/k2ufws=
X-Received: by 2002:a25:d80b:: with SMTP id p11mr2915414ybg.506.1594672984919;
 Mon, 13 Jul 2020 13:43:04 -0700 (PDT)
Date:   Mon, 13 Jul 2020 13:43:00 -0700
Message-Id: <20200713204300.345975-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH] usb: typec: tcpm: Move to high priority workqueue for
 processing events
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

"tReceiverResponse 15 ms Section 6.6.2
The receiver of a Message requiring a response Shall respond
within tReceiverResponse in order to ensure that the
sender=E2=80=99s SenderResponseTimer does not expire."

When the cpu complex is busy running other lower priority
work items, TCPM's work queue sometimes does not get scheduled
on time to meet the above requirement from the spec.
Elevating the TCPM's work queue to higher priority allows
TCPM to meet tReceiverResponse in a busy system.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 82b19ebd7838e0..088b6f1fa1ff89 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4747,7 +4747,7 @@ struct tcpm_port *tcpm_register_port(struct device *d=
ev, struct tcpc_dev *tcpc)
 	mutex_init(&port->lock);
 	mutex_init(&port->swap_lock);
=20
-	port->wq =3D create_singlethread_workqueue(dev_name(dev));
+	port->wq =3D alloc_ordered_workqueue("%s", WQ_HIGHPRI, dev_name(dev));
 	if (!port->wq)
 		return ERR_PTR(-ENOMEM);
 	INIT_DELAYED_WORK(&port->state_machine, tcpm_state_machine_work);
--=20
2.27.0.383.g050319c2ae-goog

