Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BFF722572
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 14:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233319AbjFEMU4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 08:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbjFEMUx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 08:20:53 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386DDA7
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 05:20:51 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f62d93f38aso720168e87.0
        for <linux-usb@vger.kernel.org>; Mon, 05 Jun 2023 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685967649; x=1688559649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lbl7dx8l9YmbHJ5kHWnYk1dJ4k0yBLjSJf/VNttuMvo=;
        b=qB6t9b1zMODSkPgj93HJ+1qpn/5Njw0ZMJ6QOwhdg0CjkMnqPr8IUMacGbD65Kg9Y/
         uCeroIcgSr62duk2j0g3uiasj80JsPJbuwjOZIza8U4Zb2Z40YR5Q1LdBrsKznu7kgoc
         F1nCxbPukgalowULPOiJBrkWam/CbP+8Tci1bq3a3BSytfQSsADn3lFlDlsxBuUhX9iT
         S1bvRO+BE0gM/jjmhcc1Kx1DfhltgSUEZbniKwpE0aILlGfh7wpX3+ESXJE0drGlF9PS
         Xckw+2aVAqIUK6ne6TV246giE/MCz7Q5Qm49NdtW2f4NB7XwgJM0OaIWHEhAjVTBd/cf
         hQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685967649; x=1688559649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbl7dx8l9YmbHJ5kHWnYk1dJ4k0yBLjSJf/VNttuMvo=;
        b=CNDRcYtiUoj8OcMU2SyTyTt9JfL5xRz55Dbj5gHyhrBzAAICJ1ChVTg8eM5fHHzyHE
         IRq4aA7WzaGx72cFVuT/5r5xX10pR4+wDX0H/Q5Ba14N68CfF+1ozPENfLHtfDsD0ANf
         mKyGrpBSr6SJn6SfYmw7PCiQbMMJA/m57+MsQ2YmY+9U5a4f27Kh16bGnFqrXvcc4BOw
         xxTL3DKQk3CFoj/vGBzKn8rc9ksjStAAo2+q7m8+jBBzQ5x+490m+roQaNcV0Z/nPj3u
         zHRFlQBd7bO/HX7Bxm2HAmICLK+5J/4bFEoIwIh6VVCaiWIjuKQNevhe/Sgu4WeJ2NXd
         kTVg==
X-Gm-Message-State: AC+VfDxjCeYynQ1UsZ6TeibInMBd1zpcdo1fJN6mQrZi4xqMcNHD9rYv
        gEVhHcKS7I1vVLuGv53z5FYBAg==
X-Google-Smtp-Source: ACHHUZ6N5k0djmx0ZfMuJGMvzQkir9WRvp2pnTg/RcKLeEMaPrnEc5hfzHG/EQg4F38pklY++MaDDQ==
X-Received: by 2002:ac2:5314:0:b0:4f6:217a:5615 with SMTP id c20-20020ac25314000000b004f6217a5615mr1935202lfh.38.1685967649425;
        Mon, 05 Jun 2023 05:20:49 -0700 (PDT)
Received: from ta1.c.googlers.com.com (61.215.228.35.bc.googleusercontent.com. [35.228.215.61])
        by smtp.gmail.com with ESMTPSA id e8-20020a056512090800b004f20d0ebe50sm1106952lft.94.2023.06.05.05.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 05:20:48 -0700 (PDT)
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
To:     gregkh@linuxfoundation.org, stable@vger.kernel.org
Cc:     kuba@kernel.org, simon.horman@corigine.com, joneslee@google.com,
        oliver@neukum.org, davem@davemloft.net, bay@hackerdom.ru,
        linux-usb@vger.kernel.org, netdev@vger.kernel.or,
        linux-kernel@vger.kernel.org,
        Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH][stable-4.{14,19}.y 0/3] net: cdc_ncm: Backport fixes
Date:   Mon,  5 Jun 2023 12:20:42 +0000
Message-ID: <20230605122045.2455888-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Backport patches in order to fix the kernel bug reported at:
Link: https://syzkaller.appspot.com/bug?extid=b982f1059506db48409d

Alexander's patches are prerequisites for the last. I made sure there
are no other fixes in torvalds/master for the prerequisite patches.
Compile tested. Intended for stable/linux-4.{14,19}.y.

Alexander Bersenev (2):
  cdc_ncm: Implement the 32-bit version of NCM Transfer Block
  cdc_ncm: Fix the build warning

Tudor Ambarus (1):
  net: cdc_ncm: Deal with too low values of dwNtbOutMaxSize

 drivers/net/usb/cdc_ncm.c        | 435 ++++++++++++++++++++++++-------
 drivers/net/usb/huawei_cdc_ncm.c |   8 +-
 include/linux/usb/cdc_ncm.h      |  15 +-
 3 files changed, 355 insertions(+), 103 deletions(-)

-- 
2.41.0.rc0.172.g3f132b7071-goog

