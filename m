Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F227D27BAFC
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgI2Ckq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727531AbgI2Ckm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:42 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E771C0613DA
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e2so3243427ybc.17
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ETPAsWHvLyLNkSHJ+gS6oA+OTExuVARAMVUjKC9Fc/4=;
        b=YOzN/rOvca1uPt9PY3XDoEf2RUnhEyq0eKxdF8Fg+uNyxFSFrujusub6QGt672Jep3
         QQAQ1lYV+wvQ0XYYYxJrqwdRFZfO2FbRewFO+oty1wXCTAsmmK5tEmgyl0xi8oCvmsMi
         BUgFbkwEWW32XL+iyuCv5n5sGW2/bfdQGc4XxpLppVKIgyXxlVX54V5fnETAwQOBUurf
         kO+XGzvUsGuHa9ncWogKv+vLs2sUo+8z38OyopD8nZAaW0RpmXFU1oIlWwp8hY9Vyl2M
         algRGGfrfjDNQmXqY81pqW6LXhe2dneFr05VEUk0eHVhjIAljJpvrH94ot4Z89qeNJxD
         lJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ETPAsWHvLyLNkSHJ+gS6oA+OTExuVARAMVUjKC9Fc/4=;
        b=i4A+vi2dZRcDINa/LPR4UeTEHR7+vjmji9A5QRIhCWzEW4LYZyKSn8nlsNbZ1Gr8kQ
         PNNjzz41rtJ7ejHZb/IqY+lxgzcenSj6cHWG+VFNZzAO/OAzzj0eC0r2U7lSkpbG7u9N
         NLQQREFmgq5kFnkjwzNggne393/MoXvXz+vC86IvOa8hyC/rT3+A3E1YvqS4EuuqHVz9
         MxzechYkxaY8CRSMvR8zJtcJY/jBNE6vY6DRX16WFJJ0vd46LfUhvZSkFZs35AaJI5oU
         rXxagN48v9Anh6I8VvNORoVShQr7i9w5vP06DL1W9Y6Cr2OqVuSo+wZZytm9twUuYx3L
         i21w==
X-Gm-Message-State: AOAM532A8+ujQP/yZjLbW3bXEK14AVxYgu9vxGD6votfy5HyV0BsafaQ
        UG9W9oDp/79wnln2U7RIJPHnkSQrymo=
X-Google-Smtp-Source: ABdhPJxq3i3a+BB6LOmVW3EbE+nzVKJocf8lveCUAVDznppOElFjuLfBgYnTIP44KqRmyroDeGUQ0rVuSp4=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:d45:: with SMTP id 66mr3316010ybn.231.1601347240323;
 Mon, 28 Sep 2020 19:40:40 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:40:04 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-16-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 15/15] usb: typec: tcpci_maxim: Enable auto discharge disconnect
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
        linux-usb@vger.kernel.org
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
2.28.0.709.gb0816b6eb0-goog

