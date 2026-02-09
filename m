Return-Path: <linux-usb+bounces-33208-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PX+IBgNimkQGAAAu9opvQ
	(envelope-from <linux-usb+bounces-33208-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 17:36:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F711128DA
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 17:36:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93392304CCF5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 16:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D5C3816F6;
	Mon,  9 Feb 2026 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rnRQUEmb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C6E3793DE
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770654872; cv=none; b=KJaR4SGDBlMEhbCk3maPKMud+PIV+Hm01HF2w+DdRyU2bLRSogSl+aO/6Z8aJ3FFpUvao7pzSe2iB9rtAeaX9q4wV0tmWKcT9HF+GtAn/C+u4vjPq3xDelkYDfKQ454t+rteCnosDI7YOxDeYoxUYvbZevfXYV3OrDvJW1TzEdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770654872; c=relaxed/simple;
	bh=HCz2V9O4D+cvDpbE7Iiy1tKnlQXOasTkKUV6qdGj9Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhTPvcfzSG3gIj/sgryvybX1d9FQdQsNUB4khph11IQ9WT2OY7KNWj+auDsTDpS5oWPiJbYyztyHLz2WcOyIEdBPr2BRR9vK6Ciy/LGzE7SE4LCZljBlp/BLkvmevknHDi8pIkGBt4xaSUG7dTpjRcatBvwsRgWbsgG4aVZehKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rnRQUEmb; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8954ae375efso18166316d6.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 08:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770654871; x=1771259671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Whc3/fmIC4DBzNEbgi/xYuEm50FjSRY+z7bun4qTY=;
        b=rnRQUEmboKE73gFAQkk898f6BeOgezgObOqdwfNUzLOvtL8zQZTBJvNxwCL7zoRy6M
         s/bj1CqggvANPaFL/59hNU7AWldTXUg1zjhUYtxROTP25B7eyQR4j54nUY85DJh5QjNv
         8CdXh+HewUSF6t7f5bG9FFtkgJEQr0oxBmCHBmC9ualezXw7GthUHEo15+8CvDHo6WAH
         5j6jdtW6pHTWVlFIGLDraiWVa3unAT2Lw2cAd8nT7jb9gu4tyli7gFIU6fBbsxCghk+1
         HTkR9gBiBRaJ7loDIxQazhVC+lDUvP32r68IOD6Z+A/1FgJiLK5jrMrV24wECwlaiMEf
         DYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770654871; x=1771259671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Whc3/fmIC4DBzNEbgi/xYuEm50FjSRY+z7bun4qTY=;
        b=H4g4CVf07p5GEeQo8agMUEMNs6qlW3ZUOYuNOQxJy4vXCireXShRhPx0RM9V+9kjeT
         LZn7FoMyE5nz8zrbsDf/hlCvmWc18GzLHmGhmfbgi+6/xsy3fBVMtMIoXxqVpFjVU3XH
         qeD+6IVRJKxB40l10+41JvqgdK/EfuSHRkOqbcckuVUHTi3tBImmRWoRuarvterbCMhR
         IDV4+Ye/KWn5FwXyj7mkTUYyfyretQaY8C7MRGCfxcH7tLTEnnbPWka3qYYqpdD6+J/w
         +OZxRvo4PAkL+22GDPXISGb/DU36+NQ9KHi4oDzRUeOfVHugZyfyoTUErX3Yey6V9GVt
         rmBA==
X-Forwarded-Encrypted: i=1; AJvYcCUhvXyTkARbegm3wVz9k5CCIXkeOp38589ivZHVvw72Bt8g2oGOQqSMjYwcniJXC7xAU5GyoU07BtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJx+UYn266rMxwY3Oiy7LUHTfHgfXDFrx8pzQEBE/VazLVYrc
	M28mlo2BviKED7IQjjHYq+whKC3F2wW3nnZ29eyat05nH61g57JNyBQGwBfaOAdhIg==
X-Gm-Gg: AZuq6aIyCAAe1tOZ34d7sA0fHUxz4/ZsyEI3jf06Yj/l84s9nyAGKCoc4+6lR3M0MgV
	X9a/OfoIcPLk2XfZofTWigI098vWidIpbk7vaMcSzTU9tlrDurylJ3LI6pluDPhNTB/eMiXn8rD
	NwEJI3QnFEfCk/AT60yxY+IKD0t8cRcPqyYXDORtMaiIqIWw8xyl4Xj8cFqAF2lLNdkflLwF67r
	zIOxnz3uDrac/SkFue9Z05ZyKDgS7pafrWLZAGyMJl1B2y2odEHSVScIwmyIP8XaCn+upuCtfMC
	Pk+Jw4FNJ8XZEszES+HBPfFTbhDVQt9n5tm0n/CVQqxH59Y+m3ljXCPGDDKtvF5wnVa3iSDBWBB
	SiYYfZG7jCAcnuiQhBHe+z/cuBjkUh/PQ/DwgFfYl5k+bTXKiCopTyGPOeuz82GXZ/puIKWU8wG
	zmbf0g2+XyIbZ06f9Y2O/yuHnenHsW90mzUUeJ9RCUQpTRSSbQElC9ccfsCw3zFOCYzV1Fbkgyc
	6p7nZq9
X-Received: by 2002:a05:6214:4019:b0:896:af07:a50b with SMTP id 6a1803df08f44-8970be727e3mr47306d6.25.1770654870726;
        Mon, 09 Feb 2026 08:34:30 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-25.harvard-secure.wrls.harvard.edu. [65.112.8.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf3814csm79215006d6.2.2026.02.09.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 08:34:29 -0800 (PST)
Date: Mon, 9 Feb 2026 11:34:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <738614c5-fe8a-450e-a3eb-8a5849298c90@rowland.harvard.edu>
References: <0b508f72-7248-479c-ad26-b9385e52c094@rowland.harvard.edu>
 <69893c5b.050a0220.1ad825.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69893c5b.050a0220.1ad825.000a.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33208-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: D4F711128DA
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 05:46:03PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
> Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com

Here's another, more local, solution.  It should fix this bug but not 
the underlying problem.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -34,6 +34,8 @@
 #define USBTMC_MIN_TIMEOUT	100
 /* Default USB timeout (in milliseconds) */
 #define USBTMC_TIMEOUT		5000
+/* Maximum USB timeout (in milliseconds) */
+#define USBTMC_MAX_TIMEOUT	60000
 
 /* Max number of urbs used in write transfers */
 #define MAX_URBS_IN_FLIGHT	16
@@ -2014,10 +2016,11 @@ static int usbtmc_ioctl_set_timeout(stru
 	if (get_user(timeout, (__u32 __user *)arg))
 		return -EFAULT;
 
-	/* Note that timeout = 0 means
-	 * MAX_SCHEDULE_TIMEOUT in usb_control_msg
+	/*
+	 * Impose a maximum limit to timeouts because the waits in
+	 * usb_control_msg and usb_bulk_msg are uninterruptible.
 	 */
-	if (timeout < USBTMC_MIN_TIMEOUT)
+	if (timeout < USBTMC_MIN_TIMEOUT || timeout > USBTMC_MAX_TIMEOUT)
 		return -EINVAL;
 
 	file_data->timeout = timeout;


