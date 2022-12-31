Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9516665A483
	for <lists+linux-usb@lfdr.de>; Sat, 31 Dec 2022 14:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235640AbiLaNH6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Dec 2022 08:07:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbiLaNH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Dec 2022 08:07:56 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BF3655B
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 05:07:54 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so23853561pjj.4
        for <linux-usb@vger.kernel.org>; Sat, 31 Dec 2022 05:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/WmUGDU9j7tMbOdllnp/w1LH52F3Q0nBmj5c63hXoY=;
        b=HcErrNyru3IXwnUjHyPigj4DgCH5tLR+ehl9cK0upg81tu92hM/q0QwFzPXCdVrRQC
         1e5I2qu0uCfZl1LU1MPA6dnworHc7Tz+3NO3EoKvSHKG++DIf/bZtOsR+gOVNTJ+YIhn
         +8XMNlLfdFp/TVCEvd4hjsBHeZXt+6AyncbdRSX2IoIipW2OfVQk9fnGlx7j23/6yvbk
         Z2bjbugAXIuvs2av3j3SX6T9C18JkNvmopBpo/5X3LKc6YPM4qMzAFjOnzJmtogDsJ/v
         yf3nK9lBMug7GVhXO3wAwY8LLNsuR3rWFWkkBXpCwhpvr28d07qJUbaY7YAkyvkgdb/W
         8e4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/WmUGDU9j7tMbOdllnp/w1LH52F3Q0nBmj5c63hXoY=;
        b=znohNTUPUVV4fjBXFJzNpFFObQ9OF5OhqnJ+IfanwVTSlH0Neo9ZudB54oC5HhO6YR
         z8W3YgpLDr9RFIblE2xKqYXs/fsCJcftxBCwU1Sbfr7V5pMUnZVq4mU1lGZpaQ628fXD
         BV+cbFmCqwzHXHA+btem1z3HwieGoGN86oQqQIq8P+BpxRlmjI/EdmQ8rPyYLPs37K+L
         hPJBCd2JvegVSqas2Haxc2dKdqX7zachpzywMa1GXPrc2fZjTOmYx4WQgF/c98/PvqtC
         lByn+2ovpLsarpnOKixLDVckPezXa4S4Ik1Gt6pddPvFIBwOGJGPA04IMOXqAQaMalYl
         qfDQ==
X-Gm-Message-State: AFqh2krNs6SAj40DTiU8kj3BLVZs8CEDUBSeuSbOCmYd+NWPq5g7JsWs
        thCHnBdIQ23LiziDGi0HRVl7/g==
X-Google-Smtp-Source: AMrXdXt0x2hv/NzCU5gypltMHPHNGVaAB4/E4enfVWVr3bbDnCQh0OgrIxyYaOiebMRIIqw/LRk4ug==
X-Received: by 2002:a17:90b:4a45:b0:226:102:2dc9 with SMTP id lb5-20020a17090b4a4500b0022601022dc9mr18128660pjb.14.1672492074231;
        Sat, 31 Dec 2022 05:07:54 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id d7-20020a17090ab30700b0021904307a53sm14568161pjr.19.2022.12.31.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Dec 2022 05:07:53 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org
Subject: [PATCH 0/2] Add Qualcomm SM6115 / SM4250 EUD dt-bindings & driver support
Date:   Sat, 31 Dec 2022 18:37:41 +0530
Message-Id: <20221231130743.3285664-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series adds the dt-binding and driver support for SM6115 / SM4250
EUD (Embedded USB Debugger) block available on Qualcomm SoCs.

The EUD is a mini-USB hub implemented on chip to support the USB-based debug
and trace capabilities.

EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Bhupesh Sharma (2):
  dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
  usb: misc: eud: Add driver support for SM6115 / SM4250

 .../bindings/soc/qcom/qcom,eud.yaml           | 10 ++++
 drivers/usb/misc/qcom_eud.c                   | 49 +++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

-- 
2.38.1

