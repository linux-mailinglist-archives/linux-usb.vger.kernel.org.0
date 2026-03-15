Return-Path: <linux-usb+bounces-34833-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPBrMd36tmmmLAEAu9opvQ
	(envelope-from <linux-usb+bounces-34833-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:30:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B58291EE0
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DA2D3012B76
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 18:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CA0371CF7;
	Sun, 15 Mar 2026 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NaWJ9jWl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491D7221F20
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 18:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773599448; cv=none; b=OF3wuyypmZtYITqhQY1s1ZkN2Pbp02G0hEp74pZi+4hSLEewFTAcC1xBQVymlyLyVHjUPWYTXVBjgUwbBGKzlN98Xsoxc4No73BawnneGpKhwAC9/fxsNq/Ciz5N87amshO6dGM7LhNL4dPFz1O7sunnRRaI3uI2S5bZUPCvJ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773599448; c=relaxed/simple;
	bh=2E0Bcq5G44w/EggN4XoQfrYgeQyqIYlcBREnAKKdzJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DVvJpUKAb/04et6TpRBV1gNMEAxGCS/RtQJ7xP55iwEv7LuFdPY7TmJOAedGC0YMUJSSrayTlgoQG70xhPK7tHqPOXa8kL7mPrEXlhfNLVUqvXSzY1BEH/6AGU/Wf9XJn7LnNjfwuB35qvddGEiKbvY9NGEahfCcwj3FGboAcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NaWJ9jWl; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899fc265126so46706416d6.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773599446; x=1774204246; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvqLI0qUk0lZ45MfiwOibADEjQRNHGx65cfOAV8SABk=;
        b=NaWJ9jWlR72n1TMaXRbvmOyp9rhiSmn/fcGKQ56iz4YDprRmPdnPpiHlsPBf72pgOj
         bwjLhF0TIkYZy63EY9fzV44U9sJcSp1+d7w3NMPOjfUTMjaVQtezvRg+GKJ3VigxJnbK
         aNk7w1t6U6+OlXJ+vI3YWLmZqb4FJA0e5dKoHxByvWCOaaie/V1aqkicLz2go8uUo6Q4
         VENoVNOV9JmWr64DaZYn5RmjzH0nkuXCfOxbEXxHRai4ppa8A1nhNF05eZd5tstQGUzz
         odQKLxeFG0fl6MD+M89kglM/YAJ4qZmlOID3oAaHx0X7nLNO3fGgnDbTjE51P89zv7FG
         Hp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773599446; x=1774204246;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvqLI0qUk0lZ45MfiwOibADEjQRNHGx65cfOAV8SABk=;
        b=fP/0eNq1N8olbkCJL3YI9xXGii+FGUNdYR3/DwddDfugM1P8hnRl5aGHqXl2vj8Wke
         u4h2gR/VQcgAFSA/YlX3NvEO2/zaB5BsIXDFQ28EcvasGEILukZ+iSfpzMDL0dl5eosL
         1m3edzdZKU/KVKCDbKxGbvMrFb1pTF99ByzRnIHA0bfXnZqhCqykiTmdweUsAtFat0aw
         LoSuOjWiPQep8aGfl5GAtoCIaBpURa6h/zC+bdYcPYcaaMWl3DK43ncxcYpbypx2SVbK
         f4JNQW9/ND5pzMu/Moh3MH6qQq/pJOsgSnIbFPhRD9nYk01FXdU0dSCiSE0QKZhTLD5m
         S2Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU9n6Iw1+SeBbq8s7CoSM0Noun3zF32dsjgTYS3R6e58wtpYBwVpqrOwI7LRyG0NgfX6IiYLcg+OYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVf32w2xjLvAUPM+8IxcIoint7FLvvdQZcJxw11F6lpbYow5AK
	3ChtzaCgW77Zr1R8Gi+UJ93LK10LUiQa5YrJtyszRWrFA7YXgm6nXvueMwETmW43ig==
X-Gm-Gg: ATEYQzxKSTRIX0/qjr0ZfuzqiOAYyH5UDqCXXofMAE9aqYzplWrmJCwBq8BqKGBHxYi
	bJULdA+pMCpTcfef1oMO9CVG+IDOWggI7yRQ3c7zSFJplC5HzFRk/KH/vmrrz682R1pFCPIIung
	jadRgU1rTbn5DfiGdFeoeNH0qKKfJTGNxzGsylwSfTKZWjT4aYqXwvIYnNVQY3L75NQFge2Fcix
	wwMqujDk0LSw7BcGlLbObufCNMJqCA+YilmIJ9HchqYlGFAa699h1NJ37L/YCkrwUTWS5sJ1lKD
	S1/s3RawGmTngGrWeeR9Ax7cP5/DJmYiai9UqWnhyrSqEZyHBzNGzFGhYCAaj1Rs6ttNhkenaA8
	LVczOz6vSbLHLiBLY0nCL4uaMP2vKleE9nzhvIMwDTPKDKA+yMlTPFpBEIyJe1kp1/xNrZ2JJaO
	CE1OvRqQ/lH8zQjOSy8gp6PsvT
X-Received: by 2002:a05:6214:400c:b0:89a:666:ad2b with SMTP id 6a1803df08f44-89a81dca150mr147921506d6.27.1773599446132;
        Sun, 15 Mar 2026 11:30:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c463af3e9sm28712556d6.46.2026.03.15.11.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:30:45 -0700 (PDT)
Date: Sun, 15 Mar 2026 14:30:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH 1/2] USB: dummy-hcd: Fix locking/synchronization error
Message-ID: <46135f42-fdbe-46b5-aac0-6ca70492af15@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-34833-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,harvard.edu:email,appspotmail.com:email]
X-Rspamd-Queue-Id: 60B58291EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Syzbot testing was able to provoke an addressing exception and crash
in the usb_gadget_udc_reset() routine in
drivers/usb/gadgets/udc/core.c, resulting from the fact that the
routine was called with a second ("driver") argument of NULL.  The bad
caller was set_link_state() in dummy_hcd.c, and the problem arose
because of a race between a USB reset and driver unbind.

