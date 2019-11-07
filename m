Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D39EDF2F51
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2019 14:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731003AbfKGN33 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 08:29:29 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:38383 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbfKGN33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 08:29:29 -0500
Received: by mail-lf1-f50.google.com with SMTP id q28so1603939lfa.5
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 05:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pd8G3M3XrD3leYMyoIBagiR/JS04UgAH3T/2pCQtJzA=;
        b=VS1GWvhKkSaYfs4LFYU4IGqLrdT/FHgkolYoV9W++S/LytuK5DzRgS++FuaESah88I
         gkjfPGWH1L2A9DXx3wKtCaNrv8/3vyMcgCFV5E+phTYHEy6hDZnXEFImF7V1Z9coN8EG
         b9App7kPDdOEAWuUyLw0WlK/Sh3bLNFGf7C+V25XpnpahNxuyV/7WKdaMvFxMr4Z2EZs
         Bob0wM26x851tJNFykPtQwdm7oUgAu65uT5HpfO8dtwhmqPhMg1rRd3ryV0Bs5EINPnc
         NWZIMscJXf5mRGN9pQYn7v3AmUtEZg7qAcqRFYvvzlKuhrpUjrN0yxWxxgFSXmJ+KGyc
         2iyQ==
X-Gm-Message-State: APjAAAXS3qRo5SRmD0nIS4d2c9/Qet5peJOrtFqJlcVY0weSaKbUqUum
        zFqj2WgtHUIqn8I9JHTVCa8=
X-Google-Smtp-Source: APXvYqy6UvC9giI0pZw5jeNnhxJUB11ptVtKaXSTpQzLi+ZbnAFht1Ufnz3NbPJ0f6Tg2k9Fov0yuQ==
X-Received: by 2002:a05:6512:203:: with SMTP id a3mr2402251lfo.7.1573133365941;
        Thu, 07 Nov 2019 05:29:25 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id b141sm1026388lfg.67.2019.11.07.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 05:29:23 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iShqn-0000dK-4J; Thu, 07 Nov 2019 14:29:25 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 00/11] USB: serial: mos7840: type detection and clean ups
Date:   Thu,  7 Nov 2019 14:28:53 +0100
Message-Id: <20191107132904.2379-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The mos7840 device-type detection is fragile and cannot generally be
relied upon (e.g. as recently reported for Moxa UPort 2210 which was
detected as a four-port device).

The first couple of patches adds support for encoding known chip
features in the device-id table, and documents the underlying
assumptions for the mcs7810-detection hack.

Turns out we have a lot of legacy cruft in this driver, and the
remaining patches rips that out.

Johan


Johan Hovold (11):
  USB: serial: mos7840: clean up device-type handling
  USB: serial: mos7840: document MCS7810 detection hack
  USB: serial: mos7840: fix probe error handling
  USB: serial: mos7840: rip out broken interrupt handling
  USB: serial: mos7840: drop redundant urb context check
  USB: serial: mos7840: drop paranoid port checks
  USB: serial: mos7840: drop paranoid serial checks
  USB: serial: mos7840: drop serial struct accessor
  USB: serial: mos7840: drop port driver data accessors
  USB: serial: mos7840: drop read-urb check
  USB: serial: mos7840: drop port open flag

 drivers/usb/serial/mos7840.c | 770 +++++------------------------------
 1 file changed, 102 insertions(+), 668 deletions(-)

-- 
2.23.0

