Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 594E56F6246
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 02:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjEDABi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 20:01:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjEDABh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 20:01:37 -0400
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com [IPv6:2607:f8b0:4864:20::94a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A65449D
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 17:01:35 -0700 (PDT)
Received: by mail-ua1-x94a.google.com with SMTP id a1e0cc1a2514c-779f4178ffdso1848981241.2
        for <linux-usb@vger.kernel.org>; Wed, 03 May 2023 17:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683158495; x=1685750495;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=huFx2QvDQwsYXGCCCCBMBfy2FLXsfhWYQfF5nBlr79I=;
        b=lHO7Oxeg/rcvTJ6A63c1GAy4Ybs22O9huvREAir9TIYIe+P4aC/Colr7NfCzaa679H
         0YeM84/uCokGHlJryJp7QV3wGzFt+DYV8zjwq3zbEJmu1HgM3+Ll92gXjlfpRpqh1IrZ
         WvFHPWE4Tb67HKzXWNdiEHLAE8QNIvHKG0U8mRu67j0403cm4e0tqlIAhuTD0cn77e2H
         TDzgogGpwwZAViblUqihk0fnkhmTji79j3mUayHAZn4C+VvMqfyb/UWACVeTxkr95ZDf
         ks3CreJyXNqDhECL92Eh5/7pPdirCtUNPdwLOGLZZfJgFg5yMH4e0wF/6vWJ41GsOmXP
         G+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683158495; x=1685750495;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=huFx2QvDQwsYXGCCCCBMBfy2FLXsfhWYQfF5nBlr79I=;
        b=KEUJ0DC3lXu9HwzzrKZy1Nj0wITq/jn7RJgWKXbJgferyYZ3QMhBSjAOENTsFZmtDT
         +GpcM/8YPA5fI5M7v9vqXMwq46k4erACg+E0EsJy2QHhbA3qoxoUHnXcMgcWtcJe+b12
         gEubmecRS1DeCliM1rA1wDiqTQ9PiVOQUbJd46VfoeK+9ukt86OZndksGti5As6MxjXF
         5we8+5bHYbCI+N5N9tL1Uq2BJP+hKLpWFWMPg4Hzf4jTdGWNZ+rfAYESaMRLjpAxaNbP
         3h8zztMkIQfCix+7XPDH5Q8V1Mn0dkQmb1J6Ax4InIFOcICLf9AYnVb9HFf67+VtUDM1
         OknA==
X-Gm-Message-State: AC+VfDyS0XbFgCDXVVxEY9QTlD/8+yS0tw/vCW4hgcUkl/YKoJ1vvxyl
        P5ebjc0ZDumD0fqA4hLlzyadX8ke2Q8=
X-Google-Smtp-Source: ACHHUZ64JZobIfxyRIThzFSKwv4Sp5yqy2vgzT3E5vWWFt9knroNDmnH1EnrUwjb2Urbl98PSnPkzLSFbtc=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a67:d81c:0:b0:42e:38a3:244b with SMTP id
 e28-20020a67d81c000000b0042e38a3244bmr3490332vsj.5.1683158494939; Wed, 03 May
 2023 17:01:34 -0700 (PDT)
Date:   Thu,  4 May 2023 00:01:29 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230504000129.728316-1-royluo@google.com>
Subject: [PATCH v2] usb: dwc3: Add error logs for unknown endpoint events
From:   Roy Luo <royluo@google.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        badhri@google.com, Roy Luo <royluo@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In cases where the controller somehow fails to write to event buffer
memory (e.g. due to incorrect MMU config), the driver would receive
all-zero dwc3 events. However, the abnormal event is silently dropped
as a regular ep0out event.
Add error logs when an unknown endpoint event is received to highlight
the anomaly.

Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/dwc3/ep0.c    | 3 +++
 drivers/usb/dwc3/gadget.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 953b752a5052..b94243237293 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -1207,5 +1207,8 @@ void dwc3_ep0_interrupt(struct dwc3 *dwc,
 			dep->flags &= ~DWC3_EP_TRANSFER_STARTED;
 		}
 		break;
+	default:
+		dev_err(dwc->dev, "unknown endpoint event %d\n", event->endpoint_event);
+		break;
 	}
 }
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c0ca4d12f95d..7163d5d0eea0 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3803,6 +3803,9 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		break;
 	case DWC3_DEPEVT_RXTXFIFOEVT:
 		break;
+	default:
+		dev_err(dwc->dev, "unknown endpoint event %d\n", event->endpoint_event);
+		break;
 	}
 }
 

base-commit: c8c655c34e33544aec9d64b660872ab33c29b5f1
-- 
2.40.1.495.gc816e09b53d-goog

