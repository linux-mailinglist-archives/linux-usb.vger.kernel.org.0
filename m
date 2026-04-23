Return-Path: <linux-usb+bounces-36453-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDAQJXRH6mkhxgIAu9opvQ
	(envelope-from <linux-usb+bounces-36453-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:23:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D64454D21
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 18:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E9BD430A6945
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486D6393DDB;
	Thu, 23 Apr 2026 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dUabLEIL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710FE3B5832
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776960709; cv=none; b=OXzxqCRsbXKE3Ux7FxZeiE6J1NBtuBmqpOLaXvhG0YOFB2R/7BW4zxKccIXUCDhnFrswwKViHqms0Ba20K+DtwHUVpiq49x6lqkmb8WoEJsC0IMGGEe5abQogtHLmM4uc2MC+irllkCQfQc6xkAgeK2u2z3PZJY0iFAxqtQsyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776960709; c=relaxed/simple;
	bh=YV5X2bCjv6GGS7dEsT4XonzRN49kh1U6A1xYA4r13z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RinNG/PjSGcJiRmZyPGXAwOkgj7Yuq56ixdw7um5w30EqDfni04OIAHMwuzXrWbDLHRAHVG3zVz0mcaLAGD64OYabfsbd/00poFqim5UznDTSC13fkW7Kkkcv39FugZQWBxSoX0hoNxye4mKWNfV+hToi8en9Kh76grKcAfz9Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dUabLEIL; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50d75bfb259so50862471cf.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776960707; x=1777565507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgObJLNSNVstrwi8WPQbb2HH8PTQiVBip10GVZVqWOY=;
        b=dUabLEILthTuGBZgRpMgQZtt2NTPMHbfDE1BwfNIS617TaIiucE+6+EZlGWuocUOKx
         zlCN9oYqnhx/SjUKHOArUgr/V9UCtCgNUbpgRq7SPwx+08x+MOuurY62qTYmUK27sRWc
         RL7ZVIKIuCSzfDz7qcsWj+vhfXxDwqupAJkR2vEN03msLzXR9t8DKAVUGb8indNNlhQ4
         0GuQfZs+04wcKY0Plgv02OCo3P/bRiF4h3dOHPIDOXauE/ep4qYiDsLZVTV3TbhwxCOg
         jVTmwuJGelS+l26naLvH4Fv9G9N7fF+v9bx8ot02OwmgLD5hI+7AjrrtIUudrSARqktA
         Wk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776960707; x=1777565507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgObJLNSNVstrwi8WPQbb2HH8PTQiVBip10GVZVqWOY=;
        b=RxtvXNpH125Mnl0pXXGNrshvoxOa3dGGErxV6MPEXhx+HFOJfVzrEWNL0N5CMaPg+M
         biUtFV1mn0YXcwhkkYvuMCjLbs3Px4CDXRGtpSMFtN14ZSCeecm2SBytfte7ms35NQ7N
         3MWztA5AJ0TUX/ukB1Lxlafym6wj7nKHub6CIQuxuH4a2Ks9VROIOq8ws7I6tHFTV07q
         /bq9mcAwyVhmYOKnF6u3E1vv2yql79t5wNOBUT8+4MuD5V4d1Fbk/hghZUhcAJCRXJwB
         A5JX0l5OZUDn8g3vN7w/CZrznA0VvUaeDGuv5vTl6HhaPZ8mXZzvZulTjhmGToaak+0w
         X2MQ==
X-Gm-Message-State: AOJu0Ywf8RhmPgMEEekWKcb1bWrrJFchM4O0qRTzjbfN9zEsQoBVJnv3
	HO6sf4fWv2ii0HLafnnidj0msDFQSId3Lz3tCUdxwBKILSYF5p6Em5KhWklcNM9XqA==
X-Gm-Gg: AeBDietnDgRxHoRHKnwlQ/OAiw0Ltc/IpOI4RbpBp+ze7axyTKY1hboUmWoXKBId7WB
	eU7KYNTJhP10plJTYlRul8nu6Hs7N3PE6m/KrFCE70mwiPVzvbqB87kJ//5b5m2/XZtPThzWBqD
	dmZo//mQWAAN2Hh0VMuriVpsDIM93d+FtNV4FoGwpTzW/UBuRkMjuRVuxdzk5RVTwKfEDIa1iSw
	M6y33fxGFyjMJI6pV3OD2aUH7W4xkcHjv42xxCWETlWHqvkjvJj+iqFNWgGApC5rnxx3qwxXZvk
	LuL27i0fefVngIwm5B7GX6sNuclOvDvbqK3s6RIizt3AEItiZe3VrqyZnQuVEt9b2ShUIN93F5n
	2sEud3FGH/l2bO7zqdm+MFnoN6wFWXOheN9ZPG+XAb9b5FkweOzSjUtGlrS+rnqZpwWtOuYn0T2
	467iSbxUMcfuFfB9mfalK6Rr0bPTRXUIrbEm+Kwam9/cFUVelqO2R0SFelYM3ypSpRcuqTTFljG
	sAs/88UopbiAItU
X-Received: by 2002:a05:622a:1b24:b0:50f:c26d:f31f with SMTP id d75a77b69052e-50fc26e284fmr113945511cf.19.1776960707353;
        Thu, 23 Apr 2026 09:11:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fad4dcc46sm92673771cf.31.2026.04.23.09.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:11:46 -0700 (PDT)
Date: Thu, 23 Apr 2026 12:11:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+4d3749e9612c2cfab956@syzkaller.appspotmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: INFO: rcu detected stall in dummy_timer (3)
Message-ID: <97b26c3e-d025-44c9-b384-b33db0f01a62@rowland.harvard.edu>
References: <c23ff4f3-16a1-46ff-946e-b5dbda209f57@rowland.harvard.edu>
 <69ea4352.a00a0220.17a17.0041.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69ea4352.a00a0220.17a17.0041.GAE@google.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36453-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,4d3749e9612c2cfab956];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1D64454D21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 09:05:38AM -0700, syzbot wrote:
> > I'm revisiting an old syzbot bug caused by a tight resubmit loop, this 
> > one in mceusb.  The bug was fixed by commit 476db72e5219 ("media: 
> > mceusb: return without resubmitting URB in case of -EPROTO error."), but 
> > I want to try fixing it a different way, by changing dummy-hcd.
> >
> > This is a preliminary test, to make sure the bug can still be triggered.  
> > The patch below doesn't do anything -- yet!
> >
> > Alan Stern
> >
> > #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git 811d22141369
> 
> This bug is already marked as fixed. No point in testing.

All right.  I'm going to do something rather heavy-handed to convince 
syzbot to run the test.  I'll try to remember to undo this action after 
the testing is all finished.

Alan Stern

#syz unfix


