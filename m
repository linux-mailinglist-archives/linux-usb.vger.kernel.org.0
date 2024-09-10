Return-Path: <linux-usb+bounces-14902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A81E097360B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5480D1F229F6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3802B18C32F;
	Tue, 10 Sep 2024 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlcVisH+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802B14D280
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967018; cv=none; b=paXOtRdfVg62haWiLkpfm68izlYwifBusXMM1/6y9TMzEAw0tLHBgdL9Imlruju0S/YX1HomEn2ZRym4KtcKbE1JfeGHAlz6Z3viqnpqiFijbMqt7OEsaW76sBb8HRH5Nzc/8JvBBdcThxO37DlrH7Cmsd2I5AKS7HEfgyo+fRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967018; c=relaxed/simple;
	bh=RzA8ZfBNebEsL0U5EB0QNzsHYZZILFS9ayPAuMzNedU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNOZzVLbQfcmyaNZ/clIixP21ALCI673BDP2w+sY8ts9nGPawfH7e/89OOnEorB+qXKGmo+GVUGPboxpWWhPN9eiY569k1sUUeTI37BhJXrksWxDL7fQq33Sm/dW4ne6Y3bpejr9W5EaLz8sUI/XZRvEknC4QEwSwu6DXBwNMPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlcVisH+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so515618066b.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725967015; x=1726571815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgX0n39MutN0cvoOhVPaaxt+3vWBflrma3+4LJoEaP8=;
        b=BlcVisH+ZRVtET0jlCK54rDjOWlgE5jDwcbJMqZqOc6KFAN9eHdrxM28uzQ3RoAuQ1
         UCc6bVQ56Qy7MXkWSWffycexvHS6EBx/sKQnlwmC4v3TFQjN7KmnILQGk8DPIjSBGhlS
         fojOQZDYTYmHUw2yba09BTO9sNC+6gNzwaWh/XiPsQhPZY+Uq/4N13JYxB3y13il369V
         4yGm+o+HoRWThxy5kQczWRk1gExJFa9nnJ/PrIcKxxjYOGgtPd+KP5k9x/CPclHD4vo8
         3N0n/ynH5O38c9HBeQoz7VcWr/veqNZ06OGEYYPLc7gGXC9b3AscJXbfLoKmdg7qOezI
         y5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725967015; x=1726571815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgX0n39MutN0cvoOhVPaaxt+3vWBflrma3+4LJoEaP8=;
        b=NseWlMeBGWEcQjCWd0U2oNRv8wqQ7Xka396S/9v2zveJEiCFBD/NG+mRLWfzzizQq3
         Ahnh3vVlcZLIFQxydo+pD6GzadZjwbMQHCizFjxS0AHel0p5u+ny0bfMRhbNT8Q6lJYk
         vZ0vW147FeQtAQTB6cvM+3xGoWQ3Q/yH7Pvmm7mhGk4F+YBb3Vb15yJgX9/C6EScYFGY
         uNJHUusjcF4/BRWeg6kV20jjCVGPqcoDGh/l/2JSBtx4sA9syq3QKc2qTSTaxxFWAe7q
         CSHTy7iCV4mmyPTdsAD7cxe6UtC55It8E7A2UX7eRhi+45SeRaux99t2vT1GOiTMe5fP
         ZJCw==
X-Gm-Message-State: AOJu0Yzqlsd7MzTBZQ5grYAf52gNIEJjKwVxmGdWeeVbLv3WAzOEGlJI
	DJpcrTh3uu1zcueOjVmd61HV2jOgn8Yz5ShwU3KQcIJf0S7YfDgW
X-Google-Smtp-Source: AGHT+IHhRZv8aH73spqLvaZpwaWLYgowTlUvPB3ENhkpsThbDaDF6Eti15Lz4Yo/uUuW+cDQi+o6yw==
X-Received: by 2002:a17:907:6d09:b0:a7a:8284:c8d6 with SMTP id a640c23a62f3a-a8ffb29987emr38307166b.24.1725967014954;
        Tue, 10 Sep 2024 04:16:54 -0700 (PDT)
Received: from foxbook (bgv123.neoplus.adsl.tpnet.pl. [83.28.85.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25951020sm468382966b.66.2024.09.10.04.16.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 10 Sep 2024 04:16:54 -0700 (PDT)
Date: Tue, 10 Sep 2024 13:16:51 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 5/5] usb: xhci: Fix Ring Underrun/Overrun handling
Message-ID: <20240910131651.6c4c0195@foxbook>
In-Reply-To: <20240910131233.409c6481@foxbook>
References: <20240910131233.409c6481@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Depending on implemented spec revision, the TRB pointer of these events
may either be NULL or point at enqueue at the time of error occurrence.
By the time we handle the event, a new TD may be queued at this address.

Ensure that the new TD is not completed prematurely if the event handler
is entered due to the skip flag being set on the endpoint. Or, when the
TRB pointer is NULL, prevent the empty ring warning being printed.

Now that it is safe to enter the event handler, also enter it when the
skip flag is not set. This enables completion of any TD stuck in 'error
mid TD' state on buggy hosts. Such problem could, for example, happen
when a USBFS application knows in advance how many frames it needs and
submits the exact number of URBs, then an error occurs on the last TD.

One bug remains: when enqueue points at a Link TRB and a new TD appears
after that, skipping will remove the new TD prematurely. This should be
255 times less common that the 'matching TD' bug being fixed here, and
it will take a major improvement to the skipping loop to fix.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index db9bc7db5aac..475b4d69551b 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2726,14 +2726,10 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * Underrun Event for OUT Isoch endpoint.
 		 */
 		xhci_dbg(xhci, "Underrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		break;
 	case COMP_RING_OVERRUN:
 		xhci_dbg(xhci, "Overrun event on slot %u ep %u\n", slot_id, ep_index);
-		if (ep->skip)
-			break;
-		return 0;
+		break;
 	case COMP_MISSED_SERVICE_ERROR:
 		/*
 		 * When encounter missed service error, one or more isoc tds
@@ -2824,6 +2820,15 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 				skipped, td ? "":"not ", slot_id, ep_index);
 	}
 
+	/*
+	 * In these events ep_trb_dma is NULL or points at enqueue from the time
+	 * of error occurrence. If it matches a new TD queued since then, don't
+	 * complete the TD now. And otherwise, don't print senseless warnings.
+	 */
+	if (trb_comp_code == COMP_RING_UNDERRUN ||
+			trb_comp_code == COMP_RING_OVERRUN)
+		return 0;
+
 	if (!ep_seg) {
 
 		/*
-- 
2.43.0


