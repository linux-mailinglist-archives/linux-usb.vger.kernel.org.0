Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88490766B64
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 13:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbjG1LJs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jul 2023 07:09:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbjG1LJr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jul 2023 07:09:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED0035B3
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:09:45 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3422498e87.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jul 2023 04:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690542583; x=1691147383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErJXckq2r6r6mAwaTX3lXaPyb/fST8ASE4/gudVLaCE=;
        b=MNDXkEYUX01x3ierPN6u4u3IPxU5b8oHs2ZYqAay7Qqxbsxc1mvsZJLdYOuWxjwWjZ
         EIDF9pcWDEgGSHi2neD1D7asRng/InxeRQ+//TKJrDZ/TZI22E6GBZTlS/+sieyNHSwG
         vNy2Xo+488COADZ7/koFjLpHIZgPMJ3CeY6HsJRREXF/WjmG+75Rh0RawnFmjhC9uIer
         aYJwIwENms/1LAPju78hQJ8C8d2jA4/DHn5OQgJ9SF/1snjISL9JPdnK3L4xIaPGF0cY
         /NwIPxntxyPgo6JeSbU/WozTPem3q2lJyUtHfSqwfnbSCEHfrtdjveqkvxYzONblubWc
         GQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542583; x=1691147383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ErJXckq2r6r6mAwaTX3lXaPyb/fST8ASE4/gudVLaCE=;
        b=YeF15pSi5OPa8/plcYfrUYKB3aq9ReO36p3xU7RYergXviwXGMI2QlbNRzal/qqc40
         5c+AhxEa1T29qCVTEQNfAy8Qp5v7WgGE0Boh0lmv65oC9Ioky02Z0UYI6v/+777w85+b
         J6nLebguYoM+LGBxKefiPgmoV5vhfEAzm+KZC26TyQjby1R9aOd20bPWaY3tQDJmUsZq
         sM7Dz0AwI0Ico9cuJt6qo7Spk3JRQpPdMzDL4uTK1LUZkfud9IEzDUrJZ5r6JUc1xkcN
         OHZR2auSezk4En4g23s8ZPsprh7/W9a/Q4MeOsCtItQ/upPTe5OsbIcbvsyA7tOm5pId
         Zd3A==
X-Gm-Message-State: ABy/qLa/bEtWCMG/hhp3UV5rnlMLezi70qlVT/mSxPsre0hRyrR2lmGJ
        1GnThqTE32o6Yz04XTqCqbbarg==
X-Google-Smtp-Source: APBJJlFs4OMw+wkoxBZjm2P0EflKKYLdF/K2AORx3W+hTkzZqLObAokxYeLDaZ2WegNvkhQakH0uRg==
X-Received: by 2002:a05:6512:201b:b0:4fd:fadb:e6e4 with SMTP id a27-20020a056512201b00b004fdfadbe6e4mr1403301lfb.69.1690542583411;
        Fri, 28 Jul 2023 04:09:43 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512096b00b004fdc5557a70sm759854lft.141.2023.07.28.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 04:09:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/2] usb: typec: qcom-pmic-typec: enable DP support
Date:   Fri, 28 Jul 2023 14:09:40 +0300
Message-Id: <20230728110942.485358-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

To enable DisplayPort on the platforms supported by qcom-pmic-typec
driver, we need to register a corresponding drm_bridge for this device
and also be able to send the OOB hotplug event to the corresponding DRM
connector. All this is implemented by [1], but there is no direct
dependency on that patchset.

[1] https://patchwork.freedesktop.org/series/120393/

Changes since v3:
- Fixed changelog for v1 (Guenter)
- After discussion on IRC, change connector type to
  DRM_MODE_CONNECTOR_DisplayPort to follow i915 and amdgpu example.
  The fact that this is a DP wrapped in the USB connector will be
  handled separately via the subconnector property (Simon Ser, Janne
  Grunau)

Changes since v2:
- Reworded commit message for the first patch to explicitly mention that
  the "displayport" OF property was rejected (Bjorn)
- Removed several #ifdefs from the qcom-pmic-typec patch (Bryan, Konrad,
  Greg K-H)

Changes since v1:
- Properly handle CONFIG_DRM dependency. Disallow building
  qcom-pmic-typec into the kernel if DRM is built as module (Bryan).


Dmitry Baryshkov (2):
  usb: typec: altmodes/displayport: add support for embedded DP cases
  usb: typec: qcom-pmic-typec: register drm_bridge

 drivers/usb/typec/altmodes/displayport.c      |  5 ++-
 drivers/usb/typec/tcpm/Kconfig                |  1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 35 +++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

-- 
2.39.2

