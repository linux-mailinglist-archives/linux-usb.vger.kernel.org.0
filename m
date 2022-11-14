Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D31E627674
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 08:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbiKNHhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 02:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbiKNHhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 02:37:51 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E896A19E
        for <linux-usb@vger.kernel.org>; Sun, 13 Nov 2022 23:37:49 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id w14so16491624wru.8
        for <linux-usb@vger.kernel.org>; Sun, 13 Nov 2022 23:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+v1xeFroLEZ2pPLWd3Trc4JUUcj9sZhHuuFgi+e21Mw=;
        b=QCYJSmxG90jy4NieQkayH0lG0lScaEdWQyhiRCp8N7qfAMSGsgfQ8iBhqOZ6SBmNfi
         JU78vKU+n8si93XORHoJlj+IyS35XgorRvB9drP9/ljOAHVajtonHoOx46PTsdMWWw33
         u2UKx60i/0aIxiFFMhJvNmoVlCYYXZsYuM9f6gda6+ciPJt+HYMz3ugKdoAimwOAU4wZ
         elYJNaqU0EPk/jIb4FxDRNX/MiO7SzynHuwuKawRWmHxjUJMfc1GtH2YkATz0O0EzaP6
         RDZl0oTFY3l/VEsL07ZaQ4Ugwqh6d48eFkJmTHCh0OoIxpwwUnUJHvusF1I7zlY/cEo6
         Qc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v1xeFroLEZ2pPLWd3Trc4JUUcj9sZhHuuFgi+e21Mw=;
        b=tG+VQImAQzjQQwMBhsCSpuvvhD6QYcEzR+Np6t45HhGUvtP/4aKkqI251k4JG4TfI8
         eqxktGyYCQP+OBXW39sY2uVluAm9xuzmMGYG+t4IBuXU8HdCZk+AhyXvLelVNkL30TOj
         bPblrWvx6rNmx3cMNO5+G/WK8RaF2mbqy/7cQ8OlMVtaVXfGT3hha1VJhCpIcWG1eIak
         qlBfQu42epi+UVb7cza9nGTB+a7NUnbgrU2B/sz3v82PINxOYJUtpJzGbX40gpqNn0Mq
         jyhloP2x9zHMyKQ5dElt3tmiBokOPsXuQ9Pb33JKNScdA8NJF7USgOqjQ7cd5UA4LC2e
         wIvQ==
X-Gm-Message-State: ANoB5pmvglrs65LcckTyD8iWtk6BBQta92BXnTXsRgYroNIXWmINinsr
        T8K/NqyTu+EW44nLCiJ6tXyBGw==
X-Google-Smtp-Source: AA0mqf5NqsKh/vcuUJFt2MRTYucERtlYxCAdolorEZtoSJ0reSjA8C0sNOAzq3eciyj5DEt5Kug7eg==
X-Received: by 2002:adf:9bcf:0:b0:22e:5d66:dc5d with SMTP id e15-20020adf9bcf000000b0022e5d66dc5dmr6633491wrc.175.1668411468143;
        Sun, 13 Nov 2022 23:37:48 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h11-20020a05600c314b00b003b4fe03c881sm18467775wmo.48.2022.11.13.23.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 23:37:47 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 0/2] usb: serial: add support for CH348
Date:   Mon, 14 Nov 2022 07:37:34 +0000
Message-Id: <20221114073736.672194-1-clabbe@baylibre.com>
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

Corentin Labbe (2):
  usb: serial: add support for CH348
  usb: serial: add myself as maintainer of CH348

 MAINTAINERS                 |   5 +
 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 739 ++++++++++++++++++++++++++++++++++++
 4 files changed, 754 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.37.4

