Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA2B10E740
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 09:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfLBI42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 03:56:28 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40083 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfLBI42 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 03:56:28 -0500
Received: by mail-lj1-f194.google.com with SMTP id s22so20056848ljs.7;
        Mon, 02 Dec 2019 00:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WPYFSc6bUgUoA1SV431/QgB8DmyOsppkbdFxHRHEutk=;
        b=K7eFWvyK+bAwwIp/M7Sf8c9iRwtRwAQHl6rt2/nDAeVlPIChNvR1qQ2c24dBvzgGus
         +VK8rvx8SxzJsnReLvLRmUwGjPr6MeBwqxTwC9A7J9vlRtmKlNZSN18wB1EQrGUZ+jYw
         UaMcmtsxxzLNwtNcAkA0FN/iymW5iPmhUotGx6YgWUgpLftYHH242KJd1osDgb2KMlSG
         omA06O2lAIzJ9sMY5UZOfjAR5uC6skYBlroxcTv7Iad/VvYqw2PRLI3xxykTOubuUvsM
         P7I3xgqKzuF0oq5L1icdv1esfH17Nu2KA7gCp3/D7xcyM10jfwKzBd3oTHC2BIosJOlx
         +Tig==
X-Gm-Message-State: APjAAAXHDZUcs8cTbol/YB8vykY0dBhpMUfsRY7dUwwIOTVvaCcQBY8f
        /MnvnDGaV6PpoKX2zA8wZ9k=
X-Google-Smtp-Source: APXvYqwcRugcBTfOjDPDPXkeFWaQEM0kotdWM7j0SIiphXnBunGVqGv1pQ+2Y0C3+eqgpWqj2uIkzQ==
X-Received: by 2002:a2e:8e97:: with SMTP id z23mr1641215ljk.125.1575276984811;
        Mon, 02 Dec 2019 00:56:24 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id l7sm3477674lfc.80.2019.12.02.00.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 00:56:24 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1ibhVL-0003Jx-RD; Mon, 02 Dec 2019 09:56:27 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/3] staging: gigaset: fix crashes on probe
Date:   Mon,  2 Dec 2019 09:56:07 +0100
Message-Id: <20191202085610.12719-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Syzbot has been reporting a GPF on probe in the gigaset ISDN driver,
which have since been moved to staging.

The first patch fixes that issue, and the next one fixes a second crash
found during testing.

The third patch addresses a benign warning in USB core which syzbot is
bound to report once the crashes have been fixed.

Johan


Changes in v2
 - use usb_endpoint_is_bulk_out() and friends in patch 3/3, and drop
   patch 4/4 which only renamed an identifier.


Johan Hovold (3):
  staging: gigaset: fix general protection fault on probe
  staging: gigaset: fix illegal free on probe errors
  staging: gigaset: add endpoint-type sanity check

 drivers/staging/isdn/gigaset/usb-gigaset.c | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.24.0

