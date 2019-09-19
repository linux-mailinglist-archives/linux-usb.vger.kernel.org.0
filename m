Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCC2B7521
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2019 10:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388258AbfISIay (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Sep 2019 04:30:54 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34234 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730705AbfISIax (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Sep 2019 04:30:53 -0400
Received: by mail-lj1-f196.google.com with SMTP id j19so1193003lja.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2019 01:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yvexylv+UKpEe8B3SYts7DqOF4DTQrUEjLunzxOA+Jg=;
        b=AyqgfjpUEysLBRqGxYaTldWV4yttchCkb/eoatc26ikSTOopyM8tLlH7aZ3SelnWch
         wiJzDOAHyMYt0xDwH+gnxtrMxsF0PJukOxiQCXWRjv2uXc7x4Do7el8w0JgbSmLjLO6h
         C8aqt8dlPL/bTp8Y2PoP5I3A//MbjnbXlbS+UuzYhJ91Wn9vQGqvBAzkKlksBQvLOGG6
         dPEkzpj+8pWEGOax6GBtt4iNz5wuaoB5QM3Ne4sZL0IUGl6fy66AKPK/DbKrfN0wXSbh
         ngijLwpwwPC5hbuuxtgAkb6L4QvUAIsoT++TxsFLzSxS94hkTTwEQf/xX/ZFsZ4o/VQA
         jNHA==
X-Gm-Message-State: APjAAAUw9HUEsm5xw5A2nGdGIaHkw63sCDqtxAgvKew3wUAP7FnKqBjz
        aNlNte/uvBcgf2Sz/P/qIQo=
X-Google-Smtp-Source: APXvYqw4LCF2/WTuJ84G2A9CX366gTGITQg09eukGJxpsV1xn1qK5KDjjqe0QfFlPz7EslvCv+Uhdw==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr4638675ljc.237.1568881851887;
        Thu, 19 Sep 2019 01:30:51 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id m17sm1703821lje.0.2019.09.19.01.30.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 01:30:50 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iArpx-000839-HL; Thu, 19 Sep 2019 10:30:49 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH RESEND 0/4] USB: legousbtower: misc fixes
Date:   Thu, 19 Sep 2019 10:30:35 +0200
Message-Id: <20190919083039.30898-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Resend with Juergen on CC ]

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