These sorts of races were not supposed to be possible; commit
7dbd8f4cabd9 ("USB: dummy-hcd: Fix erroneous synchronization change"),
along with a few followup commits, was written specifically to prevent
them.  As it turns out, there are (at least) two errors remaining in
the code.  Another patch will address the second error; this one is
concerned with the first.

The error responsible for the syzbot crash occurred because the
stop_activity() routine will sometimes drop and then re-acquire the
dum->lock spinlock.  A call to stop_activity() occurs in
set_link_state() when handling an emulated USB reset, after the test
of dum->ints_enabled and before the increment of dum->callback_usage.
This allowed another thread (doing a driver unbind) to sneak in and
grab the spinlock, and then clear dum->ints_enabled and dum->driver.
Normally this other thread would have to wait for dum->callback_usage
to go down to 0 before it would clear dum->driver, but in this case it
didn't have to wait since dum->callback_usage had not yet been
incremented.

The fix is to increment dum->callback_usage _before_ calling
stop_activity() instead of after.  Then the thread doing the unbind
will not clear dum->driver until after the call to
usb_gadget_udc_reset() safely returns and dum->callback_usage has been
decremented again.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/68fc7c9c.050a0220.346f24.023c.GAE@google.com/
Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
Fixes: 7dbd8f4cabd9 ("USB: dummy-hcd: Fix erroneous synchronization change")
Cc: stable@vger.kernel.org

---

 drivers/usb/gadget/udc/dummy_hcd.c |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -462,8 +462,13 @@ static void set_link_state(struct dummy_
 
 		/* Report reset and disconnect events to the driver */
 		if (dum->ints_enabled && (disconnect || reset)) {
-			stop_activity(dum);
 			++dum->callback_usage;
+			/*
+			 * stop_activity() can drop dum->lock, so it must
+			 * not come between the dum->ints_enabled test
+			 * and the ++dum->callback_usage.
+			 */
+			stop_activity(dum);
 			spin_unlock(&dum->lock);
 			if (reset)
 				usb_gadget_udc_reset(&dum->gadget, dum->driver);

