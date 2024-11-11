Return-Path: <linux-usb+bounces-17438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 884779C4225
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 16:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07CBEB26D6D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2024 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7781A071C;
	Mon, 11 Nov 2024 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="K8Hrj4gY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3630E6026A
	for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 15:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339926; cv=none; b=dLdNajWX20bhNQr7t1VZd3IZToZovgBEjkuxFqLBNqnDCbpvDU54484aHXntZj/30+JIAgTKPdXRrOdZlXvjWyVyJ8rf5PO5lQrEhJ2OWw8sAwlB6D8K7c6hFt+vv+sgS59GinCZAo/6Tuc8nQUtNzVKNFlnRMsbien78fcQCYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339926; c=relaxed/simple;
	bh=exa2y6eKjt46ZR+xY0nZgxZZaTA8O9D4XD+FG9JWtlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4e34IRazr+2KiBVAFqJl55Xm+Ak3s7JxuqKGtyr7SQ88SiEYhiiN94OR8VOX8u9GUFs397G9LnXwSstELxFTenmIwlKwNOP8Z9goU9WOtJ4x+4PXaj1SX2sFUEdchY887MDYNHMPZXyN0lxzJSwluBshJvWFF0bqiTVc92biGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=K8Hrj4gY; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-46101120e70so33051261cf.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2024 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731339922; x=1731944722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCXsU+nIi3O7Py500c5fEHZL4/6y1J44sJ8PdhEWdk4=;
        b=K8Hrj4gY0JU0XM+wiZHO60gS031T5f+Y/cDHMmm3MKI2SVaBvIAnT9VMQy3lQRE4xV
         IZwg8AksyprVvUgf7HC/zeuoreWTmgh9el1NTp6tRx+Dix/JPkcoitYGc7rf4LeZ7OSG
         AzkQcJoXZZxYKACz3RtIyVkBF+26KYOOhj0Omj05ztjzrjNWFK+5Uo9gDDuvobgTeqVO
         spDAW7aUeKq5H4jsvrYKpISfcGgbHwDY7vsHNd+iaRhm3ERiN42Px+X+YRocx434vZuz
         39W/ysCdHcho9kvbm7X8JQ91CJikpzQbYkHSu6zd0UHFxSCJmZ/6i2hHXtM/fzIRGXl3
         kxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731339922; x=1731944722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCXsU+nIi3O7Py500c5fEHZL4/6y1J44sJ8PdhEWdk4=;
        b=lb/MvUSQ87O5ulL67R11HG87e2MVobCkjLrzHcAxpaI7gG3JRkr8pe/kl4jWhbLHmI
         XcPpmDk+1mTUCRFs4zJbBMoGMqtvgYD5kQAjJWDkdU4GzIXC6BZVKYNEf5myEBxNeZuX
         qVV6xrNYq4G1OTWMIbT0jRkbd4LCL2goPzIBBk0yhlex+9+kXP/LI/xkLBPHu8BMO0Pl
         imMDwNvrC9G0aICiONLhcXli5PzrFy1M25yPNilMwAAlWuvU2ZpWVliSgtzLt3Hgvr2G
         oXi1Yysn4PnlZYaahQ96XtQ7QPRHNqq1EU2WiXxRqhODMR8liFuFtbwOY7nYcxcejKF+
         ZGmA==
X-Forwarded-Encrypted: i=1; AJvYcCVQdmwWN6fwwgi+/7RrhSb3lepWKcRt0JZe5iFR054fWvQ0lK7puZQHrAp//G9x1O2y52G5hZxYUsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCkFqAqLM6vjuqX7/7tQCnfH2T3FBYgavsyprt4Gy2kXMWHoVf
	t6BZIYPtPzddxj1/uvRGoXcWlZ/H00AGQkqUWzBoVykpSgkWMSmTGpZOjgEcnA==
X-Google-Smtp-Source: AGHT+IEj3sl4CA3R9xS24YOsLMugaKGVPIrva5w5VBDVhL0F6m4Bo20B2UlSKP2+WdzSbxHG/fODlQ==
X-Received: by 2002:a05:622a:294:b0:460:bb96:dd08 with SMTP id d75a77b69052e-4630930ecfemr184669691cf.5.1731339922180;
        Mon, 11 Nov 2024 07:45:22 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9dc2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff3df36asm64043171cf.18.2024.11.11.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 07:45:21 -0800 (PST)
Date: Mon, 11 Nov 2024 10:45:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+e8e879922808870c3437@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in ld_usb_release
Message-ID: <1af819ae-cd88-4db0-af6e-02064489ebb2@rowland.harvard.edu>
References: <6731d32b.050a0220.1fb99c.014d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6731d32b.050a0220.1fb99c.014d.GAE@google.com>

On Mon, Nov 11, 2024 at 01:49:31AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2e1b3cc9d7f7 Merge tag 'arm-fixes-6.12-2' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1650d6a7980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b77c8a55ccf1d9e2
> dashboard link: https://syzkaller.appspot.com/bug?extid=e8e879922808870c3437
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.

Question for the syzbot people:

If I have a patch which I think will cause the issue to become 
reproducible, is there any way to ask syzbot to apply the same test that 
failed here to a kernel including my patch?

Alan Stern

