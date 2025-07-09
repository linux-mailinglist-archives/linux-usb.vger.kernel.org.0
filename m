Return-Path: <linux-usb+bounces-25632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FA5AFEBF6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 16:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16D8B17F277
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jul 2025 14:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8433C2E5B04;
	Wed,  9 Jul 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cE/GtvM9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872FA2E4267
	for <linux-usb@vger.kernel.org>; Wed,  9 Jul 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071247; cv=none; b=rZx6L4Fs5T5bJJva1mcOXZ1Ep/Ywqt2wWKwk5s4E/kA6C0Kff1mskZwLNxilZqqagak07HUaklW3L1GvkOQxOmZDWsx8RUqwXnmmUK9R3oJOtC0UTllrYvqWMVxfogSXL4mN/S6bzyslV8FYUnifGA+fNMVQQdxrkvujp7DORfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071247; c=relaxed/simple;
	bh=fi5dlcVYm9G8nBwLPH0im4WpK5MxfdoRzaSmVtausTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGrZPS2jpxsNnAJZ5pgejdNds1oBpNtIHf8Ts+O7DFC8VuJaga/piJ+Im+kBR/VpYJ8Y3Tjy+GDxuGX5vpqCivSmNC0Hw9TehUo7upLlGng2+YIyWpnSPQor1CDOQU7/9nucwO57gBD+dn7DtxXBC0rDF/9uyswz7lNt3KR3V9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cE/GtvM9; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d9e2f85ab4so225058185a.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Jul 2025 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752071244; x=1752676044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGWFHdtZblo8Oo2gBKGyoEbqM+fNtoacUTFg5r7huRI=;
        b=cE/GtvM977DTKr3Kb38XbrgRpXOsCZps2eqfxycd2dK8r3xEJuBCQKwjlVTZLKtIZp
         yEB84+eLNgiHT/5We13qNUem6cdzjH1oaIOjKMSdw6lYHDT9utHDUAX6ip+K+BdeEEGH
         aNuMmWp/9/tKOrN2Mto9HrrFAf8iySyI3dsGNZ5HGmBNiWOSGK+IC1KijfPYf4Y6Jwp2
         YN32dKKJqpNTQ34yCyyuVSRmrWFTCUlUnn3YmVwQhSYOfX7rPQhnKFeKlzv8tTJHD7ND
         dEzlSW8N2ugZ3Jt75BXQ8xyu8UPqKaJ0fsNt8wQxOB/xwrpMNVDcMojV85OziOcszEAw
         UE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071244; x=1752676044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGWFHdtZblo8Oo2gBKGyoEbqM+fNtoacUTFg5r7huRI=;
        b=RMIvseBNM81l07Ebw2OD9COI9jR6K61aPiVwulG+fthtw6vwXmhurHPT/k7ajLWxjB
         RGkEjDfsHoVp42wcQhdgvVeyMEfhRX+LF2HloSUxUGUGIjqmuDUJD0vpqdYTTiG9h51j
         IhntsrsIXVfvT4BtZ3aOq8HwcKXJW75M4FuyIFHAjIjeFgBIhFoh3qhcpmFElekWKYhV
         fIeByIcoX1DnvATpPbcJlIdeZIiAb8I1LQLFSNV0s38reBpz5LWYo5VTvAkV0po6xFsp
         11btnes8Tw/M9ZZzMZytLq4Mw3hzH7lIcys4mTgfM9cToIXLwphWetTJKQv4awJQn9fv
         euLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpGKzaLlVyw/7cD5li9JyyDwA0p12e+Mk44hOeHP4K2TuOr2g7d2+qzl1K0rKOGmDjhzoyyEhC5R8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzix/KGLdMMiw3DdCjvzBv5iP7sdtgKjaHd5yQmgsZMSMJKCfJ2
	xtkVvP+BO32RCF9AulZOFGcoLF+ylk2P9xFL87OdxKgj01Tjl9u9HGN0ESuYRsDuIQ==
X-Gm-Gg: ASbGncswlGCJhM6iwvq7zJbR9wxjFRBl0J5m3LB50ZDMQvOhvCEEC6bbGAT2Ap9OMId
	RoHZgEb0npy+1c87h5Zm23xzgRvWBYO4UworVFUHl0wK6XoL5nFoCXvHMBJbYCNeDiw8P4m6Z67
	+l77436/mg1Gf4PTq1MduD7uNQMkUV7Iwrc2jkolZvTW8f8r6deVRf5/Ox/G8AmpCDRe34ilRev
	gM0+4UpVpXelmiH2AfoAW0pFDUOqDRdldTFjUgNrTwgbab+8UgAdixIVKQRLYc81T3p/9hkqcNE
	Jno59pU/giugdb9V01xX7ZfxKSWu8k8qroUu9i+/aI4BIIMuk6PI/DZJH6DlU80K6rjrRWiY1do
	DnCzQ
X-Google-Smtp-Source: AGHT+IEhSNilAiMzk7JU3mAp9mY4ZZ21aK9Lgnm792fBqwVqVQMNtgq7u9pI5px+tE6tp9YuqMqxVQ==
X-Received: by 2002:a05:620a:1a0c:b0:7d4:6257:3a0b with SMTP id af79cd13be357-7db80d7707amr417464585a.54.1752071244413;
        Wed, 09 Jul 2025 07:27:24 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbeb2318sm938003185a.107.2025.07.09.07.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:27:23 -0700 (PDT)
Date: Wed, 9 Jul 2025 10:27:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: syzbot <syzbot+592e2ab8775dbe0bf09a@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	USB list <linux-usb@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [syzbot] [kernel?] INFO: task hung in uevent_show (2)
Message-ID: <e064a3e4-ae70-4a24-ba5e-1bb8c7971f23@rowland.harvard.edu>
References: <686e7698.050a0220.c28f5.0006.GAE@google.com>
 <79f634db-c149-4220-b8d4-0fff2c6b6a01@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f634db-c149-4220-b8d4-0fff2c6b6a01@I-love.SAKURA.ne.jp>

On Wed, Jul 09, 2025 at 11:13:29PM +0900, Tetsuo Handa wrote:
> Hello.
> 
> I tried below change (in case somebody is by error passing
> out-of-range values) and hit this BUG_ON().
> 
> Did I use wrong boundary condition?
> Are there exceptions where out-of-range values make sense?
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 92c752f5446f..baf536c56c21 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1985,6 +1985,9 @@ void usb_sg_wait(struct usb_sg_request *io);
>  static inline unsigned int __create_pipe(struct usb_device *dev,
>  		unsigned int endpoint)
>  {
> +	BUG_ON(dev->devnum < 0);
> +	BUG_ON(dev->devnum > 0x7F);
> +	BUG_ON(endpoint > 0xF);
>  	return (dev->devnum << 8) | (endpoint << 15);
>  }

Which of these three BUG_ON's did you hit, and where did you hit it?

Alan Stern

