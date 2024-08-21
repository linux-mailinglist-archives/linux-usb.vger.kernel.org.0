Return-Path: <linux-usb+bounces-13795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03732959CAF
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 15:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873862820D1
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A76190472;
	Wed, 21 Aug 2024 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I6MQdlqG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D660161936
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245364; cv=none; b=b/qsWm4M5gl9Idpu6OVey8hQZ+Jd1bdbXnAxACCi/g6nejMBISOy67al6hkiXnmDeGRVjO6e3mFNpKTH/n0lToF4ksjpDR/cGxKOizyllaNieQ7EshDOW8SjdRt+F0cBXCG+f8nd0/u7lnC1Vbmkc6n/KdUH3bbeQLnOm/+Eh6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245364; c=relaxed/simple;
	bh=akhq/CdT+L0Vh/+Pm264J1J45oVAHfo3szEuMlJfWv0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGxIlPp3wlLJwRhSy0dCZkmbtChtT2qWgKP0y3UMar+ez0GJ7gTwDSFNelYlRL3qi2gAyxFi9zB/ytIHVRzhTCShUUwSL0qpyCGfC9zCql5FAuka9bU5GS5ikUF4AzqI9uuRvHrL9hkBTCGBePqxdfRCI0jU44W7TZql1Lc6KSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I6MQdlqG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5334adf7249so567313e87.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 06:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724245360; x=1724850160; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ6cBCrys9GNQbW6UJcQz24fc8KJmNbuT4O7q7oXbEo=;
        b=I6MQdlqGiFZA0bvbUWN+Ne0VlNZu6cuNVyjQUb8tnU1XFH5RnHVhUp3B0nRatBulMv
         btwFUfERMx2FOt3UfTawacWIGnPHJAvWOHfBxDYfAXRAJh6K7ZVXIrEo8KX+qjD9VmVY
         lnbYO1w+9uiMcOBHXWjiPeiQXOr4DKGLl7clSzD2Bzw0UWAVBDfxVRbB0modhe30QFxl
         Ejnj4FZVh8HdqZdfBoXAHA6DyAErnAfAjwdsK84Jwo2AN1gcSdPQ3cQo/4YhrT3UxP2X
         6DDeo99SJvi7IaOaVLsMDfLjuyYvVYdwRUUOqnA6ISuI5uco78cKc18a1sqNggpIdBjI
         5fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724245360; x=1724850160;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ6cBCrys9GNQbW6UJcQz24fc8KJmNbuT4O7q7oXbEo=;
        b=Xav2IEygjzm1brsC6pUyd7a0mde6aktLiVpjWYhvkpGCcc8+HPC/HtPwyYAEIEZ9Jr
         FyxVY/DR/Q7majn4jaJfK9veBK2HVbirQJ3D/wHaT5fO6/Fsc4d0LUGLkduP3z+6pH8k
         HjeuDexyRPSjBPYf/dKKK0j8RqHsKjBUm8+My7D2T3lqldy8q0WPyXuIT9WDXvICaPkL
         Jjm9uaAVQrnITbkrszE+BQC7j+AzDSfc+wRXcMZkxKbAtOl9R0PBEvrmoctKfRz1Yn4M
         CRvVTiCI/YerJ+3USA2rOtuXs4rj7bEIQC6GzJxhTsTZ6ziiVRur563C81R5IUgv1SXp
         MWzQ==
X-Gm-Message-State: AOJu0YxK8PY8UUTERghzOjHK2Kf6Qfpzbm2WW36lMKKN1G7ti5Cw7DHQ
	RRqgDyCq1NJh99Gsci+LlC+Rh6vNf+i6u8j9w1CpUHXEZ1K5nrC1
X-Google-Smtp-Source: AGHT+IHaKZe/Klom8Cxezt2LHTE/mQY248f+vEPUmy2QIC7S9piKGVULTrwClMXRdO35bT9CPrcXGQ==
X-Received: by 2002:a05:6512:39c7:b0:52c:d76f:7f61 with SMTP id 2adb3069b0e04-53348602056mr1636296e87.56.1724245359757;
        Wed, 21 Aug 2024 06:02:39 -0700 (PDT)
