Return-Path: <linux-usb+bounces-1948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 883CB7D061B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 03:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 17A14B214E7
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 01:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BD9648;
	Fri, 20 Oct 2023 01:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E6w/HQLu"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5B38F
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 01:21:39 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574BC112
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:21:38 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d815354ea7fso364752276.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697764897; x=1698369697; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=svgRlD+xMxXKSNv1D21nXe/Ukb4M7OikQcdxYN6vhEQ=;
        b=E6w/HQLu+MM7ZPt5y0dka0jHHkkNewlbZNJFvK/oeRDHncOpdSXgod5JH2BVF8wm9h
         MPiXB70QD9hXN4nxMNLkDxblaJ0lYMB2LfxHA4faV+1OUfPKiBA8qXnqVkJEdWdRBxJO
         NKIVD2OGfOua6m9uj0A32Wc0LulJ8aiBredMlKg9rH6if+/OCq82VeUwAg7FcMo0Wiof
         WCKzy9DmqJepUD/ycFXd0/xqSjiTeC1/HjxGGIji9TKXofO0ba42Cj8t0+0H1aH+pugL
         7foHYl9Jcz5wcD2qAd7oyEJKpjw+RAKYIJiERoU3xeLgPgpxtVaS8g3BaMtuakRR7Azp
         ldbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697764897; x=1698369697;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svgRlD+xMxXKSNv1D21nXe/Ukb4M7OikQcdxYN6vhEQ=;
        b=V1Xac0uh1rQBru7z8ZhgFuehXTbe3CQpWfNK9kd2Sjnb/mfWn4xEsqZYOyY1J5DF0m
         jXoYAseQOsruiqnhcfHSk3dC4yENLY9ikbud0+ujaUdhtlPzPg33XHbAn4KaRYk2Ch5A
         hQx5UuEUW9HLyzFXCSQOcpow7e08q5I79TaJDhRCX9u6RJCNinZ77n+HIb9DVN+2JuL7
         GhQoYn6Z+Pu3cVsQRtZcCtCBtlAuv01EHu5iXCivqBjPyE5suJXqCqk9PjMEnndnuemO
         DPdPy1u7t9R+3yWiRLm2mT2b1iC6C/vyewZQSU9HzTgdIZSGPM1yYOyk1nwXEj82cDlf
         tWqg==
X-Gm-Message-State: AOJu0Ywu2aO86hilHhh2JrDCL4NWdwMRDivdC3q86z8sb5t4XCwNvGMo
	aB1tEZyUsjyY35G41+tgsCwZGN9z65E=
X-Google-Smtp-Source: AGHT+IEVeJk3Qi++5fKSME7qdO8CAO8j6CVkisf6RVyyQg1hEpWsD9DIRASMsOOPNhJdtTnJfDNyeH2MfO8=
X-Received: from hhhuuu.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:c80])
 (user=hhhuuu job=sendgmr) by 2002:a5b:b06:0:b0:d9a:3a26:fb56 with SMTP id
 z6-20020a5b0b06000000b00d9a3a26fb56mr9102ybp.2.1697764897525; Thu, 19 Oct
 2023 18:21:37 -0700 (PDT)
Date: Fri, 20 Oct 2023 01:21:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
Message-ID: <20231020012132.100960-1-hhhuuu@google.com>
Subject: [PATCH v2] usb: typec: tcpm: Fix NULL pointer dereference in tcpm_pd_svdm()
From: Jimmy Hu <hhhuuu@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: kyletso@google.com, badhri@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jimmy Hu <hhhuuu@google.com>, stable@vger.kernel.org
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
Cc: stable@vger.kernel.org
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
2.42.0.758.gaed0368e0e-goog


