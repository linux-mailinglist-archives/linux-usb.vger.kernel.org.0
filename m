Return-Path: <linux-usb+bounces-36451-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8F9WIm5D6mnqxQIAu9opvQ
	(envelope-from <linux-usb+bounces-36451-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:06:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1536454A30
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FD0D301455B
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EEC371D10;
	Thu, 23 Apr 2026 16:05:40 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2D36604C
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776960339; cv=none; b=OAlVlWAc5YWKZ85DQiV7Wr8Pi6C59LjAquPL42RR2YxYw+z6f60jNB49uL7dNCik/ytWXGuegZVTm0Vqj739XZYSd9ggOIKQBGUatyYSthTNdkNgdHgsC0IpgIeTyH1jFBfuljKztD7sHMnpOkYL0S+MPc48hGJBmZFSoshfAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776960339; c=relaxed/simple;
	bh=iIWp6i9FcI76CiqwMJMv/Ax78ggiIRTJCmzS9UPQ4VE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=l2QrifezHNRNPwgDWQshjPZstmCXrWFTVHwqZ63nWI7oxmcNapY0TgDiKLWDuZBDXfayrrSQfYn3tg7Tc077Z50RzVd3XvwH/twXNWvRWTgoFftL60vgOGXkuUtCh6XqChsaF9JnnJCyXiwsF2aN/tatjnl+qY0Jy3Ppwg0qtUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35641c14663so8277590a91.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776960338; x=1777565138;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3HadXVXm8Vbqa9+RiiKD2XKixY1TBNX5MNBCpPCreo=;
        b=eqjW9ZOpvGzB9n5bIB3m/wv8vxla3cNsPlHGZfBy4GjweTS5dt+V0KO6++HKwA9v5T
         I/dBozsSNmVKNNbj6Z+MRg81FNPvt0WyIhRTu7hKCE6xP/bUIRAH2eXkN44IaqfYRS8w
         fcOEN8Oi89m9A/YoEFaL8Gdes53Qsxb49QkpRDse+0jdYMZY7jTyXULGzzzyjBuLbqpK
         pPbDoLgnu2jsSaFmPqXJLnY2ezzIhTI72CPNIqo752mcgfm6+7qV4npg9vpEif8gs+P5
         XT9qtzl5xs6qyTZ//a982GVH5q/wlS6AdNGh5rRrAWvoH+rD99Cu3JJO7cs3ql4U3/7G
         27yw==
X-Gm-Message-State: AOJu0YzXb/AXOuK1bXWSfgbUC0I2rr/Inlvs/jnHDttSZgMBQPISJktq
	wZQHyiSbgrhgfveWg9VWBtVY4w9gaCdk1LUblNfUwTdCJSQkQgtsYxesI34WNEuBPMtGWZ79Uow
	1v0kFlwV/wFrSJ+G23GGeGPy9SKjFWdNT81BVkxbS/mfOZla9e7CrTISmdow=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a17:90b:2ec7:b0:35f:c0d7:ac54 with SMTP id
 98e67ed59e1d1-3614041aa7amr28878440a91.12.1776960338100; Thu, 23 Apr 2026
 09:05:38 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:05:38 -0700
In-Reply-To: <c23ff4f3-16a1-46ff-946e-b5dbda209f57@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69ea4352.a00a0220.17a17.0041.GAE@google.com>
Subject: Re: INFO: rcu detected stall in dummy_timer (3)
From: syzbot <syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com>
To: stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	TAGGED_FROM(0.00)[bounces-36451-lists,linux-usb=lfdr.de,4d3749e9612c2cfab956];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: F1536454A30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> I'm revisiting an old syzbot bug caused by a tight resubmit loop, this 
> one in mceusb.  The bug was fixed by commit 476db72e5219 ("media: 
> mceusb: return without resubmitting URB in case of -EPROTO error."), but 
> I want to try fixing it a different way, by changing dummy-hcd.
>
> This is a preliminary test, to make sure the bug can still be triggered.  
> The patch below doesn't do anything -- yet!
>
> Alan Stern
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 811d22141369

This bug is already marked as fixed. No point in testing.

>
> Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
> +++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -231,6 +231,7 @@ struct urbp {
>  	struct list_head	urbp_list;
>  	struct sg_mapping_iter	miter;
>  	u32			miter_started;
> +	int			missing_ep_delay;
>  };
>  
>  
> @@ -1275,6 +1276,7 @@ static int dummy_urb_enqueue(
>  		return -ENOMEM;
>  	urbp->urb = urb;
>  	urbp->miter_started = 0;
> +	urbp->missing_ep_delay = 80;	/* Microframes -> 10 ms */
>  
>  	dum_hcd = hcd_to_dummy_hcd(hcd);
>  	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
> @@ -1863,6 +1865,8 @@ restart:
>  			address |= USB_DIR_IN;
>  		ep = find_endpoint(dum, address);
>  		if (!ep) {
> +//			if (--urbp->missing_ep_delay > 0)
> +//				continue;
>  			/* set_configuration() disagreement */
>  			dev_dbg(dummy_dev(dum_hcd),
>  				"no ep configured for urb %p\n",

