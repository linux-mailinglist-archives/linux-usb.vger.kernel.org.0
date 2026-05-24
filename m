Return-Path: <linux-usb+bounces-37991-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFNfLXUrE2qt8gYAu9opvQ
	(envelope-from <linux-usb+bounces-37991-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 18:46:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1AE5C333C
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 18:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E2E53009551
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 16:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD853A901C;
	Sun, 24 May 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lB7PAhTX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518E3126BF7
	for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779641201; cv=none; b=SAyvanC8YUpYlnmbbNf4rAC/Y//mcGKqj9daNs3Pd7sf1Phw4DXgARY4N/+WghUDPhXtvN7Tln4LcmkemJ5c7/IQHVmd3rwKu4FWMNCGikNkPzaOw1Nj5n3XUDhAMZ9e0RbeYgRr5PpQuYer81mYyOVx7mZV4APRNCQ9RndvdtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779641201; c=relaxed/simple;
	bh=j2j0D1jOjd4UBCrhIhr50v4K6cW+B+G+YjTRbqpq6RA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyepGLZZO5DwgXE+fIUEM5J4IROzhxoLHzozNOlSPDqqFiH88DQ1AGp2vQo7Rqh1MD1Z8tdgCr52GrhUDG1S9vVE39YVgGzqHjOquzyXv9Cq9gQ1HwDeldNheuRydDzBK8YWTKgeUEm+YJJ+MHqrKAFuthIoYlJ45aAB8MVRYd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lB7PAhTX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8c6fc5fd3so8948196e87.0
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779641198; x=1780245998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLzR3htq1atAmvb17/pEVQjmT80azUTFF79GXEig94U=;
        b=lB7PAhTXlgHBdE96I1VBKRsY1qAG9+cj+m+HVZ4Ihs1AEURWGMHRWYsASjSsVjxYKv
         j45gNvYdm3QuVvPT2OOe8Gi4jjIZUp+7VBjd4W79r5O/4Hc8Ed6ChBoCPvK6xsdhfnV+
         CDFXiGzwpcdjLSNuiYFakfLSX/S57z8Ruccb5zx4NIbcRXbyqOGRcw6+l0m2t4r7T4bo
         yetc+rGFV9lBTn6jD2GYZH2aVeijBaTF0dEvZ+fSL0fQkcQ9KPqkagkA2qNs3JPmcIQj
         +6P1iuNNc3PiAj7EqYXzfJmkIj3jiajKhtcY16qe3eBViAUoB86N85qqb8j078Aey6pl
         JEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779641198; x=1780245998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLzR3htq1atAmvb17/pEVQjmT80azUTFF79GXEig94U=;
        b=hjnU3ov1Che36BWEsDzXMCIovR7YhUzydQPBEyYeDJk+1+eeyJZXiuStLGEaGToi0m
         YLpCFesTJuvuk2P1S92hzs6nPTV07gbYoud0EB7IFYwgAh0O9WCdj8Ir7gnHIni0nK2J
         GBrAJzPoUSNu85lLPXKXJ5JypQzpFB3kH7qnj9svx3rxQS8u6FzPrHpoSuHrGTFRlddt
         05drzIs+zT8CdtxBei732TpSgrjw9bvqWapQ4RmMZLAERsisV+V9S3pEV+XiCE9StVLn
         JFEIQUsiEoypGHfuzGKe8jKalgigbLF8JTR4A2F4uNhfRbWxIQtb4Glg8mmv98y2iPfd
         aR0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mMSyQV7nJp6vO3ThLkhvOlWirxRc1Mz1QRJeF/9OY6ABmZQwI5ioft7ShFJHjOt6C20MKMTEHQuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGusFI4AGte3n3SfCD/sA6fnmoDc5bMEG2M+mGxvL878WIsH1B
	4pLUyvGxwLwLVhhlznZyf8Nfx8ss3vPU1EDGCBm6PkVW7hBHgSnqZqvj
X-Gm-Gg: Acq92OEGXsS4MNBqZH/CIySztPN0Ysy0lUIBDbE368Bo0I9yKqYlYf1d3wFfr+TanoT
	uqLbFI0nJdBgsfXEcHeq+4N1GKRDOnR4H9DTwhAqOR6cyUsTjg3r9yr/CoA2Lsj+UF2i2RGusPB
	SMoc8pvqudghBYfXBiQaFtX2OkVR32D5QRzQ5XRlWAAPr7MyEDQTKTlJkPi0g7KflfZsGIdvDVO
	tB3U48V3y5xbL4ggmnUAc91H0UHqDhuGXghCQp9BvJgrCtOOKmIX4Qu8Xoi6odOb7LYJf1ta7i8
	z4fnP6Ixr5O8wr9frlO5tPejdrCkdEhaK/jbN6NVfwhEUOz8C1mIdWp0dUgerOgIyPn6FQd2pcP
	U0EC/BKPQRsOWpEofn5Ek/Xp+NL5dJSMjhlEsaYMX/MPsAmh5JTW1v5AtLiOJpB9/g33pzjEC0z
	W3I7eOGAdG5gQh0nqYV414MZZ0Io6Yhgoz
X-Received: by 2002:a05:6512:1444:10b0:5a8:6def:7e38 with SMTP id 2adb3069b0e04-5aa32308639mr1895271e87.15.1779641198193;
        Sun, 24 May 2026 09:46:38 -0700 (PDT)
Received: from foxbook (bfk48.neoplus.adsl.tpnet.pl. [83.28.48.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cbabd1sm2006938e87.34.2026.05.24.09.46.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 24 May 2026 09:46:37 -0700 (PDT)
Date: Sun, 24 May 2026 18:46:33 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Joseph Bursey <jbursey@uci.edu>, syzbot
 <syzbot+ad2aac2febc3bedf0962@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in
 iowarrior_write_callback (2)
Message-ID: <20260524184633.405c4b3c.michal.pecio@gmail.com>
In-Reply-To: <69c60a2a-68d2-48b0-8236-b80cd6b602cf@rowland.harvard.edu>
References: <6a0ce39b.170a0220.39a13.0007.GAE@google.com>
	<32c79569-8001-48d2-9675-b38b1670f285@uci.edu>
	<20260524103053.308501de.michal.pecio@gmail.com>
	<69c60a2a-68d2-48b0-8236-b80cd6b602cf@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37991-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,ad2aac2febc3bedf0962];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 2E1AE5C333C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 24 May 2026 10:45:39 -0400, Alan Stern wrote:
> On Sun, May 24, 2026 at 10:30:53AM +0200, Michal Pecio wrote:
> > On Fri, 22 May 2026 13:38:40 -0700, Joseph Bursey wrote:  
> > > Hello, I believe I have a reproducer for this bug using a
> > > combination of syz-execprog and eBPF programs.  
> > 
> > Hi, could you check if this patch (compile tested only) fixes it?
> > 
> > I admit I'm not an expert on USB core, but I see nothing _reliably_
> > preventing URB submissions after usb_disable_interface(), which may
> > be the root cause of this bug (besides the driver sloppiness for
> > which separate patches have been posted by Johan Hovold).  
> 
> The general attitude has been that it isn't the core's responsibility
> to recover from bugs caused by drivers.  Rather, it is the
> programmers' responsibility to fix the bugs properly.

Well, there is also the attitude that core doesn't do crazy stuff like
removing endpoints and resetting or suspending devices with URBs on
them, so HCDs don't do much to handle such anomalies.

https://lore.kernel.org/linux-usb/5f7a69d7-87fc-436b-a3c9-b9d4fc1a5c17@rowland.harvard.edu/

Combine the two and a buggy driver might take down the whole bus.
I'm inclined to see the existence of these usb_disable_endpoint() calls
in various places as an admission that USB subsystem has never really
placed much faith on all those class drivers. Maybe rightly so ;)

I noticed commit f9a5b4f58b28 ("usb: Avoid use-after-free by flushing
endpoints early in usb_set_interface()"), which sounds a little scary.

> On the other hand, it won't hurt to add some code to the core for 
> detecting and reporting buggy driver behavior, so that the
> programmers would know about it.

Current situation is that core removes some 99.9% of all URBs before
calling disconnect() or performing aforementioned HCD operations, so
recovery paths (if any) aren't getting much testing and one could write
a successfull driver without even knowing that usb_unlink_urb() exists.

But the remaining 0.1% of time things like this syzbot report happen,
and back when the number was more like 90%, the remaining 10% was
apparently quite exciting on the xhci-hcd side too:

https://lore.kernel.org/linux-usb/20180721105509.hjocon6ngk2liwo4@debian/T/

If the URB elimination ratio could be brought up to 100% with a small
tweak I think it's an attractive prospect, hence

> > My patch tries to fix it by updating ep->enabled under a spinlock
> > which will be held while checking this flag on submission attempts.


> > I also suspect that more UAF in sloppy drivers is possible due to
> > usb_hcd_flush_endpoint() failing to wait for pending BH givebacks.  
> 
> usb_hcd_flush_endpoint() only guarantees that the HCD is finished 
> dealing with any pending URBs.  It is not meant to guarantee that the 
> URBs' completion handlers have run.

Fair enough.
 
> > It seems that dummy-hcd doesn't use HCD_BH, so this shouldn't be
> > a factor here, but it could become an issue on real hardware.  
> 
> Do you think it would help to provoke some exotic bugs if dummy-hcd
> did use HCD_BH?  That would be an easy change to make.

Not sure, besides the obvious possibility of a BH completion being
missed by usb_hcd_flush_endpoint() and running after disconnect().
Also not sure if syzbot would catch those cases if BH is enabled.

Regards,
Michal

