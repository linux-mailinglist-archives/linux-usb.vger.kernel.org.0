Return-Path: <linux-usb+bounces-9669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF418AF7FF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 22:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A4EB22243
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 20:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9899614290F;
	Tue, 23 Apr 2024 20:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxzSRujX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA1A5B1E3
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904053; cv=none; b=fofD60NzZA6Q50yj/k3Gs7FM2mdfh2eppo6/6h2hDTN8GGayMet3hW+UPCBmUaGQUK1GEIFAk/V6XOXiIZN2I7MYRyuz1B0oxGmQn/F1AM2VGHI4NAQdWknc2L72+HPmy821Hp2nl1PPYxY+aIiTkjnu4JzxxokVXU/i0FU1VKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904053; c=relaxed/simple;
	bh=lcfcr+1GhRDv8IVeIRF9u5dA/5mCN9+AaIerErbLA3o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MesOedi2X01zc/6+eknmUuv/bYjDLzAcdwNqmBgi2lHQzK272nYOUDAtEjy/MtZpsyNHuqfdjl/ZGrc2zg2OFRjep/b9sV9g5OTaT+5I/Ki1WUPSnaYugaxMf7J68VTpnaZcajpko03bx10dtELPF054wQXEEQY2Cq2SPPSBgOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxzSRujX; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61ae546adf3so97811147b3.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 13:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713904049; x=1714508849; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2i8rOHeh5RKwXjYUcNtV4zB/YO7tGxfhWF0DF/1cLZ4=;
        b=KxzSRujXX2yYda3YGKTnIy4ApWTa4qKhWwlWg//ZHW5l4swE9CP/orGArRxdf368/O
         pBBLbK/K6VEGFGs2H2+i3jF9jJvz8RHRiPF8aC9Q2NRbBGJPoOyTni1hRySUOOtc8poW
         rT++3yfRe9vEWaC/9u7pZfJzg50pKYER8LB3gr7SjGmu4nIZbZdoEXdDiPdx2DqAAKmM
         mtJlZC8rZGo3oNkf8r9LSY7zBKRkLSqj9vsoKIubLriW2yHO509yawS/sW3fOW1KkPeU
         S5/fUxmKaBpI3Ss15GyXmXuWtOzLEZwtrV1eXm96eOVcKVE8vvdxIm/8jQDVVOs1bPpa
         N7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713904049; x=1714508849;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2i8rOHeh5RKwXjYUcNtV4zB/YO7tGxfhWF0DF/1cLZ4=;
        b=pjmRHzWF6Kzd9ZzE2kbkwMFY3gUyMiughwxA8MyB3r+eHBSsd/zNlVaph4RBPeTT51
         rX2F2ofAmMc8eINy2VcQTxJGX8YlpXMI+AXIdlrmekryzcczgxsjb2kSP6ZdLP5cjwLS
         aTVg2tx9P8RF6X1AqrVE23WJcR9YJ1M9vDi5oAAf2sE5F3RecI8esH5EDUooy71SrUmQ
         W5Y/HFaJC7UxFqZt6QFx3iY2Tjz6eYPdrzv6TwXu+sJmleGEQqNghJnFp6EXzAoa4fP7
         UOAocFTWoOjx8t4QhvCCAlxHlm6DQvjS45EgDZvaN42PN7ONuqs9al/oP3y8j8vtGncz
         2d4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTAOxlEgMRW8tUoiGMY2MxtyZBxMx6HWPactIBFiWH58+nsGpEZQfmef+PCSPRw3yd9xAdrZZKKPOsm0HLDSOaE7MvQTmSbUHn
X-Gm-Message-State: AOJu0YxTszx7N25E4qRLqFzimRo0RpxTBBJRU3mhwc4d5XthfngWghlM
	M9+jzqmw3t/6jkUB25ZKqqncbr2weeduyPx2rhabBe1Xs8RnEvE7CB94PNuHdMwEpxh2byD4VmY
	hYa2+IWIHoFcjxQ==
X-Google-Smtp-Source: AGHT+IGarbd5K4uaWj4S1ITDwyHkqJfj0ZEmFs6fdBZvTxtKNXxpMjldoEZN/YiLU+j9pn2g704onWkB6aCSgp0=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a0d:e288:0:b0:61b:649:ac90 with SMTP id
 l130-20020a0de288000000b0061b0649ac90mr124315ywe.9.1713904049585; Tue, 23 Apr
 2024 13:27:29 -0700 (PDT)
Date: Tue, 23 Apr 2024 20:27:16 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=rdbabiera@google.com;
 h=from:subject; bh=lcfcr+1GhRDv8IVeIRF9u5dA/5mCN9+AaIerErbLA3o=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDGkakktYYi6sPmxr55z1O2bjw5mSD3P+1X0pFLqfL/96v
 8/dl7MmdJSyMIhxMMiKKbLo+ucZ3LiSumUOZ40xzBxWJpAhDFycAjAR5xZGhg2H9BSsfP9eF0o+
 +Divb9I6wVnFqtt737R8nrG5I5T9BBfDf5+IG96xxirbVl8r7rUtrZ4d2bdi06enZ1wYKqIiPrY xsQMA
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240423202715.3375827-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: tcpm: clear pd_event queue in PORT_RESET
From: RD Babiera <rdbabiera@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When a Fast Role Swap control message attempt results in a transition
to ERROR_RECOVERY, the TCPC can still queue a TCPM_SOURCING_VBUS event.

If the event is queued but processed after the tcpm_reset_port() call
in the PORT_RESET state, then the following occurs:
1. tcpm_reset_port() calls tcpm_init_vbus() to reset the vbus sourcing and
sinking state
2. tcpm_pd_event_handler() turns VBUS on before the port is in the default
state.
3. The port resolves as a sink. In the SNK_DISCOVERY state,
tcpm_set_charge() cannot set vbus to charge.

Clear pd events within PORT_RESET to get rid of non-applicable events.

Fixes: b17dd57118fe ("staging: typec: tcpm: Improve role swap with non PD capable partners")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c26fb70c3ec6..6dcafbaf10a2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5605,6 +5605,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case PORT_RESET:
 		tcpm_reset_port(port);
+		port->pd_events = 0;
 		if (port->self_powered)
 			tcpm_set_cc(port, TYPEC_CC_OPEN);
 		else

base-commit: 684e9f5f97eb4b7831298ffad140d5c1d426ff27
-- 
2.44.0.769.g3c40516874-goog


