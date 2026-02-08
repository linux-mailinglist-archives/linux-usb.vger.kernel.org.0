Return-Path: <linux-usb+bounces-33164-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ks4mKySiiGn9swQAu9opvQ
	(envelope-from <linux-usb+bounces-33164-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 15:48:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7A6108F8A
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 15:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 668A330131FF
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 14:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE19C359700;
	Sun,  8 Feb 2026 14:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tZT1AkeR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E101C6B4
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 14:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770562070; cv=none; b=LVbPnmg94gC1AvkgAshuh7Nrr7a29hNCjt62YnzRm4LtaQpQoW3N4gYBKLhlnGGLi48EqS6Tlfi7E/qM8KEFBoahleqJVKu9XCPzaZ9Ydi2MNFkomlFAWpNvx/Al8zDwYHvDDtRrpodpQ+OtYCq6fq1seX/w132rArUH/z8x+iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770562070; c=relaxed/simple;
	bh=U9b15+I/4hgieeATc22/j/H7wME6jqaUG0c3GEvfn2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S28TM56zIdyATrvnuEmBkX85MhoBrfRlGjWfQHKPckq5UkTuHhI5hCg33GoOaR0KMlfYUjSKJTpOy3l431LvBlyI6s+Iofuq5/syqrNWUsyQEyDYp1SH6/yv1f9H3Px+Q5jVhtFRUtO/NlBvdK5zDwIggaNQFkezw8LetIBpdSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tZT1AkeR; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-896fa834290so4274436d6.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 06:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770562069; x=1771166869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xp9MhrSmHRJJVHNx4gX5aDap1N1pfiJxz45voArw034=;
        b=tZT1AkeR1ytDpNGi6awsjKsbtUMQl9gBqyBK6bVekmVZfdFw4ddjRNJwQdGMxCWe9Q
         f/VObndrMY0emMzM8ZC7kFVcIsrC9BODXUxqZ2410xuDY3AyvSgOZqeEfTHfMNVIRodd
         xd0iiviRx+h6WmlzFkZyvPO5664yFfJ/eV+fXWOMII/Pu6F9gt7l/rN0Oggp5y1qQn+8
         3ulRbiR4Lz6hU43245Va1Dgh0cPfY4/iHEkWcKY5S5vYCvDJLsp5kz3BR4uPoHYD0oiG
         7blmY53oc3ovPSy7eWYNkijCbr1mN1R9HLL32y9FUg5frOk3SSdwZ4adAcGvX0CEtTWX
         pQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770562069; x=1771166869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp9MhrSmHRJJVHNx4gX5aDap1N1pfiJxz45voArw034=;
        b=WjKwtUxjyFszsjV4WJteHk5+PLW28Q1DoUPlha+LjWBT9YRYDSyQXOj8VRBxPthNxp
         1iqjgqg2mWUsQKw65KalmVlquAFjqSLTxrWlCrl2dtZpRGrty0T/DHLj+tqVB4k2WZJR
         77EG5KXMzniG3/YJptA2qdsJWXpwp9x0wk4SNj1lcSVn++20po7CNVteSuVt9g2iSquN
         jIzy1FogYFhtSLCxZyCKWBpPJrWvTT/HnsjIApdZ2J1EfthckVvqpZnF6za/7qm4Dk04
         cgUQyE3X9V7B5TXJeilA4a2cQCIVU2TaIr2ZFaRdU4y4ypxAf2b8RRVjxQl8yJJfuD5e
         sFnA==
X-Forwarded-Encrypted: i=1; AJvYcCUIJAXHgBqwiG+mZtPKKOLadOiGEN/adRqpJap+YuN/ewFmCxe+gX5rjlHI/FL2IYBJ8+FeCB9Tp/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzMu+JqA90mSD6Z5rw50/Icxk7PAD3FIVRQV38yPbIvps+cmK6
	d8Wu7BM/7b1ND45AFnWn0YwGrfmpfKWvxrT+hFqwn9kRkuQU7qoc60dXFdYbwb66kg==
X-Gm-Gg: AZuq6aJgEa4VLvJsnkPjxC93GVjQ7d6IBGRcTzY+DGzxPmSbyFvuaT1W8WG2RG3TxBD
	HNhvWSXYkarD0Cy1KYjpkTFJEW/44yDUMwmqmhyaj0e3G67VhkQNYhEuMpkA+Z7pFxgDmIr8D6+
	CvisI6KmTMZzxfxgof8ngu+uSa7GTq56j59g+WFy/6Mdr39VTEaTVA5o9Ud7KwnOj9j68xXfpAp
	3xFDPaD0rRCij4C/79ugsorvnEea961YZjiOtYUH11Ny0QlDFu8UYKA5gvS3Tyap4e9IH8O1Eya
	sjI665Lsf20x0wHtCfCf7VWd9q0HNa1dlZ4isqf9mEH4GoCAhTdZfuqrCF4F1jzjOf8OBViwuVS
	cDi/R3RPrGvUEs1tL+7sAT6SzUBDbufZtdBdqpVDwUYwbHXK2KtW0BJ6TmpanJ01ShQQRRVgDI1
	LVIJ7rVCF+8P7+
X-Received: by 2002:a05:6214:f21:b0:896:fb99:f692 with SMTP id 6a1803df08f44-896fb9a8f86mr14805046d6.0.1770562068860;
        Sun, 08 Feb 2026 06:47:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89546b09f77sm42179576d6.31.2026.02.08.06.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 06:47:48 -0800 (PST)
Date: Sun, 8 Feb 2026 09:47:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Ben Greear <greearb@candelatech.com>,
	Oliver Neukum <oneukum@suse.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
Message-ID: <17f32422-a93b-492b-a879-ff0a9469b668@rowland.harvard.edu>
References: <69882e77.a00a0220.34fa92.003d.GAE@google.com>
 <20260208085532.2639-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208085532.2639-1-hdanton@sina.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[syzkaller.appspotmail.com,gmail.com,candelatech.com,suse.com,vger.kernel.org,googlegroups.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	TAGGED_FROM(0.00)[bounces-33164-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,25ba18e2c5040447585d];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: AA7A6108F8A
X-Rspamd-Action: no action

On Sun, Feb 08, 2026 at 04:55:30PM +0800, Hillf Danton wrote:
> > Date: Sat, 07 Feb 2026 22:34:31 -0800
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    da87d45b1951 usb: typec: ucsi: Add Thunderbolt alternate m..
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=15ee9402580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a04e768f944f1aa0
> > dashboard link: https://syzkaller.appspot.com/bug?extid=25ba18e2c5040447585d
> > compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=137967fa580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142fab22580000
> > 
> If the hung can be reproduced with PREEMPT(full) instead of (voluntary), this is
> a better case for spotting the reason why the underlying hardware failed to
> response within two minutes.

What hardware are you talking about?  This test doesn't involve any 
specific hardware.

Let's get some diagnostics.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

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


