Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA2F4C8C70
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 14:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbiCANVb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 08:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbiCANVa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 08:21:30 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91579BB8A
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 05:20:46 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v21so20482756wrv.5
        for <linux-usb@vger.kernel.org>; Tue, 01 Mar 2022 05:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbuAVOFvLWG0mYZFHoEmjUQrGHAY8rjotKrLEcD75BU=;
        b=m+ejchhDr+4fRDiYAYHrEDdVjC1pnyP8CX3mDX4/DCcL0e+dW48/hPcynL/09WpLF0
         XbKIRA+/6/AuBhOucxrrtrfVvJPe51t6sbbaXW0NxRAR212Xw1A7vHztaP6EL36s6Z4T
         lXPxnxUOjshYR4zKkbuMXySXCy7YwBtI/07sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbuAVOFvLWG0mYZFHoEmjUQrGHAY8rjotKrLEcD75BU=;
        b=Sfk2elwe9XAbg+GVAQJTUvGfBgD1eT2VrdaJG3FXvrpc88bbATshTSqNXbJSlKuvXb
         XZiQu5EFOHVWS3mCre/2jZI6yoq8zAFFBfc0GR57tuNyvuGVU/ORTyAxUNS3REGrFcsX
         vD2sFILj4pSfWFMSzcqVizgl8gQSlpsbwvO11m16BbBiHbe3Zjp2XtSc6K5YlffrAun9
         0E4iGLUFRyoBt3wLBY1Kove3HlRPvxIkihA3sYNKNmYHicz8somTt6MFfigVIj0BjYlA
         eQuxRD0MJW8yFHnlJMhZDBZSl/b+Ni6dlsHpi1uE0fMAFAv4/GxKG7oomLCH+cohh4/o
         JvmQ==
X-Gm-Message-State: AOAM532ubQagSgem439FZ5KGYd7Pf8t+HxkuXPqwRAT+h6RuagDZKBJR
        yQOu6JgjiQVGG7vlO2zyVrD0Fw==
X-Google-Smtp-Source: ABdhPJzaAihKnxMuXOx1a0k/SNlzO0PlDemeJo9CuAlBgqoofV5ICbHzLcciJSO5dOJz6iiTHvU5Xg==
X-Received: by 2002:a5d:64cb:0:b0:1ef:d80d:8129 with SMTP id f11-20020a5d64cb000000b001efd80d8129mr6615137wri.21.1646140845456;
        Tue, 01 Mar 2022 05:20:45 -0800 (PST)
Received: from capella.. (80.71.142.18.ipv4.parknet.dk. [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id i12-20020adfe48c000000b001ef6eab4c81sm13258492wrm.96.2022.03.01.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 05:20:44 -0800 (PST)
From:   =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        =?UTF-8?q?=A0ipraga?= <alsi@bang-olufsen.dk>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] usb: typec: add drivers for TUSB320xA and TS5USBA224
Date:   Tue,  1 Mar 2022 14:20:04 +0100
Message-Id: <20220301132010.115258-1-alvin@pqrs.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alvin Šipraga <alsi@bang-olufsen.dk>

This series adds a new typec class driver for the TUSB320xA family of
Type-C port controllers and a typec_mux class driver for the TS5USBA224
switch mux.

This series was bourne out of frustration with the existing extcon
driver for the TUSB320, which did not offer a convenient driver model
for the Audio Accessory mode muxing offered by the TS5USBA224. I found
the typec subsystem to be more suitable.

I have tested this on my i.MX8MM platform with USB OTG support and it
works as desired. However I am not very familiar with this part of the
kernel, so I welcome your critical feedback to this series. Thanks in
advance.


Alvin Šipraga (4):
  dt-bindings: usb: add TUSB320xA Type-C port controller
  dt-bindings: usb: add TS5USBA224 USB/Audio switch mux
  usb: typec: add TUSB320xA driver
  usb: typec: mux: add TS5USBA224 driver

 .../bindings/usb/ti,ts5usba224.yaml           |  56 ++
 .../devicetree/bindings/usb/ti,tusb320xa.yaml |  78 +++
 drivers/usb/typec/Kconfig                     |  12 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/mux/Kconfig                 |  10 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/ts5usba224.c            | 102 ++++
 drivers/usb/typec/tusb320xa.c                 | 517 ++++++++++++++++++
 8 files changed, 777 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,ts5usba224.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,tusb320xa.yaml
 create mode 100644 drivers/usb/typec/mux/ts5usba224.c
 create mode 100644 drivers/usb/typec/tusb320xa.c

-- 
2.35.1

