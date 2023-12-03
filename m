Return-Path: <linux-usb+bounces-3624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FBB802700
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 20:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E73E1F21165
	for <lists+linux-usb@lfdr.de>; Sun,  3 Dec 2023 19:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3897F1863A;
	Sun,  3 Dec 2023 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apW0MUyz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC794D50;
	Sun,  3 Dec 2023 11:33:51 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d3efc071e2so27867697b3.0;
        Sun, 03 Dec 2023 11:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701632030; x=1702236830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y6lWc8aIDYdMYtX7xVGo+jJQtwQekFKvBPUzRmUIdQ=;
        b=apW0MUyzv4uVWmCyq78Ni4VFmdVx3jye1P8LiQAbfkfx3RJ9OezpN+lmoAnapH6j3r
         Y73rGJbilnWKQnrlXFLIQGRg0l896/cvabhmwnRecNrgqTguCwcAn8coPiB/fjBgV4yA
         8sn5gTgOlWAKpb+wIf6iczYihB1+6OYyg23eqkeQF1fXl+mbkkONRHXGjo60oS48r4ch
         dYifS8f+WFEuRt8kwqVbWA7jkNBjI0BdjVFUbb23wZ4zlrKrhqXnvrRW807TfUnf+CSL
         P+pGzxhIoA3JiyPTE2KhN+wKKPkZ47HHQK26aNx5RROZUWCpjjJhw+BRlbKaP2gZztLt
         uLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701632030; x=1702236830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y6lWc8aIDYdMYtX7xVGo+jJQtwQekFKvBPUzRmUIdQ=;
        b=kBAIxvkV9Cc3hdUgytujirINXlssTAIY7Vf54hu5kYi9IEliG0i+kBQqU9DRr3/lgE
         tM01+CSK/IboGxEMTl0pTsxcYatlT24vxy80lpktVOWijkoDPK6r4VXtUU1Ze9XIwKkC
         EbdS4kpuN3zni2jPyF8LUf+VBKtvRqblxEWJJP9qWLZYxnGRC11kmgMXnIRFom2Go0cW
         4s6T7qxtEP5hm7Iff05Whm07W05RjWt1Hb0S9t+cwf3FwTpLvsMbuan5vTtcFk+SD1XH
         SZRtmBLtTu3dXqT4aKN/afk3mNKdi6oPjk1Y9aF3aeaqRzc4H6NMs8p+9S4tDcqkM9Qg
         s7Eg==
X-Gm-Message-State: AOJu0Yy2v32zGdNBNYrRWd32Lto56WImbShEqFpd+Q2MaXLtoG9tcXOj
	/ul2qD2xdtIN1Sm70K+UZPsh/uKNtMajfA==
X-Google-Smtp-Source: AGHT+IGOK9mD9okv5pOrk47u6hZJaF3mocMEXPtt8mLBuZqzR8skLGhdxIF/5v+SQ04OfyLAuIgeBw==
X-Received: by 2002:a81:a110:0:b0:5ca:da4c:306a with SMTP id y16-20020a81a110000000b005cada4c306amr2218038ywg.51.1701632029791;
        Sun, 03 Dec 2023 11:33:49 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:cb98:c3e:57c:8191])
        by smtp.gmail.com with ESMTPSA id i206-20020a0ddfd7000000b005d361dd6454sm2674399ywe.87.2023.12.03.11.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:33:49 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v2 23/35] usb: cdc-acm: optimize acm_softint()
Date: Sun,  3 Dec 2023 11:32:55 -0800
Message-Id: <20231203193307.542794-22-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203193307.542794-1-yury.norov@gmail.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231203193307.542794-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acm_softint(), uses for-loop to traverse urbs_in_error_delay bitmap
bit by bit to find and clear set bits.

We can do it better by using for_each_test_and_clear_bit(), because it
doesn't test already clear bits.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/class/cdc-acm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index a1f4e1ead97f..8664b63050b0 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -613,9 +613,8 @@ static void acm_softint(struct work_struct *work)
 	}
 
 	if (test_and_clear_bit(ACM_ERROR_DELAY, &acm->flags)) {
-		for (i = 0; i < acm->rx_buflimit; i++)
-			if (test_and_clear_bit(i, &acm->urbs_in_error_delay))
-				acm_submit_read_urb(acm, i, GFP_KERNEL);
+		for_each_test_and_clear_bit(i, &acm->urbs_in_error_delay, acm->rx_buflimit)
+			acm_submit_read_urb(acm, i, GFP_KERNEL);
 	}
 
 	if (test_and_clear_bit(EVENT_TTY_WAKEUP, &acm->flags))
-- 
2.40.1


