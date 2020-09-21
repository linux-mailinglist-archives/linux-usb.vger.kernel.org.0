Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E5A2722A3
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgIULgU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:36:20 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34905 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbgIULgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:36:20 -0400
Received: by mail-lj1-f196.google.com with SMTP id a15so10786283ljk.2
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z9kvcwkdOTpmtJhgDB/7kzE53Gqe9GAyKSDocCC4uiU=;
        b=Bu315simnE/psNBgulb8CEwRurpRlWlQgyN+0fkocK/RRqveOR36GFGcVbs4hgWIUD
         fLgSKjyxH5KdWC3+QKuwSriDJmWwhQNFQpW/tMAkngBq3ZPHIBXUDNx+44a1PfOFnVOQ
         1bTxQXHNPbrtGGN9qDNgzzs5mJqs9xRGhKVTuvidissDJhXeBABixdNifBDhPigh2rbp
         94h3vVLh8y7/Fm442TU2IE8yve/C9EE+RnAVgQ+ZV/s6PUgvxRjc+2HuoPfb9OUXL/ed
         0cPv7LHti9EuS3uAp1O+Sqd7W/FcGfsxr0JF9s3QNJT9NDjkw/t7nesE1urkv6GXexqo
         aT1A==
X-Gm-Message-State: AOAM532s+K4NW667ajLQUOe+UJtb8hG/6HMUB/DckvfJCYkuWCC2OsUS
        QrQeMuSgxUrjGWnVU16Y0l8=
X-Google-Smtp-Source: ABdhPJxcEO5tzjbrhi77N0q3es2h8Zbrpo5Zr6BYNTzR7i8HFPbOEPGSzqvzMvwsWVv/10absIM8tg==
X-Received: by 2002:a2e:9ccd:: with SMTP id g13mr16531337ljj.29.1600688178016;
        Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a25sm2480558lfi.267.2020.09.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:36:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKK79-0008O8-0a; Mon, 21 Sep 2020 13:36:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] USB: cdc-acm: handle broken union descriptors
Date:   Mon, 21 Sep 2020 13:35:21 +0200
Message-Id: <20200921113525.32187-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series adds support for handle broken union descriptors by falling
back to "combined-interface" probing.

The first patch drops some bogus altsetting sanity checks which would
otherwise have had to be needlessly reproduced for consistency. The
final patch drops the driver specific data class define in favour of the
common one.

I'm not adding a CC stable tag since this is technically a new feature
even if it enables a class of radio-scanner devices. I guess we can
consider backporting once this gets some more testing though.

Note that I also included a fourth RFC patch implementing an alternative
approach which could replace the second patch entirely. Depending on the
feedback on that, there may be a v2 of the series.

Johan


Johan Hovold (4):
  Revert "cdc-acm: hardening against malicious devices"
  USB: cdc-acm: handle broken union descriptors
  USB: cdc-acm: use common data-class define
  USB: cdc-acm: clean up handling of quirky devices

 drivers/usb/class/cdc-acm.c | 43 +++++++++++--------------------------
 drivers/usb/class/cdc-acm.h | 13 +++++------
 2 files changed, 18 insertions(+), 38 deletions(-)

-- 
2.26.2

