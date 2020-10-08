Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73D9C286E8F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 08:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgJHGQ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Oct 2020 02:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgJHGQi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 02:16:38 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10288C0613E6
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 23:16:34 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e190so4367540ybf.18
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6GCQRlFJvWAm6bVyoR4JADJgZDrlGQ+tF0P2tDjAwQ4=;
        b=dLyHE+NKdQx6N3xp8Uj0u2R2VKofMtLTZbJqX8MtTRl8FhWle9nCzpI2P9+fYPIo0m
         63b5xQhRL/DjD/toLWYMiH1Ax8C/upXf/Sj8+oSDqMga8KA9ZzrOzMQ/W4hWBmW+tH2y
         +ohwZCkSNbr4REb60eP9JKyuul04eKFo3xMlrFyauZ8sZKfy18SK5nhSEY51H2EbJn0R
         X5MPqZEAUaTsF9GdTK+OPZ7lbomAv6YIPCSVfDJ34wGFbFAQ2zMj7jwCM8Uz9J1hIOQ4
         71ByrlPz2ptjDEhJXFkIHnDUSCAlxtuhc0gLPLOd+1jFS52qb0s51Jonjsakkt2de7Vm
         ZU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6GCQRlFJvWAm6bVyoR4JADJgZDrlGQ+tF0P2tDjAwQ4=;
        b=N83DSuM+x4uM+SLgRqa7iosdETfvyokbYJsvDVFsVtCF+lhbY6RCpTBdICOSAOOwPO
         koxZReuzFiosVLYTVQU0mNcB/i94o8T3o97dmqxI725AXXVnwArNIwz5B8usQIsEAoZw
         HQZiIY0fSbrUPymu8f6sapwSBXm66LyoppzfohTkCRoL3ob9Bvsq37V99AyhYEdPQTog
         R7jVKyO2Ry2En4Kf5QyXmBuSdHuWVx6PhPixfT3TOp6n59rTZqxGx+4XN5AJnLsfZGTK
         qymHE9Gm1CwsmT0mgxdCUpfTQdNHbdbgzQiiSUdmEEiXs6zT3+MyDi663+7H79XMrt0x
         XHIw==
X-Gm-Message-State: AOAM533xQ3mRFY5mD9QnFuesILZfnwDCiD/Ylsfg9zsE/bQo+PJPAom6
        bvUVy0SUJ5RA8nXpSDk6cCH3SmJ7jDU=
X-Google-Smtp-Source: ABdhPJzR1jVNVW1InfbNo/DsP2kOzfsXrTXKg75iI2BfBahjQzKg4bl254IPLZohE8W45uopVL6I/TAa6Us=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:3184:: with SMTP id x126mr9152093ybx.141.1602137793300;
 Wed, 07 Oct 2020 23:16:33 -0700 (PDT)
Date:   Wed,  7 Oct 2020 23:15:56 -0700
In-Reply-To: <20201008061556.1402293-1-badhri@google.com>
Message-Id: <20201008061556.1402293-16-badhri@google.com>
Mime-Version: 1.0
References: <20201008061556.1402293-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
Subject: [PATCH v10 15/15] usb: typec: tcpci_maxim: Enable auto discharge disconnect
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Amelie Delaunay <amelie.delaunay@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable auto discharge disconnect for Maxim TCPC.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Rebase on usb-next.

Changes since v7:
- Heikki's suggestion:
Moved the actual write of TCPC_VBUS_SINK_DISCONNECT_THRES
register to tcpci code.

Changes since v8:
- Moved the logic to program the default values of
  TCPC_VBUS_SINK_DISCONNECT_THRESH into the tcpci code.

Changes since v9:
- none.
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 43dcad95e897..55dea33387ec 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -441,6 +441,7 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.TX_BUF_BYTE_x_hidden = true;
 	chip->data.init = tcpci_init;
 	chip->data.frs_sourcing_vbus = max_tcpci_frs_sourcing_vbus;
+	chip->data.auto_discharge_disconnect = true;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
-- 
2.28.0.806.g8561365e88-goog

