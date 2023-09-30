Return-Path: <linux-usb+bounces-842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D507B4317
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 20:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 041CF282BB4
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 18:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF79B14F9A;
	Sat, 30 Sep 2023 18:48:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637E2138E
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 18:48:28 +0000 (UTC)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38E7D3
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 11:48:26 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-565ece76be4so17962024a12.2
        for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696099706; x=1696704506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gKqACIemJ7xq8miKveFE694eSHgsnRyVWu3g5h4Gxp4=;
        b=3a4VBHeWdu0/zbAmE7je7DBZv+0KEc/xQMVeV+qdGK6Nr8LfehtgWbocwiY+dYlgLZ
         PAACuN7qj+NQTZTYVetASsQx8DYWkZfPrQMLvDAZhsCJnh2VqkpzBm5QJuOZI5l0TYbd
         ytUK3acBBgwxaufYyEunNxjsEqTnl8fX7f8RDIcUSmXu8umNAb0qqQtEm9vKHj/FgyjO
         hi+VVa00WP7deOyQ62HrgxmuBcGB1zwinhIq+/Tq4mACwE5ZRdEMCwF8O9vfacgT6s/J
         R7sDA70ZawaazXg6ttCdXpBFjiNL5rllXcIKbG9ejb5YX/gPVBCKk1sR2/bVwa8CqfmJ
         p3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696099706; x=1696704506;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKqACIemJ7xq8miKveFE694eSHgsnRyVWu3g5h4Gxp4=;
        b=sfzKVmm/IXluEfiaIKlrVeVqX7FykcYD42aAl6CgffAu8n1csm7tYm0533vbskjz1R
         F2s+oTtQJvcN+YX6fuE/IQ5UV2gSVRCgsxroWlHjpNOXNf8cLe2Sy/uhkZp57xtJjNpH
         ErzFtnp5hGlmTcuHuz1isvni/bqhALcsyXdfl6Ba8MLkrbqZ3ryFuebLiBzl322OYQmp
         n/+sh9ufeuOzvmz/Y09ALBGh+9s562vTt7SFFI9blCagOYMi0FdN2kDs/cA7XkpCn/PV
         AhDjaj3HZ/pu+otzTNbGYqYCpKcf8c/RAfHJqr2N7z4zYTRxmtyZ3N2EEtm1LwEUiCrE
         l9LQ==
X-Gm-Message-State: AOJu0Yzw4HrOSgSLsvqMvZOfEdJmZ+05V8zNmIK3lTwCiQIqSvm0z5qr
	eBvZXNz+D7koF9EJ0BW54MdBiZPSjCQm
X-Google-Smtp-Source: AGHT+IG9LKMHiCnD0PVucuSqHuzZlds0WM31PPnH9aY3/cS6xweL85gyTfLkJODb7y5rF0AgmHVDqDNkMnG5
X-Received: from hi-h2o-specialist.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:3cef])
 (user=arakesh job=sendgmr) by 2002:a63:6d48:0:b0:563:dddb:2016 with SMTP id
 i69-20020a636d48000000b00563dddb2016mr116191pgc.5.1696099706255; Sat, 30 Sep
 2023 11:48:26 -0700 (PDT)
Date: Sat, 30 Sep 2023 11:48:18 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230930184821.310143-1-arakesh@google.com>
Subject: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
From: Avichal Rakesh <arakesh@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jchowdhary@google.com, etalvala@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Avichal Rakesh <arakesh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

We have been seeing two main stability issues that uvc gadget driver
runs into when stopping streams:
 1. Attempting to queue usb_requests to a disabled usb_ep
 2. use-after-free issue for inflight usb_requests

The three patches below fix the two issues above. Patch 1/3 fixes the
first issue, and Patch 2/3 and 3/3 fix the second issue.

Avichal Rakesh (3):
  usb: gadget: uvc: prevent use of disabled endpoint
  usb: gadget: uvc: Allocate uvc_requests one at a time
  usb: gadget: uvc: Fix use-after-free for inflight usb_requests

 drivers/usb/gadget/function/f_uvc.c     |  11 +-
 drivers/usb/gadget/function/f_uvc.h     |   2 +-
 drivers/usb/gadget/function/uvc.h       |   6 +-
 drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
 drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
 5 files changed, 164 insertions(+), 65 deletions(-)

--
2.42.0.582.g8ccd20d70d-goog


