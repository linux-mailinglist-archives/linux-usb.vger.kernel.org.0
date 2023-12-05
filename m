Return-Path: <linux-usb+bounces-3724-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DF804B57
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 08:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DAFBB20CDB
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 07:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8862D63A;
	Tue,  5 Dec 2023 07:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OWniOsrS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B30CB
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 23:47:53 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5d42c43d8daso31113767b3.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 23:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701762473; x=1702367273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=INmJtN8JS6E2KqYHMrd6XJhzfWKSoCLZVNWKsSG3lEY=;
        b=OWniOsrSMKVMYXAk8BCgzDxnombhAt6q8Mxh2L/xIrYRy4SXYzSCjZq7+dvhz8H/Su
         twZpePhjB6/JtlEZ3M1j98DsG6o1UJOAOINA0QiiHrLO79hJA3ozLTGD7qF2xExeiNG4
         UYBCG3+0KzBzAft4wJyl6yZz5DS2mMpFfcRKjC7ZgmKBOPxuM5tygr3eh7SQLWtFDUTP
         oekyFlyL5qZp1x1tJAHWbsHYsq55+uzuMxhNtXu9JaFXBm0/oycc2ZfZQiUY7VvY0G7N
         EJz+pjuFLNDm1IzpDeTcQgjNs3QNVvoX/lcOI9W7DDaXpAv+mbYe5vlVY3d8Dt156E3N
         t7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701762473; x=1702367273;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INmJtN8JS6E2KqYHMrd6XJhzfWKSoCLZVNWKsSG3lEY=;
        b=lg02IPJFohTGUf0KZeCqrieYUwpc8HBby0GIIItdU35PZLROqfszk2bn/5g3dV4f9b
         lSZ/8NsAwpfNXqKgk2QiEjTEvLUFHPgkZDbGs+3UwslC6zsTczEbIvmWNdvbgEE9RJKc
         fcTR4q5Uq0vxz6rEzIq6YZX4xjst7ia0nkPBdRBfzq8sjYPPd7YPqmxOwuPbnXuwwCoR
         Dg/BGrUp4nLECdEhCEsgoXdu/I3CIj+3QH/ssWNBl6hH0rnKhm3tjd43QTT4tKCjAiBp
         5uKDSb/SoRwOKyvvby92RUMYfwojc0+7JtfYdos3Ck0xGA8o7L7HWTi4ZwCKuf9ag3Pp
         +UgA==
X-Gm-Message-State: AOJu0YyhFsPWZabCXWnPNA13Tf6shBJKo/8VPLxD1nvI37avTFajZTXW
	QpgYz2i/4cUnKu/3Mma5CbEKUK7lZqxU
X-Google-Smtp-Source: AGHT+IHDsrM5qG/g3mwo20j/t3aM3nd+n7sqb+4JfPSK/lkd4YpfB95s9xXGLrPXQwyaAktUjLXY5Pvp3WQW
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:8ac9:92f2:1a10:4e1c])
 (user=kyletso job=sendgmr) by 2002:a05:690c:842:b0:5d3:e8b8:e1fd with SMTP id
 bz2-20020a05690c084200b005d3e8b8e1fdmr47271ywb.3.1701762472940; Mon, 04 Dec
 2023 23:47:52 -0800 (PST)
Date: Tue,  5 Dec 2023 15:47:46 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231205074747.1821297-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Query Source partner for FRS capability
 only if it is DRP
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"

Source-only port partner will always respond NOT_SUPPORTED to
GET_SINK_CAP. Avoid this redundant AMS by bailing out querying the FRS
capability if the Source port partner is not DRP.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 50cbc52386b3..192c103e0d10 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4401,7 +4401,8 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_current_limit(port, tcpm_get_current_limit(port), 5000);
 		tcpm_swap_complete(port, 0);
 		tcpm_typec_connect(port);
-		mod_enable_frs_delayed_work(port, 0);
+		if (port->pd_capable && port->source_caps[0] & PDO_FIXED_DUAL_ROLE)
+			mod_enable_frs_delayed_work(port, 0);
 		tcpm_pps_complete(port, port->pps_status);
 
 		if (port->ams != NONE_AMS)
-- 
2.43.0.472.g3155946c3a-goog


