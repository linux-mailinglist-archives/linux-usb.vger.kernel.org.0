Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91FBE660194
	for <lists+linux-usb@lfdr.de>; Fri,  6 Jan 2023 14:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbjAFNxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Jan 2023 08:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbjAFNxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Jan 2023 08:53:50 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B424777DA
        for <linux-usb@vger.kernel.org>; Fri,  6 Jan 2023 05:53:48 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bk16so1310672wrb.11
        for <linux-usb@vger.kernel.org>; Fri, 06 Jan 2023 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WNMsx5q6cRvPII41LbEPP4xqVdTisRzp480tWzGjdk=;
        b=KHT5msff5tEKeojSXkM0K6w3V8PAPFm7IMYeBwR6ETayrfQO/2+r1O9h4w+/frXhcg
         c9GcVdMYS+LExqtN/j5+uhsi9IyuCbxjc4Nj+yWh/+GJl77TUFo4cNMvMMWVXaltEOzd
         3odiiRn4wuC+uv167YAEeE8oSKHEvJ3qy9+MUCYh4IE/1k4od4+qXd8X8+8K4rBh5UfL
         AgoNtZruktlnYza7yDxZeHZOzZ+Odd9ig57t1kljMdOtzTG0zkN3paj3koYv0wfbQeHP
         O/O+ltlc/pP3LGBg5nokQf+eHQszlJBycYlXpcStaus42QsPpkfcqcH1zgGKE+I9Y9fx
         Vz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WNMsx5q6cRvPII41LbEPP4xqVdTisRzp480tWzGjdk=;
        b=fFigQ0NuGXDosmGgE8zx8AKdMpv68DeIu7YCxDm3pnWT09VG43uc/FNk02OYih4Uw/
         nzqgRTQJfc85owf6qFKf425jUG76bBd8yRjn3uFTVIYotFSDFmgbTCX6nGrQqEi8dWk7
         EDrpO7znwiI5zv1Kakn48N0BUNxnvsQ/AOvee75s1tyLmPmO54njqRRLa2n1NOORYZdt
         cv8r9jyVSdQ3D1UcqOjcPioy+wd//LtQpDy1ovI49J0zuGEXj+23LSWhtDh+z7ewxTGE
         KHoTi7u2ZhJCYorO86DptnsTJ3pPiqzOAPUM/hsL2ithSx2UQv0CkaD9RAiE5pJqg+8j
         5/3A==
X-Gm-Message-State: AFqh2koHvCAgPTe1tfud+e6aedeTKIJ7So6eZ2mH2YaderKudiMr2CbF
        wEn9Q+GDM406OaJPd3w4BAe+Ng==
X-Google-Smtp-Source: AMrXdXsyM+9RmdZJ7yzacmsIWdZyXH+McvFTvkZxqAv6vY+2rEeM0PeH7jx7DxXNcuDx8N2rFH9hVw==
X-Received: by 2002:adf:ec87:0:b0:297:1b3e:7087 with SMTP id z7-20020adfec87000000b002971b3e7087mr12017251wrn.37.1673013226873;
        Fri, 06 Jan 2023 05:53:46 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id m7-20020adffe47000000b002b880b6ef19sm1191623wrs.66.2023.01.06.05.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 05:53:46 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v5 0/2] usb: serial: add support for CH348
Date:   Fri,  6 Jan 2023 13:53:36 +0000
Message-Id: <20230106135338.643951-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello

The CH348 is an octo serial to USB adapter.
The following patch adds a driver for supporting it.
Since there is no public datasheet, unfortunatly it remains some magic values.

It was tested with a large range of baud from 1200 to 1500000 and used with
success in one of our kernel CI testlab.

Regards

Changes since v1:
- use a data structure for encoding/decoding messages.
- check if needed endpoints exists
- fix URB leak in ch348_allocate_status_read error case
- test for maximum baud rate as stated by datasheet

Changes since v2:
- specify ch348_rxbuf data length
- Use correct speed_t dwDTERate instead of __le32
- test for maximum baud rate supported according to datasheet
- Use a define for CH348_TX_HDRSIZE

Changes since v3
- Fixed all reported problem from https://lore.kernel.org/lkml/Y5NDwEakGJbmB6+b@Red/T/#mb6234d0427cfdabf412190565e215995a41482dd
  Mostly reworked the endpoint mux to be the same than mx_uport

Changes since v4:
- The V4 was sent against stable and next have ch348_set_termios ktermios
  parameter const that I forgot to change


Corentin Labbe (2):
  usb: serial: add support for CH348
  usb: serial: add myself as maintainer of CH348

 MAINTAINERS                 |   5 +
 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 660 ++++++++++++++++++++++++++++++++++++
 4 files changed, 675 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.38.2

