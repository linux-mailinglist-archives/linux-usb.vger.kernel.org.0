Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3995CBEE25
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 11:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbfIZJMt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 05:12:49 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34322 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIZJMt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Sep 2019 05:12:49 -0400
Received: by mail-lf1-f67.google.com with SMTP id r22so1142275lfm.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Sep 2019 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=86zRUVfrv1gM2heltfetGcfT+aUYDu+euELROz6td7U=;
        b=gMaWk1GvBUWgoYI6Yjg1vpvld9zgCaIh+mVWhrr8QpPrJqGEuNDZcMKU5peApkpEh1
         TiodHnZ/EfMkXpZuSfr1dOK0YWetDjelk4oOATOutmKswHIiB4EMx7uW8lsYZj0jiZCt
         AyPpxsZFf3VCPqRp1623CG1oUs5u2zL4ZQafhR5MHi+Rnbkj7qGtojE9JMzyIdV+IkGK
         SQAR5VgrzFLY3JyL8tRyE4cbdMZQdjrUP6hOnpD8GrUACB3VKCSXt9/nNhwjZL/VF2zL
         ha+nCvImKIEdRzaC8nqfKJcJW2ItvgnzWeq4KOBMils9iNvYW7yTWWYTM1MpBxNb9lz/
         g0UA==
X-Gm-Message-State: APjAAAUNQCzx0fSrf+Cv9aJtRCYkj0XcYsDJYCKjsIeZm4xb2T9sWu/Y
        2auDgOo5Av62Zt0x+9uRfvIu9SQi
X-Google-Smtp-Source: APXvYqzAOIghS/STMlMLy1e3AXwHMH1hUTLl/WMh46o35BnARMLebIINWKKLWRZLrpJrE1vGoU8LLA==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr1511061lfp.1.1569489165575;
        Thu, 26 Sep 2019 02:12:45 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id p86sm365343lja.100.2019.09.26.02.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 02:12:43 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iDPpQ-0006QO-Vd; Thu, 26 Sep 2019 11:12:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: usblcd: disconnect fix and locking clean ups
Date:   Thu, 26 Sep 2019 11:12:19 +0200
Message-Id: <20190926091228.24634-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a failure to stop I/O on disconnect() in the usblcd
driver. Turns out there was a lot of legacy cruft in this driver which
could simply be removed.

The first patch is marked for stable and could go into v5.4 while the
rest is v5.5 material. Posting all at once for completeness.

I was tempted to rip out the custom ioctls() used to retrieve the driver
version and bcdDevice (sic!), but decided to leave them in. I doubt
anyone would miss them though so perhaps we should give it a go?

Tested using a mockup device.

Johan


Johan Hovold (4):
  USB: usblcd: fix I/O after disconnect
  USB: usblcd: drop redundant disconnect mutex
  USB: usblcd: drop redundant lcd mutex
  USB: usblcd: use pr_err()

 drivers/usb/misc/usblcd.c | 60 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 27 deletions(-)

-- 
2.23.0

