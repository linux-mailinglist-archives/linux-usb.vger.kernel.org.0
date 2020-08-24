Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2436250A90
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 23:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbgHXVKl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 17:10:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24223 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727909AbgHXVKj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 17:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598303438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=98P4pw0MSJfjYTwg7Jr3bMvh36DJTSmp1NgoIinTZVY=;
        b=T6KPuXFlljhlHOKs+0VDpQHY/SEu3DBgB6dbvzvtoF1u4WxnxD0BRUR+YM5b+5GVSMhz+i
        2KHIq7GzA4Ly1Qs+CH9EZKyo8Nuj612z9uyfWty5lMqTYe4ONE2YvG+M1DsZ1laBFZHnei
        72LdzE0U+Ir8wwqfcIksy4navBZjT/s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-cXpm1CHGMM6oNZrOebn5Cw-1; Mon, 24 Aug 2020 17:10:34 -0400
X-MC-Unique: cXpm1CHGMM6oNZrOebn5Cw-1
Received: by mail-qk1-f200.google.com with SMTP id v16so7377509qka.18
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=98P4pw0MSJfjYTwg7Jr3bMvh36DJTSmp1NgoIinTZVY=;
        b=h+ZCVgqhBm5O1W+0JSkZFNi3rcFEXHP++ULp73CH7a99fMFg5VlZhjvEXTJTzXAWCM
         A5EB/lC6Ss0HgXfhfN3kWa9eAQVBwr8qCTSCUXIBvqDWlbM7Y+DeV2TUDxPZqVkbb4TR
         YcKpcKV2Pyz2F6bzjsUSGq3YASPfRVLhM9krsfqLnQb+gugwVn9M2/ZKwCVoNL94AW3+
         7zus735/bhwPPVHtPBmo68NzCfqqaHZjv/RV/B3tj2E9pNns18cuGxyL5JCiyLZQWQjU
         OlE/0QQWYLShcVMfL3Ac9PhInbZrOZKz9Po6t7jX+xu7P9gxK5B0+us0pL3cInJWUFN3
         FoJQ==
X-Gm-Message-State: AOAM531VPjzDsTiAkyKgmzlvD1sP0H6V1szbzl9q6rKe6VYYHNIB5WpW
        TSmSqxEqQz6TOftC1KNlXBmLb6+oUoHMgeJ0H0MV1uGcrUJDjj7hQnZhhVN5zV3d62uzjYLP1/V
        nozPLQCel2i65uUl0P9Rb
X-Received: by 2002:ac8:3894:: with SMTP id f20mr6679732qtc.243.1598303433825;
        Mon, 24 Aug 2020 14:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwS7pZM6tz74vKWqZ0073bXmrovICgMLihNHEaqZgQPStkNvmVP3ub77pZRv8l2/JBnLnEvCw==
X-Received: by 2002:ac8:3894:: with SMTP id f20mr6679720qtc.243.1598303433555;
        Mon, 24 Aug 2020 14:10:33 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 198sm4681833qkh.19.2020.08.24.14.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 14:10:32 -0700 (PDT)
From:   trix@redhat.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: storage: initialize variable
Date:   Mon, 24 Aug 2020 14:10:27 -0700
Message-Id: <20200824211027.11543-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this representative problem

transport.c:495:15: warning: Assigned value is garbage or
  undefined
        length_left -= partial;
                   ^  ~~~~~~~
partial is set only when usb_stor_bulk_transfer_sglist()
is successful.

So set partial on entry to 0.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/storage/transport.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 238a8088e17f..044429717dcc 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -414,6 +414,9 @@ static int usb_stor_bulk_transfer_sglist(struct us_data *us, unsigned int pipe,
 {
 	int result;
 
+	if (act_len)
+		*act_len = 0;
+
 	/* don't submit s-g requests during abort processing */
 	if (test_bit(US_FLIDX_ABORTING, &us->dflags))
 		return USB_STOR_XFER_ERROR;
-- 
2.18.1

