Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B41D272675
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbgIUOAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:00:08 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46585 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbgIUOAF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:00:05 -0400
Received: by mail-lf1-f66.google.com with SMTP id b22so14088356lfs.13
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OI2cnB/a4/t0sodHBTZ/TB95ZqeNGflX+6nW0RfeM84=;
        b=hNrOR6Btc6T12/AUlYKw+gYrmVz6o7y6RGdnO7rEYqIVN8f6uvdgqSX5HE9gLy2WY5
         lRPYuSKdZYPswfMZpWmy2qkM2quZiD/Z3TW8mKEdTbTHCWZJM0Fu+za7lBEgBK26jNIA
         MsiBUrjx6FIwi+KMrOXnYvHtsQCgr8wWEpEC52TEsnZfDS0OYH//8onbjGPGM78yFfPC
         uU/ScPlSWDd6UyJIhD2KAEkqFi6SrfvW4FBOeqGvqaPeGdW68wPm8AvNUNcv0+4PlRTv
         7YAHO5KwIaSJMmO7edQUpitO8cfOkQ3+Y3hnNUMBOa0NHepEQPh3vCWAE7UDkF1RQADu
         Bjqg==
X-Gm-Message-State: AOAM5321a12MIO839CdhGTvFjfRF0/w1GY09Sv3eKRbd4P2BqYcaIhlz
        tswqrSZQCTEQCzz0MgZ6St8=
X-Google-Smtp-Source: ABdhPJyUqpmCz6hnLUclnkzZ8IQOzjT1k/4IlrEA+RKkWtGKXa1orHt28U/Bw1mBaUFwnIAQyQLQ9w==
X-Received: by 2002:a05:6512:10d1:: with SMTP id k17mr36495lfg.179.1600696803401;
        Mon, 21 Sep 2020 07:00:03 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id q6sm2780682lji.0.2020.09.21.07.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:00:01 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKMME-0006Gl-6J; Mon, 21 Sep 2020 15:59:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
Date:   Mon, 21 Sep 2020 15:59:47 +0200
Message-Id: <20200921135951.24045-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series adds support for handling broken union descriptors by
falling back to "combined-interface" probing.

The first patch drops some bogus altsetting sanity checks which would
otherwise have had to be needlessly reproduced for consistency. The
third patch drops the driver specific data class define in favour of the
common one. The last one, cleans up the no-union-descriptor handling by
probing for a "combined-interface" before falling back to the
call-management descriptor.

Note that I changed my mind on the stable tag; we can't be overly
paranoid about a theoretical risk of breaking some quirky devices. And
if we do, we still want to know about it, right?

Daniel, would you mind giving these a spin as well?

Johan

v2
 - add stable tag to 2/2 as it enables a new class of devices
 - demote a broken-union warning to dev_dbg
 - replace the fourth RFC patch with a clean up of the
   no-union-descriptor case only


Johan Hovold (4):
  Revert "cdc-acm: hardening against malicious devices"
  USB: cdc-acm: handle broken union descriptors
  USB: cdc-acm: use common data-class define
  USB: cdc-acm: clean up no-union-descriptor handling

 drivers/usb/class/cdc-acm.c | 55 ++++++++++++++++---------------------
 drivers/usb/class/cdc-acm.h | 13 ++++-----
 2 files changed, 29 insertions(+), 39 deletions(-)

-- 
2.26.2

