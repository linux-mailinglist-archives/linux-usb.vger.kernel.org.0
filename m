Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75886D1308
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 17:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfJIPiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 11:38:54 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39030 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJIPiy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 11:38:54 -0400
Received: by mail-lf1-f68.google.com with SMTP id 72so2018326lfh.6
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 08:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KNwQuy/qjCD2TjI8KL8/lMEdqtih09iWsjOUr6FCork=;
        b=byIfWUTO2QXgnt0ueM/yARuFkk6xOimyIsXxFDCbunRsUU+TbzLsw1fVcHhbq8NgBJ
         IDnX7ouRDd5ggM5aplClNG0aBpaw27ZAJm116LozD13/8pbS2LPN/g95lbuqOPrqPCjr
         eFSALuvWiYVwbJR4PhJ/FPEGuQy6DaIL5OMRNRHHT9RaznCyprN71jVumDfKQgNjY1o3
         qrEjxO5pk8XIKSYHFoiWOd6QoWOCEzMkd3enbAv1fS3BK71Wrx+PasYSCB2rUlvJCXv5
         4N4A7MmQMczEtg1M+DckTG+bPKBOboqUPep8yyDEuVl/Lk5qx3x7tcbP3UYCRSC84hTx
         Y/fw==
X-Gm-Message-State: APjAAAVMCIumcMzV4wa4MHzCrcHvs5x2fn397uTnP7UyxcVaE9s+ydfu
        NWGEa4KeEqh0kqiAKzEZ44Y=
X-Google-Smtp-Source: APXvYqxkLZxWSSqMSVcIyFCjgnrC//FylPhtRtoQfe/MOo971t+rYSOY6tLOfrMfwlHRMokAQYtb0w==
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr2416630lfm.109.1570635532438;
        Wed, 09 Oct 2019 08:38:52 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id h3sm542764lfc.26.2019.10.09.08.38.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 08:38:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIE3J-0002Go-6o; Wed, 09 Oct 2019 17:39:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Keith Packard <keithp@keithp.com>,
        Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: misc: fix disconnect bugs
Date:   Wed,  9 Oct 2019 17:38:43 +0200
Message-Id: <20191009153848.8664-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a number of issues introduced primarily with the
conversion to dev_err() and dev_dbg(), which failed to notice that the
drivers where using their USB interface and device pointers as
disconnected flags (leading to NULL derefs) and that they did not hold
references to the structures (leading to use-after-free on release()).

I've already fixed up a few of these USB character device drivers
separately, and the uss720 driver has similar bugs that remain to be
fixed.

Johan


Johan Hovold (5):
  USB: adutux: fix use-after-free on release
  USB: chaoskey: fix use-after-free on release
  USB: ldusb: fix NULL-derefs on driver unbind
  USB: legousbtower: fix use-after-free on release
  USB: yurex: fix NULL-derefs on disconnect

 drivers/usb/misc/adutux.c       |  3 ++-
 drivers/usb/misc/chaoskey.c     |  5 +++--
 drivers/usb/misc/ldusb.c        | 24 ++++++++++++------------
 drivers/usb/misc/legousbtower.c |  3 ++-
 drivers/usb/misc/yurex.c        | 11 +++++++----
 5 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.23.0

