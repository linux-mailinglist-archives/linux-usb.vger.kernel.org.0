Return-Path: <linux-usb+bounces-33172-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kp5GejtiGkKzAQAu9opvQ
	(envelope-from <linux-usb+bounces-33172-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:11:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E46E910A14E
	for <lists+linux-usb@lfdr.de>; Sun, 08 Feb 2026 21:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22E7430191A9
	for <lists+linux-usb@lfdr.de>; Sun,  8 Feb 2026 20:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1911233FE01;
	Sun,  8 Feb 2026 20:10:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4F33F8A8
	for <linux-usb@vger.kernel.org>; Sun,  8 Feb 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770581452; cv=none; b=FTGRzcH7pOW0f3W6Wlc5HVgVyfjNNNLAH34my7AVOwwuTWZD4qc9tdlooxpJ+Zz8QUFTe+6FXE/l3WV5856Lx+eCjFUq2dxxiZcLq+c1za4ui4F/1fns9qxPuUqfB7UiXNSByQcuJuCDqaR8eDHn5WwW6EO2TVXNpNlntKwL+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770581452; c=relaxed/simple;
	bh=nijB+r77J1KzQJaDCsx8OsyvTDBwCs3VimW3uJf+RtE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=qd23PY+zlJmsVH+L7YSLxTfMhTfbcRZwyr2mN5I4+anspfudtI694wuIGSuLrFAjhhOmpQEDhgPm8Yc2+NnzBwzK8LCGiZZ5sqmW/TTqRKMPiL8dpg4q5Ie473pWkKQNT1zTJqElvyctcNwZH34CXN0T524uQqu0mSoRCByx2dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-45f148c7fc6so12501774b6e.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 12:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770581451; x=1771186251;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hQzZQ8oGJABHiHZENV6qBqUA0TTCO0RDqeLcnOsMxCY=;
        b=lS5JOgSMUf6T6sI7lvLkY/jYsC+/B07nYdU7CC99KyAE0BAdN65fJCzGObhrz/p4yd
         Lxj7dcZJG1+p/b4IjdgyxMTv3+D11alNUB3UeSW8rIHswnrmuYOPwRADNCFUgBdhLweB
         yLYB6wGnAmaJS4mIMNJnUxLV1dU6MaRxVtmFYnev1uKFFWjUYZ7/+imxPNKlehovrMf8
         fX1I2gOUvOWSWwZtGaQH/uVTYS5V+g1OK4WUnUIdWSmR1tC/INppsJ2BcJJK2IuU7j+9
         1pU8+mj2gVaKAPTst4kjBwNTwf47tTglpL6KIHjG8Rhs4QKtDxGrDcijHZaI/CiLJ6XT
         QWoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/fVICy2EXRQ+IetayOzzIF+3/gdOwpRnlfIN47zwUCyHprQ2XA+9nWY4kUckZxLu7R+2TEF6Ux+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4L7VSA3Kka7Ez+5NijhvF4InAKQ88ZSQU7cIqx1H5Wi9i0Ztl
	cUmloPJTUba19FVcX7ej8752PDVbvvmaqFDjgQ847tMFcoIaAbwmt8WF4zZ49eVp5Ik3mLrcdCw
	pBUad0B3NyOw5tI8f3dxjqVkXZ6VykwH4eGHC2V9x3xYW7OtTfIMLyWvvQJs=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81d6:b0:65f:66c5:c3e with SMTP id
 006d021491bc7-66d0a479588mr4288396eaf.22.1770581451616; Sun, 08 Feb 2026
 12:10:51 -0800 (PST)
Date: Sun, 08 Feb 2026 12:10:51 -0800
In-Reply-To: <f986d2fd-e2a2-4233-a7bb-df962bcafcd5@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6988edcb.050a0220.3b3015.005e.GAE@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-33172-lists,linux-usb=lfdr.de,25ba18e2c5040447585d];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	SUBJECT_HAS_QUESTION(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E46E910A14E
X-Rspamd-Action: no action

> On Sun, Feb 08, 2026 at 07:50:03AM -0800, syzbot wrote:
>> Hello,
>> 
>> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
>> INFO: task hung in usb_bulk_msg
>> 
>> INFO: task syz.3.17:4981 blocked for more than 143 seconds.
>>       Not tainted syzkaller #0
>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>> task:syz.3.17        state:D stack:26904 pid:4981  tgid:4980  ppid:4531   task_flags:0x400040 flags:0x00080002
>> Call Trace:
>>  <TASK>
>>  context_switch kernel/sched/core.c:5260 [inline]
>>  __schedule+0xeb0/0x3e50 kernel/sched/core.c:6867
>>  __schedule_loop kernel/sched/core.c:6949 [inline]
>>  schedule+0xdd/0x390 kernel/sched/core.c:6964
>>  schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
>>  do_wait_for_common kernel/sched/completion.c:100 [inline]
>>  __wait_for_common+0x2e7/0x4c0 kernel/sched/completion.c:121
>>  usb_start_wait_urb+0x147/0x4c0 drivers/usb/core/message.c:64
>>  usb_bulk_msg+0x22b/0x580 drivers/usb/core/message.c:388
>>  send_request_dev_dep_msg_in drivers/usb/class/usbtmc.c:1350 [inline]
>>  usbtmc_read.cold+0x48d/0xfe7 drivers/usb/class/usbtmc.c:1408
>
> Unfortunately the log didn't contain any new useful information.  Let's 
> try looking farther back.
>
> Alan Stern
>
> #syz test: #https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git da87d45b1951

"#https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git" does not look like a valid git repo address.

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
> Index: usb-devel/drivers/usb/core/message.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/message.c
> +++ usb-devel/drivers/usb/core/message.c
> @@ -57,15 +57,21 @@ static int usb_start_wait_urb(struct urb
>  	urb->context = &ctx;
>  	urb->actual_length = 0;
>  	retval = usb_submit_urb(urb, GFP_NOIO);
> -	if (unlikely(retval))
> +	if (unlikely(retval)) {
> +		dev_info(&urb->dev->dev, "Submission failed on ep%d\n",
> +				usb_endpoint_num(&urb->ep->desc));
>  		goto out;
> +	}
>  
>  	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
>  	if (!wait_for_completion_timeout(&ctx.done, expire)) {
> +		dev_info(&urb->dev->dev, "Killing URB on ep%d\n",
> +				usb_endpoint_num(&urb->ep->desc));
> +
>  		usb_kill_urb(urb);
>  		retval = (ctx.status == -ENOENT ? -ETIMEDOUT : ctx.status);
>  
> -		dev_dbg(&urb->dev->dev,
> +		dev_info(&urb->dev->dev,
>  			"%s timed out on ep%d%s len=%u/%u\n",
>  			current->comm,
>  			usb_endpoint_num(&urb->ep->desc),
>
>

