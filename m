Return-Path: <linux-usb+bounces-25738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB7B0341E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 03:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62A0F3A53BE
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 01:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BD419D8A7;
	Mon, 14 Jul 2025 01:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jYZIPoUH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3F197A76
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752455495; cv=none; b=r8Z7yg4AiEAGq6qhTinjfkPYf4mRGH2c6mqgBgpGWTF4Yxgxs33USFgHgiBRjSuMMX2qJCvFCv+CU1A9KyCCSwQRHYFU0APZDlkdy8rJaWLiGOq0xy/KvK5ijoW9wcoV54xZ+4koNlkJocpaKmwVIWxdB0YpED7By65PVA4W6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752455495; c=relaxed/simple;
	bh=j4/GUaCuAgKJAAJiuRYHkvew+9PqJ5XkKhTmQXZmkPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw8CCBn2dFGhZ7UKaOxPrGbwDvIkpe7gs88uZPq8vlUuLeg5n6+J6oZ/EggfKTO0mWJfuU2Xo5/KRvZRut/1lS7v0A28J/uUZo5soQwhL6oq+CxY/rD8TrlxH/42g9/u2DEg4mU3y9x7cvWjy168LLyQOlEwrq6cr4lNJOMf8+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jYZIPoUH; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad79433bbso37465106d6.0
        for <linux-usb@vger.kernel.org>; Sun, 13 Jul 2025 18:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752455493; x=1753060293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQAf5mzB5oq+TjOcq3MJDcg2d3RZoiYcHy403Tv2aks=;
        b=jYZIPoUHuOVJvlLy2WNjfRn54TK2l1ZlOkmVVQGWzpr7tLdLabEfPoCQEVfODAVFsB
         zTX0vLbImtRTz40gkEfOx+1ZNqQ9z0sJr/f4VA3/jg23MV9+SSTlZ77vYBHEJswxErZL
         BNA9+6SHjL1kyc6gSTJvdR1jJ6fdyiywxa7M/5zHOYEhNjI5g1zTcLGlNwJHKysdYz+D
         mjgS/Bv86Is+/NEEVvc+ChdS01YQFqInjdLcjzJ3mSSSxZ0LK1vELVob1Cx2hTbQeRsO
         WJ+JVw2TS2uCTY2jVDEv/1+oPLZow8hMswEi+9WxvlRT9CyIK+PCgklWTAR+5ApSdigr
         rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752455493; x=1753060293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQAf5mzB5oq+TjOcq3MJDcg2d3RZoiYcHy403Tv2aks=;
        b=k2jglOeEDr+HrakmOq88UvlipRVGXON45le+ZhhgIO5kGIRuH5jlT5SP0E4ZpqgROw
         3pGFytKIfivA/obntuPEa2tdT+vWmO4BpLVI/FS3tmaHofHi/CuGzWdaqwgtVO8JthI4
         bkJJ53vD9TJKSv618O6erAPrdsMc2PYQjCW4o1PF+aPpI13i/amcVuZdy1TFSftltLwH
         yn7+XdbAG9u2kBBduzWi23Hmza1tHP7RS3eL0PxC5UNICGJHGzpsaiK13i1D+ZlDhd1E
         idwmcB6yLeWvfpKKgVZZ2NSNM1xHgH3ahdDE4JrxAFY24NMuVMU41/KKHaza7VDH0lsR
         pTrA==
X-Forwarded-Encrypted: i=1; AJvYcCV4LLBJK3ydn2H+2DU6E1p0fhKn7l8ZBaDXcqVSg4CLY7nf+PZk7MSSJ/0IoWqm7RfqQy0kr6PIuVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDBueyRh51w+HfUratKnfyOQbaF+x0QXg4G596o1XXl++r5p74
	/D9orCaH2gV3DxukEBL1dNdy3IGNa0EgAcmll3f6SXTlvPVme+O66wGgpPdbIhFafw==
X-Gm-Gg: ASbGncsvjuCLyFuVmeVcARoi1hsP+AWLAPjagw6/LE7OD7R5q68tsXK6rVMWQy9aQar
	NWU9bX8XzgEuZjaxSg5NokAXPgdmqEW1bxCNbqLIQGp/fDsQIZOLtbJVGoNBndrpx1JEAvOap3q
	3L2/H9SDwmjFMJMQrcApDFxmhA6IPoZRASJ591dlcBJSSCYlrDQRZetwkqfbM+V8b9uzBnBz6Ky
	+2DAekfU2UE/znA0tMYxaPKQfSh9HuKFS2Dd3ZyMCQNZjChQaMtmYzHfKBsAijfwHoSf2xFAX2X
	IW93cHUCFdCEohp58FAEaY3eW7w0jn8MKCr0k54YIeZYXULaA3026Yncv/UC0T8Z29M02mvss7l
	EUGHFm7yV+o0VSePeYjR4c+o=
X-Google-Smtp-Source: AGHT+IFizEf4I8/K3ZlZ4oFvSmfCwQRTQsZFlZtmLM5f9nREbt9mhf/wtWKQ5xmc6XWYkhYeeIq5jw==
X-Received: by 2002:a05:6214:2c08:b0:704:9077:e0c8 with SMTP id 6a1803df08f44-704a4083edemr229936646d6.3.1752455492461;
        Sun, 13 Jul 2025 18:11:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e874sm42057226d6.18.2025.07.13.18.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:11:31 -0700 (PDT)
Date: Sun, 13 Jul 2025 21:11:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
Message-ID: <56cd61d5-b821-4481-9f67-1cfff01abfb2@rowland.harvard.edu>
References: <e8fe21fa-9a2f-4def-b659-063d55a40f3d@rowland.harvard.edu>
 <68742302.a70a0220.3b380f.003d.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68742302.a70a0220.3b380f.003d.GAE@google.com>

On Sun, Jul 13, 2025 at 02:20:02PM -0700, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/hid on commit c2ca42f190b6: failed to run ["git" "fetch" "--force" "--tags" "d2f5fa5d883c5402c78965af80c005a5cbdbc6c0"]: exit status 128
> fatal: remote error: access denied or repository not exported: /pub/scm/linux/kernel/git/hid
> 
> 
> 
> Tested on:
> 
> commit:         [unknown 
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6
> kernel config:  https://syzkaller.appspot.com/x/.config?x=76c2fb9aa0954fb8
> dashboard link: https://syzkaller.appspot.com/bug?extid=fbe9fff1374eefadffb9
> compiler:       
> 
> Note: no patches were applied.

Hmmm.  Apparently syzbot doesn't like git:// URIs.  Let's try again with 
https:// instead.  (It's really hard to keep track of this sort of thing 
when all syzbot usually tells you is that the git tree it tested was 
"upstream".  Grumble.)

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6

