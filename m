Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D85D856B92C
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238199AbiGHL7H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 07:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237509AbiGHL7F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 07:59:05 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA4E9A69F
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 04:59:04 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso810806wms.1
        for <linux-usb@vger.kernel.org>; Fri, 08 Jul 2022 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J8jX3Estd4eXEE5d3rDwAh42z+mREjTkFoeqoQgEeb0=;
        b=ZDrzfSRaLToxEUFp2EQi752TPzw6KWp5z7PTfMgdWzut+mLJG4tPCLtNAG/sRSJmKS
         N3cdQ5bfkKxk6aSfpwuY3d8ajpdIY+2QqZd6dsZf0LEjNTyFV+MSqW5E8zpKV1kblWIE
         vL3Y1RtiPXvAa2NnT9gi9iizlNC7GuXXXJF4ppmCxWEg0yt8+eQ2l6fufAA1o7k0EH8J
         GpYqTu2oAFiJlsXFh8ZT5tzu1ot0nVZusTWj2GalgXM7kgg0lDYXju3c2JC/nD3wKLLF
         Dm4id9TDWKnfgoHVuF+GQOQj/UBy1C+eoN//nAdYzcPWsZgbF4SFFTBum3QzxhSQzqn5
         L/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J8jX3Estd4eXEE5d3rDwAh42z+mREjTkFoeqoQgEeb0=;
        b=lWpjDVEMSXub3Lr2ugE4XCO7k4EXreh3P0zj8IaJI5rK4XbtCCLH6OQ0LSwb+3llcY
         ZLQ53xoBDsWtZ7XpmDipoRjgJZPZaeR2xFbJLVGrWZ7cSTxgOBdDUne8p8wI/TavnJi4
         HYLCcg3iaShyaOMod3ZByWOHXBFvv5n8B+rafmzttcLYANFEt9eM5d0fooCApXFdT0I1
         kwkJ0ye5/1uPEw3Xj+Ees6FLBkE1KxHXqIE+N4T+me3khcxr3YmAATD7eddnao8ET26I
         yyG+HrrompyhzbRQfbzj4ubxwHPuUug7EaXDd300NpFiHnDEiQwtL3yYr6NWatNiYotO
         vY7g==
X-Gm-Message-State: AJIora/GcfRqdcfq4GXni1PfAWgYT7HQ6R4LBU0pWwkCnXhla+ryQZTI
        EY4SjpQ0dZhT8WaW4wQGfgaQNeCJKITkBQ==
X-Google-Smtp-Source: AGRyM1vuTGQwXg0ppz8MTrRHHXpPLYCTQLIx1P5Ck9+mBKTCVriITFTEaFI5NP4AWYjfbULqmh97xA==
X-Received: by 2002:a05:600c:5129:b0:3a1:92e6:563e with SMTP id o41-20020a05600c512900b003a192e6563emr3298326wms.81.1657281543266;
        Fri, 08 Jul 2022 04:59:03 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id z5-20020adfe545000000b0021b81855c1csm49436474wrm.27.2022.07.08.04.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:59:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Cc:     faizel.kb@dicortech.com, baihaowen@meizu.com,
        bryan.odonoghue@linaro.org
Subject: [PATCH 0/3] tools: usb: testusb: Fix reported gadget speeds
Date:   Fri,  8 Jul 2022 12:58:56 +0100
Message-Id: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

Using the testusb utility on a qcom platform which supports
super-speed-plus I found that "??" was being reported instead of
super speed or super-plus speed.

This is easily solved by aligning the test tool speeds with
include/uapi/linux/usb/ch9.h::enum usb_device_speed{}

Before:
sudo ./testusb -a -t 0
?? speed	/dev/bus/usb/004/027	0
/dev/bus/usb/004/027 test 0,    0.000004 secs

After:
sudo ./testusb -a -t 0
super-plus speed	/dev/bus/usb/004/027	0
/dev/bus/usb/004/027 test 0,    0.000004 secs

Bryan O'Donoghue (3):
  tools: usb: testusb: Add wireless speed reporting
  tools: usb: testusb: Add super speed reporting
  tools: usb: testusb: Add super-plus speed reporting

 tools/usb/testusb.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.36.1

