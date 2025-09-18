Return-Path: <linux-usb+bounces-26454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A982B19D5A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BD77188FE8A
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 08:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842F123ABA0;
	Mon,  4 Aug 2025 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="egdOofYm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B22B7DA6D
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294899; cv=none; b=ap8Y4OiTeBhlvU0ce9sZE4loMkRIzBqSsQ6Xmrj0FumsVAL49lGp/PoK9WU4DX+irjGvOVr7c2re1/I5HxzGmqFjtUvdQC5Lo5uT7+TnoK7DlaHDkkI0b+qlymbzhRkqY5SOmXRMaXY2OPb59+1a8TG2rAX3QkuZ8Q7BYwqXTgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294899; c=relaxed/simple;
	bh=gcEc+FpO3LIYPbjLO7I3aUUbBabMwLEp5GRofBB8rac=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bopbfTO5oRbgI3QvQHHW85kY1BVGMVc21vbq3Ia6gojgZLwgepOJUKkRXchbGvgVAV2teby09R667QtxFRjZ1sURhmS2qDzfXBFd4E0dW43NuPVaHQnNDHPADiwV5D04zkkJZZMIOdcrrnT9WGMgdCztR7mCrSlJ6c1vtUuOqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=egdOofYm; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-33243810731so16417891fa.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754294895; x=1754899695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zDpfVHh/I73JR0rh9yUDkpVjkFVk9LI6bMI7NvadtUA=;
        b=egdOofYmIxkeAMBy68PPJuHrG8NUOu0Wtp4GZj9sb7Qpm5wLRyrPrz+xslMieE1SpX
         Hn6LLelsYDLuX7OJx96tHX765e0pd4DOlEPYFJKx2wyogkPB2hwdR06k2azyrIyAc2jG
         Pksc/sSHskoidp6a3j2Cp4t4qFYfMzjxtawcTJU0oxW/VVNCT2ca559CXtZ8HcgfMiq5
         CyPZ4tiBtz/TZ6/6sSfCuE7MXmibymOKRscu5gCHA/VqXYUSyw7/vSTz8xfvFM6pyMi5
         9lxHU92SMJLv4IhiCRFTDralzi+uomhOsPcjAvS+54NeDuze5oxqLkrAJXfXzf2l1e0a
         iHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754294895; x=1754899695;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDpfVHh/I73JR0rh9yUDkpVjkFVk9LI6bMI7NvadtUA=;
        b=uAm9OJOQqHSulnPcGWF1iXCttGHDF9Z1+SH1GrKbiZmz2/gGBbzUZW+t55CzdQc4Zs
         5pxQzsWnO2o+1ik5cKKFKlDJlA6sPd3hwT5uREc20v+fVBUFO5Y8yAU/FgcCXMkSrVxh
         TF+ir4HfyNHajn62s0KMrdd66HEMy6+9Kt2sFQVBF6xjN0FkKh7M06NGsftEndTpk0gE
         iW/8WHJl/71qmKbRBDkqXuP2puUazWx75YdHu5481L5MO+ylq21C2/WxrV84M13FAuf+
         LFhuaSl6HrEjAGLygXM5HluxQDZYtHI18Qzj9vrcJUCTaldqo60552M5a3f9GUWiJIg3
         5tkw==
X-Gm-Message-State: AOJu0YyFp4Q0E/mX3Wl4HPVhA80jBAvCsCl/sDo/TceuWsHKVQPDHmEe
	bGbhls6ui5/Y8am+JI2cm9Hn108oW7uH/v8KGCW1RhKFlMWCqUukwr7S2rmDqHrjbq6GCRZTmsa
	hVksjcg==
X-Google-Smtp-Source: AGHT+IFI/+C03ECI+u2R1ZspoDxfTwxjzHt8Ag3z9DMpMi6xjyg97vO8zI4z85XpJM8zbEHAQDDflyTWYjk=
X-Received: from ljbbj30.prod.google.com ([2002:a2e:aa9e:0:b0:32b:8259:7b2])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:2126:b0:32a:8764:ecf1
 with SMTP id 38308e7fff4ca-332566a4766mr15538621fa.4.1754294895320; Mon, 04
 Aug 2025 01:08:15 -0700 (PDT)
Date: Mon,  4 Aug 2025 16:08:05 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804080809.1700691-1-khtsai@google.com>
Subject: [RFC PATCH] usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
From: Kuen-Han Tsai <khtsai@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>
Content-Type: text/plain; charset="UTF-8"

During a device-initiated disconnect, an xferNotReady event for an ISOC
IN endpoint can be received after the End Transfer command has already
completed.

This late event incorrectly triggers a new Start Transfer, which
prevents the controller from halting and results in a DSTS.DEVCTRLHLT
bit polling timeout.

Ignore the late xferNotReady event if the controller is already in a
disconnected state.

Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
Tracing:

# Stop active transfers by sending End Transfer commands
 android.hardwar-913     [004] d..1.  6172.855517: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
 android.hardwar-913     [004] dn.1.  6172.855734: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [40d08] params 00000000 00000000 00000000 --> status: Successful
 ...
# Recieve an xferNotReady event on an ISOC IN endpoint
    irq/991-dwc3-29741   [000] D..1.  6172.856166: dwc3_event: event (35d010c6): ep1in: Transfer Not Ready [000035d0] (Not Active)
    irq/991-dwc3-29741   [000] D..1.  6172.856190: dwc3_gadget_ep_cmd: ep1in: cmd 'Start Transfer' [35d60406] params 00000000 ffffb620 00000000 --> status: Successful
 android.hardwar-913     [004] dn.1.  6172.868130: dwc3_gadget_ep_cmd: ep2in: cmd 'End Transfer' [30d08] params 00000000 00000000 00000000 --> status: Timed Out
 ...
# Start polling DSTS.DEVCTRLHLT
 android.hardwar-913     [000] .....  6172.869253: dwc3_gadget_run_stop: start polling DWC3_DSTS_DEVCTRLHLT
 ...
# HALT timeout and show the endpoint status for debugging
 android.hardwar-913     [004] .....  6177.479946: dwc3_gadget_run_stop: finish polling DWC3_DSTS_DEVCTRLHLT, is_on=0, reg=0
 android.hardwar-913     [004] .....  6177.479957: dwc3_gadget_ep_status: ep1out: mps 1024/2765 streams 16 burst 5 ring 64/56 flags E:swbp:>
 android.hardwar-913     [004] .....  6177.479958: dwc3_gadget_ep_status: ep1in: mps 1024/1024 streams 16 burst 2 ring 21/64 flags E:swBp:<
 android.hardwar-913     [004] .....  6177.479959: dwc3_gadget_ep_status: ep2out: mps 1024/2765 streams 16 burst 5 ring 56/48 flags e:swbp:>

---
 drivers/usb/dwc3/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 25db36c63951..506391699a10 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3896,7 +3896,8 @@ static void dwc3_endpoint_interrupt(struct dwc3 *dwc,
 		dwc3_gadget_endpoint_transfer_in_progress(dep, event);
 		break;
 	case DWC3_DEPEVT_XFERNOTREADY:
-		dwc3_gadget_endpoint_transfer_not_ready(dep, event);
+		if (dwc->connected)
+			dwc3_gadget_endpoint_transfer_not_ready(dep, event);
 		break;
 	case DWC3_DEPEVT_EPCMDCMPLT:
 		dwc3_gadget_endpoint_command_complete(dep, event);
--
2.50.1.565.gc32cd1483b-goog