Received: from foxbook (bfh246.neoplus.adsl.tpnet.pl. [83.28.45.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d420fb9sm2022438e87.243.2024.08.21.06.02.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 21 Aug 2024 06:02:39 -0700 (PDT)
Date: Wed, 21 Aug 2024 15:02:33 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: FPS <mista.tapas@gmx.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
Message-ID: <20240821150233.4f8f66ef@foxbook>
In-Reply-To: <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
References: <20240820130158.339b4d87@foxbook>
	<bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/kFZhkHQc0cQiWe0r0J9unMN"

--MP_/kFZhkHQc0cQiWe0r0J9unMN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

The reason I suggested aplay is only because it terminates after a
finite time, reducing the amount of output produced.

Today I found that I have similar issues if I plug my audio dongle into
one particular Asmedia USB 3.1 controller. I quickly confirmed your
finding that aplay has different symptoms - audio is slowed down and
distorted, but no errors in dmesg. Same for Jack in playback only mode.
I need to use Jack in full duplex to reproduce your symptoms.

I automatically stop Jack with timeout to control dmesg pollution:
timeout -s KILL 0.1 jackd -d alsa -d hw:3 -p 48 -n 2


The root cause appears to be that there are those "missed service" and
"underrun" errors in the first place. One means that the controller
failed to execute a transfer in its scheduled (micro)frame for internal
reasons or that the transfer was queued too late by software, the other
means that the controller ran out of queued data to send.

I could believe that maybe we are scheduling transfers too late,
causing these problems, but no idea why it only happens on particular
"bad" host controller, while othres are OK even on the same machine.


In my case, I don't observe the sequence of "missed service" followed
by "underrun" and I don't see the subsequent "WARNs" either. However,
I produced a patch which should fix this problem.

I produced a second patch which improves handling of "missed service"
errors, by reporting them faster to the audio driver. My hope was that
*maybe* this would speed up recovery from such condition and reduce the
disruption created, but it frankly doesn't seem to make much difference.


If you would like to play with the patches, I recommend using the
distribution's kernel config (/lib/modules/`uname -r`/build/.config)
because doing 'make menuconfig' from scratch takes a while nowadays.

Regards,
Michal

--MP_/kFZhkHQc0cQiWe0r0J9unMN
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0001-xhci-don-t-skip-on-isoc-overrun-underrun.patch

From 22be329f3276f98f71a485b6d8ed1063246f0efc Mon Sep 17 00:00:00 2001
From: Michal Pecio <michal.pecio@gmail.com>
Date: Wed, 21 Aug 2024 14:14:47 +0200
Subject: [PATCH 1/2] xhci: don't skip on isoc overrun / underrun

---
 drivers/usb/host/xhci-ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a7d343b78557..376bcbe7b6e9 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2978,6 +2978,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 cleanup:
 		handling_skipped_tds = ep->skip &&
 			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
+			trb_comp_code != COMP_RING_UNDERRUN &&
+			trb_comp_code != COMP_RING_OVERRUN &&
 			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
 
 		/*
-- 
2.43.0


--MP_/kFZhkHQc0cQiWe0r0J9unMN
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename=0002-xhci-process-isoc-Missed-Service-faster-on-modern-ho.patch

From adf5386fa4eba9d12f51db74162760b852d90034 Mon Sep 17 00:00:00 2001
From: Michal Pecio <michal.pecio@gmail.com>
Date: Wed, 21 Aug 2024 14:15:30 +0200
Subject: [PATCH 2/2] xhci: process isoc Missed Service faster on modern hosts

---
 drivers/usb/host/xhci-ring.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 376bcbe7b6e9..7b3a466705ab 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2451,6 +2451,14 @@ static int process_isoc_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		if (ep_trb != td->last_trb)
 			td->error_mid_td = true;
 		break;
+	case COMP_MISSED_SERVICE_ERROR:
+		/* seen in hosts conforming to xHCI revision 1.1 and later */
+		xhci_info(xhci, "Handling Missed Service Error\n");
+		frame->status = -EXDEV;
+		sum_trbs_for_length = true;
+		if (ep_trb != td->last_trb)
+			td->error_mid_td = true;
+		break;
 	case COMP_INCOMPATIBLE_DEVICE_ERROR:
 	case COMP_STALL_ERROR:
 		frame->status = -EPROTO;
@@ -2781,6 +2789,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 * short transfer when process the ep_ring next time.
 		 */
 		ep->skip = true;
+		td_num = list_count_nodes(&ep_ring->td_list);
 		xhci_dbg(xhci,
 			 "Miss service interval error for slot %u ep %u, set skip flag\n",
 			 slot_id, ep_index);
@@ -2977,7 +2986,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 			process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
 cleanup:
 		handling_skipped_tds = ep->skip &&
-			trb_comp_code != COMP_MISSED_SERVICE_ERROR &&
+			(trb_comp_code != COMP_MISSED_SERVICE_ERROR || ep_trb_dma) &&
 			trb_comp_code != COMP_RING_UNDERRUN &&
 			trb_comp_code != COMP_RING_OVERRUN &&
 			trb_comp_code != COMP_NO_PING_RESPONSE_ERROR;
-- 
2.43.0


--MP_/kFZhkHQc0cQiWe0r0J9unMN--

