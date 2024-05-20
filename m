Return-Path: <linux-usb+bounces-10343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 595348CA00E
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2024 17:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 138A0281770
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2024 15:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B754C66;
	Mon, 20 May 2024 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WCRdbWwb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C36E54660
	for <linux-usb@vger.kernel.org>; Mon, 20 May 2024 15:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716220161; cv=none; b=IXK7wmqOe6+armBO95JIf5Ug+TFkNrrLz95/33hQ6rs4QSXFZ5ooGZm443fLXljzTnkB93Tvm5X3O+6VacjYom+VpoK5sPqd1Cp0pcY6SMiXaYoisP1kHHN6DeftfgY33t4jQKmvOGwiifF0bQP0jaU79ugzomsOaH9kZUroI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716220161; c=relaxed/simple;
	bh=4iB0UniyvGsVchRqtMoChe7NlqVHuiQOzngJRi+uD6o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OFam8Z7P9U+tyZK8vvErTuxMOtzb0ssBoH0Wfsjvph+3QD5D3nDOzM8LllnPaOQs0tp17n8WuI8WMjE/a1N3HjpgEO/xwJTOv1+QCESBPi+6v0k38LwP526WlIVCU6PLCOjLzpft8yZcQS1XetcBdCloSm1ocsiHFvM79IxDMDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WCRdbWwb; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de51daf900cso18704332276.1
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2024 08:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716220159; x=1716824959; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Hta5Q6/b2rPRyvZAPSqwK1sqIL5wofS3TUQ5XOr7Cs=;
        b=WCRdbWwb3h9YKpUTyyIeIrWAoBbRg2SyEDVvAuyxVVXVp2XBwg9gKfsScI2HW5ilQ+
         ndT2MxOmv8IEgZwMplkk+y+0XWODXFBnxU8OZpZ/5a+Cg1Nwzm6Cn5jz00Xq569SLAHa
         SWtHngG05WDcp2zNDGQRyQ1Nqxupp8Oi6bpODCjOMcKZJ+Buht1wqIsVSU8SHCJtFoHv
         F3nedsdHviLjbBkJsnigBUUrvc+4c/Ptk8PicatkscFJdaYKivS98nsHRMCJJAooMiOG
         Zrii/j48u7thpxZFCPBim07mes5tWv8lZc5MWo9DC604+6eNRFhwaYfH75033ZoxqPbc
         BxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716220159; x=1716824959;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Hta5Q6/b2rPRyvZAPSqwK1sqIL5wofS3TUQ5XOr7Cs=;
        b=Au2GUpHuoD6AXTlb/4/P2sHFZEkYRr69xfPZ5C4fllUw8eHzIAJcvDxadu+PjsqSfh
         PHsYlYyTGMTsVl1ZaoVJdb6vqd1jA9n51dkRxzy9kouhxm2iEte59P7oAhjyLh4qhe03
         w7zGXIV6F1uTj66jLEGfjZNjpFIOxdrouX5oGbvfQ5r/O7Cu5TJ1qfC80+DiqQIGADgy
         kcIZyX2ibQa++A/S3AFFOdy9fFEKkQMfjNE/Vh0otHkWivXetlievPbMXhKGzn18ukIQ
         /IkAqwtXkFd2P5Ypume8tfAq4wTtZEZkVk8GgCNe54tbEnj9XjqvRGp/46Ffo9jPgrUO
         1c/g==
X-Forwarded-Encrypted: i=1; AJvYcCVYncpvDbtIzj4hcP26NUgOg52QgTFmHTYm7f+TQAcWX/AlYcG4CQIv7uKNuujAx8Sjc0pAUlYiCS5qFoy4sTx+dXTdGew+Y624
X-Gm-Message-State: AOJu0YzqH/F5oVS6fVHdjIqfxNu7BIbzDqiCmbilX0ub866Kmohn057u
	KMbSS+/aecNv82jNXa78L51FyOJH+5DqEaK/3rkMNgKmCsm0h515PCqdvQRdBPdMf9QryAJG3BP
	4PJiWyA==
X-Google-Smtp-Source: AGHT+IFiZXUt8sxoCkvWR9ksdbwYOAWH9aUG7crxl4brbEO5+hvznY+zLbTMl/qWVD2B4Kq7QWK0AT+WRJAL
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:a7:c:e7e6:5547:2aba:8696])
 (user=kyletso job=sendgmr) by 2002:a05:6902:1241:b0:df4:9b3d:66a6 with SMTP
 id 3f1490d57ef6-df49b3d9b3emr1603204276.10.1716220159335; Mon, 20 May 2024
 08:49:19 -0700 (PDT)
Date: Mon, 20 May 2024 23:48:58 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240520154858.1072347-1-kyletso@google.com>
Subject: [PATCH] usb: typec: tcpm: Ignore received Hard Reset in TOGGLING state
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Similar to what fixed in Commit a6fe37f428c1 ("usb: typec: tcpm: Skip
hard reset when in error recovery"), the handling of the received Hard
Reset has to be skipped during TOGGLING state.

[ 4086.021288] VBUS off
[ 4086.021295] pending state change SNK_READY -> SNK_UNATTACHED @ 650 ms [rev2 NONE_AMS]
[ 4086.022113] VBUS VSAFE0V
[ 4086.022117] state change SNK_READY -> SNK_UNATTACHED [rev2 NONE_AMS]
[ 4086.022447] VBUS off
[ 4086.022450] state change SNK_UNATTACHED -> SNK_UNATTACHED [rev2 NONE_AMS]
[ 4086.023060] VBUS VSAFE0V
[ 4086.023064] state change SNK_UNATTACHED -> SNK_UNATTACHED [rev2 NONE_AMS]
[ 4086.023070] disable BIST MODE TESTDATA
[ 4086.023766] disable vbus discharge ret:0
[ 4086.023911] Setting usb_comm capable false
[ 4086.028874] Setting voltage/current limit 0 mV 0 mA
[ 4086.028888] polarity 0
[ 4086.030305] Requesting mux state 0, usb-role 0, orientation 0
[ 4086.033539] Start toggling
[ 4086.038496] state change SNK_UNATTACHED -> TOGGLING [rev2 NONE_AMS]

// This Hard Reset is unexpected
[ 4086.038499] Received hard reset
[ 4086.038501] state change TOGGLING -> HARD_RESET_START [rev2 HARD_RESET]

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8a1af08f71b6..9c1cb8c11bd6 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6172,6 +6172,7 @@ static void _tcpm_pd_hard_reset(struct tcpm_port *port)
 		port->tcpc->set_bist_data(port->tcpc, false);
 
 	switch (port->state) {
+	case TOGGLING:
 	case ERROR_RECOVERY:
 	case PORT_RESET:
 	case PORT_RESET_WAIT_OFF:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


