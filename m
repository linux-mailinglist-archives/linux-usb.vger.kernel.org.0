Return-Path: <linux-usb+bounces-33215-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM6nDOc8immsIgAAu9opvQ
	(envelope-from <linux-usb+bounces-33215-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:00:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 837CC1144F4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 21:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEA1930125EC
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 20:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C21D30F7FE;
	Mon,  9 Feb 2026 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NkFVovqa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E32A2DB7BE
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 20:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770667232; cv=none; b=IGwLU7LtHeH3LFNQlmCX52/UwEUneLld/Qah3LRQoBF8Hs2cUGQXgqyTF2FOIM0XIIkZVA9SjwS5ccteduT9Zr65lFSeW50J67fhBPME7ZwqSwTbIaJrDaew9VIqtu1tn0h8+KcnkU9F5fJIOSUgoidYohByJqqRLMFjPpsN6Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770667232; c=relaxed/simple;
	bh=JSVarwn7uxmEj/iYUWORl5/aO/h2PISb1ORA5SW0+sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=P2SlmPsHMi7b9vuTclfqO2Sqx8SZj/dDMNi5b5oT1zGgxzQ0dcmL3u4i1zjmEhSAxC1uWUfbdPdsWocZiJfYDeQHn2DvHwQ7uSME4cJOJM3Du8S7V0p01rLPEo1et5misd1ZSuTyF4fUHZIhjc6nU8QPGqRNtVuOBoxrd//JWnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NkFVovqa; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5032e951106so549241cf.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 12:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770667231; x=1771272031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcJL3Niaml4CHapZe0Erbcd+PvblmJfYcWDuAQL6KWY=;
        b=NkFVovqaeW1PEakyI5TQxwOw+o1JDt30KSNlNtuVUkFW5AgTwg8l4zv4qxzdP21fzu
         SL6vrLlqz/i7ESmjzloY14f5IpNzJ9YZA2Z0U4BWlSUL1EaOnNmY8XcWTTpHkmBtIptA
         oSHnva0COuRptJcWqp5UQpRMzUJFGrathNmafdPufTgtOXlaXJRWmIfYPyO6XGfP4jxM
         3j+vnLJw/FoULYlx0qQAc0pyUDZJSmv9tJbxmuBYun+neAXbLL0KYVz0U8JCDg4n9rqU
         Jvil0YwtMwgRsctGGIcfXUULbsveFK+aPP1clCBgRcpsL4A9qRR5PmKZ8bn00o0kRpUk
         vehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770667231; x=1771272031;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcJL3Niaml4CHapZe0Erbcd+PvblmJfYcWDuAQL6KWY=;
        b=nG/Hsz4NqgG3nFeAou3OsQvu/7YBueGHh7MQDct0sk5HnviC+MXccLmuLEbHFeZC2L
         IOgqZyX/6n7wtcE9jkRc9JRR72wW+QxDYhAVz5d1NYiElII5F62bHx6IpXUsWqRqbJa5
         upweclbHsfcQQ539+GJfk+LMkBxJOJxtSI609eK0iccJUEURNoAvspFiOGYQzz0emsvj
         js9RTXPb8WTTVaQ07MV5A77jnsIi1lUdCynR0wPCmCcvrOQiDYdtbHR7P3hblFbAKmRV
         xR/pcZBtCncpdGoia25QtJXf6jSjG/jVfx7xPAo+5Nrz3WvDsO61DjtcGGvgq3Z+RGTy
         cGSA==
X-Gm-Message-State: AOJu0YyXo6mLDPXpvQKm8TgO2HaRfbLmxfkcH9Txz/+n0q3zdhusaf6M
	kfzoIJ1N7iMpGVFtIKQtRDmPGmyXXR9rNNwI0tJQ2tOpg9YWXUdr8ruRS7dnPInU/Q==
X-Gm-Gg: AZuq6aKtQ4/+B7CewWpklBdoFJmKtjgw0I3WdSYhm9VnScPU1kAYq5d6xtYcwBPWoI+
	8BBETnWjGwbRV2xICLm8FspYTWGyI089hvgQ8eo2CREmH8DpfoXmcA0SqOzmv2eJOJuDZH3aMVF
	AIsZyh9uAb2okA/paFi3wrHL6IurJszbTF5trhkKlH+XLBewYwnNEP2VO2aN1iYnWA7ReV3AUCN
	BBOb4mwe0yechWUo/LsynDz9wFCyDaVx0ghgW8pLHWtxINZUdfwI8hEOd83aveCu27pxzSc5xog
	leu6xubB+/2zKj/T54P4/6kyxkaMq/5cfTzKvnJ7+BI/QdGGN3j72GBxhnwna85L0NSFWuQKwW4
	QE8JCh3KgRF+hyvXqLtETw0tDXbbCIiZ0uV0JLAxqoyw+1Ln92XQi7P5uiiiHi5DT6xGyY4Xo7G
	t5fr1WU4L/fTYjYycb01cGUkb1XB6xytRpEQcZwg93EskOODlgVblhio2NjmU3QgClSwKsw3bmq
	YAMUUka
X-Received: by 2002:a05:622a:1a97:b0:505:e4ab:ce7 with SMTP id d75a77b69052e-5063986a744mr156725271cf.10.1770667231499;
        Mon, 09 Feb 2026 12:00:31 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-25.harvard-secure.wrls.harvard.edu. [65.112.8.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392c0680sm84823471cf.24.2026.02.09.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 12:00:31 -0800 (PST)
Date: Mon, 9 Feb 2026 15:00:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
Message-ID: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a7f1f3d-7063-426e-85be-e32a5e2dc431@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33215-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:mid,rowland.harvard.edu:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 837CC1144F4
X-Rspamd-Action: no action

The usbtmc driver accepts timeout values specified by the user in an
ioctl command, and uses these timeouts for usb_bulk_msg() calls.
Since that function will reject timeouts that are too long, change the
driver to reject ioctls setting the timeout to a value above the limit.

If it turns out some users do need very long timeouts for these
messages, we will have to remove the limit and rewrite the calls to
usb_bulk_msg() to be interruptible.

Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/8e1c7ac5-e076-44b0-84b8-1b34b20f0ae1@suse.com/T/#t
Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 048c6d88a021 ("usb: usbtmc: Add ioctls to set/get usb timeout")
CC: stable@vger.kernel.org

---

 drivers/usb/class/usbtmc.c |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -34,6 +34,8 @@
 #define USBTMC_MIN_TIMEOUT	100
 /* Default USB timeout (in milliseconds) */
 #define USBTMC_TIMEOUT		5000
+/* Maximum USB timeout (in milliseconds) */
+#define USBTMC_MAX_TIMEOUT	USB_MAX_SYNCHRONOUS_TIMEOUT
 
 /* Max number of urbs used in write transfers */
 #define MAX_URBS_IN_FLIGHT	16
@@ -2014,10 +2016,11 @@ static int usbtmc_ioctl_set_timeout(stru
 	if (get_user(timeout, (__u32 __user *)arg))
 		return -EFAULT;
 
-	/* Note that timeout = 0 means
-	 * MAX_SCHEDULE_TIMEOUT in usb_control_msg
+	/*
+	 * Impose a maximum limit to timeouts because the wait in
+	 * usb_bulk_msg is uninterruptible.
 	 */
-	if (timeout < USBTMC_MIN_TIMEOUT)
+	if (timeout < USBTMC_MIN_TIMEOUT || timeout > USBTMC_MAX_TIMEOUT)
 		return -EINVAL;
 
 	file_data->timeout = timeout;

