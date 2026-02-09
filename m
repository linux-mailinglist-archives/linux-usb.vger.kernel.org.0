Return-Path: <linux-usb+bounces-33206-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDKMKhr7iWkiFQAAu9opvQ
	(envelope-from <linux-usb+bounces-33206-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:19:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A33111D5D
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 480D4301D963
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAC037F115;
	Mon,  9 Feb 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="NueQHCvK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6C1A2545
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650381; cv=none; b=LiW+A+zKA8P3inBLC7tgMhXPsRipwIAmMVE+lbXVySbc7/y8TsbGHL/34uKgMcrqqEF3jrzaLFSCNMbX45cTIVLB1Fqc/zuO5TN1n3AF9+xrOexYX8kn5hEYaDJ5JVvhhBhFBmkiqF97Nz2pax2RBndyhGLAD3W4oONzej879AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650381; c=relaxed/simple;
	bh=dJMOVBFsWwhDsWzn9HnmrxOxrlB3gMo+4dk6IbmZZbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JEYJCk+oS4eI1n2B7poQk15f2zal51okSqYJnOv8C48hu0zSnh9sVU2ZVhD1u49MM2dmNBLeFNOhOku9SKakqoRKL8Snm/n9ZFC+ZH734v/qKbCNWvE7hYQ5Bq4jgQfmy8N7QEYA8UyOwkFR/Sf7NXxmfCU0wmg/PmZEiL1SB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=NueQHCvK; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8947e6ffd20so65623756d6.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770650380; x=1771255180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AyEFv3bCe9MwV0dVRLQLYr4hm8peyBEebtolhI62g0A=;
        b=NueQHCvKkUC6aI/hJbHRyMpdVXSjmMz+o6UUGjZMrtJnH6clOtb+yRv7Oujuw6wTOs
         yXaF7j8DYJsCUxsK0VLncycrYa/mGzCdTP1+e8Mlz3n/Wo5jKRxz3MUwMU7dNEGN+tqH
         vf1yNQtefUSWGz3Ee3s0bEuco1FQr45Qql7bf/Kph5VyV+yXUGO5xxduTfX15kn3SU+Z
         CHP8CFCOYtSRTiz7IuNiqAdfmjII5pDPV2ftmYedbhAIi9YCfAaaXJm0BPRxOqrhq5Bb
         ezTd21xD5xnr3bC30m8yCGPTrf8M5bmgj4l00POcrB6U5r4fgVER1V4L5l7fsSw86epQ
         suZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650380; x=1771255180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyEFv3bCe9MwV0dVRLQLYr4hm8peyBEebtolhI62g0A=;
        b=pz778pOskfhXH6XM0vy6qTKEK4IWGJNM0Grit5KcC3L/rDCTaEN/m+BtUFzqf4agIw
         qh2EuoSzZfussVB8e3jJZX71smhOHLh5/yONQXDs6LZd1jtn4VYIYP2fOTx5bwXGT1LP
         Cd7TPZkjhO5GAVzVbY7JuQkOIkdUKk63PCmR9aQwUO9ttAAV9Lk4lfBzIfKRRFMHzUl1
         DXjlij8M5YjUm4Hu8i/AyGRzGolocySb7xnTBIKuRq63FmLrOBShoEbJ7J4hTP3awC15
         vwg/SmdDtez8Gqi8wsGrlBSBukZf0180dRrIVlTqUoV22Cww8GJ9/7jOq5GL0oNrwDGS
         nzCA==
X-Gm-Message-State: AOJu0YyIlLJMQ4TypVpN7tnfjAfd4fw3lLSUSWfUfFoBv5oRqoNK8owJ
	87uOkD65KRBruoh+5cBltq0o/2CED/td1N6BKZhn+8A/5O8/HT82djiK4/wOk9wTS4s=
X-Gm-Gg: AZuq6aI8/qZDcUd+1lWTgQbRM9nAloIH12RjgR9P80T6cNUrJI5lghWJnxzxMiYdG6e
	5shkpMm6t6qnwc8iPuz8hPpO0FRz4NK/zjbghomvWMHXr20HmYSMxmMusJumP++tKWMuTi9QB49
	4BKzCskAJacjEIhDg0OlFnTZkXiCzKX4uGjOb4Esqo/SbtuarSqpiL6L0Yi0L/rcqyT3/h83piL
	DvC06gdTMTSJVm0PsOCXhXXbNB8Yf+P/kZ5xNsydfV38vziE4iNteoelRfaSYx7r5XgjFKqAPup
	EVyh/XPJNk5nqKx+OYZ57iK+oVr2r65CK55EJSlvEVQ4ewxMvBpOfRUwQmi2Zf77EMf9u7p/kpj
	9qU2f96ieixo3ohDNEN5LgS4KlPmy+h3/Dz8iQfmw5Y4puTV9BTiVgMq8Ej/NEfkoBeDogTdxcw
	Ab8g5rmq0lp913aczdu4jm36pNAzDc92ibjrByBcWuTadd6C0sPBdDgrGqPUr+i5UZwQ5n5F1J8
	DSBzUyGIjWesfYrqehDAGh0qyVoV7I=
X-Received: by 2002:ad4:5c68:0:b0:896:f767:9669 with SMTP id 6a1803df08f44-896f76798cfmr66786486d6.10.1770650380213;
        Mon, 09 Feb 2026 07:19:40 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392902f9sm77866641cf.18.2026.02.09.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:19:39 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH v2] usb: image: mdc800: kill download URB on timeout
Date: Mon,  9 Feb 2026 15:19:37 +0000
Message-Id: <20260209151937.2247202-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33206-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,u-northwestern-edu.20230601.gappssmtp.com:dkim,northwestern.edu:email,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: 05A33111D5D
X-Rspamd-Action: no action

mdc800_device_read() submits download_urb and waits for completion.
If the timeout fires and the device has not responded, the function
returns without killing the URB, leaving it active.

A subsequent read() resubmits the same URB while it is still
in-flight, triggering the WARN in usb_submit_urb():

  "URB submitted while active"

Check the return value of wait_event_timeout() and kill the URB if
it indicates timeout, ensuring the URB is complete before its status
is inspected or the URB is resubmitted.

Similar to
- commit 372c93131998 ("USB: yurex: fix control-URB timeout handling")
- commit b98d5000c505 ("media: rc: iguanair: handle timeouts")

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Check the retval to see whether the URB completed normally or timed out.

 drivers/usb/image/mdc800.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/image/mdc800.c b/drivers/usb/image/mdc800.c
index 7b7e1554ea20..a47bac0fb04b 100644
--- a/drivers/usb/image/mdc800.c
+++ b/drivers/usb/image/mdc800.c
@@ -730,9 +730,11 @@ static ssize_t mdc800_device_read (struct file *file, char __user *buf, size_t l
 					mutex_unlock(&mdc800->io_lock);
 					return len-left;
 				}
-				wait_event_timeout(mdc800->download_wait,
+				retval = wait_event_timeout(mdc800->download_wait,
 				     mdc800->downloaded,
 				     msecs_to_jiffies(TO_DOWNLOAD_GET_READY));
+				if (!retval)
+					usb_kill_urb(mdc800->download_urb);
 				mdc800->downloaded = 0;
 				if (mdc800->download_urb->status != 0)
 				{
-- 
2.34.1


