Return-Path: <linux-usb+bounces-26579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DFB1D48E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 11:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B4473B89F8
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 09:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA72D25EF87;
	Thu,  7 Aug 2025 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GsnRebEp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f74.google.com (mail-lf1-f74.google.com [209.85.167.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4A25A323
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754557645; cv=none; b=QvJ1SlVGygSyhyDXqay/irqdxIIMeLgmU8kK9jbK/gEfYh5ECsxquSDSeoEkF2ZC7LM0ipk1LN4muOl6MLkXEN7OEmpyUJZa1JR7r+ICnhDbCjMNFOzaJng6t5vuZMz+nrSZHlC1J473cR3ECTGDbe4DJ06MLyBHJav2mRluEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754557645; c=relaxed/simple;
	bh=gWOqssh/B0zhOWj/hgJV7uLzIgiEe8s9kBaCELWoyKk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XnF42fCBeIrNjo+4WDvreaWy7FL+noySeb8f5UDm7pMunP6ye7XFXQ5cV8YvAjqscRKS7M3Lswb0ksUv+hDBYQbxt6TTk103QdHME0DU/he8kW17Iah75XLRSRSgE7f6mqCNlZOlYjasmbWcyP0Sjdjw+lzmSedy3TTj9M8/Iss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GsnRebEp; arc=none smtp.client-ip=209.85.167.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lf1-f74.google.com with SMTP id 2adb3069b0e04-55ba07af930so385767e87.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Aug 2025 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754557642; x=1755162442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7857YzQoqmpmB028bo2TGbiPP5wF9E/++uq/WGiIKkw=;
        b=GsnRebEp/k2t6992PQYbJpruGBzpSyKFcgJflyamRqM1fC/OlpeqXWLLhVZUGpI0A0
         K0RmumCw3iizF1fcEs0PupHBGPnP2de1anG1nn3E7IyaEXaoSGh1f8XpsX8oVyI+JrEH
         saXlfLtUHdnn6uZkP7rmGs7TsHizBMjBDs0ovBzadQxmXApVCH3H441q7Ire2bKT7YnZ
         SM8uv7hwDYw+BsCdArLZMRuCGbW5t8FLDWtopPBI+xxEiTe1RyqHj2f7/1gaN/rz/Ca7
         HgHrcgqYBW4rU/655FXbIjZxY/scfP662MoNV/vbXmP5VLNajmr5lybwUCLf0u3L9NTS
         vSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754557642; x=1755162442;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7857YzQoqmpmB028bo2TGbiPP5wF9E/++uq/WGiIKkw=;
        b=bZuXScIfsuce4s/xqL+aaFJDABrKyZrAbWtZF83huWnik7OQ/xrLUT70OCHpvIC9pm
         TCx+SHNorLrUCRyj08N6x0wgSI/gr5/+eOMz5Xkj8yJbdTXPmNA3zzlT5ehbZqN4t8IM
         Ja8zEXwlvFxlL3tPNVBhpCORfjD6DnbBR+0mtHnTclYIjoeEJCxeI/rJwu/M/HFUYUW3
         eGJNwNH9xBfst+Eu4gaROWnuV8FODzTAW0JAdK+iGIaDcl359/geqhM/icLIpxQKp4x6
         6GQeOx8+2Ligi6njuCJfHkYT+qcvFGX3jnWwcl2AlzfcUJ9nvZeD7LGqNgWPsNqvuNnq
         QTAg==
X-Gm-Message-State: AOJu0Yy4s5RWN+cXERhpHOAJlEp1YRSy+MJo1AIMT1vbdZm3O7f5LiGD
	fXvboG1bxmHPkl1coF+pSoBAFxXYQ4+OeQFyez8iLSkD2hYlc4QX+piHrOF5FfJ1ghmdKEXgitM
	zKxIbVw==
X-Google-Smtp-Source: AGHT+IGcYso9lswwa8L91nhsQT2KN51k8C00/kO55/cOHbQzKDJFXuLSSBDlGqgO/JEw4iEG5HMAZyjVZdk=
X-Received: from ljcq7-n2.prod.google.com ([2002:a05:651c:1107:20b0:332:7383:a5fd])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a2e:a00f:0:b0:32b:7811:d48d
 with SMTP id 38308e7fff4ca-33381231618mr11845571fa.4.1754557641541; Thu, 07
 Aug 2025 02:07:21 -0700 (PDT)
Date: Thu,  7 Aug 2025 17:06:55 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250807090700.2397190-1-khtsai@google.com>
Subject: [PATCH v2] usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
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

Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
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
v1 -> v2: Updated the commit ID for the Fixes tag and added the missing !.

 drivers/usb/dwc3/gadget.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 25db36c63951..68fa2813e5f4 100644
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
+	if (!dep->dwc->connected)
+		return;
+
 	dwc3_gadget_endpoint_frame_from_event(dep, event);

 	/*
--
2.50.1.565.gc32cd1483b-goog


