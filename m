Return-Path: <linux-usb+bounces-24820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E3ADC13C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 07:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7119D3B3FE9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 05:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC0724DCF7;
	Tue, 17 Jun 2025 05:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2Nd4Hg5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98F23B625
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136938; cv=none; b=iwEcJxVK7bUNlxY8rcZ1ZubWhI9mRPXTt2GYzlTdUZR/r7yWmmov0Cg8or7Wl3xQzStsDjsSRdlAk3wp8A2nDMo/syIFLXDh3UnAmirksaOt4QR1N9T3MHb69v5nr2QZ0LwEjZwfF9wgxNoqL4rcqnAmiK2EJdCbdf/Pmz9kgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136938; c=relaxed/simple;
	bh=YoOKZWDe3bgJ0VNg0eea3oWFhS1QY5GJUZB2g124DaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NRe9ib/opbjPuPvvU19Pa3YCDoWRraZRRPtN1swlYStiQjDK7zHGdin9RKOLFIWuP5VxcwFNSfYs8dxsJLFa5qxx8YRtjoVip/rcnMkUB0CKR/G9q9FU3472tmU/60WWPCskns7aHbsSa51Te3SLSOGX7pkycqwLXSWV2P6yuZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z2Nd4Hg5; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-32b2de6033bso31743131fa.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750136934; x=1750741734; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1f3cBdI8xhkfW1PldN25AHnH1CARokeiI9s7jI03ZKc=;
        b=z2Nd4Hg5HqvusKgpB32GJ1XMbAfQqFY5ncKCgWb3l7CqCyVvlXnKZX8Lp+1Z8M7FtO
         0fqXzxfT9iZ/0j+b+kSe8CVleph3y4kUTClpT2BleMkDc5Cey9Fn2rLRjyG4yMJMAlBP
         Vi/Ymt/1q8z/7WdBke5bioCNP2Po5/zpaCKY6Z/WnLrtu7pwF7enTGE2tf8ZsVXXdupc
         /T2ruzjPW1FGIQfemPWzr35xaqvoyd/Np4z8DFmlaOlEWGIdbP14hGMAwOgs5dQT+/Fx
         j/l8cmhBXtByPbrcoOf3kDE8nRmPrO9K9v0HBXNMIuprIbofklnu1QrY520dCUcXZKFM
         cmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136934; x=1750741734;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f3cBdI8xhkfW1PldN25AHnH1CARokeiI9s7jI03ZKc=;
        b=Y86Q4EAVQngwtorX3yCcrpp5IC4UW/ehLHfCxNoWGGMIyMR4CAu9OFhN4psCc3knmB
         8DB+ojht+EGjh1ch21SBlK+isN716bvpXcEEz93dnLE3UszNT+SGNpEyMF5HCGiamw2x
         ajJQTO5ouD7afJYOf63wwT7t1d5Qij0jZCDF1GT69xV+SLhoi8dnEhxbvg0oa2jLbMbL
         XvC7AXxrH7seYvBD3ZB3MzB8gr6QYp0XIij7PIIINf28C7zQdlCe5wL+eQDd4SeldtAm
         NwkYzWmzHD64QZJgeR201iBYApRJpKex2oZiexUEwQl/iZZC6c6S95Z+oQSTqkvZ9kZ4
         Na2Q==
X-Gm-Message-State: AOJu0YzSp0ihfYrLav3HkwBJEGpdcdg8acyT7L1k0XM50w1ZJXy4MLyF
	wr0uzqfu9DUgP8VtHjI6seUD3UgtIj1RWi9A5Nm7Au1jGDjOJWLUxFqhttme2l7olg9HidsFH0f
	a85bdFw==
X-Google-Smtp-Source: AGHT+IFYSpjBdNE9GBi8neTP2Ze6oQSxzs3XDaNIiK3QW1FHbqEsFzdEHcQZ/oyym4KEV3rZRaUJ4kszYmQ=
X-Received: from ljqj16.prod.google.com ([2002:a2e:a910:0:b0:32a:807c:a3a7])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:651c:154b:b0:32b:4932:d5ad
 with SMTP id 38308e7fff4ca-32b49508ae0mr28534501fa.10.1750136933782; Mon, 16
 Jun 2025 22:08:53 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:07:12 +0800
In-Reply-To: <20250617050844.1848232-1-khtsai@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617050844.1848232-1-khtsai@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250617050844.1848232-2-khtsai@google.com>
Subject: [PATCH v2 2/2] usb: gadget: u_serial: Fix race condition in TTY wakeup
From: Kuen-Han Tsai <khtsai@google.com>
To: gregkh@linuxfoundation.org, prashanth.k@oss.qualcomm.com, 
	khtsai@google.com, hulianqin@vivo.com, krzysztof.kozlowski@linaro.org, 
	mwalle@kernel.org, jirislaby@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A race condition occurs when gs_start_io() calls either gs_start_rx() or
gs_start_tx(), as those functions briefly drop the port_lock for
usb_ep_queue(). This allows gs_close() and gserial_disconnect() to clear
port.tty and port_usb, respectively.

Use the null-safe TTY Port helper function to wake up TTY.

Example
  CPU1:			      CPU2:
  gserial_connect() // lock
  			      gs_close() // await lock
  gs_start_rx()     // unlock
  usb_ep_queue()
  			      gs_close() // lock, reset port.tty and unlock
  gs_start_rx()     // lock
  tty_wakeup()      // NPE

Fixes: 35f95fd7f234 ("TTY: usb/u_serial, use tty from tty_port")
Cc: stable@vger.kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
v2:
- Move the example up to the changelog

Traces:
[   51.494375][  T278] ttyGS1: shutdown
[   51.494817][  T269] android_work: sent uevent USB_STATE=DISCONNECTED
[   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep1in OUT/ep1out
[   52.516288][ T1026] android_work: sent uevent USB_STATE=CONNECTED
[   52.551667][ T1533] gserial_connect: start ttyGS1
[   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.tty=0000000046bd4060
[   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
[   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
[   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) ...
[   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
[   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be9750a5) done!
[   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
[   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
[   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_wakeup(), port->port.tty=0000000000000000
[   52.747629][ T1533] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001f8
---
 drivers/usb/gadget/function/u_serial.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index c043bdc30d8a..540dc5ab96fc 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -295,8 +295,8 @@ __acquires(&port->port_lock)
 			break;
 	}

-	if (do_tty_wake && port->port.tty)
-		tty_wakeup(port->port.tty);
+	if (do_tty_wake)
+		tty_port_tty_wakeup(&port->port);
 	return status;
 }

@@ -574,7 +574,7 @@ static int gs_start_io(struct gs_port *port)
 		gs_start_tx(port);
 		/* Unblock any pending writes into our circular buffer, in case
 		 * we didn't in gs_start_tx() */
-		tty_wakeup(port->port.tty);
+		tty_port_tty_wakeup(&port->port);
 	} else {
 		/* Free reqs only if we are still connected */
 		if (port->port_usb) {
--
2.50.0.rc2.692.g299adb8693-goog


