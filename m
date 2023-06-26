Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E147673E5D3
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 18:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjFZQwS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 12:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjFZQwR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 12:52:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F053D10FF
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 09:52:04 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso4158785e9.0
        for <linux-usb@vger.kernel.org>; Mon, 26 Jun 2023 09:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687798323; x=1690390323;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RX0ATF4iG7zLA/0c1ahQHVsWmNJPp+QupJeJmJf7dDE=;
        b=LRivViNYhyXQKvIXtY1RcKyaR98NQE7CCWmyFRcYeNmvYYMD4GYxeeseYaEjTG9CLg
         uj1XD0+TsYWivhQJT/V72O1E4P7UrFL0nfLlGvlUPjZ0JKMnsJBOsNnfUW0FNIOiUK3k
         h9qfpSDbaU5GULx1Bcb84gXYAryaMMK1LyZQG4KwTeFtgHPme3aNlvPUUV9EKzDZZz6I
         9pLtOTAAbgfDL3DavCaY4OYKBhE9TIkz+pU2ssydLvI343Rd0p+kS/ENNAYNhzvdWJXl
         smyJ1z7SeC9aokbLFvkl5CEkXedPIkorGZyDQOaicEMvtWQ6Ya8VSnkZ4HOWRI2TUE+L
         aUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687798323; x=1690390323;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX0ATF4iG7zLA/0c1ahQHVsWmNJPp+QupJeJmJf7dDE=;
        b=KZ25uv017F7I2cGbkkaFBaL29sBXnI7FtLcTMvLncgyzcrwNW6yctqw6chi41nuYEx
         Y0J5aeVsd/6pkhcmyQpKDu6QgUaudtG7szzGCdNPnhn2QAtSxpoWgJFpZ51xRw03zEH7
         OCFpd+//VhM62t0Z1f3rre/W2cj1hHR+jNtGb0n6eYtumau6pxP90maEHPQC04wwn0KU
         Bkww9Z6F7loUUV2l4ShsQajFOoUld797Ohf6AXf1A1VOSKSp6Ar8b+kRADUrGah/NSMr
         p7G42FPcuPmIyek9LLFsUW7hXOyrBbrWwZlKqeEWh2YSf6xL5Kh9d6/zu3OhdTHSt1AD
         6lVw==
X-Gm-Message-State: AC+VfDy5n6Xe4RGRUAs/E0ZDUXC0NioRGDcEKxN8eQPogfkfnQHkCPC8
        DC3lNeSyor2yO71vAbHXWW0XaA==
X-Google-Smtp-Source: ACHHUZ63zj3b+dVwT0JjioR3qHTymArG6YfHoXuoyldjQkwvgiZGKNrCMHPDNHIx3qfp+28vCe6Azg==
X-Received: by 2002:a1c:4c0f:0:b0:3fa:8c8b:716 with SMTP id z15-20020a1c4c0f000000b003fa8c8b0716mr4135902wmf.1.1687798323252;
        Mon, 26 Jun 2023 09:52:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id n23-20020a7bcbd7000000b003f9b19caabesm8205108wmi.37.2023.06.26.09.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:52:02 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 26 Jun 2023 18:52:00 +0200
Subject: [PATCH] usb: typec: ucsi: move typec_set_mode(TYPEC_STATE_SAFE) to
 ucsi_unregister_partner()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230626-topic-sm8550-usb-c-audio-fixup-v1-1-bc72fddf3f42@linaro.org>
X-B4-Tracking: v=1; b=H4sIAC/CmWQC/x2N0QrCMAxFf2Xk2UDt6FB/RXxos8wFZlsaK8LYv
 xt8PIfLuTsoN2GF27BD44+olGxwPg1Aa8xPRpmNwTs/uslP+C5VCPV1CcFh14SEsc9ScJFvr3h
 lHilSYOcWsEiKyphazLRaJvdtM1kb2/r/en8cxw/7287hhQAAAA==
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mr86JHI41H3kynpprp69RFpyVVHDbDm53qvzMVnH8b8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkmcIxFmDjqabxx+bKet4LRxvH27IFF3TP7o3XEshe
 9+o9CSmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJnCMQAKCRB33NvayMhJ0WiXD/
 9XzM2XmCirIqZXyAaRhb2OaAhJDfuIZo0Y6Q7vHlbTyXDHOaDfY4KHXjh0Zfc6Q28q4H8LaEhR6rkr
 NBQ2Vs2KYOx7f8OB5xCVLZ/gos0gBrETZU2U6Jy+gIUExf66QoMiHXC/uPdeeZrgrkJygbS9UaHGwo
 Te7F7QYMFCH3eKiCUE6kO2tpi1VdXl44dTjfSd7FzkW4yGZ3F3CVJMTY8Cp0kuPpU0+XQ14+RHLO4q
 KDEBV0q5eI6g+43xpGUoaVa4nrpp0Gmb64Xra/gHF8NNUJX8ONm4wwAxyDfJ1fljhLoGdLrD5UQtUm
 jDhsQHo+JscADIKRGDTnQu/qi2WSF4yq2KS2F9UlUN77I0QwLbvP1OWdCJ0VsHU0RrdfprHmIjzE91
 K3NiEwqtTCvBs9Ze+bwN8DEAfXvYpVwYbjM5Pkdaub3+9irJthJzgaJM/+QVh3bQ+9wVmjGb8vd/bV
 WIaziuIsXNuVzYh2gNbSSvGYrHA1Dt47cAaLEYV1B5uTuhHQPCfzRapT47MOoM56OzfXKG2lYcjYmv
 etMLG2uvbSehYfnkXEvLY1LsPDI90CmVLKr5/xNLVbg8feTxnVETJRKbckn39N+G0pg1p4hDvmaLdI
 wKkatn9Bd2s0+thGC4N85zl48tSEs+VN+9kjWIPwxiVRDXfTK00hTBlD5Teg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

It's better to set TYPEC_STATE_SAFE mode from ucsi_unregister_partner()
instead of ucsi_partner_change(), ucsi_unregister_partner() is always
when the partner disconnects.

Fixes: 25a2bc21c863 ("usb: typec: ucsi: call typec_set_mode on non-altmode partner change")
Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b6d6b14431f..f6901319639d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -785,6 +785,8 @@ static void ucsi_unregister_partner(struct ucsi_connector *con)
 	if (!con->partner)
 		return;
 
+	typec_set_mode(con->port, TYPEC_STATE_SAFE);
+
 	ucsi_unregister_partner_pdos(con);
 	ucsi_unregister_altmodes(con, UCSI_RECIPIENT_SOP);
 	typec_unregister_partner(con->partner);
@@ -825,8 +827,6 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 					UCSI_CONSTAT_PARTNER_FLAG_USB)
 				typec_set_mode(con->port, TYPEC_STATE_USB);
 		}
-	} else {
-		typec_set_mode(con->port, TYPEC_STATE_SAFE);
 	}
 
 	/* Only notify USB controller if partner supports USB data */

---
base-commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
change-id: 20230626-topic-sm8550-usb-c-audio-fixup-9ee3cac5e00f

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

