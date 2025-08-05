Return-Path: <linux-usb+bounces-26486-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6899B1AE6B
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 08:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D509E16543E
	for <lists+linux-usb@lfdr.de>; Tue,  5 Aug 2025 06:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1E22192F5;
	Tue,  5 Aug 2025 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IaQ0US97"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973EAA927
	for <linux-usb@vger.kernel.org>; Tue,  5 Aug 2025 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754375659; cv=none; b=DI9m26mwQCPwlmOclixc5DiKc63ZVxD6U8dayL6qG9tEBdeBounba0MuJlPFa6a9ZmI6lZnd1s8TMM7utA3Z8obDxnz7aWvnAd/fYlxTYKgPDERe4Jph997HVqRBo5jcnomBg7OBhNLZz6XFgjlNIDNCgGtQXG/v3Wd4JA7bkOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754375659; c=relaxed/simple;
	bh=cixIAO8oXA2knbhtv7yiIJY9vKrJjFWNPFcHiT/tnZA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=lSqH/pPQIJjJrJr07LsbgNJxvyu8tyJQeN/bOEAxNmVDJccR156NgXoxXPl90RW+Q6MlTYO5Rd7MIWkox/4BhE48WjdOWSN76SZ23RFQ2wdqyGEUDXPiNcZhgXcV5TtsRykUnRzL2/RPFB+aaAQCRAreo/cYHrKDbC1qkbapM1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IaQ0US97; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-459d5f50a07so9854535e9.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 23:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754375656; x=1754980456; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4jcziFTCywaC5rIJAZm6+DjYPtaEFdHTnELvD+78CD8=;
        b=IaQ0US97fR2ekIBdWwzzYiV4DjyKZWyOSntsOMqQ98fDlzghbKEcrlkJv1CACa+odr
         9EfDqERgX8aiSclO3/Q0ZSzjXe7eU3boawyeXCSNPx8V1yd2bK+fDalgc+yTjBRPcJCo
         Ct1DCenftR7zJE0/8ac9lIE5ud61+6nagjpyLpqlD4T8L9jWm7zHeDNielvO/p7+4Ba6
         GrcceVOFMfzamvseTGws4nRYE6sRcRjQVlhNgpbViLUbRSBasQC6DVtNnTe6FvDCcVz2
         YAFLLdTwpM56T+a++ObWqbHZKDFmtIr9mzoiDH+oj2CMiRqEhICCXYDRKto5MQefvHH5
         9vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754375656; x=1754980456;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jcziFTCywaC5rIJAZm6+DjYPtaEFdHTnELvD+78CD8=;
        b=wDZiJoHRkIAmX8mVZq2HYmnMhqZrwdVhn64CM/yOGTK2EpqpbySsmNKORUV6wp1jML
         e9JtjxS07S73k4yrTaiQc6X1w1wn+kYhm3V53exG/jPNB69ZDD6aiUcNV+BQP5TeAYYN
         +PkcX5WhkhebL+btzxsB0EbVPXY15SzqgJRHLqBOQAf5BSzMidFk3rJbuwKP5Z73ZcZ6
         Jg4JnGEXiseZcDCaZaYjlyEw88cIIA3kLvt4XZqukgn07MQ4IwWNjsYr58i6lpcd65gS
         4oBd/6K9ivYDhxGoPe3LqYnbpHnZEZrAqLvRqHnx7NtJ+r51gR1hJgo3YBVRjQWDrZOU
         wnTQ==
X-Gm-Message-State: AOJu0YyO9wErE9s/0H1jFX7kc5Svqu0kxnO9K2tpD4hyolLnepJL21LU
	nhtoa/UAiIGZF1IARs74/WDK8lepgG65oXIyGy3Y4p5DVnD+a5ZM5wKSBoMdJZHuFJgEpI0u6lE
	R1PSCOg==
X-Google-Smtp-Source: AGHT+IH+SZCeGSGnjYQjRBM14WrANNPTb10svYVRYIcvIDrsT7KCEZNOf2pjlIe6AS7lbpPHhzvdUW/c8dY=
X-Received: from wmbel9.prod.google.com ([2002:a05:600c:3e09:b0:459:dcca:571e])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ba2:b0:459:e025:8c5a
 with SMTP id 5b1f17b1804b1-459e0258d84mr25184895e9.33.1754375655980; Mon, 04
 Aug 2025 23:34:15 -0700 (PDT)
Date: Tue,  5 Aug 2025 14:34:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250805063413.2934208-1-khtsai@google.com>
Subject: [PATCH] usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"

During a device-initiated disconnect, the End Transfer command resets
the event filter, allowing a new xferNotReady event to be generated
before the controller is fully halted. Processing this late event
incorrectly triggers a Start Transfer, which prevents the controller
from halting and results in a DSTS.DEVCTLHLT bit polling timeout.

Ignore the late xferNotReady event if the controller is already in a
disconnected state.

Fixes: 8f608e8ab628 ("usb: dwc3: gadget: remove unnecessary 'dwc' parameter")
Cc: stable <stable@kernel.org>
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Tracing:

# Stop active transfers by sending End Transfer commands
dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [40d08] params 00000000 00000000 00000000 --> status: Successful
 ...
# Recieve an xferNotReady event on an ISOC IN endpoint
dwc3_event: event (35d010c6): ep1in: Transfer Not Ready [000035d0] (Not Active)
dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [35d60406] params 00000000 ffffb620 00000000 --> status: Successful
dwc3_gadget_ep_cmd: ep2in: cmd 'End Transfer' [30d08] params 00000000 00000000 00000000 --> status: Timed Out
 ...
# Start polling DSTS.DEVCTRLHLT
dwc3_gadget_run_stop: start polling DWC3_DSTS_DEVCTRLHLT
 ...
# HALT timeout and print out the endpoint status for debugging
dwc3_gadget_run_stop: finish polling DWC3_DSTS_DEVCTRLHLT, is_on=0, reg=0
dwc3_gadget_ep_status: ep1out: mps 1024/2765 streams 16 burst 5 ring 64/56 flags E:swbp:>
dwc3_gadget_ep_status: ep1in: mps 1024/1024 streams 16 burst 2 ring 21/64 flags E:swBp:<
dwc3_gadget_ep_status: ep2out: mps 1024/2765 streams 16 burst 5 ring 56/48 flags e:swbp:>
---
 drivers/usb/dwc3/gadget.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 25db36c63951..ad89cbeea761 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3777,6 +3777,15 @@ static void dwc3_gadget_endpoint_transfer_complete(struct dwc3_ep *dep,
 static void dwc3_gadget_endpoint_transfer_not_ready(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
+	/*
+	 * During a device-initiated disconnect, a late xferNotReady event can
+	 * be generated after the End Transfer command resets the event filter,
+	 * but before the controller is halted. Ignore it to prevent a new
+	 * transfer from starting.
+	 */
+	if (dep->dwc->connected)
+		return;
+
 	dwc3_gadget_endpoint_frame_from_event(dep, event);

 	/*
--
2.50.1.565.gc32cd1483b-goog


