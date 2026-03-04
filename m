Return-Path: <linux-usb+bounces-33935-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DPbOb6op2kqjAAAu9opvQ
	(envelope-from <linux-usb+bounces-33935-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 04:36:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F291FA759
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 04:36:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5D0A312CE44
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 03:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87CA366802;
	Wed,  4 Mar 2026 03:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZQnwEyt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1C36656D
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 03:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595265; cv=none; b=EMiP+HLyl9/aYa4/q5wZFf2iPHP2Vytja2irWbIcDNqYJo4T2BSpTdgqAu7eCO8DONu2X4rIm/AemKQ32ce2QyjqJ0v7KJRw+7iHYlQDUycoQMmT2mlApUAHVG64qoYvNId/T+T0mKjAVUFdt3BfPbSWGcFtSX8db1zJ57x4n80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595265; c=relaxed/simple;
	bh=R2M2fHHkAPwgqw+I1TxObtsEQQvziTwqQOcXHWNyRzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=laPljHPzl0ScQ7BiRHYlvfWH6kq9dKxidw7IcgT2224YNAw8XlrJO2M243x6aDsa/VT1537csvq2KGVc3RWWxmRe+EZpEtz2BEDis+GHyb6LQ60yEBhrMrOhOWjgDyM8RyZWJv1FWDxAt4osm4M1xUl1Hx4PrW0nDLKobVsHltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZQnwEyt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so3792188a12.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Mar 2026 19:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595263; x=1773200063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CW6uN7WcGPQ9ejL+45MIV9ogicIgXHxX+5ZMFH2olI=;
        b=EZQnwEytx4wtGqIbaRPGhfYQHGvl9wA4cN3T63R7ork9iyREMtAK9mHEG/3orspJBa
         KhUg9/HORv5FW9jrjpoewWv0mzqp12Yh2RleKRBUl1+QxbLXEAsTSc9DTBUmPUxdDWba
         6oCpVvSxxfZqDJ5pdhQUaNN5H/O02rhSyNTt9ddmbAVWW6cuUOKLS8YJdmbxCxhM61st
         0VN4avVy0nbcdxaVKdiIrLUbu1QejZY5ZgS983WFTyR6OD+ym6ws2T5t6oIk6kYcfVX9
         +ibwfu6vP5TdNPH+pt3LuUXczF0jjFvypVj7yAOq1X6p6epQeksjVwTzd5riWutIamH/
         KkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595263; x=1773200063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CW6uN7WcGPQ9ejL+45MIV9ogicIgXHxX+5ZMFH2olI=;
        b=efOvF0XyVXjFwz7fZV0H88zeiG1MhLxQSRmm1vUkTndmFbZ48JGYmkOZl1kZUiY97H
         Iq28dXwwc6Nn/Bin+4V9+V16XadvJskTkbyDFLLFaxebSlj/anqb+Y71QA11HdKsIAug
         aRMyYmIuviiWKCbX9xMbFd2X0EP3Si0YGl/BwWTJMdEsh0Im11eU4+XAuRO8nriTI7Gq
         H5xTvcD6QZO2R6uj2izg2ic+zotZZvPywkIGIRixSRlxs1zbvAlx70PGh2s9JzwdkZag
         Y8fJkZhGZ3lRd8G0SdSiwVS9EK5F8gqxFYW2KvNqYfD1dv4M8Iv0xFNypyMZfOJLCYIG
         slig==
X-Gm-Message-State: AOJu0Yz3Nh1gZdeCkcE9xpOD4o0bTan+7LntKbRGn4zx+QLs3S1YfT48
	GjkugZbwewmyPHCt1urfSr80jPHBMNszK0q4UYwEQvXF5upwnZ7Q8AUUJmTPiIBd
X-Gm-Gg: ATEYQzzWVHuxzNmJ+4zyh5jjNgDMkH2wfCBzEooIugVx0uLm3pWjRt2SV46myg2kCLS
	zScQJY/XCLwvdvxkiTMfhb9ZM36W6so34M/fec7YzWlmqKBzmN4R8/nEfqHZJ85uXt0G4FvrfJP
	E3Zb2HnFJCGOVBLQKjmQ7vhrEJJX4YdeA7F68w+od4vhe/wQdYaWeHGqxCfqSciAamuvQl0VbCB
	dxKkaURGBjT1cfK1OGGzTiOMP8xf9zz0eJokm0VaIRnIJQrufgvkVUW3r3vxxwzcpVlEVxbm8Y7
	sUdBN0emTeRRFwr/4XDjNy1UTD7j/4Ni8364c3zO8PyHlkQLz3BMldnJpvTOUJ5/0MUgs0J5JmE
	mOMmgWqXPGmgnbzAMtuqjWvS1vRWw3YgdW2oi61v7nrMtIpwJzPPVJqfPXxneJXENArn+wBvq5a
	430AVXQCjbV/9gAAWzB5pgGPBxdG+RM6H2T3aZjObtGFNwyYRqUumO/Ge265DqmFJ6f7FmaD6Rv
	DuHADEALmd3dwmC
X-Received: by 2002:a17:90b:288d:b0:345:badf:f1b7 with SMTP id 98e67ed59e1d1-359a6a6423emr556197a91.28.1772595263344;
        Tue, 03 Mar 2026 19:34:23 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm3814047a91.16.2026.03.03.19.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:34:22 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] usb: core: remove unnecessary goto in usb_create_newid_files()
Date: Tue,  3 Mar 2026 19:34:18 -0800
Message-ID: <20260304033418.49357-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92F291FA759
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33935-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[marusikadamenko@gmail.com,linux-usb@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The goto to 'exit' only returns the already initialized variable
'error', which would be 0. At that point it could not yet be anything
else. Replacing with an early return 0 removes the
need for the label entirely.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/usb/core/driver.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 2574e65bc640..571b7d78e814 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -186,7 +186,7 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 	int error = 0;
 
 	if (usb_drv->no_dynamic_id)
-		goto exit;
+		return error;
 
 	if (usb_drv->probe != NULL) {
 		error = driver_create_file(&usb_drv->driver,
@@ -199,8 +199,6 @@ static int usb_create_newid_files(struct usb_driver *usb_drv)
 						&driver_attr_new_id);
 		}
 	}
-exit:
-	return error;
 }
 
 static void usb_remove_newid_files(struct usb_driver *usb_drv)
-- 
2.53.0


