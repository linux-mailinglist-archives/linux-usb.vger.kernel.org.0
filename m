Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE366D8F45
	for <lists+linux-usb@lfdr.de>; Thu,  6 Apr 2023 08:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbjDFGTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 02:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjDFGTM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 02:19:12 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22468A6D
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 23:19:11 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-545dd1a1e31so330729437b3.22
        for <linux-usb@vger.kernel.org>; Wed, 05 Apr 2023 23:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680761951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/f7k2pCQfyKc9i/c1APoOdFbnqMktgzwaYI9MvzI7I=;
        b=HC1tvqen+SYVHhiRrMODrf/6S8bdwKpI+yt4teqebTIbY0JBmRRXhr20JjZXktd3I4
         F66rfE2Is4Qu9p1TfNS5iCUeIomqVNB5B9pfoUwHBcCe+jCtE7iHW5NSO/+DU9mThwEk
         9snHuN8YGSee2wvz2Idm7U2+wqV2Qy6ssaFNI2sxaEpMba45OPyqNDWImo6Sc/5k2KUf
         9YeX2q7D783NI+HlWIJdrk66Ki4oVoLI+Yut4ZYAW8I5mOz/EnuJviU0CWGco3MFDl4j
         LamLj+bt8zhJrkna8q8FVBQVM9Y7sh9ay6CfAJm7DUKZTK1obcEHq/hZzxoh66/Oqtdg
         FuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680761951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/f7k2pCQfyKc9i/c1APoOdFbnqMktgzwaYI9MvzI7I=;
        b=OccHYScRRdz1eFqjxEcSh1Sow40O9HjTlcUGv4zhQLLVZhVgh+6raXJ7Cwhgn7PQ8W
         h9Sviiex5OD4xix3JifTGprs1qABDJrckK/LCNKFVu0RUZcBN09O66oe9UPDIztjtonJ
         +M0OdytOajitSgb1CGaEXn4hKPM6DersOY6JLJnVJjf3KrNsGm4XQiQBLfVwWXUHX+ct
         R57rYDNrB6bFzRIye2AcFN8Ps1ah8pTk2LS10U+UYea/1q7O/wdQ1CthkKLxLtzBptnR
         Bs42doigXXuGmKZLkDwT9yu/Wb2W4mtT6IrVab4/I7ExSoadlTG2bL0I47efFirdNYYn
         Ubww==
X-Gm-Message-State: AAQBX9emxBZY11F+83YeCI3QsAofQmLHx7l7kiu4ThUzQn+jFO3h0XYp
        03swFmQgoDvOXj7bQTzITFMUt7V2XZI=
X-Google-Smtp-Source: AKy350Z27oP6FQknZlBJY3VEEuuN5Fbe6TE3Go6ZF49WVR2vlInKkeeEI2A8kAjBmcEm+hNGu+IRXRCtHaY=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a25:cf88:0:b0:b8b:f1ac:9c6c with SMTP id
 f130-20020a25cf88000000b00b8bf1ac9c6cmr1399315ybg.3.1680761950871; Wed, 05
 Apr 2023 23:19:10 -0700 (PDT)
Date:   Thu,  6 Apr 2023 06:19:05 +0000
In-Reply-To: <20230406061905.2460827-1-badhri@google.com>
Mime-Version: 1.0
References: <20230406061905.2460827-1-badhri@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230406061905.2460827-2-badhri@google.com>
Subject: [PATCH v1 2/2] usb: gadget: udc: core: Prevent redundant calls to pullup
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        colin.i.king@gmail.com, xuetao09@huawei.com,
        quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
        peter.chen@freescale.com, balbi@ti.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_gadget_connect calls gadget->ops->pullup without
checking whether gadget->connected was previously set.
Make this symmetric to usb_gadget_disconnect by returning
early if gadget->connected is already set.

Cc: stable@vger.kernel.org

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Fixes: 5a1da544e572 ("usb: gadget: core: do not try to disconnect gadget if it is not connected")
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 890f92cb6344..7eeaf7dbb350 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -708,6 +708,9 @@ int usb_gadget_connect(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (gadget->connected)
+		goto out;
+
 	if (gadget->deactivated) {
 		/*
 		 * If gadget is deactivated we only save new state.
-- 
2.40.0.348.gf938b09366-goog

