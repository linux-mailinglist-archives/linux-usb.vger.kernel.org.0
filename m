Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8223588309
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 22:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiHBUQL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 16:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiHBUQJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 16:16:09 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4295D186E4
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 13:16:08 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pm17so9048954pjb.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Aug 2022 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=2Ra8Z84FGiy+WxWESz00m+pAyXWLLHoUcteZqKqQVeQ=;
        b=QNIGy+vx1z5bbrFce3ejE7J+p5w419nQycC6VBys146sIuWA9+2Q/SxR15+OoVBJ7u
         eVdeJ5BRBbYNJ1oMXuwK7ItVg3nM4k6dLbiE2pw1d/EDvI6zWRQcAPDiwNKBwpAREw+F
         k74zd9mYKzqSMuyGEUf8TrxytiEyihtScBMXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=2Ra8Z84FGiy+WxWESz00m+pAyXWLLHoUcteZqKqQVeQ=;
        b=MIpgL93jfrey5pxJ8xIq7hzBZM4zmwyOUu50hdqFlXnnVy/CiI28zie1EBaFk9u+YK
         R2fdKwRkcOu5yNeUlVgCYrfTr24FqDiCR0Yi4D7HdMYpy7P01UGWCLqBDd9xTHJNkn3F
         b1JfN84RbRZiu+TaOckt4lSgeFFUjUmcwCiVr08mWUBLkSU2f6lclY7e/9BDs2/ERU3n
         Jom+V9y4PyxTXXunreYxMLnOqHtXR0vseOAW3DEFM+h90IJLQlGm0EGzYFCIUob77w5f
         N654nyPKUtgfPeHAUN0vJaYhd2e2oxJvgYlW9h33u/Emj2e3Y7dBeliBB2bJdhZI5dzt
         lugA==
X-Gm-Message-State: ACgBeo1+WdiTih1RSJij4tjj7HhfALjGmj3LLcdsW8pKf8QSawqz+Yxd
        48cND+gXhKoFPVLEK63XE2OmkhyB+raiGw==
X-Google-Smtp-Source: AA6agR48+4BlazoQelyJzBpk3hRX4cYNy52/1dxW3jP/E7tQakkcT9LaTbOh7tK2MRemv/M8z7eGRQ==
X-Received: by 2002:a17:902:f78b:b0:168:faff:d6a5 with SMTP id q11-20020a170902f78b00b00168faffd6a5mr22691375pln.76.1659471367735;
        Tue, 02 Aug 2022 13:16:07 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
        by smtp.gmail.com with ESMTPSA id w18-20020a170902a71200b0016ee26224a4sm80863plq.305.2022.08.02.13.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 13:16:07 -0700 (PDT)
From:   Suniel Mahesh <sunil@amarulasolutions.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Zachary Holland <Zachary.Holland@biamp.com>,
        Daniel McLean <Daniel.McLean@biamp.com>,
        Rene Samson Ambrose <renesamson.ambrose@biamp.com>,
        David Sands <David.Sands@biamp.com>
Cc:     linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
        USB list <linux-usb@vger.kernel.org>
Subject: [RFC v2 0/2] Extend functionality for GET_REPORT
Date:   Wed,  3 Aug 2022 01:45:54 +0530
Message-Id: <20220802201556.1510069-1-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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

This series does the following:

patch 1/2 extends functionality for GET_REPORT.

The current kernel implementation for GET_REPORT is that the kernel
sends back a zero filled report (of length == report_length), when
the Host request's a particular report from the device/gadget.

This changeset extends functionality for GET_REPORT by sending a
particular report based on report type and report number.

patch 2/2 adds a test application to test the extended
functionality.

please review and share your thoughts.

version 1 patches:
https://lore.kernel.org/lkml/20220801123010.2984864-1-sunil@amarulasolutions.com/

Suniel Mahesh (2):
  usb: gadget: f_hid: Extend functionality for GET_REPORT mode
  HID: ghid: add example program for GET_REPORT
---
Changes for v2:
- patch 2/2 got changed. 

 drivers/usb/gadget/function/f_hid.c  | 184 ++++++++++++++++++++++++++-
 include/{ => uapi}/linux/usb/g_hid.h |  10 ++
 samples/Kconfig                      |  10 ++
 samples/Makefile                     |   1 +
 samples/ghid/Makefile                |   4 +
 samples/ghid/test-hid.c              | 134 +++++++++++++++++++
 6 files changed, 341 insertions(+), 2 deletions(-)
 rename include/{ => uapi}/linux/usb/g_hid.h (72%)
 create mode 100644 samples/ghid/Makefile
 create mode 100644 samples/ghid/test-hid.c

-- 
2.25.1

