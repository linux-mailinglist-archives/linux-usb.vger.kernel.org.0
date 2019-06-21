Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D15A54EC1E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 17:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfFUPfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 11:35:00 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44761 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfFUPfA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 11:35:00 -0400
Received: by mail-pl1-f193.google.com with SMTP id t7so3167808plr.11
        for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2019 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/iwaNeZ0Hv8eIGULdMzpIwvTEbyFGL6h1hHZPyLPbU=;
        b=fCU5GPRqtGM5B9pGnCzdVkseuKv6V0v+Ld8nJqHya0XCkDhbV5Lv+7aotjFbDrzDa+
         /xidqUNaC64LsyyoHSXiKrOMrFA5icuLecB6k6awXdCkFkZ9rvOvqvBYLa1X4OG+crCq
         1YY7QulomQbSOH++lAEcccoOmTcnIc7KnXfzXCv0AQClECT1o5TkwXu36cEm1+/Z1IBZ
         ZTrD4y4R/oLkFQ9QocZeioEE++N6hXPbjQQnmvI+abDemQnl5YKyI2mLSsCfU3nIJqNv
         8WFMocOzwLqQEWML6XbgNROTvPG88rk/KF1AymY17sx6ClWF64tMB2u0GsVotx44TLUV
         xN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=R/iwaNeZ0Hv8eIGULdMzpIwvTEbyFGL6h1hHZPyLPbU=;
        b=kWDDXbgWuFLngw8AROPAkOnHOyWUX1Mh04CjfMnE9l0Z1yWSedoTrfk64wT8L1PWDv
         AEGxZqh7tAjbDm7oHRbLyu7oPBFNHi232LE5P37QIzm381Nj73DTllbP/sKXc25dSCY+
         W69JufR2EH4m8e7m1akxSBpGWpDxfvFxIjO3Nhl4JIBE6j3ETJQ5pT59jkUdtVEid0XV
         ym8kBj4pEmbgkxYTMDcqb+VzI84XuPjr+GIyy70aGuqeo3KPR/uLNMr3LfVTZ4g49dxs
         bj5ZO+VO5I3pmOfq0oj3Ki0PGrZJ4iE5cjWQqp9Eo4MO3HhI/Bl6U3/okqNok3iZyP+n
         LIwA==
X-Gm-Message-State: APjAAAV9ItDMWX4mHCe2V0MPFQksQbV3T/+z+QXSM9SX9ZxTifj1/jGk
        fhSQAwTkEDtc8Z+Ajq+O+D1P/j7Jb/E=
X-Google-Smtp-Source: APXvYqx3nb7L2LqOaEGW+cK7l5B/kY8fFaSWIlez3jJr5IFFvwOgifg+lCpI2aXGmHcZU+499k8mNA==
X-Received: by 2002:a17:902:8d89:: with SMTP id v9mr106519989plo.99.1561131299835;
        Fri, 21 Jun 2019 08:34:59 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id j9sm3261045pff.88.2019.06.21.08.34.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:34:59 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 52DAC4650EE; Fri, 21 Jun 2019 08:34:58 -0700 (PDT)
From:   dmg@turingmachine.org
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, Daniel M German <dmg@turingmachine.org>
Subject: [PATCH v3] usb: clean up some of the computations in adu_read
Date:   Fri, 21 Jun 2019 08:22:40 -0700
Message-Id: <20190621152239.17559-1-dmg@turingmachine.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621071655.GA20682@kroah.com>
References: <20190621071655.GA20682@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Daniel M German <dmg@turingmachine.org>

Replace ?: with min to calculate the number of bytes in the secondary buffer,
including changing the data type of data_in_secondary to size_t to be
type-consistent. data_in_secondary can never be negative.

Remove some spurious calculations (copy_to_user returns zero on success),
making one variable redundant (i)

This change does not alter the functionality of the code.

Signed-off-by: Daniel M German <dmg@turingmachine.org>
---
Changes from v1:

        - Replace %d modifier with %zu to avoid compilation warning
        - Note that v2 was not properly labeled (its subject was [PATCH])
          v2 and v3 are identical in content.
        
---
 drivers/usb/misc/adutux.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
index 9465fb95d70a..344d523b0502 100644
--- a/drivers/usb/misc/adutux.c
+++ b/drivers/usb/misc/adutux.c
@@ -343,7 +343,6 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 	struct adu_device *dev;
 	size_t bytes_read = 0;
 	size_t bytes_to_read = count;
-	int i;
 	int retval = 0;
 	int timeout = 0;
 	int should_submit = 0;
@@ -371,23 +370,22 @@ static ssize_t adu_read(struct file *file, __user char *buffer, size_t count,
 	timeout = COMMAND_TIMEOUT;
 	dev_dbg(&dev->udev->dev, "%s : about to start looping\n", __func__);
 	while (bytes_to_read) {
-		int data_in_secondary = dev->secondary_tail - dev->secondary_head;
+		size_t data_in_secondary = dev->secondary_tail - dev->secondary_head;
 		dev_dbg(&dev->udev->dev,
-			"%s : while, data_in_secondary=%d, status=%d\n",
+			"%s : while, data_in_secondary=%zu, status=%d\n",
 			__func__, data_in_secondary,
 			dev->interrupt_in_urb->status);
 
 		if (data_in_secondary) {
 			/* drain secondary buffer */
-			int amount = bytes_to_read < data_in_secondary ? bytes_to_read : data_in_secondary;
-			i = copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount);
-			if (i) {
+			size_t amount = min(bytes_to_read, data_in_secondary);
+			if (copy_to_user(buffer, dev->read_buffer_secondary+dev->secondary_head, amount)) {
 				retval = -EFAULT;
 				goto exit;
 			}
-			dev->secondary_head += (amount - i);
-			bytes_read += (amount - i);
-			bytes_to_read -= (amount - i);
+			dev->secondary_head += amount;
+			bytes_read += amount;
+			bytes_to_read -= amount;
 		} else {
 			/* we check the primary buffer */
 			spin_lock_irqsave (&dev->buflock, flags);
-- 
2.20.1

