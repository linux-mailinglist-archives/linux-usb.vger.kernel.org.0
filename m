Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5AE39CDFE
	for <lists+linux-usb@lfdr.de>; Sun,  6 Jun 2021 10:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhFFIQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 04:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhFFIQt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 04:16:49 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 881CFC061766
        for <linux-usb@vger.kernel.org>; Sun,  6 Jun 2021 01:15:00 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id f18-20020a0cbed20000b029021ef79a8921so8187246qvj.17
        for <linux-usb@vger.kernel.org>; Sun, 06 Jun 2021 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=VOkk9SHKODEiIaCjHRVGDFttv1xB96FlGn6EoEewOHo=;
        b=iDi+D4O/64oMalj7NDWxWFAJhNOxmwvywuHRupaZeJVE44Cwq1VIfhbgZbehE8iYQM
         EYid8RlUhLT0xc4twZV6rknQ+Jqky6Egc6Iymtaal5SUi5QaLGCxfGcQe8FhofhJuVwV
         Z/jZisMQwazLdgX/a9pIHpF8g4pHhBu7M8oc5jH497nDTitfifFNNShHolzp2bfnhflN
         r/BTKt+iS6TXUDY/t1sUuqtwlX8+tbR2I+KzrqoKKKvOuwFUnY7ZIqE+vj6ugVlcP7ZT
         oZizGgYnT7j82zX/sjqpmsrl6/za8OJCMJfGxlhDhi/sbGSVQqngUrNhPo38kvTtAhIm
         aHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=VOkk9SHKODEiIaCjHRVGDFttv1xB96FlGn6EoEewOHo=;
        b=AUl3yWWWY8FetpTU2i2Z29ui8sUDc4+0HapWft4s6cGjgMnoiAbZdtf8O0aRZjKBYl
         UVEf4UyfVDLI5dJ73IkI9T7Ehja0ZOw5JZN/XpR99bKGQtzaCFHra0YrTKfbd2hm/w67
         KLMoChrotqMivwve4h9GbkuYm74OxY6NJdR7yPgbsI8ivLbI7KRhwNwtlbpcukv97847
         IpA7wMaHR7j6taEpQN2QNCIGtVSkWGAXlTNXs9TN/2tg4kMkvWm1jnmF4W04hyEEtuYQ
         zoNjEH5pGl8UCIShJ3ZNrv6BUejQIrl3TDtVmiR0aeyIbRABkeiHDxE5vlYjUyJqq3Cv
         9Gyg==
X-Gm-Message-State: AOAM5323Ife/t2EmOfzO7oHtIkSoA0OklaYzoKBXikV2T4cSlSDNDrYP
        AQtUvKbkQHCD+/xc2Q0SvGooGmZgQzaI
X-Google-Smtp-Source: ABdhPJy4We1ZBM0a34557fIrttfTWocguftYAyyopbi5pamCZqd3FxN+7xSZFyPhZCzYm5jp40HNHnl8/HpK
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:5235:5c99:43:ac3])
 (user=kyletso job=sendgmr) by 2002:a0c:e942:: with SMTP id
 n2mr12441036qvo.5.1622967299273; Sun, 06 Jun 2021 01:14:59 -0700 (PDT)
Date:   Sun,  6 Jun 2021 16:14:52 +0800
Message-Id: <20210606081452.764032-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH] usb: typec: tcpm: Do not finish VDM AMS for retrying Responses
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the VDM responses couldn't be sent successfully, it doesn't need to
finish the AMS until the retry count reaches the limit.

Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 0db685d5d9c0..08fabe1fc31d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1965,6 +1965,9 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			tcpm_log(port, "VDM Tx error, retry");
 			port->vdm_retries++;
 			port->vdm_state = VDM_STATE_READY;
+			if (PD_VDO_SVDM(vdo_hdr) && PD_VDO_CMDT(vdo_hdr) == CMDT_INIT)
+				tcpm_ams_finish(port);
+		} else {
 			tcpm_ams_finish(port);
 		}
 		break;
-- 
2.32.0.rc1.229.g3e70b5a671-goog

