Return-Path: <linux-usb+bounces-8425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD088C6AA
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B81A301E36
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 15:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559CD13C824;
	Tue, 26 Mar 2024 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xzGuM1KZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718A812B82
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711466358; cv=none; b=oQtoJRGHrNNNaq0H0eNmwZ+6Oyd5NumaQpbP7yUe6Uj4pou674x+UUykLYz4HHz0IX2/iwIMOK+CJETQ2au/Rzy5F6KceEj4ALOV1JchjQ0YEzt6lyLyIJ7qOvJtY+Gp9Ko59PjtwiKIZxMjvFrJJ8/BcDyn+uri6/FtFvdrjNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711466358; c=relaxed/simple;
	bh=SraOnsE2ZK1vLT3c1NA6VI0uTZIh2ButPyGByZ0auQA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z2CR0BTyKL4ujmYdrRw2ty0GG3gFbD+jkJm+epLvrze0O5FJZ0ULXsOJwa5AZp/sZGzteG1De29oXVp0pDobTXB1jq+BchmWfbaA5Y0cX4eokdiHlwcFsNbKCNftpsau99ED9JVTHhFimBZBAZHHYGECD+6xqiOiD+1MaxndRzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xzGuM1KZ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1e0a7c699cfso25073805ad.0
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 08:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711466357; x=1712071157; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZX5Wvd0xktos9WBEJLXysYQZfAByNmYU61XZUR2rboI=;
        b=xzGuM1KZb0vhUSloPR47tQ+K1gKAwkakkn7KULQBpl+ezMMid8cwKiYLps3KYQ/mkb
         M9YObxQcmmvWtqZP5szQoh76lZJSwyAqIzpDL2Y9tA6BQJs/C3V/EJ4OMjFTPCWoiM06
         T6QUHjJ+4ycjMnYqgT+AXChbHKw8REBtDl3W/FNHT4ycjSOVYPF4utEEVd4WheJp0TOe
         UYqaVS4bWwV/d7yemM+VcU2cHlX4GMO0vBYWPwzp8jFB+Lk0SAUnIpEzVB0xnKBenr7n
         wbucMQ01UIl4qc0v7EmoxSMbYSalV72LfV0e8U+CNKKNCc0oKDzGl6YArBrPG3xd+DvG
         RGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466357; x=1712071157;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZX5Wvd0xktos9WBEJLXysYQZfAByNmYU61XZUR2rboI=;
        b=kR9C/aUrwPTPLs+nP8Hdg9ilEUso/4CCHzSNqC4rHUd94gowIlAaR2UBP0ywiUSS4T
         XuCXIzkWXKGbbn+5o+e8QEzZ2YktC9OzY6MYIxQblgSWnmMQe/HHsNFewDAN3ys06IMf
         WSqFKBa9Jr5t7vO7DMiMPjkJlZa665NyifR+KNnjhFzLkc0evGp43uEATagN7QCkTM4d
         S/8RJF6jbOWvb7cLSXJm9SHbu1BO1PNa+H7CHKKDjQ181dboZNgY4NS8VrZQpDzWnA3S
         3HUVeMpw5wNsmKXc4fScscUXVvq3wIttM/e4s+1pEsMqfTLVF8QEkpCzmL2Sw6DLFaon
         sT/w==
X-Forwarded-Encrypted: i=1; AJvYcCU8sTv0degCtJY0WZ99VO2VZatYCnAdDiJfnGcuCx3glq3C5WhhIhOm+BJvurZKlX2MuxlPAuHhKMe4bu1YYqTLQXjZS4KBr7GI
X-Gm-Message-State: AOJu0YxNhfbbgDvvCLsT9OEi1P6s35yCJwF4ZvbM5qU5Q4MJCDC6Ms/4
	ekQLUlh5Wu4yUPSAycQra41vgCh6EKVjk0CbqNwjFDosSIsZhFMi+DBcc2mPMHANvYoIKBLPECj
	5TrnXPA==
X-Google-Smtp-Source: AGHT+IGpcix9zT2zJgL92BUZCTnJRPGRgLNYsBdbyVdVSZE0L1tCyIxVI05/4rz1JStR/B5emPq+lsM6JUK+
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:a7:c:666:5c0e:98a6:f950])
 (user=kyletso job=sendgmr) by 2002:a17:902:fb43:b0:1e0:9a7:e629 with SMTP id
 lf3-20020a170902fb4300b001e009a7e629mr206486plb.7.1711466356714; Tue, 26 Mar
 2024 08:19:16 -0700 (PDT)
Date: Tue, 26 Mar 2024 23:19:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326151909.440275-1-kyletso@google.com>
Subject: [PATCH v2] usb: typec: tcpm: Correct the PDO counting in pd_set
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Off-by-one errors happen because nr_snk_pdo and nr_src_pdo are
incorrectly added one. The index of the loop is equal to the number of
PDOs to be updated when leaving the loop and it doesn't need to be added
one.

When doing the power negotiation, TCPM relies on the "nr_snk_pdo" as
the size of the local sink PDO array to match the Source capabilities
of the partner port. If the off-by-one overflow occurs, a wrong RDO
might be sent and unexpected power transfer might happen such as over
voltage or over current (than expected).

"nr_src_pdo" is used to set the Rp level when the port is in Source
role. It is also the array size of the local Source capabilities when
filling up the buffer which will be sent as the Source PDOs (such as
in Power Negotiation). If the off-by-one overflow occurs, a wrong Rp
level might be set and wrong Source PDOs will be sent to the partner
port. This could potentially cause over current or port resets.

Fixes: cd099cde4ed2 ("usb: typec: tcpm: Support multiple capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
v1 -> v2:
- update the commit message (adding the problems this patch solves)

 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ae2b6c94482d..2464710ea0c8 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6855,14 +6855,14 @@ static int tcpm_pd_set(struct typec_port *p, struct usb_power_delivery *pd)
 	if (data->sink_desc.pdo[0]) {
 		for (i = 0; i < PDO_MAX_OBJECTS && data->sink_desc.pdo[i]; i++)
 			port->snk_pdo[i] = data->sink_desc.pdo[i];
-		port->nr_snk_pdo = i + 1;
+		port->nr_snk_pdo = i;
 		port->operating_snk_mw = data->operating_snk_mw;
 	}
 
 	if (data->source_desc.pdo[0]) {
 		for (i = 0; i < PDO_MAX_OBJECTS && data->source_desc.pdo[i]; i++)
 			port->snk_pdo[i] = data->source_desc.pdo[i];
-		port->nr_src_pdo = i + 1;
+		port->nr_src_pdo = i;
 	}
 
 	switch (port->state) {
-- 
2.44.0.396.g6e790dbe36-goog


