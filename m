Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BAC9218804
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 14:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgGHMuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 08:50:21 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:42309 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgGHMuT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 08:50:19 -0400
Received: by mail-lj1-f170.google.com with SMTP id h22so46935015lji.9
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 05:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s6Gz3TpQ0tG73sH39lJ+ZODk0JbbnI6qT3+W+evmRBY=;
        b=hC4nZNaTtWNF20rsXeAcjGegPxaqcuKoOTgsUdDhLZiX+eS18OQylXw2+RDytEatZV
         /p4yOSYZ1XbAvnM6Wl49JnCQxGiUzKGlanVf5Vi6IHcCOvznNp2d6AZZ6calHn5iE4SI
         lX8vGRV3okaA9czByTGj1dpz9WquIAQC7Kycq3iEdVD7KRZle22nWk9cRb7AwFSl0C35
         4EjWytHAJGkKCkH0vnN8dPcD7eQd5cZPHrji9P8NYLdXiCiMVK+SPEEbGve9FDbHs4nK
         tzK6sojlpUIFG5ZqqS/RD0doQ+tv83LMgjqRaHky6NnH9uDlnvW7qHLSW3AimVlJpygn
         2JhQ==
X-Gm-Message-State: AOAM5317OCK3F4iZjk1lvqKrDFoYJcM0U8m8/7S1XHKLUJpG4CFTxxGf
        3FdGA8nG0LFRAFtTMZaVuJVpExF0Vnw=
X-Google-Smtp-Source: ABdhPJy5ZNRhgwDH/VxSBmq+KGBn3aSue68zC64X6KPBxzsmBW8K57C/IMDqsMCyHMoyMbNREuD0AA==
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr18028772ljm.296.1594212617258;
        Wed, 08 Jul 2020 05:50:17 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y1sm896416lji.5.2020.07.08.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 05:50:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1jt9Wf-00045T-Sm; Wed, 08 Jul 2020 14:50:13 +0200
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>
Subject: [PATCH 00/10] USB: serial: break and sysrq fixes and cleanups
Date:   Wed,  8 Jul 2020 14:49:50 +0200
Message-Id: <20200708125000.15659-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes the break and sysrq handling in the ftdi driver (which
have never really worked) and optimises the sysrq handling somewhat.

Included are also some related clean ups.

Johan


Johan Hovold (10):
  USB: serial: ftdi_sio: make process-packet buffer unsigned
  USB: serial: ftdi_sio: clean up receive processing
  USB: serial: ftdi_sio: fix break and sysrq handling
  USB: serial: only set sysrq timestamp for consoles
  USB: serial: only process sysrq when enabled
  USB: serial: inline sysrq dummy function
  USB: serial: add sysrq break-handler dummy
  USB: serial: drop unnecessary sysrq include
  USB: serial: drop extern keyword from function declarations
  USB: serial: drop redundant transfer-buffer casts

 drivers/usb/serial/aircable.c |  2 +-
 drivers/usb/serial/f81232.c   |  4 +-
 drivers/usb/serial/f81534.c   |  2 +-
 drivers/usb/serial/ftdi_sio.c | 59 +++++++++++++---------
 drivers/usb/serial/generic.c  | 22 ++++----
 drivers/usb/serial/mxuport.c  |  6 +--
 drivers/usb/serial/option.c   |  3 +-
 drivers/usb/serial/pl2303.c   |  2 +-
 drivers/usb/serial/sierra.c   |  3 +-
 drivers/usb/serial/ssu100.c   |  7 +--
 include/linux/usb/serial.h    | 95 ++++++++++++++++++-----------------
 11 files changed, 107 insertions(+), 98 deletions(-)

-- 
2.26.2

