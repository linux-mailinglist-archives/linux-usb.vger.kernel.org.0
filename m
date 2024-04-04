Return-Path: <linux-usb+bounces-8933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D58988DD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 15:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9021F1C275AD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 13:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FDF12838A;
	Thu,  4 Apr 2024 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gwb1Yspj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F60E127B46
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712237727; cv=none; b=QR2yrfKYy2XSdHOgbf5oHcsdESvzYdsUdWkuaUY+/kNCfjeVkbke3tRu/4oDhU/YnG+kWGlWeD3cbGo9OWcCgkvTglw+/YAOi5nD4oNIGt3JGap50eVqYnu74mgLcNiroOpC3opOMxs4bbMgR6PMuohcECY0Ghv5cDXdhS9WiIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712237727; c=relaxed/simple;
	bh=T/e2Z+UzwFEEvo+yZto4ozOs7PdQ42qjues1cZwdgpM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cfYefIlwvg0SQE3ZJH6oCNBMFqw6P2hZQ+OELOppJFBuRDo7lsdZL8uayqB7+h0if+Fb0/rTWLTbCRVlwHly2bw2z5qaSWX7qIcAQwNJZhMq7ZCDxgb6PNmHcVB1duv6OBI7wsf8Y2TwOJEOdfBZz34LpBUW13fnAxm6T40439U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gwb1Yspj; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-60ccc3cfa39so15681307b3.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Apr 2024 06:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712237723; x=1712842523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hetVaClf/9lVuj24JMrL9FriyluZzetl+ezDnz2xhz4=;
        b=Gwb1YspjPjlKQOzxQrEOzaNoio97brSgVgZtURqlFK9AQRkVjc+AKZhv9IPSw761QO
         TK59d60amicIGvJb5ZYpe2sPP8ce9Y6bDKUxbzUhRZ99J0ZwuJHQTgOtvTxNo6ePOqnX
         NAe5aKws2NtSJWI2X+3I4YMEF0ewNPeiyRp48TwahzssSauh3ldaxKuDjLt46VisuS5M
         vP+R9jYZhqUXlD0d5DRQZVLcqUNxKVMjaGdBfvLVY0s0UdpDfvpB9v9Klf9pYroejlEn
         aPouzLNfpfd5naljZHi+i8lAM7zi2RXRwz2xX7p8uob+8N/+lPH1jcL3FEr5O3tQLgsm
         FxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712237723; x=1712842523;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hetVaClf/9lVuj24JMrL9FriyluZzetl+ezDnz2xhz4=;
        b=atn4nLHpNkcSXj0cl+u6y098BYWtVS9l3CRE3WUwOnYgaHwSpDQXcGcpgvG0A+xnA1
         dQ5PDrbqsWPjbxrjB4DpatZt79DxcI3IyofpUeG/Qovq22S19Cv0QznT9gE5tVQXjVut
         /B4sWWFlL1AFK+E3QjDB+kmkl/GY5f1PN8oshttW3iQN42HwXRd99O0E0Q3xt0cCq0pj
         PqZh/coJq5pTsahBdowvYJS3d5dDnqAlCR9E8IeZEAPaxkRob4KDntJbCf4CYdHjQkMb
         LZXUGEiUy1/QeS92DWojXkQFzzzdJcyJXJszI5j2152f49sC+QibkQNk8cXc1ELiU/Bj
         ysYw==
X-Forwarded-Encrypted: i=1; AJvYcCUamXpNHEG8SVXgYBPkFTi6XTNIKPtvUHUifReE8E0fy/zpf4ANxsGN01i1dSpJiKDQmyDM3GL4OYkb9QNLIb7+QxU5SQYllp9/
X-Gm-Message-State: AOJu0YwiRs9y8tM992tlHvF5XASciXiHeuXPe2/Ia8tcpqMmJQItYSnB
	eOFNpjzknTp3Biy6MixXQPmFzLuYspwNhygBVWX20+bnmJSOWwxBWW15Mz6sUFUGjA4CBwLBrTe
	5kAPtjA==
X-Google-Smtp-Source: AGHT+IFpeL1kU/z52ZFjT6Yrsam39v7avneNXzrxyor3Qi+k37OG1axFH7Cbl8OqGm1CW+N2ZPKFP/zd6MMX
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:a7:c:ad10:daac:95a5:1fe1])
 (user=kyletso job=sendgmr) by 2002:a05:690c:600d:b0:611:7166:1a4d with SMTP
 id hf13-20020a05690c600d00b0061171661a4dmr699112ywb.3.1712237723382; Thu, 04
 Apr 2024 06:35:23 -0700 (PDT)
Date: Thu,  4 Apr 2024 21:35:17 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240404133517.2707955-1-kyletso@google.com>
Subject: [PATCH v3] usb: typec: tcpm: Correct the PDO counting in pd_set
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v2 -> v3:
- rebase on top of usb-linus branch and fix conflicts
- add Reviewed-by tag

 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c26fb70c3ec6..ab6ed6111ed0 100644
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
 			port->src_pdo[i] = data->source_desc.pdo[i];
-		port->nr_src_pdo = i + 1;
+		port->nr_src_pdo = i;
 	}
 
 	switch (port->state) {
-- 
2.44.0.478.gd926399ef9-goog


