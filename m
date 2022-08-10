Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 607BC58F3A3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 22:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiHJUpR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 16:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbiHJUpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 16:45:15 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E808140B1
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 13:45:14 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1168e046c85so9405806fac.13
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 13:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/Tb8rXUIwGiSR5Mp63C1iN3z6zJu5WryqQsj3M2SVRg=;
        b=Q9AFEMh19+uvchGr3kAscMNtmOvF3UcLNJrpS8Q5hLvtT/YdMM7ENd6DjjRLHuvNOL
         0LMyVuT3q9mnbUQmzJ0zoQEoLfE8fdc61WnbEU7OQKKAuNnUQ1HuAPVEdrrM3sSChHWt
         hs7JdP5X2s0YvHaULZr82zbLpXfmRkWxil55IzHvFdGh1ltbsfcacSD8NPJdoWoar2gj
         e4C1Nb58hBOKtfpe+R6GcRS8IbS8+W6xgTvExAM/GLzGFMVIEOMrRXIfe8kz+INtxoeZ
         LuJJKLxYT+R6QHeOBSLeSu6xSmTV7XF/sRCi77BXAZdJBqaX59TLEmb+RhNL3Vx4ZsfO
         FjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/Tb8rXUIwGiSR5Mp63C1iN3z6zJu5WryqQsj3M2SVRg=;
        b=12kskHedqKh6qeml1MPbBzmTqHgN/vuy1XqgznyUziqXWKdcn8aBxrS82vbjkSQxH7
         i/EPhHJpGWQ7xSk+Ae3se/KVHXJhy/I+CrOmMrKfieJWpvAN6xs8avUcq2t6HOcPfFUJ
         mG6Hy6BKp7BdHl6+JQsx5GEwYxtnavIe7XZwvYkIE/h0l45MNGNqGFm2SBxiQCh+fgHY
         Lmwjtg+oGH2F5SRPjkZrXNDmzKaTG3a7aWSDZ7j5wrwvTbdwJf994CY6uHZ2ww4ATMz0
         osCgXSue0hbSdffJhy/lawdeUrrAlb5y4G9ZhSRFXiBvd5Qc2UvCr1s8+XAVaraG8ruh
         sPlw==
X-Gm-Message-State: ACgBeo3dN1WHPoXTRIHkazWKmyMWiQto+H5l16qiD44C5UnmL33EnWY4
        s+daFdhyYOVACtdBkrEQexgIYJLMlQjRLg==
X-Google-Smtp-Source: AA6agR5KR+MQJmPIBH24l2i6zKt8CyhlzpT30Va14Lpv2RPY+mSG77c/ZvfnJUnOTLxhLbdj4GJIHw==
X-Received: by 2002:a05:6870:a181:b0:116:da6b:b3b9 with SMTP id a1-20020a056870a18100b00116da6bb3b9mr1418910oaf.179.1660164313523;
        Wed, 10 Aug 2022 13:45:13 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f12-20020a056870548c00b000f2455e26acsm3968218oan.48.2022.08.10.13.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 13:45:12 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: mux: GPIO-based SBU mux
Date:   Wed, 10 Aug 2022 13:47:48 -0700
Message-Id: <20220810204750.3672362-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A design found in various Qualcomm boards is to use a USB switch, controlled
through a pair of GPIO lines to connect, disconnect and switch the orientation
of the SBU lines in USB Type-C applications.

This series introduces a generic GPIO-driver for handling these designs.

Bjorn Andersson (2):
  dt-bindings: usb: Introduce GPIO-based SBU mux
  usb: typec: mux: Introduce GPIO-based SBU mux

 .../devicetree/bindings/usb/gpio-sbu-mux.yaml |  77 ++++++++
 drivers/usb/typec/mux/Kconfig                 |   6 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/gpio-sbu-mux.c          | 171 ++++++++++++++++++
 4 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
 create mode 100644 drivers/usb/typec/mux/gpio-sbu-mux.c

-- 
2.35.1

