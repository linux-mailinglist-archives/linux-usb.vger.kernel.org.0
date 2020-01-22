Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B80DD14524C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 11:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgAVKPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 05:15:52 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39418 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVKPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 05:15:52 -0500
Received: by mail-lj1-f195.google.com with SMTP id o11so5836722ljc.6
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 02:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3ZokUU8aRhircLS9Vyet3E7GDELXUeCMPOQc4N/540=;
        b=lN3CTormZNdcQgRfwcXGVg2QbGzTN5Cw+x4evmXuQXS318GxXv/Yw9ut4gFa7mYcrb
         VxvqSjMAEUXUn8MO2WYXrIS77BbJnBE78vfEcW39mGhW+BQ4tnZ0kMaTp3lX2cNXq8AZ
         c1ww/8s77GqM4LOWwzeV7VCMNLMDkuByV9oXadJACelVKuMHdqHXgW9lIvNmVXr7EdWL
         sE70iLl0aQXXyAMf+Mv41hks+PEC5mtoIxJ54KtwxLIvv4R2oj7wsX7QQJi4EcvN4FZ1
         xtIr2NrYjVtKlsqDcrtVO7aT4BNyVo7H21oEjDefVRD/vFrvsslkNCkKq3iJzqYsm5L6
         5FNw==
X-Gm-Message-State: APjAAAVottrKV+bWFyFnDJjUbuvfOoksSWgNA9H8mcRXdT/k2j0/8o6A
        uUuJUoL3W5ja7jAu73zA7l080Ypv
X-Google-Smtp-Source: APXvYqz1gdZWXl24DOnNokdfO4TXxhzqM59n+tZEPawm/4x4ULuWLKxpsvfxQyZnSDoYyKr22yjXmQ==
X-Received: by 2002:a2e:86c4:: with SMTP id n4mr18865984ljj.97.1579688150721;
        Wed, 22 Jan 2020 02:15:50 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id m16sm20105489ljb.47.2020.01.22.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 02:15:50 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iuD34-0007bR-2u; Wed, 22 Jan 2020 11:15:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/5] USB: serial: ir-usb fixes and cleanups
Date:   Wed, 22 Jan 2020 11:15:25 +0100
Message-Id: <20200122101530.29176-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes a possible NULL-pointer dereference due to a missing
endpoint sanity check, as well as two long-standing regressions in the
ir-usb driver.

The last two patches clean up the set_termios() and switches to rely on
the relatively new feature to let USB serial core to verify the required
endpoints.

Johan


Johan Hovold (5):
  USB: serial: ir-usb: add missing endpoint sanity check
  USB: serial: ir-usb: fix link-speed handling
  USB: serial: ir-usb: fix IrLAP framing
  USB: serial: ir-usb: make set_termios synchronous
  USB: serial: ir-usb: simplify endpoint check

 drivers/usb/serial/ir-usb.c | 185 ++++++++++++++++++++++--------------
 include/linux/usb/irda.h    |  13 ++-
 2 files changed, 126 insertions(+), 72 deletions(-)

-- 
2.24.1

