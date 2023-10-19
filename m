Return-Path: <linux-usb+bounces-1886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 405F57CEFD0
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 08:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F031128139F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 06:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446241FBA;
	Thu, 19 Oct 2023 06:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yI1u9WmY"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC346699
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 06:06:24 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9859FE
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 23:06:22 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a8d9dcdd2bso7643497b3.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 23:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697695582; x=1698300382; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lr68DklHqj74TxP0eigSuVpguDEeRxq0NgDtMHIH/oI=;
        b=yI1u9WmYCCKp+URianPUqDBeVnJcpjK+b/l1y7cshee5UpH12W5ZZFclN9xChI+5hA
         wmJ8tgei8Vjg/57XbexbFhslugLDaQQkaMmai6/3nQQpXNBL57MdcF2syWViEdrN762C
         ioTh2L+skWoSH75+a8NkCbOZ7rM7DsergA6R++V9/w4MjLwoNSA58NgTDIi1m7nproHL
         gDhSuqHwsTEDwWBacRxb4QBDMml355+b9tKr+zdyo1Az0QirC5WgjVXHuIqq5KomwBAC
         nUCQQF/8/vW2FkC9H7Tw5nA2xNnm5CRCUzdgpyHL8Qd+g3+ux3wcY3gSpJcHVcU6xxMZ
         IIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697695582; x=1698300382;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lr68DklHqj74TxP0eigSuVpguDEeRxq0NgDtMHIH/oI=;
        b=wajC0y3IEJbFEEG5fdfTgbFJ57doEFlyQmzv4X/WOkVhfzX642lhFGGVULOS2XKH2K
         I6c3W2AQqdvt11KjUJVufG+IM5P/YrPAf4whtSlUQ1q9WUMqMc5BkNePAUaL9P1MKgRf
         5/1s1tZXMOQVRWypU2Prpb+THmnejyCaGla93Z4wSTY6dXZSVYJ4frC619KALNT3L+oL
         gjKM0+1AE9yiF2PB/reBdpqVg1ylzMx4p4B0VM8Nr2IIKJd6fdXdh0V7U70tZz9mSK89
         307eq678eTssIEICu+SQT3SjJeAzG+sFZRaSesDiFPXG8LBmYGL5bB8F/Uhvn4VI1zM6
         19BA==
X-Gm-Message-State: AOJu0YwWA0e0etx1yqBJQ3hoSOHNtkU3mmsKbaH+As4KVyspXzRcFxoQ
	pMxfOpKm7lGbdu0Y2Xyia8ArXvs3/+8=
X-Google-Smtp-Source: AGHT+IFxdAeW7rTbAxtKpzc3xZucRQ3pnnEl53+/pr0bFck1skxCTbWWGVdiz94HSZyqmYP90WNoxGbwyO0=
X-Received: from hhhuuu.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:c80])
 (user=hhhuuu job=sendgmr) by 2002:a81:92c6:0:b0:5a7:afd5:1cb1 with SMTP id
 j189-20020a8192c6000000b005a7afd51cb1mr31144ywg.1.1697695581761; Wed, 18 Oct
 2023 23:06:21 -0700 (PDT)
Date: Thu, 19 Oct 2023 06:06:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231019060616.1988631-1-hhhuuu@google.com>
Subject: [PATCH] usb: typec: tcpm: Fix NULL pointer dereference in tcpm_pd_svdm()
From: Jimmy Hu <hhhuuu@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: kyletso@google.com, badhri@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jimmy Hu <hhhuuu@google.com>
Content-Type: text/plain; charset="UTF-8"

It is possible that typec_register_partner() returns ERR_PTR on failure.
When port->partner is an error, a NULL pointer dereference may occur as
shown below.

[91222.095236][  T319] typec port0: failed to register partner (-17)
...
[91225.061491][  T319] Unable to handle kernel NULL pointer dereference
at virtual address 000000000000039f
[91225.274642][  T319] pc : tcpm_pd_data_request+0x310/0x13fc
[91225.274646][  T319] lr : tcpm_pd_data_request+0x298/0x13fc
[91225.308067][  T319] Call trace:
[91225.308070][  T319]  tcpm_pd_data_request+0x310/0x13fc
[91225.308073][  T319]  tcpm_pd_rx_handler+0x100/0x9e8
[91225.355900][  T319]  kthread_worker_fn+0x178/0x58c
[91225.355902][  T319]  kthread+0x150/0x200
[91225.355905][  T319]  ret_from_fork+0x10/0x30

Add a check for port->partner to avoid dereferencing a NULL pointer.

Fixes: 5e1d4c49fbc8 ("usb: typec: tcpm: Determine common SVDM Version")
Signed-off-by: Jimmy Hu <hhhuuu@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..792ec4ac7d8d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1625,6 +1625,9 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			if (PD_VDO_VID(p[0]) != USB_SID_PD)
 				break;
 
+			if (IS_ERR_OR_NULL(port->partner))
+				break;
+
 			if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
 				typec_partner_set_svdm_version(port->partner,
 							       PD_VDO_SVDM_VER(p[0]));
-- 
2.42.0.655.g421f12c284-goog


