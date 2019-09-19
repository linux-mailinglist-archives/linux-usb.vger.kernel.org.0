Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0878CB74F7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 10:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387785AbfISISm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 04:18:42 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33917 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731373AbfISISl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 04:18:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id j19so1157575lja.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 01:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MgI5S+05DIWI8umTRTDa8khd6auACJlX0yQxdc49Xs=;
        b=BXT1OdsUu4biZSYmPqhE5aQEDy5VQId7GB8Iw8YHKy4hJlbf08m1MTUhydGALrgLEn
         F+8dZFY88nnwXEbSEublx1+D9lHGB2ht8+86nekIAjszn83tGyev/A8xrrHAF2ltnCxt
         mTu9unI/TIEn2wwfbUBw4rhTzcF7SefY6Y1Is8qehwJDTBXbMWDcpe0i6KFNl0W0Cvlj
         xQE/TlqVc+iKKOLfxmOqh6mOGuEfbuMMn1b0D1Lywl6UZv3KWtSwnT24JQzxi02Xria7
         Z/uAfT2uGOpeRbpkoOhWVK7aor/qIGpeQVtMp0pHnJb7Og1tKyyBwk7KatbG22d1HdCl
         9RHw==
X-Gm-Message-State: APjAAAUvSokt9xp4dfSU7V6IbKIU1OcNmlyklfiUI6U3MAHA1HRA0c9r
        +39pxTWjDFiaAQ8gA5sNkKc=
X-Google-Smtp-Source: APXvYqwzb13g1xUW6vu7xOwtJb5fnSE+N8uolZ7I90S6OU7uWQW1Kyxg41F+W5B/Cvgj41heLSl5RQ==
X-Received: by 2002:a2e:9145:: with SMTP id q5mr4619449ljg.76.1568881117876;
        Thu, 19 Sep 2019 01:18:37 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id u21sm1506401lje.92.2019.09.19.01.18.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 01:18:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iAre8-0007vV-I5; Thu, 19 Sep 2019 10:18:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: legousbtower: misc fixes
Date:   Thu, 19 Sep 2019 10:18:11 +0200
Message-Id: <20190919081815.30422-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a few issues found in the legousbtower driver. The
potential deadlock issue was reported by syzbot, and the rest was found
through inspection.

I have bunch of clean ups for this driver as well that I'll post once
these are in Linus's tree.

Johan


Johan Hovold (4):
  USB: legousbtower: fix slab info leak at probe
  USB: legousbtower: fix deadlock on disconnect
  USB: legousbtower: fix potential NULL-deref on disconnect
  USB: legousbtower: fix open after failed reset request

 drivers/usb/misc/legousbtower.c | 55 ++++++++++++++-------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

-- 
2.23.0

