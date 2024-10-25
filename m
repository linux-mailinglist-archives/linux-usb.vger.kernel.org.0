Return-Path: <linux-usb+bounces-16717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E23269B07D7
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 17:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6A08282D44
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 15:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DFA231CBB;
	Fri, 25 Oct 2024 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Co4YLX8B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365EA231CAF
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 15:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869220; cv=none; b=Xxnu0fDMD5PwoDYGEJdx2dvWUcx6NA+YYzMba3wipke98LxR6BHGXTwW1KAydPl3+nVPy+kWw9TPyGlT7s9h0H7wA0QqfJrEGngjQ1Zlk1g0ZdDBBRY0q0KU/x4GtJl/om6ELPOwLp3EUG/8fW5iQz7qDzFFrl6Mn6+kkpqW8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869220; c=relaxed/simple;
	bh=jjhEJPptethgjzwbLQgHQEbpgTKW93lbhZcDW+yg5Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8E3YYgSQO5IDO9V7EmDEAcGswSpGJw7CcV7jzUKFcN4KKMDwiSSqsu5fE27EbkNIxdyehYYcpIAfgdXpl9pzvljjtZvNu/1PbClOheIQu5LElRAaQScSq4fjuw9JforlBoE728g+Yp49d5qqybKCHvZoqPCPjs9HATuQuMOlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Co4YLX8B; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6cb82317809so13069336d6.0
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729869217; x=1730474017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ob9J20yg1EvtCmSQIYYm4VaG6/BYPtCl9JLxfLLlhDA=;
        b=Co4YLX8BAkzwoA9girfLCTeYlFzTGG6qnSKrTGrNHYc0R3yh2nllHeaWJ5Q1PFzUdP
         uQlRIHjsSp1usZGuhmp++GoKoHFB9kpfiTLHksjD08e1Euty5nxamKnIpmmUmqjFVIbi
         eFtPK596lW91fDIH+33Y5ClnnwOlbdkGe22fSpav98pQdRkV3eLb08WVX3BXoAD30YsU
         +zSIM91wiuAlh9VeqWMNAp9jEjaR/129JjqcnFcsbt92i9ipPfmu3de44t9Lav4q18uH
         cXqJxlFizrH5IsG8f+7znD4vDwoGddjTWGoSVZKk/Tr+ko99JsfLH6+bLi4ft9MQINFg
         IZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729869217; x=1730474017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob9J20yg1EvtCmSQIYYm4VaG6/BYPtCl9JLxfLLlhDA=;
        b=Q/d4xQz66Bnm4FhqwnP7+09S10bNixEDE8RQoizQxg3a93gzkLfZEd6v9QHVzH1zkI
         LIUoDtOR6vWcNZzHwuiTbPXYk3hw7wTibiQSQlS9p4//c+j4H3pjdwwh1HFp13L0F8bI
         6AzBvmw+Jq2z3r7nGzzCza7QBGznuFZxbA8amuVi8LP7myLyu7Y7k/RNsDE4Gs/EdkV/
         63NgaGPCFyhYkFynXd7yj4lKTADFwk0+jMegSi2uGi6c7NjgUvZ6cHCa7PVW87s3vAZ+
         LI63MdTXxdgT0/uTiY7Nmj5LLfmnu+uHjm56jANMwp+TmHz4uCcxODLumqNyntWF3nkZ
         R7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2jw7eMF6ViCbAgCa8Uk3Z2/Yt2daL5U5NRbXfB1Tjeir2ogjEIxbkWGvTc2ebx7rzm37NH9WtNY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQJvlbgP5oLQzwUfen2qzHMeeeyNbrmu9jHRicwA50SQ8q5n8Q
	8tm7ibmJA2F7SLpdPat2p1kIWMLDHY1Cq1fAbp4j6SITNKbR8PnCcR22g3RyYg==
X-Google-Smtp-Source: AGHT+IFRC0zpJ4ztR+NlXTGogQURe8G0MbwFZddw+Mqy2FLyvvPsPABgZ1YxFaEmRVPEcniozaRZvw==
X-Received: by 2002:a05:6214:2dc5:b0:6cc:44b:1060 with SMTP id 6a1803df08f44-6ce342d2640mr129470286d6.32.1729869216999;
        Fri, 25 Oct 2024 08:13:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a5660asm6443376d6.140.2024.10.25.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:13:36 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:13:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: syzbot <syzbot+0ca979b86eaec7337a89@syzkaller.appspotmail.com>,
	Liam.Howlett@oracle.com, akpm@linux-foundation.org,
	jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	vbabka@suse.cz, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in
 vms_complete_munmap_vmas
Message-ID: <967f3aa0-447a-4121-b80b-299c926a33f5@rowland.harvard.edu>
References: <671b7fb2.050a0220.2e773.0000.GAE@google.com>
 <832afb0c-98b7-4d29-8436-1ff6a65133b8@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <832afb0c-98b7-4d29-8436-1ff6a65133b8@lucifer.local>

On Fri, Oct 25, 2024 at 12:37:36PM +0100, Lorenzo Stoakes wrote:
> On Fri, Oct 25, 2024 at 04:23:30AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    c6d9e43954bf Merge 6.12-rc4 into usb-next
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=139f225f980000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=4a2bb21f91d75c65
> > dashboard link: https://syzkaller.appspot.com/bug?extid=0ca979b86eaec7337a89
> > compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=179f225f980000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/3bf4a453ec2f/disk-c6d9e439.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/e4a2db2a5d95/vmlinux-c6d9e439.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/8eb8e481b288/bzImage-c6d9e439.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+0ca979b86eaec7337a89@syzkaller.appspotmail.com
> >
> 
> Isn't this just the same thing as [0]?
> 
> Again I think we're just happening to hit a stall in the unmap logic rather than
> this being an mm thing.
> 
> We retried that one a few times and it didn't hit any mm code after the
> first time.
> 
> Greg mentioned there was some weirdness with the dummy usb hcd controller
> in [1].

For what it's worth, that weirdness has been fixed in 6.12-rc4 by commit 
5189df7b8088 ("USB: gadget: dummy-hcd: Fix "task hung" problem").

Alan Stern

