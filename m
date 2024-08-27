Return-Path: <linux-usb+bounces-14192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25AA9615EC
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 235481C22F99
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A001D0DD4;
	Tue, 27 Aug 2024 17:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaA7cE3s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2521CDA3C
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724781061; cv=none; b=WlZzBdt30Dc0KhU/P4E8SPjv1Bn3/EcGgZkOeU++1O6oYf400AxemqMxZbWSkryrv854hRg8E3mnN2XQVak8Ye9L8FZMA5W9Hp7eEUyZMTbGWXRa7k7dydwCKpFtJa1BAK2TliKowkhXK2qMWY8JmwJv8CLBUfL3qINuJGl2Sqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724781061; c=relaxed/simple;
	bh=YCK56ta0CfLsO43jOU410kxlnlorAXMODs4yZCTF/vU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJBn3o3qXKZcjap/kX9ggyEwExZMXwj5Rldk5BMz2C2wKfkm2FThFeAFD9nAoCS1deHvjAwfCCX038WmBKo+fsS9ZfDdSh98I+7nPkVNb9SevvaosDyN82tQH8fn7q5rqEyEG/fkxQVJsMczzaBjnqaS4ktlRP7dfgBmigGRAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaA7cE3s; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5334c4d6829so8110032e87.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 10:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781057; x=1725385857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0GlT7wq+kWJRxuNuJdkkcFinJAX6r3HFmUAqyEvvGk=;
        b=EaA7cE3sHonsehJyug3PMtsxnRANg+5crB+IsksH1fQ4X20fWRCJRISo5oPDWr84ms
         1I6hsB72/nmqE/V6JVudtCuMySxFZd+5QCG0ZVTeR2CLZ4UfAPK9tl+m8KkOMPfFIyfz
         9YOsfgtppEztlMuOxqtFhagi8OjLU0li6wAtRMmSUjwtr0VX7sd9xnugl27y4+KLQS6m
         1ATk3e4pFoj2IKEZC00PkOw4uE8N580jDfhPgT/F1s3wcQTq2mvmb0dh5PLR0NVSVPqp
         DLsquRR5xT22jJrwNPTsz0ttfDEBLgkUQbeAL5Anq+8sxciSF43MJ8lTNyvXlFSiUHLb
         bA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781057; x=1725385857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0GlT7wq+kWJRxuNuJdkkcFinJAX6r3HFmUAqyEvvGk=;
        b=ukxPGuooGLmBEYzhGPqWxSqZU3X23h2hNicxjKEYMnpnh/FmCPGYRiWAh6sYeCN+gF
         Xe7/mi6jh7euXI0FN13/ZwOx+ouVJWbFfIH/MFQ9TrCzIxVb1q/VS3wm+7jtL/0w2G21
         kWbO+3ai9hmCh7ycb0WMkhUPHM+sEgfx/6aX85YaPbNbCghpH1D08D8+diOeCR1+RYTT
         /086d6rpw+epPx6mSwqcUf+1omvXrlLf7gp2OchVh6jlpKZf2jqIxL35RYyqZdsig5WV
         SfISZFxpBndS19JJABQ7xd0ETOvHC2SA/FbkcApNPHuvPQU+0w1hcWMY2bRs/l3nQRy7
         EM1w==
X-Gm-Message-State: AOJu0YwIEdZUTy5pJJeAsnsUmFfpTELhrAzBbOoL0pMtqe8zgZzQ1TNt
	dROH4DXpb8p8s/pwJYpNiwn7eqiTek9aDN9rfEfNtOZmhR2PjmCe
X-Google-Smtp-Source: AGHT+IFueuyJn289uVgeqDWxf+R8nBN6YkFa+hzK0meAFSKJCvhPmx6JuXB9DqMNTwRNOUMVVetFHQ==
X-Received: by 2002:a05:6512:114e:b0:52e:fd75:f060 with SMTP id 2adb3069b0e04-5344e500ad8mr1986797e87.61.1724781057018;
        Tue, 27 Aug 2024 10:50:57 -0700 (PDT)
Received: from foxbook (bgu35.neoplus.adsl.tpnet.pl. [83.28.84.35])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5343696592bsm1611650e87.128.2024.08.27.10.50.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 27 Aug 2024 10:50:56 -0700 (PDT)
Date: Tue, 27 Aug 2024 19:50:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 4/9] usb: xhci: Expedite processing missed isoch TDs on
 modern HCs
Message-ID: <20240827195053.185f5a91@foxbook>
In-Reply-To: <20240827194625.61be5733@foxbook>
References: <20240827194625.61be5733@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xHCI spec rev. 1.0 allowed the TRB pointer of Missed Service events
to be NULL. In such case we have no idea which queued TD were missed
and which are still waiting for execution (and the spec forbids us
guessing based on frame numbers), so all we can do is set a flag on
the endpoint and wait for a new event with a valid dequeue pointer.

But hosts are also allowed to give us pointer to the last missed TRB
and this became mandatory in spec rev. 1.1 and later.

Use this pointer, if available, to immediately skip all missed TDs.
This may be particularly helpful for applications which queue very
few URBs/TDs for the sake of lowest possible latency.

It also saves the day if the next event is an underrun/overrun and
we will not get a valid dequeue pointer with it. If we then saw the
skip flag, we would have no way of knowing how many TDs were missed
and how many were queued after the host encountered ring underrun.

Handle Missed Service Error events as "error mid TD", if applicable,
because rev. 1.0 spec excplicitly says so in notes to 4.10.3.2. The
notes are no longer present in later revs, but rules of 4.9.1 should
apply universally.

Note that handle_tx_event() can cope with a host reporting MSE on an
early TRB of a TD and then failing to signal the final TRB. However,
in such (hopefully rare) case latency is not improved by this patch.

Tested on ASMedia ASM3142. This USB 3.1 host gives valid pointers in
Missed Service events and the skipping loop works until it finds the
last missed TRB indicated by the host. Then the skip flag is cleared
and the TRB passed to process_isoc_td() like any other.

Tested on NEC and VIA VL805. These USB 3.0 hosts give NULL pointers
so the event handler sets the skip flag and returns, as expected.

Change inspired by a recent discussion about realtime USB audio.

Link: https://lore.kernel.org/linux-usb/76e1a191-020d-4a76-97f6-237f9bd0ede0@gmx.net/T/
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index e65cc80cb285..cc0420021683 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2413,8 +2413,14 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		frame->status = -EOVERFLOW;
 		if (ep_trb != td->last_trb)
 			td->error_mid_td = true;
 		break;
+	case COMP_MISSED_SERVICE_ERROR:
+		frame->status = -EXDEV;
+		sum_trbs_for_length = true;
+		if (ep_trb != td->last_trb)
+			td->error_mid_td = true;
+		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
 		frame->status = -EPROTO;
 		break;
@@ -2730,13 +2736,17 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * When encounter missed service error, one or more isoc tds
 		 * may be missed by xHC.
 		 * Set skip flag of the ep_ring; Complete the missed tds as
 		 * short transfer when process the ep_ring next time.
+		 * If the xHC tells us the last missed TRB (ep_trb_dma != NULL)
+		 * perform the skipping right away.
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag\n",
-			 slot_id, ep_index);
+			 "Miss service interval error for slot %u ep %u, set skip flag, go ahead %d\n",
+			 slot_id, ep_index, !!ep_trb_dma);
+		if (ep_trb_dma)
+			break;
 		return 0;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
 		xhci_dbg(xhci,
-- 
2.43.0


