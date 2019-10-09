Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E31AD14FD
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 19:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731879AbfJIRJt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 13:09:49 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45803 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731908AbfJIRJt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 13:09:49 -0400
Received: by mail-lf1-f65.google.com with SMTP id r134so2213503lff.12
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 10:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X9RwUQKmTZ/DEElWepO5PO6zmD+LDDWIRfVD4Cm3DS8=;
        b=FR+vv6gLCqZxHNDNK5SKEjfVKrxKYDxF9uZPezLm4QKLJVil7TE/LGjLFndFu7uX09
         aAisSLW1MobfrHw0FprkG4ZnXSpajgH1tFWkpN9tOfhP3o+Gq/VIyF/SWd88mOGJmdZz
         NgE+KasaGG2gXl9smtfU1EGrBpMoSZwPtorC8qPMRl6eTtxIqBdAMJl36723eb/4YvjZ
         eMVcIMjq1p+y+Mid4CYxXWxzAwmdgTaguK5EAVwdC0lzRLycI3GzJpCkCxoNl2lPpuOk
         nWRm55BmheghAkeLqpkzdj+2UDDwdEyKIhMLjLLQ5lLZr9ta2Pn7e24BMfwqiYPQQtQG
         NRnQ==
X-Gm-Message-State: APjAAAXXiVdYHCbp7uZYTnOO+eSpKybbmEIIVvhjyViTzVKr+T4wLICp
        bImstf7p7nkwZTyn/A+lvQI=
X-Google-Smtp-Source: APXvYqzbKTx/W6/rfwGqvAjnEW1XzHIp77JbsLhLuSO0tdPgbbt4YVmUL/VOSYCWCZ4xInXJwLsbYA==
X-Received: by 2002:a19:ed10:: with SMTP id y16mr3040537lfy.74.1570640985852;
        Wed, 09 Oct 2019 10:09:45 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id n12sm654533lfh.86.2019.10.09.10.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 10:09:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIFTF-0007q0-7F; Wed, 09 Oct 2019 19:09:53 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/3] USB: usb-skeleton: drop redundant in-urb check
Date:   Wed,  9 Oct 2019 19:09:44 +0200
Message-Id: <20191009170944.30057-4-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009170944.30057-1-johan@kernel.org>
References: <20191009170944.30057-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver bails out at probe if we can't find a bulk-in endpoint or
if we fail to allocate the URB, so drop the check in read().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/usb-skeleton.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/usb-skeleton.c b/drivers/usb/usb-skeleton.c
index be311787403e..2dc58766273a 100644
--- a/drivers/usb/usb-skeleton.c
+++ b/drivers/usb/usb-skeleton.c
@@ -230,8 +230,7 @@ static ssize_t skel_read(struct file *file, char *buffer, size_t count,
 
 	dev = file->private_data;
 
-	/* if we cannot read at all, return EOF */
-	if (!dev->bulk_in_urb || !count)
+	if (!count)
 		return 0;
 
 	/* no concurrent readers */
-- 
2.23.0

