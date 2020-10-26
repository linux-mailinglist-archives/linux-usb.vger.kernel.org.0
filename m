Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3437729967C
	for <lists+linux-usb@lfdr.de>; Mon, 26 Oct 2020 20:13:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1792621AbgJZTNh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 15:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41083 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731649AbgJZTFI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Oct 2020 15:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603739107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=CeSxyJXbIAWmg9ma3wabvh6TND1xY66CvqM05CqNLic=;
        b=ZdhfbYCy/drm1D3cqPzEjWssSRx9tshAYgZS561CLKRNMzh7+G3wmWQev3ehOmd3+R7Ryi
        Xm/5xBdmhLHUdmS+n7pSTOZaRsoXMp/7XQa5dW4+w9dnCdU0JvyPIQChdNCT2g1DSJEjSZ
        HzHkdRGmIj5MZ/FtNKkOUHFcIDrQz0c=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-LOhROEtnPfW0Z3a1qIy7Ug-1; Mon, 26 Oct 2020 15:05:05 -0400
X-MC-Unique: LOhROEtnPfW0Z3a1qIy7Ug-1
Received: by mail-ot1-f70.google.com with SMTP id h7so1396617otn.10
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2020 12:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CeSxyJXbIAWmg9ma3wabvh6TND1xY66CvqM05CqNLic=;
        b=Z+swmcnjSyp9XDe3n2lncTBlvZj5ZjM83JgOqkFLZkXffq6lj5l026d3nSKqAxhQS7
         IRWFsjHNxcMJxU6lbYjqoOiO68fOviWmK/szQ+mLLARwj5BQcj5cYFwCJ2yyXguQgbf8
         I2Sww+QemSSrc+6YSK1r5RnsMUm14qBV7ooZwCS6PUt2Nip3PXfZ5eopfAwyEDBC5R8g
         uGa2dmsrp/+9mBInALOkEsr3/nrGf1J1qx7mRn6DPEVlnvZgWFtNEG0jDMhyaSTqAHKU
         yJ6aQgirLaqo5x6Ep8rnzzr29CHuUojicVknJlGW0MVlURCkC4KG1rxBiT24CyXCDDer
         AAUw==
X-Gm-Message-State: AOAM531YUorhzhbZc1w4KkJcX/r9jJj/o3ioyrpHI9lqsITTywexccQq
        dEsa6VDEMxCZWmEm4HBxNcwrLXP7jXfQs+0SMD1YLD7JFa31O7LkCr5B7dk44NENtumajrQmlDk
        WqPF6u2JA/e8yMIaXAT1i
X-Received: by 2002:aca:2b05:: with SMTP id i5mr15353016oik.57.1603739104684;
        Mon, 26 Oct 2020 12:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDzUzZb1se/ghFrljj0r4jK+qZOmg7H/2p/u6170SKKqrlq3uXimvsSk1NAmvcYmDQLE9vRA==
X-Received: by 2002:aca:2b05:: with SMTP id i5mr15352977oik.57.1603739104214;
        Mon, 26 Oct 2020 12:05:04 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id s27sm3044196otg.80.2020.10.26.12.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 12:05:03 -0700 (PDT)
From:   trix@redhat.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: storage: freecom: remove unneeded break
Date:   Mon, 26 Oct 2020 12:04:57 -0700
Message-Id: <20201026190457.1428516-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return.

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2 : split from original large patch
---
 drivers/usb/storage/freecom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/storage/freecom.c b/drivers/usb/storage/freecom.c
index 3d5f7d0ff0f1..2b098b55c4cb 100644
--- a/drivers/usb/storage/freecom.c
+++ b/drivers/usb/storage/freecom.c
@@ -431,7 +431,6 @@ static int freecom_transport(struct scsi_cmnd *srb, struct us_data *us)
 			     us->srb->sc_data_direction);
 		/* Return fail, SCSI seems to handle this better. */
 		return USB_STOR_TRANSPORT_FAILED;
-		break;
 	}
 
 	return USB_STOR_TRANSPORT_GOOD;
-- 
2.18.1

