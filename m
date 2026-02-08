Return-Path: <linux-usb+bounces-33166-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LffCyypiGkUtwQAu9opvQ
	(envelope-from <linux-usb+bounces-33166-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:18:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC6C1091B3
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E57930058EC
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 15:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D5235FF69;
	Sun,  8 Feb 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fl4wT1Vn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E72265CDD
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563873; cv=none; b=g0MF5sgxttlf1K5MQ8mQdrrsUj0FSYfaUvzNzbXtxumHqAIiO/M8xUxnY9uxUjvDeJTmAqNJKS5sU6yJSiT71fOEs4VsbAxBwQZjg7hWUnWMcQoS5yePGzv/ytWVnH8A+NSWPvJxN0XRgpHMiUWJjFbliw4cFaP/NDhP0CbqEdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563873; c=relaxed/simple;
	bh=1yVpi5HAhCuT1qrh7P3HjuyX3b4RKzx3yOMkYRJoMFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8xX1A+XT6ctZSWNrvovwOszHsN+w631+uHqpZAMTZiT60ZbkHEVqTxCBctMmoiCNnJSrfY/L7wT3uK0zXGhy6AMtzg3NCqZAw6b+5XsUEcKmcMWSxpgiLAXBKCINf6nfym5amzM/OSBJABTLr+61gT/LAibcue7Y+jqJuvRTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fl4wT1Vn; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c6a50c17fdso229784285a.2
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770563872; x=1771168672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPjZsAgr+khXl+kS15TvgM4dk5lTzmqRSevXQSNjq4c=;
        b=fl4wT1Vn0M50aqhvgmqTHpaObm6I49Hsh0+NNOaIEoD8su79IYuci8KBGbuEn7hgkR
         kvEnUJDALfD8R/ll0VCTwvIurPGqAM98rkBSdhf294vVbRfubRUijON/DRs3QjRv4hQJ
         z3Q5EtAqNXX0Y9cEnzTg2OGfKJfVWs4hGB7RhRKcmrk5VhfgHG0GJ4scAKX/6ksuAu+y
         1OHQ9ZS/ZePNxHgpV+zjlvksSyJvJa9cUMK7aju33AkZmzTWJNDvGI5ugxJVh1inatUB
         prX7EypjAJO3iIvhRpDu+1UnoTz4eZ3qrSdKdZ0vMe1yz6hjj+qrJAYaEia9//Fyh0o5
         Qauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563872; x=1771168672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPjZsAgr+khXl+kS15TvgM4dk5lTzmqRSevXQSNjq4c=;
        b=Jmpc331f1Wr/a1CdMPjF2Y0ldF+lqoir8n/cHONy/LVbYIUZ7SZZrSx2JuGW2iOSy6
         IwFbGqojBKwbFi7CyFiQdQKGgXzFdacVkdUO0Idgs2QpQ3dPUx6V+E8mBmRUwC+p5vc/
         Iwix87bIlBfQsJVdrG6ADwqkrv3HDpmAg8lnqc0kNc9XOXT1u0kFa2pBCvOYR7sgEL1a
         qpB2pEsr3r0+7mZpym+b7z7JTtB+Z7RF9h7GZZXyIqjOPAL8dtXDX+k8s3E6XWziN8UJ
         An/7Yc5iFRtdbfyQJ/OoSVAFTCsy115iyG1g6S4XHyEPEnQvQ+uZtIVKNGNU1eWAo2+S
         3HFw==
X-Forwarded-Encrypted: i=1; AJvYcCXQuOblid4aS5SGx55ckomGQAYGQRAB0AN9+kxo2sX47V5BUlH2e4g9Jy88KjbUFYUU4DB1FLEBIw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdUbrXxizn16iefian63fTUnw1FmjzHDNMpFH5GQ83kObNZ66
	MxM14wZzJghCqgkB//U34qDH1jDe6jj7YaPUYRYWWthQPXDUR/4JGBDAZgFrFDMqVw==
X-Gm-Gg: AZuq6aJmIaNeVMR/pKuw1U6jj7k9xahfqMIqpIadHGAEt8N0g+y1SaHlGxVQWcVukQ5
	uRsV2sMmHqVpyYCEev0qGI1m1XBg9n/+MJ5yf3MxrdiQdCayIXifmCgF7PrjuNC7BUCINOd5cqu
	r5yFBWKMhr02xAqoOgd+9xx6kvi4ADe5eluzWuw3s30xjh1qDDS/vi0rPWGVOCbqgzCD1SNtods
	rMs+CYYn6JAhG1xwx8/xLAA31q22xlIQh/q7Zx8G4XzCJDJcSvqONJPqD0VFqLDeXdsrTp2YbS8
	co0fddm8dEE77MiqzI0IpSqcFADeTPPzbx3tev6I+JIudVsF8aAny9DfMDQPv1d2c5YYyn88uB9
	aZVIEZxIlK9y4bTMljvrJc+qgbPcTHJhUimxpDPfZ157LLsaeegrZPO2B66w8H4sRlpWw4t1Vv+
	kcYx/8YVK1bAqt
X-Received: by 2002:a05:620a:4009:b0:8c9:ea1c:f219 with SMTP id af79cd13be357-8caeeb4e933mr1032900485a.2.1770563872432;
        Sun, 08 Feb 2026 07:17:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a1575asm645341685a.32.2026.02.08.07.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:17:51 -0800 (PST)
Date: Sun, 8 Feb 2026 10:17:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <6c618000-fe74-4429-9e91-b8a012598bef@rowland.harvard.edu>
References: <17f32422-a93b-492b-a879-ff0a9469b668@rowland.harvard.edu>
 <6988a5a7.050a0220.3b3015.0057.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6988a5a7.050a0220.3b3015.0057.GAE@google.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-33166-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: EBC6C1091B3
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 07:03:03AM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> INFO: task hung in usb_bulk_msg

Okay, most likely the reason for the hang is that the count is 0.  But 
that doesn't explain everything.  Let's get more info.

Alan Stern

#syz test: #https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

---
 drivers/usb/class/usbtmc.c         |    7 +++----
 drivers/usb/gadget/udc/dummy_hcd.c |   11 +++++++++--
 2 files changed, 12 insertions(+), 6 deletions(-)

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -1362,7 +1362,6 @@ static int send_request_dev_dep_msg_in(s
 		data->bTag++;
 
 	kfree(buffer);
-	if (retval < 0)
 		dev_err(&data->intf->dev, "%s returned %d\n",
 			__func__, retval);
 
@@ -1404,7 +1403,7 @@ static ssize_t usbtmc_read(struct file *
 	if (count > INT_MAX)
 		count = INT_MAX;
 
-	dev_dbg(dev, "%s(count:%zu)\n", __func__, count);
+	dev_info(dev, "%s(count:%zu)\n", __func__, count);
 
 	retval = send_request_dev_dep_msg_in(file_data, count);
 
@@ -1425,7 +1424,7 @@ static ssize_t usbtmc_read(struct file *
 			      buffer, bufsize, &actual,
 			      file_data->timeout);
 
-	dev_dbg(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
+	dev_info(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
 		__func__, retval, actual);
 
 	/* Store bTag (in case we need to abort) */
@@ -1470,7 +1469,7 @@ static ssize_t usbtmc_read(struct file *
 
 	file_data->bmTransferAttributes = buffer[8];
 
-	dev_dbg(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
+	dev_info(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
 		n_characters, buffer[8]);
 
 	if (n_characters > remaining) {
Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -762,8 +762,13 @@ static int dummy_dequeue(struct usb_ep *
 	ep = usb_ep_to_dummy_ep(_ep);
 	dum = ep_to_dummy(ep);
 
-	if (!dum->driver)
+	if (!dum->driver) {
+		dev_info(udc_dev(dum), "Got dequeue, no driver\n");
 		return -ESHUTDOWN;
+	}
+	dev_info(udc_dev(dum),
+			"dequeuing req %p from %s, len %d buf %p\n",
+			req, _ep->name, _req->length, _req->buf);
 
 	spin_lock_irqsave(&dum->lock, flags);
 	list_for_each_entry(iter, &ep->queue, queue) {
@@ -777,12 +782,14 @@ static int dummy_dequeue(struct usb_ep *
 	}
 
 	if (retval == 0) {
-		dev_dbg(udc_dev(dum),
+		dev_info(udc_dev(dum),
 				"dequeued req %p from %s, len %d buf %p\n",
 				req, _ep->name, _req->length, _req->buf);
 		spin_unlock(&dum->lock);
 		usb_gadget_giveback_request(_ep, _req);
 		spin_lock(&dum->lock);
+	} else {
+		dev_info(udc_dev(dum), "request not found\n");
 	}
 	spin_unlock_irqrestore(&dum->lock, flags);
 	return retval;

