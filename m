Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E66776EF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 10:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjAWJBh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 04:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjAWJBg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 04:01:36 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58FFC1C33C
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 01:01:35 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so10062227wma.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Jan 2023 01:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnbR18XVTVgA/kG2E8Uv4DzkNNYetgwaJLUmuarDdSk=;
        b=JzK8IhpBF46oOeAJ76jz6D0Y6GOOrokHvTEDGusuNe3Me7BOEfEx95JrDZGmUc8yDg
         StBnXbbXFuwDTZsCKINAjG2zces9HDT92dI7smnCOexe7cALbOH8I4A10R+BQcFKW/9U
         PmrkYNZHXZKZq83Ul2puFJ2PXNiUM/1PFjsyO9bA6dzu8OpLazow+sdEas+m/V3R7Uq4
         8i5H+HP6Jo+bOHL7Ut7RBOm53akrdpAAPxLxWXnAXzkYHdfIfORZ5E9drFbX6uv+C4W8
         BC7S4Ou+88ayBwicUuyemqRWjFHXIWWP7d/fxEiaqlsc6IhAypkZkF8SD4oQRydkRDj1
         sIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnbR18XVTVgA/kG2E8Uv4DzkNNYetgwaJLUmuarDdSk=;
        b=urCLzyE2cA/3wpu+1EVvpBpjAN9T05epZ1iYwE+OkFjH9VPLQhFobFQPtCjcFcyspm
         YRPQGCLpyNkHe5R8Lq6dZgqz0PESLZoypKojDFtHGwAErL+cwDZrFy6Bd7nj5aHG8AAX
         KAbcX++agJxCyo8BX4tbt1+TDnb5RLXtNUWyjeS43BFV8gqeX+L8fQaSTY64mt3xwf0g
         LGaYslUMzT1rlttEeLvbX0eCAwM357HCUmvCT7Yi0Zza2au2TkkOb08VwBI4Eyp3wFhe
         SlMcm2h0MT8++fW+BtgzZVnlsnBez7Ua2+dY+p/mEOidYUFlhYpKdBMQzjS3XGAiE8be
         JIQw==
X-Gm-Message-State: AFqh2kpSucB7sGFpMvIfu4FbFE4XcmhOmiL8kQPUxfcehaE9hb4QwbXC
        LiPO7SiZcyaAVAL1YFwKg1C7b++qUOzfsT3haW4=
X-Google-Smtp-Source: AMrXdXu/HlyXTp/d7I1qaZ4QWa7ARUSXggvTNS6pnnOmW48dig76WBBRkDfoJsFeYItnkAgit3gqWQ==
X-Received: by 2002:a05:600c:4fd3:b0:3cf:7197:e68a with SMTP id o19-20020a05600c4fd300b003cf7197e68amr19869124wmq.18.1674464493842;
        Mon, 23 Jan 2023 01:01:33 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id t15-20020a05600c198f00b003db32ccf4bfsm10106087wmq.41.2023.01.23.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 01:01:33 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 23 Jan 2023 10:01:25 +0100
Subject: [PATCH] usb: dwc3: qcom: enable vbus override when in OTG dr-mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230123-topic-sm8550-upstream-dwc3-qcom-otg-v1-1-e287a418aa5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOVMzmMC/x2NSwrCMBQAr1Ky9kE+BqNXERf5PNtA8zEvVaH07
 gaXM4uZnRG2iMRu084aviPFkgeI08T8YvOMEMNgJrlUXEgFvdTogZLRmsNWqTe0CcLHK3j5kqD0
 GYy4XDVacTbBsVFylhBcs9kvo5W3dR2yNnzG7399fxzHD1TTZ32KAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With vbus override enabled when in OTG dr_mode, Host<->Peripheral
switch now works on SM8550, otherwise the DWC3 seems to be stuck
in Host mode only.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index b0a0351d2d8b..959fc925ca7c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -901,7 +901,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
 
 	/* enable vbus override for device mode */
-	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
+	if (qcom->mode != USB_DR_MODE_HOST)
 		dwc3_qcom_vbus_override_enable(qcom, true);
 
 	/* register extcon to override sw_vbus on Vbus change later */

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230123-topic-sm8550-upstream-dwc3-qcom-otg-81795ea148db

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
