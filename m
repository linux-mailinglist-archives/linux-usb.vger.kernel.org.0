Return-Path: <linux-usb+bounces-25763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E918B04040
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 15:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553603B1BD1
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 13:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F6B24886A;
	Mon, 14 Jul 2025 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fedjZVEo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B00D19AD48
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500206; cv=none; b=QWKcLWSxLx3X7ct7g1UzvqtDCQa2neXFduLwPU/VOoxhtSI16j5cS3i7sVi3Q1uvjWw6+M1yhoMYH34nBPm7J8ruOVN7tTmEqmgM52slwMjRAt2Jvf/wJ0d58SRKnNS4HHQmEWJvOrOYvLPNhITC3qOMm9+hXbiDVzIpRqlZU+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500206; c=relaxed/simple;
	bh=AFwuCN2vX0YXwi1bAc0uRw1duEUI/zG6mrRV1RTe8vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deDuysMiTJcu5rrKsbftYZF4sajiU+v6poylJAMqAhZSvypocHDDeIbTkrU7CLuoow19fQTZxGBehtG8/1hYNd6KE1dRCm52nHHxVK4DXEpAd8DvqYbuDQGWaffKLoVQNGjAOOSk6bcSf5Hj+ZcNyLJJ070wM7EnCzKNah8II0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fedjZVEo; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e334de8df9so15940685a.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752500203; x=1753105003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzEuDbRvDYwQi9yz42oCAYTj76hJiOhQZR85jUMWpaM=;
        b=fedjZVEovtpIk6GnKqLQ0x2ceygJjssfBNQHnwRkPaBdCiygMMLw52sMfZQBIFEMha
         tVuah9ynOAfM0LoI0IXk+Hzyqx56YIsGGpJeG8xKUTqpZta3O4olzGSmyUrrKmc9XwrJ
         nsNrb1uJPhcsdixsr9B60fZulBP0FpVPnJMH97vcn3Z6PeBouYIOKP69lZITISp0TfPH
         CJJPNFy4R6x/bEUWTeiPFnkd8vbKBmpYw+/q+o22aw1oxa3o9vG1Q49TC6oVmj6shAsV
         ecfeB3y8wpuquPlD7qmWLdvKqNRGd9hF8EnNKNOJVSSBIsXpYF0DXeyjwl+r2MiMt0Dl
         4eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500203; x=1753105003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzEuDbRvDYwQi9yz42oCAYTj76hJiOhQZR85jUMWpaM=;
        b=AbV55bFHMtZNRCwkU/iqNHrUJnxR04jd/n0CdTJ8IhQXQLxQH0l+JvbsqL37gsiN2D
         ppnkCJ22lfhXHGqXP5fMFfXAv4wCjqP0ZKn8xo8QtW1ARXuZPFJ66PldeG0WkvB8pucf
         8JivfAdOHa+d9AhDF4g4IvAaMh2X+wKJaGZ8uaxWapeeZwOikqL+RGEpunD6Rd2m+SEk
         wLPgb1QW97T0JIokp2KDB8lOH2HIcHNwO9pfwWsD140dB/FI834XxxEtrIsTpWkB8OKz
         VLa40o07nZjG8uYFabcXWFALe5Ri4hlfzw8kQyC7NJb4eFWGpaXdMT2h2LTbYJhtc3Rd
         3CwA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gRQAOmaA5F3DVwoYz7zwYx12oLyr4WZwNuL4BbLWzNBaWntNohTVDGiNHNKky4arshU7jSpJ9gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YypKc5YE2iSHCF9Rj9LmL0lvKb1zT0GlPqyApASy5yMfpE+u9b7
	VHK4yDeiG5aB1jdKwfss9ne6/ta8vL/rGBHPUdLpWxffdjdKJfoH6OzHq6I+aULPfA==
X-Gm-Gg: ASbGncsdDuH2YyEOgpGoQZxoYzuV8yFQ4/w/OowF9i6dLKvMj3FJ1vqJZ8+Gf/e1ojr
	7GrPY1Xu9n6jy6mdj1o3HF3EKZqZkGruKmVy3vTlASiYPShhsV7ebNC2xvrpR1DtYaloA/aKZyW
	a1IqgnCZwetcrpbrCqPnlYXn2SCUBFZRGPD582PRNORHmnOPTs7O9eVOuld9xTg9TsckT3ljd02
	s0pmQYwxepfvTMm+99/xCqJwlkvHUXJqJEBdlTYQY15NA/d7jv3mAA1wrJ2I/iqid34ulZi+peM
	Npagr688AcT9OCn6iQzIIqiXCZkkGOvlLDQSD4VqVTP2Nv11XvdafHqG/O7HDW7BbYhdjFTj6Pu
	TARKl/zWTxCQVvGXNeU+w2Ac=
X-Google-Smtp-Source: AGHT+IEkMGy0P93fi+8WY7gmhCfOfV2V9LDV8Tp6KgMmdWe1QqVkN12EUDvmUpKqXUFSah8FXeWtSQ==
X-Received: by 2002:a05:620a:1b98:b0:7e0:6402:bece with SMTP id af79cd13be357-7e06402c8c7mr1302094385a.38.1752500203091;
        Mon, 14 Jul 2025 06:36:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc0f705fsm509506185a.33.2025.07.14.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:36:42 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:36:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
Message-ID: <9c3926ff-1012-4da4-b477-41a305aa0f98@rowland.harvard.edu>
References: <20250714024903.3965-1-hdanton@sina.com>
 <687490b3.a70a0220.3b380f.0048.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <687490b3.a70a0220.3b380f.0048.GAE@google.com>

On Sun, Jul 13, 2025 at 10:08:03PM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com
> Tested-by: syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=138330f0580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=7367e34c3d60253b
> dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
> compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
> 
> Note: no patches were applied.
> Note: testing is done by a robot and is best-effort only.

#syz dup: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_copy_to_buff

