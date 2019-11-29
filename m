Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6EB10D3DE
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 11:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfK2KT5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Nov 2019 05:19:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36984 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfK2KT5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Nov 2019 05:19:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so4025657lja.4;
        Fri, 29 Nov 2019 02:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nkz44mhoHDVLzUp+/+JjQSxpcp30cfW8CdRZ0pMQCHA=;
        b=FieVe25/4Ws5qJ+3ptkYc7nMaoQsP5Q+EHa1xK1iA815yzyw/M6CGvxejDndfwEiYk
         srxUm9Pk2tRJgkxvl+cUxALeQUiWkvwc1WfHKF9hPEnn55vodw0vkLR6xUSDcuBTnBPx
         Rlv+ux6GSHq/y6cirnRws3GJpDJYHQ7b9Y0kmVBrBDq7P2zf2MKPde6hcstElFdkQYoK
         w8cTSWoLltlm/Ev+yhB9wWqoVSiIXmHaxrVvLuFl0TtSP+Mj9bVy6mNSfL3ZEy5tWT9J
         952DyobzrMmajiKZhLOuAV4PYDYhvgDqlopR5DOK2/y+tdMDrjCecqxIQyDU4hf/vZqY
         k7XQ==
X-Gm-Message-State: APjAAAVzIYsm2M990YYM3NjkyC0nyzfJgVPfkFTy+DHH1S9H2sAd0UIr
        f/WYkyA6fk03T4Dr2pSoh1E=
X-Google-Smtp-Source: APXvYqxAfvdzr+rRXM1jO65af/PU54ixUlxEaF5CH6lMjYgGG/YUfbUODMZ7BHGj1brVNpUmRRyjAQ==
X-Received: by 2002:a2e:88c4:: with SMTP id a4mr56115ljk.174.1575022794828;
        Fri, 29 Nov 2019 02:19:54 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id a9sm5432369lfi.50.2019.11.29.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 02:19:54 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iadNU-0002YX-72; Fri, 29 Nov 2019 11:19:56 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] staging: gigaset: fix crashes on probe
Date:   Fri, 29 Nov 2019 11:17:49 +0100
Message-Id: <20191129101753.9721-1-johan@kernel.org>
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

And while I hate playing checkpatch games, the final patch addresses a
checkpatch warning introduced on purpose by the third patch.

Johan


Johan Hovold (4):
  staging: gigaset: fix general protection fault on probe
  staging: gigaset: fix illegal free on probe errors
  staging: gigaset: add endpoint-type sanity check
  staging: gigaset: rename endpoint-descriptor identifier

 drivers/staging/isdn/gigaset/usb-gigaset.c | 39 ++++++++++++++--------
 1 file changed, 26 insertions(+), 13 deletions(-)

-- 
2.24.0

