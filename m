Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BE63B7489
	for <lists+linux-usb@lfdr.de>; Tue, 29 Jun 2021 16:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234481AbhF2Opa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Jun 2021 10:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbhF2Op3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Jun 2021 10:45:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B145C061760
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 07:43:02 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso2676414wmj.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Jun 2021 07:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUQypUmM9h6i4v6oCk9YehaCw2OHs9SsY81VSC9/xGA=;
        b=sArHeNOUzj3vmLXDdwuwfj8f7i2m0cYVp8fuCi2r9rpfddu+kEMY1G60XrRel1WnyL
         UNswhwcK995ctEZ12cF6CAVqp1OymrqaCC9Xg/cwSIZeFk4NcOfX4BJAFfBXs/zI9ki7
         4vDoTLxOmhXGr2Qsc+xUkRUKIgzoFZ+ljJaEUH5+WMOYHP0TjHvPFVU+0ZSoxDGI/4CZ
         /sKQSu4vxbdDb2wPQQZt/im2ac8+LQasGw/OctrIvX3j5aHzcWKnQy+AGiKIFtC40dPy
         KtI7W6mUS0A391jtA4lB/mGx9kp6S036Geer74EQslDIQvDo3DBWVFAk31d9QtNkPiKw
         cZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUQypUmM9h6i4v6oCk9YehaCw2OHs9SsY81VSC9/xGA=;
        b=Xa0le8SVh/RTjuRFAhMlJoLTPqkfv4C5iIsHU6U3l8Ywp8Eq8NSdI95lXs9fDg4ffZ
         STrYaSUBCFz51a8cEaqqxNBObJvvdt7aBc2AYjzWIpQZ3Map5p2TLshq/bo9NCZgvVyt
         puxXSYkHtxgt62W7cJaGwNGWf7NlkWHs/5t4cEjtPIXe00K1023WcOihl3EEzKN55Hga
         itCMFkMUJopm4+H34Pzr+7BPFB8FpGLR4QoHWDoejfT6TxYwJ5FBI9NfuQ6uwZQ3XbCM
         oepVk732Sy6jhenhpn9SUITSLkeHeCwSbt4TuFEaddlANP3BjjQ7VQXcpuZJixkQ4q5T
         ElRg==
X-Gm-Message-State: AOAM531kWkil2WgBwzV1gHweweJsXeMsR6tYqNVKmG59VzojjdSFssjT
        QDSaFtoju7k0a6aHPfzFNSYWDg==
X-Google-Smtp-Source: ABdhPJxmnTQQv3D2hPWfJ1GSQnqr3Gaqmbq52ab9Gs/KhGp5lHb4rgpPo28nQOE60OyOUwXgH+x3RA==
X-Received: by 2002:a7b:cb8d:: with SMTP id m13mr33010668wmi.8.1624977780916;
        Tue, 29 Jun 2021 07:43:00 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u15sm2832266wmq.1.2021.06.29.07.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:43:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] dwc3-qcom: Prepare the ground for pm8150b tcpm
Date:   Tue, 29 Jun 2021 15:44:47 +0100
Message-Id: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These two patches from Wesley prepare the ground for addition of a full
typec port manager upstream.

We took a bunch of these patches into the RB5 development tree, which I
have subsequently split into a USB/TCPM specific staging branch for
upstream.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-5.13.rcx-rb5-tcpm

Some of the original patches from Wesley for basic type-c have landed
upstream and some have not. The type-c patches are subsumed into a pm8150b
tcpm driver but, these two specific patches have not changed and are still
required.

I'd like to resubmit them here with my Tested-by and Signed-off-by appended.

https://patchwork.kernel.org/project/linux-arm-msm/cover/20201009082843.28503-1-wcheng@codeaurora.org/

Wesley Cheng (2):
  usb: dwc3: dwc3-qcom: Find USB connector and register role switch
  usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API

 drivers/usb/dwc3/dwc3-qcom.c | 126 +++++++++++++++++++++++++++++++++--
 1 file changed, 120 insertions(+), 6 deletions(-)

-- 
2.30.1

