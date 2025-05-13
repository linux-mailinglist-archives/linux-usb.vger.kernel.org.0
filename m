Return-Path: <linux-usb+bounces-23922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ACAAB5825
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 17:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA4F462A03
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 15:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F312BCF55;
	Tue, 13 May 2025 15:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="NIMtKrE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6DA20311
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149081; cv=none; b=Kc4U1o1i0D6cMVGIWJu1BI7OL7aBVkUmBCgMZ3cHFR2n+dbZR2ldhoZy8Z23KAQliKM+GEVGPMAbdbGvlavNmSC5wXZcVm5OIL1GhzqBYcGehGENKLz2pio0zWHGTG0T2WKaBtL3vGxhxBCgjJ/KpStNIGiKSOZa3pjiBzNHvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149081; c=relaxed/simple;
	bh=vSuPr7ri2jzEwCjhbZAQ66WU4exRsQXK236Tp2UMrTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkZR32eMgvSKdr9p7REFWuJJC/v1QV6zIBgfx1ro96O2fdrd5aq43gnhyO5Nz2d1hm3LHSaBCrohNcAHQURMa0+1cnmDRr+SiJi42kPBr7kz8JtrOSM/CSA0NcLNywill5IsPn4Bz5/7XdgUZZ2Q19GfsR0A04psgeuAW9k2eJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=NIMtKrE7; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f53d271b7cso50424006d6.2
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747149079; x=1747753879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=NIMtKrE7ErXO/DxGs0OJbDz/ob0eD9w7H/g4n6XXbbw7kvx3Ck8UQ9uKVLPPf0H/la
         M2ylvtvbB6Vhpn8/kmdR7R099XFlOpw9LKlsgNRYnE73VmEsGif8lc/YYYNGgnMpJ8c8
         sk6KKrxYk36p41GNyNFPv99xwVwizPIMFeeaAgkC4KGTzU7u+lh2AFL/ahEMU8ehDvj0
         conupw7tuesHfnXT29WTu0+dTf2sl8Bs7Kkw7CFktcM1T3pWTOVUrKjgfmeOGVBQd9ir
         gZhHfi/UKnqRfPV/ctpBnhboSWA0FO/v4LoajKnXdbD34E7H8sm9Fc9aGkeM0rmiirXz
         VAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747149079; x=1747753879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcA3Z4jzMIZZtYMJRiF5ZNA7Jc6yPVtKd63c9eBjQkY=;
        b=Or0mMLXJDs+bcEyXnwY4d7YUwf7pXerjCX53QudfnAEf1OIF5s5v4+AFsE2wJUjpX/
         //4N020OZMaUUPZ1wDJuK9gPxGpadLgnQVIVd8k52Ytriccz+EZtx7plBwtIVbNV4ZNB
         ewXxJQWc4MECKMpdlLf38d5oDfDFjdQRQ8VHUcMueQnvRsf9qPvKOGzExlHaExAzi54p
         zmRuKk4plvwTmwxb62gRNTYvrllpMorGBoRuFdKBI2Foh7iU3Jcuwm80ubawCBDCQJ0z
         ToNE8xY2v4Qaj2KpGK55zCKmNymqw+pfVG57AM+yTcpu1ObA/qu7p/Atpi505hpCc74Z
         NV/w==
X-Forwarded-Encrypted: i=1; AJvYcCWWlYtXhlyHoicaokIMxNmz99DDfG8Q9Md94U6jlV0QU1U2yg/igmc9comWaYgz+QQanGWax1vK17Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjeXrPFm8jlHqR3IFBPWHgGu7kLR5xXenQSkMiDG6n0OsfVBz
	o5M+kOdykAeIN2iBa4YMDhYRoxoAlb/id6Cmrknkd6XDOFbQftd6ZPUbD4bbPQ==
X-Gm-Gg: ASbGncv3BPIlzFBCqhKfw+uXiwr1ciADJnx12QRbIpvSH+Vl7qr5tOJVJyWLYTD50dH
	xBIlT4S2HdRQ/E6NLbzxTVrZtIcWefUdY5BQj7JcCjSY59/OFWoAQDdR8lAjFc9EVkfhTmE52aD
	BAAg37rm5CggWmv+lkQ018wvvK/8OOf48MHJgsmlEHdrhdCe55Yu7W3/kv0+xtaI1aLCGtNtlnL
	xSj1hKOj5aEOp74JsTKnNinrzKSPJH1GH8NOQUFVF2CR7gU78nKA0d+KgINOipPH0D9HriPrCmi
	v02Yd8f/yU67eDchdd/fyx6jNkf+/w+XRcSjOT1Bu0652AurZfM0S3iYrOqDthoe9YmKSA==
X-Google-Smtp-Source: AGHT+IFE+sCALMsVuAzcyi0CFJEyC2jHv15dAG6xqL5vQvflSMq1MuCrXdzeM+nxcj1DyxaL/2CcbQ==
X-Received: by 2002:ad4:5d63:0:b0:6f4:cb2e:25ca with SMTP id 6a1803df08f44-6f6e4800ddemr310098676d6.27.1747149078868;
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6eb393f0esm51659016d6.33.2025.05.13.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:11:18 -0700 (PDT)
Date: Tue, 13 May 2025 11:11:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, hdanton@sina.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, mchehab@kernel.org, paskripkin@gmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [media?] KASAN: use-after-free Read in
 em28xx_init_extension (2)
Message-ID: <ab7652b5-f854-4221-99a3-1c5b192b29ff@rowland.harvard.edu>
References: <000000000000453f3d05db72fc7e@google.com>
 <68235ee9.050a0220.f2294.09fc.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68235ee9.050a0220.f2294.09fc.GAE@google.com>

On Tue, May 13, 2025 at 08:02:01AM -0700, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit a368ecde8a5055b627749b09c6218ef793043e47
> Author: Alan Stern <stern@rowland.harvard.edu>
> Date:   Thu Jun 27 19:56:18 2024 +0000
> 
>     USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12cf6cd4580000
> start commit:   cd802e7e5f1e Merge tag 'for-linus' of git://git.kernel.org..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=11cf6cd4580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cd4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=91c351a0f6229e67
> dashboard link: https://syzkaller.appspot.com/bug?extid=99d6c66dbbc484f50e1c
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143a7768580000
> 
> Reported-by: syzbot+99d6c66dbbc484f50e1c@syzkaller.appspotmail.com
> Fixes: a368ecde8a50 ("USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Clearly a ridiculous claim.  Maybe the bug fixed by that commit covered 
up the actual cause of this problem.

Alan Stern

