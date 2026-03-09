Return-Path: <linux-usb+bounces-34307-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id r6OxCk7YrmmKJQIAu9opvQ
	(envelope-from <linux-usb+bounces-34307-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:25:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD123A79A
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 15:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72F9E30162A8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501B23D330E;
	Mon,  9 Mar 2026 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Hu+PzubT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D27C3CF66E
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066314; cv=none; b=RhVRjSh3Citi5VJX1n0VRyP/mByB7a0Cf65vUM7ZmRpaCutyN198MAXmcH2gkinwXSG1zLVqn6PMqtbtd6C2NzydBYq7oiP7VfRcENPF91Isuo4bHkQ2qziUpzIZtrsH35dQFJRvWCi1HfIzb2SF8ptW3PJZHhk63ym/SQerJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066314; c=relaxed/simple;
	bh=E1cH4QUcFzrMFXyxenhZ3EBIIeHiyY/JGTBN2yiS09k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J345pM6n6lovwFxiH7AiaxRpgNATR/T6VtZOIC3jBjxz45JQOZFs9DtOwlBYJaLaG+SY24np5Jvd3NejKPbvLhTLR+1nYX1oSRb95RcOacIlrulzrgZ1poCYEaANl5yPT2iUbZi2cmdexL/M2QGoJFOVMuN5lpCSTQ/q3gaWOCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Hu+PzubT; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd90401034so44063185a.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773066312; x=1773671112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8TM6Fc3J8ohQ1tZNdTZAHIM+VRp5pd4c6FXTXs4zbo=;
        b=Hu+PzubTROlN2b+JY9k8w48bHqhk1+2gr+WHiYphh6t9+Zketrz9nTHE6f2Fy37H/u
         Yx37ZZAs6FgQowwrprKMj0WyOs5Rn+j4eYt70UiB6k4Ld8iK7yysRMBE3m0/J9IOeHRv
         1w1Do5BN3EP5E7DlGG4TuMPP/8M+23lfN84kLaVfpXaMD5IytQxQt/nTeMqPOX6ZZOl8
         ZI8bETNMW0mzweikuoVT0+SzrxSW3r1GlxKyvTOvY4olwpad62q0uuuczWGhifRFQYoS
         sr5p/qqtftcBj5loOI0WZbTtsNN0PTwMTHtgYk8Esym2YWTq1NQmJH0N4eeo/V6TxaCX
         +kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773066312; x=1773671112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8TM6Fc3J8ohQ1tZNdTZAHIM+VRp5pd4c6FXTXs4zbo=;
        b=fPYiZxDTKH10Qa3D+ITV5THW1oXrXtLHuR0xDJtmKs+aos25fZevkGQUw8e3e5qVsx
         VkHzczlI302pmv8/TXfjT0jSZ3gUzAAo/H6FmYweobeEjA7fOPz5r0eIAuNR3J5PciJP
         siZqzcs/lsDLnk01nhEgkm7p7c+HSvqVT5FEYIF3N7pAKCg0XM3didQ339cnzGVGXxKa
         7Atzf8x18EB7KmZm/a1JE7Td61HBZBxTRJfkD8UkYKbzbBokfEH/9sKK4lWLmjut/f1a
         ynPvaqGuXXq4da0na55CX+GTV/bNi85MPHQdJSXXLDibNlZoWp2VF6xYXxRbJa/tGNO+
         mjyw==
X-Forwarded-Encrypted: i=1; AJvYcCV038EGmRwl3UJjf8Pj1WEP5bWNkrXKS4L6vo1fifBScKI85gPKjLfhcnYLOipOfxvez0128WmxKT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG6gs1XrolaeMGT2svaKz7E+3au/ODKGQ5Y0bim/d1Bj0TG6K3
	8eVisILMFqrXPKKfL8t5XM+dhHItvjD7ILctPq9j7ajj8/B5V+6bDmfyVrOX2++fuw==
X-Gm-Gg: ATEYQzyaEoGj15euoWSkkDcPitflQNBjaVIIMu2pSHx0AcnZG9QAHzachD78CNtJIQc
	Dcwvj3D92lODiTIfpDX9oFNd28d9sIFNnO0w2KHmkaSLSobXlwHWHD6JdiYrBsxv2mi8puXBf5x
	tnd76dWlUjLZbP15BbEtVfBQbOhf7ip43N60btpFM1ACc1ef0jb+d+1kQjz9IJR8ugqLNOjc2wy
	FWlwirWhBqkSla6DewKxBIgHvKSTX0AvDxTv/vYOf+MzD/5IIKz0doxEZDU4z65khufLBvx4DT9
	emWdoB+lQBJnWtSfty3GFqoLa/E3gpAr+B1KA0ioZaoZRnxXRHbp40jhP7vpdD7SudGVHJ7D4cc
	qB0w8yE50AUJxcVcWN6FcnlJ1q00WXKWqK2grLuvK2dxOUTAd4KPMg3yP4Tf3Y+C5cvTcUQDa4N
	1xnQ8V5chgML7PSsdMFwMCQMqs0M056gfB2IP+65BazA==
X-Received: by 2002:a05:620a:199b:b0:8c8:82a1:11bf with SMTP id af79cd13be357-8cd6d336123mr1386944485a.2.1773066312377;
        Mon, 09 Mar 2026 07:25:12 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f4840b1sm690980185a.1.2026.03.09.07.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:25:11 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:25:09 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in usb_gadget_udc_reset
 (4)
Message-ID: <e9d9d118-e6fc-42de-847d-e58eaf7bcba5@rowland.harvard.edu>
References: <6f521b75-5e13-43b6-9e1d-d2a052c68597@rowland.harvard.edu>
 <69ad9d3d.050a0220.310d8.000e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ad9d3d.050a0220.310d8.000e.GAE@google.com>
X-Rspamd-Queue-Id: 87DD123A79A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,appspotmail.com:email,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34307-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,19bed92c97bee999e5db];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 09:01:01AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> Tested-by: syzbot+19bed92c97bee999e5db@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         65169048 Merge tag 'spi-fix-v7.0-rc2' of git://git.ker..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=133f3fe6580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2a019678b1a3a692
> dashboard link: https://syzkaller.appspot.com/bug?extid=19bed92c97bee999e5db
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=178dc8ba580000
> 
> Note: testing is done by a robot and is best-effort only.

That's not very helpful.  Let's try a slightly different approach.

Alan Stern

#syz test: upstream 651690480a96

Index: usb-devel/drivers/usb/gadget/udc/core.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/core.c
+++ usb-devel/drivers/usb/gadget/udc/core.c
@@ -1192,7 +1192,9 @@ EXPORT_SYMBOL_GPL(usb_udc_vbus_handler);
 void usb_gadget_udc_reset(struct usb_gadget *gadget,
 		struct usb_gadget_driver *driver)
 {
+	dev_info(&gadget->dev, "Reset #1, driver %p\n", driver);
 	driver->reset(gadget);
+	dev_info(&gadget->dev, "Reset #2\n");
 	usb_gadget_set_state(gadget, USB_STATE_DEFAULT);
 }
 EXPORT_SYMBOL_GPL(usb_gadget_udc_reset);


