Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A20AEF76B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 09:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfKEImQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 03:42:16 -0500
Received: from mail-lf1-f53.google.com ([209.85.167.53]:46379 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725806AbfKEImQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:42:16 -0500
Received: by mail-lf1-f53.google.com with SMTP id 19so9280634lft.13
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:42:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hw05ePdq7yTQi83DwqWiRaXs9EGG+0kE5BtsB3c9q0=;
        b=Vkpv7NcEEcugte99t0tq+x6EeP58ZJD1u9FNLmleH4Nf2wsursxrtJWscdntZTEu3f
         cNo7kBXHvHbqLs0yJO05YM3T70L1xJHQuiSbej/kO32CLfGvhdWQ4bNap6+NNEhAEOMV
         /Y/XzSU38CA2cHJQ25yTDuVsxUeU/96oPZJ+WFcZSlsLyf+0r3ZX33B701W+5MnpFwfD
         wS2b5yKeKfzZ2KtGt7lT3YW4Q93XurzKxj9TcWxR7dGJeFSybyjxxeaBEiTgsAl0TXGt
         lkikHTMD3ZJQyJziaNfaJpxFvkLVI4G0cPg/7ztshtMlFpNfBYu4yEW5/6uRlqVBKiVO
         yXYA==
X-Gm-Message-State: APjAAAVLKUeWmesuunyLkT9OBgQ3BxxeApNkrit4kuZIMcPvcrn/DWiX
        5gHRCa03x3fqe9fY85Koh5Tqe1oM
X-Google-Smtp-Source: APXvYqxocEXh/F+9cXLz2dBx6nB6IQEnOHgxlPomJvcLW6ZDDg93SeEom2JUg698fLrSv1KuvFT9pg==
X-Received: by 2002:ac2:5dc1:: with SMTP id x1mr19305233lfq.177.1572943334373;
        Tue, 05 Nov 2019 00:42:14 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r22sm7935893ljk.31.2019.11.05.00.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:42:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPl-0004GW-6U; Tue, 05 Nov 2019 09:42:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 00/14] USB: legousbtower: misc cleanups
Date:   Tue,  5 Nov 2019 09:41:38 +0100
Message-Id: <20191105084152.16322-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here's a bunch of clean ups to the legousbtower driver as a promised
follow up to the earlier set of fixes.

Johan


Johan Hovold (14):
  USB: legousbtower: drop redundant MODULE_LICENSE ifdef
  USB: legousbtower: drop redundant NULL check
  USB: legousbtower: zero driver data at allocation
  USB: legousbtower: drop redundant open_count check
  USB: legousbtower: drop noisy disconnect messages
  USB: legousbtower: drop redundant interrupt-in running flag
  USB: legousbtower: stop interrupt-out URB unconditionally
  USB: legousbtower: remove tower_abort_transfers()
  USB: legousbtower: clean up pointer declarations in driver data
  USB: legousbtower: drop unnecessary packed attributes
  USB: legousbtower: drop redundant endianness comments
  USB: legousbtower: clean up runaway white space
  USB: legousbtower: drop superfluous brackets
  USB: legousbtower: drop superfluous newlines

 drivers/usb/misc/legousbtower.c | 303 +++++++++++++-------------------
 1 file changed, 118 insertions(+), 185 deletions(-)

-- 
2.23.0

