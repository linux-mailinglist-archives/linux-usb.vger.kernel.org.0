Return-Path: <linux-usb+bounces-25762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6688CB0402C
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 15:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80CD41A65687
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 13:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65E02571BD;
	Mon, 14 Jul 2025 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Nxns75rw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18702522A1
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 13:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499929; cv=none; b=Xq4ktgipF527ZgJqem3CLOHlmguxPnW7wJJ/6Oj7CrwnuwrFuXSoo5JzG/rRqpdfdN5k/Cq69q/xjgO5IRvkrCXaVSoppqnepTW3e4pOSmQ7U7Eyn/Ll6bw7G8plpt0w6c34v8Bt8On0aiBsgAJSnTg6hTsE+8PyeJC37DzEw2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499929; c=relaxed/simple;
	bh=o6gSA4iRI17tVBKBvXibBGdjFo1+iPIqRviexnz/ZOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQR52Ozpui930qjVaJtPsZ9ZExVpcnZLYQX75m6O65kyNdAdXLg2KIF4N+z4dUA1Ro1BscLCn1kqLjhEJmrPDFG7zAKKicoClbsYYG3TRjYg7O1SI7BGSJMm5tz724eIN82v34wexnyXf2ItnW74OgkkZVAG7sIwf7115WAyxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Nxns75rw; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fada2dd785so48917836d6.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752499926; x=1753104726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6xBkPh8bpRDbDE/rpTA1xUCWQKllGijDoGG0L7obvbI=;
        b=Nxns75rwscfW0S3/9Op6Vv/x8D7p6l3jJ1KqrpadOQB6E248W/JsKFOnIal2CMAGz/
         QLl2yEdVqyf7ysXBaXWRBo6QLo3zb8/7eLWDXMl7HHZgvjiushOUDAiMcxcT5Gsv2yNp
         zVQFZ+Kk5KGikOMnH68u9chbAPNueHconi9LAEvgSll7iXHFGpA8OSxZRc1S0jyy6pfE
         JyKFHupn0/5b8ngeJVAbbHhj+qPSJMbKLOAYPfxHA6hUNIY4+GN6culNc+re9+OXXN2A
         b61wYZaQWg4Ok/HHpy9FdKG3hCkD14x76btNf+9qdObz7EgyarwbsjH82fFfTgj8B8jM
         QmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499926; x=1753104726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xBkPh8bpRDbDE/rpTA1xUCWQKllGijDoGG0L7obvbI=;
        b=H7yrXWZPcD3NfBM0GOPQFzvqzgpYf86WhXXqdNDTvO4L/0eBBqZctLE/Wnpu6uU2s7
         e5hDFMrWU4nasVjQJ+OetTPxCSr9LSF/rki0oipK4UdkzlS9Jk8bgoWuZw0Oy8tNihl7
         4cUa+8AhhCiJtdRHJGOl0WXMfHEUvQTfEUwMwXHvgKvdsrCTwzPUucIf9qgcvaJshd+o
         nHUQjUEqCcOkXMUkIY6nEwHyv6J9ueBcPMuZZvtCRDIKjvmj7KKKiadshMS62E0JpFoY
         IpPvprY5Q6Hqy77ncpc3/rsMbbDwjYkJqz+3/u0NhfdA9+xFiH1lsPyvPZIqgiGS7iIy
         oDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa5aG2SKYnzYIdW79XCzRBu1CxZ8kzB0/CRecTALTH/jjQdQjQ+1wiGgNsyOJyxEtt9Hs0bFPmCO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUbZWiLD3iJqO9iH4aXPDnFMpJwZNQx3GmWA3fX89PjfA6yvyh
	eBkKZxLUqvt/g41tREG46vBbXHWKHwUU32cVPeQqrvBacNG/8EDFyjuvSgPHbCFZKw==
X-Gm-Gg: ASbGncvRLMAAPV85BIZAhT8zWzQQWUPK7N5jYqnTXrtDyE9rdUkMsfRMJWXEE2aVawF
	dgc29MtmG5hDqBsW84veEpFP0q4NgX1i14No7JkyGuJO/CX/tPZB6ZjPDGCsMkN2fliSjkXdzzf
	j2l4uhNq8E7Tub7b8uoRX8Vuk0NKRV/SLSLPMqD28O4IXwMA5W3MM4LvGlZRVpJF0ZNtJmp+/Ib
	kPXnww1mqB1P2zeGrQxkLhozT8wweAJ4uhb7Rm1g9N1RvoUC0QLckDFrvJw5oogwVHe625DPkQK
	s/eNr1xTg51xowbNcABMfySwUlHJdY2cG0g9lXGPwysgjeZ6w6+UnvG7fcYdcJmJ7Cs4NIvIO7i
	51Xx5tuKG0agkq8LfW8YFdao=
X-Google-Smtp-Source: AGHT+IHcDlRJdgLbWczO/0oWQhJ09a+Chve/NcLaTIVCSDBaS66RcroV2AomQZA/4l33Q7BCJCQN+w==
X-Received: by 2002:ad4:4eaa:0:b0:704:89de:f2c3 with SMTP id 6a1803df08f44-704a3a86501mr196941696d6.39.1752499926309;
        Mon, 14 Jul 2025 06:32:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497dd4a06sm46959806d6.123.2025.07.14.06.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:32:05 -0700 (PDT)
Date: Mon, 14 Jul 2025 09:32:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
Message-ID: <a8129780-de7c-47bf-a491-0d71afd60c21@rowland.harvard.edu>
References: <e8fe21fa-9a2f-4def-b659-063d55a40f3d@rowland.harvard.edu>
 <20250714024903.3965-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714024903.3965-1-hdanton@sina.com>

On Mon, Jul 14, 2025 at 10:49:00AM +0800, Hillf Danton wrote:
> On Sun, 13 Jul 2025 15:19:34 -0400 Alan Stern wrote:
> > 
> > Try again, but with Benjamin Tissoires's recent patches.
> > 
> > #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6
> >
> #syz test:   git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git  c2ca42f190b6

Thanks, Hillf!

Syzbot is a great tool, but it still has a few rough edges.

Alan Stern

