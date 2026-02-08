Return-Path: <linux-usb+bounces-33167-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA2LDiypiGkUtwQAu9opvQ
	(envelope-from <linux-usb+bounces-33167-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:18:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DDD1091B4
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 16:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB59230071CE
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 15:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EC736074A;
	Sun,  8 Feb 2026 15:17:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E801E360728
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563875; cv=none; b=R0IeBD5XX8+LPg9Gtv8239fqCnEeblX7oDJG6Vircb9MmpQTygsLrMoyuMo0vd2LKstrDMkQxh55MkF6AZQOsqijPFTfB1fm21XnyDxNcE79UHrDJG0t/9+0W7IEqEDIOKyXkyfDnB29tLyIJd7a+AYdxHCn/K/4xpro5a2N5Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563875; c=relaxed/simple;
	bh=2j9pSVQEb68QpfSMu/erABwemGlfb6AK/eV0LH1RM+Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BGMz36lTS9A9RTo8WvHMmSYSO1onJxaXpAfKdSJzugMurpNMgoNIlpSkJDtPPApFB91Cam1rdSRCasdwah3FiZGKEhFVpr5FDJEbwPPNprfUB/UD1cnbqLkHUZ3Tst31RWD6YrbpjRithzkR8YNXZ/f6uHPdbf7jGXRnwU7iRD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d19e3a3770so14414481a34.0
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 07:17:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563874; x=1771168674;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eyjq+gG7AnfkbB+smMYKUKKsvHTyUByluhuE9HZ/PCA=;
        b=C95U7uSG3gAO5jQTWOoOWsZ6yfk4ZQ5eZtr/1X4U8WRrUUFWhR6Qm4wRZsugxI+rrB
         hWTPWYZcjQVhKFy8EvcIqUTlMvtM5Cm6XDd+T115Md0WRROdliGb3jZFrQjW/eeiNIki
         5kD4AW0E+wW7JZlFd1mThQ+qa4uqq91WfiVYR0mW4PYRJOnsX4GpiCKtgMr/xEsNXqyE
         4EV2E8YP/L2dHLpRJjdzs3f6VuFrgXElasTEXfv4sUoVrDq+JAIpc1e9bwpa0ti7WRGl
         x+Epon0VHyaY3zmzMDrwqfC30+Q8RsgaortwFZ9CRhn+G7nq2oyjd6MizTUVT0oEF4dP
         7zZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsIpPelZZ0BPjvuQP99qMQvA4+JVFqssePVtRQtSPAULNmkKYtYhjF1h1z+bpSVb/o3yHPODhRQFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoxbQY+uPSwhnrAx/HJl6sWIpHO3MlmKqJgfyQ7SF7vQCertHH
	Dp71c1GSYUile+Uw0bR2c77UxYh7wKB8dr3hEm/0Q6wzIQhOh9RFL9hyEFcdqWybQJpfzcAeGX2
	P0zuO0GAnnjKyx4A/tOnuCYnIZN2P/4AgFcAsbZemzX67riQIT+Xdd3nzjC0=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198a:b0:663:cb2:d67d with SMTP id
 006d021491bc7-66d0a9583d4mr3633168eaf.37.1770563873872; Sun, 08 Feb 2026
 07:17:53 -0800 (PST)
Date: Sun, 08 Feb 2026 07:17:53 -0800
In-Reply-To: <6c618000-fe74-4429-9e91-b8a012598bef@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6988a921.050a0220.1ad825.0001.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_bulk_msg (2)
From: syzbot <syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com>
To: stern@rowland.harvard.edu
Cc: greearb@candelatech.com, hdanton@sina.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, michal.pecio@gmail.com, oneukum@suse.com, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[candelatech.com,sina.com,vger.kernel.org,gmail.com,suse.com,rowland.harvard.edu,googlegroups.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33167-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1DDD1091B4
X-Rspamd-Action: no action

> On Sun, Feb 08, 2026 at 07:03:03AM -0800, syzbot wrote:
>> Hello,
>> 
>> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
>> INFO: task hung in usb_bulk_msg
>
> Okay, most likely the reason for the hang is that the count is 0.  But 
> that doesn't explain everything.  Let's get more info.
>
> Alan Stern
>
> #syz test: #https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

"#https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git" does not look like a valid git repo address.

>
> ---
>  drivers/usb/class/usbtmc.c         |    7 +++----
>  drivers/usb/gadget/udc/dummy_hcd.c |   11 +++++++++--
>  2 files changed, 12 insertions(+), 6 deletions(-)
>
> Index: usb-devel/drivers/usb/class/usbtmc.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/class/usbtmc.c
> +++ usb-devel/drivers/usb/class/usbtmc.c
> @@ -1362,7 +1362,6 @@ static int send_request_dev_dep_msg_in(s
>  		data->bTag++;
>  
>  	kfree(buffer);
> -	if (retval < 0)
>  		dev_err(&data->intf->dev, "%s returned %d\n",
>  			__func__, retval);
>  
> @@ -1404,7 +1403,7 @@ static ssize_t usbtmc_read(struct file *
>  	if (count > INT_MAX)
>  		count = INT_MAX;
>  
> -	dev_dbg(dev, "%s(count:%zu)\n", __func__, count);
> +	dev_info(dev, "%s(count:%zu)\n", __func__, count);
>  
>  	retval = send_request_dev_dep_msg_in(file_data, count);
>  
> @@ -1425,7 +1424,7 @@ static ssize_t usbtmc_read(struct file *
>  			      buffer, bufsize, &actual,
>  			      file_data->timeout);
>  
> -	dev_dbg(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
> +	dev_info(dev, "%s: bulk_msg retval(%u), actual(%d)\n",
>  		__func__, retval, actual);
>  
>  	/* Store bTag (in case we need to abort) */
> @@ -1470,7 +1469,7 @@ static ssize_t usbtmc_read(struct file *
>  
>  	file_data->bmTransferAttributes = buffer[8];
>  
> -	dev_dbg(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
> +	dev_info(dev, "Bulk-IN header: N_characters(%u), bTransAttr(%u)\n",
>  		n_characters, buffer[8]);
>  
>  	if (n_characters > remaining) {
> Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
> +++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -762,8 +762,13 @@ static int dummy_dequeue(struct usb_ep *
>  	ep = usb_ep_to_dummy_ep(_ep);
>  	dum = ep_to_dummy(ep);
>  
> -	if (!dum->driver)
> +	if (!dum->driver) {
> +		dev_info(udc_dev(dum), "Got dequeue, no driver\n");
>  		return -ESHUTDOWN;
> +	}
> +	dev_info(udc_dev(dum),
> +			"dequeuing req %p from %s, len %d buf %p\n",
> +			req, _ep->name, _req->length, _req->buf);
>  
>  	spin_lock_irqsave(&dum->lock, flags);
>  	list_for_each_entry(iter, &ep->queue, queue) {
> @@ -777,12 +782,14 @@ static int dummy_dequeue(struct usb_ep *
>  	}
>  
>  	if (retval == 0) {
> -		dev_dbg(udc_dev(dum),
> +		dev_info(udc_dev(dum),
>  				"dequeued req %p from %s, len %d buf %p\n",
>  				req, _ep->name, _req->length, _req->buf);
>  		spin_unlock(&dum->lock);
>  		usb_gadget_giveback_request(_ep, _req);
>  		spin_lock(&dum->lock);
> +	} else {
> +		dev_info(udc_dev(dum), "request not found\n");
>  	}
>  	spin_unlock_irqrestore(&dum->lock, flags);
>  	return retval;

