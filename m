Return-Path: <linux-usb+bounces-19216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88228A0A830
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 11:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B2418879AE
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 10:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00AD19D06E;
	Sun, 12 Jan 2025 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9gPwLcj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA04315A;
	Sun, 12 Jan 2025 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736676863; cv=none; b=YbdViIjSdhvqEZn6rvXujhY9J9kuui8vEKAwkTVIkZkOoDx9PDk52T+BupF8n2grOC9f6fJxH60poM66401k6LfpOsht9uuUW6l5lXp5i2iTpBoXndouhBfx8DrXI6SBNi8XpA57NVIB8vOb8vKjoSaihtEeAKqyHFdkSvPjb3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736676863; c=relaxed/simple;
	bh=ziRgbsJZSnYarvVsDVdaeaUnWeXssTT3cjbPbWfOVeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a29rm1yqwbO8wm54sjw2rdcR5T6cH0pwW9FB+pVUMrFGpli64fxzf8znPaNRn0MNhADwwp5/Chm2BC8Rh1X2zqOXOcGec2WKQEzwcsiFSVusJYcuc68W0CWDuB0gWMEGcnf4rQN5PH/lPzq+I8PgQsWd7sCecYyk1ZlBUeXIQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9gPwLcj; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385e27c75f4so2404612f8f.2;
        Sun, 12 Jan 2025 02:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736676860; x=1737281660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXHzcs8Q4TI7qKACrdk+Z4wasVtXyQLh8H/sgYhKew8=;
        b=C9gPwLcj3h+CTYUQCHRI4/2Ql4RJqb9rH3LvR7Dlq/M07ja8x1FMeRR0ucNN8Jcv83
         MsCcwEILTZQn35w5+UGOQYiPw99kQlXpAsAfTjTorhB91Rh7MH3C28/T8ULg62GJxqIj
         udTr1/epGkwnSZECZJ9x6tFN96xVptvfKmlaYdIbGnXgeKnpNb1kWLtb6y9DOFT4J2DN
         48ctATy06XCTtRDJfdNoB594E7DSg94tfdh52CGXyS54TLDPuUB7bzH79GRJOT2PAipL
         RzEJ+R8ttVR0OUvSPaVl7v3+LX5JAr41VqyRgj5FazIvWfj0Ui1/YoT8hmQ6qL9RSRrK
         Wo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736676860; x=1737281660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXHzcs8Q4TI7qKACrdk+Z4wasVtXyQLh8H/sgYhKew8=;
        b=HNPZdRNVihaLek8kTHLUzcRj0pAyJdGw9WgJ5HouRCLRLUEBslfvMVjDM9Ewm0Cgwl
         LvwcjYRjjsXVE6Z3OFRWtGHdFTy2sw3ydHyOB5/xZTFr2ZmB0MltXMCNI376poB1gg2o
         n38r/SgGPMQ+Vp10cWQ6BX9T/n43DGEVloLi0YDmHiJKtdCv5JPcEp0p27cibhkKgb4f
         rTvbDjA3CAmQk8Ihud1laDOuJWHgD+XObh18zSiWrOQKX2rCkr3uj75zlETBMhUbyFAb
         exoHX3n8DI6xHWujaq2Ja1cvFzfRNmiz5h8rbPehXzlVw87PDzZu+o5LbdnBkllY3ziY
         ye3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVf1XFNEcZ9iMHMr5g9ARFtVIjRMZhus+rHMdxelzYoNNdVT9exe2PaBp20eRqoVogTYirj6d0Ofa0vJAM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9o1IBB8DAWn4l3qbMfaWADOQwP4Ktaz1hZtQMwLKvCpL9zwPX
	A0M/zPIjAT1InlxHcJPq0TEDdK8MYlp39MZmaL5owhuxtHapQ5Z4WFxXTQ==
X-Gm-Gg: ASbGncsvypCB96R/8fMCCgRkgOzhmq1G0/b2HmY/CKPlGUsE6VCbWqMVp+aM2aK+wje
	EyHY3oanKGB1u4+kQJuoee6tmlImoR1hftoX3zhPavz+dLUQcWqfkG809oEj4qKVK8E5hMlyKlx
	jxv1p8CaIyAWTLyzj11wLYWL1OznQaceBVi5L+dVamACNxvocC37UcVqbUQhYatM7jk4jPSQFiv
	sI9e4r8JuWHp1BXyNt9GGtLbGh4bB4Ci/JcfeyOSf/suvmVDHkexJuZ8ZE=
X-Google-Smtp-Source: AGHT+IEk13AgAOLTij7jpouZjoCozs4Oijc2g/8cOLKVl9GLXydlorUrfaAcdECSUxdrojk9vjV8rw==
X-Received: by 2002:a05:6000:4011:b0:386:3835:9fec with SMTP id ffacd0b85a97d-38a873306cemr16822177f8f.44.1736676859947;
        Sun, 12 Jan 2025 02:14:19 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:6dc4:51b5:3556:88f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddccf4sm142555455e9.19.2025.01.12.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 02:14:19 -0800 (PST)
Date: Sun, 12 Jan 2025 10:14:07 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: Fix null-ptr-deref in qt2_process_read_urb()
Message-ID: <Z4OV7184kahqhzBl@qasdev.system>
Reply-To: 2025011206-starboard-dexterity-a740@gregkh.smtp.subspace.kernel.org
References: <Z4LP0VsyOkaRBQL9@qasdev.system>
 <2025011206-starboard-dexterity-a740@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011206-starboard-dexterity-a740@gregkh>

On Sun, Jan 12, 2025 at 09:42:45AM +0100, Greg Kroah-Hartman wrote:
> On Sat, Jan 11, 2025 at 08:08:49PM +0000, qasdev wrote:
> > This patch addresses a null-ptr-deref in qt2_process_read_urb() due to
> > an incorrect bounds check in the following:
> > 
> > ""
> >        if (newport > serial->num_ports) {
> > 	       dev_err(&port->dev,
> > 		       "%s - port change to invalid port: %i\n",
> > 		       __func__, newport);
> > 	       break;
> >        }
> > ""
> > 
> > The condition doesn't account for the valid range of the serial->port
> > buffer, which is from 0 to serial->num_ports - 1. When newport is equal
> > to serial->num_ports, the assignment of "port" in the
> > following code is out-of-bounds and NULL:
> > 
> > ""
> >        serial_priv->current_port = newport;
> >        port = serial->port[serial_priv->current_port];
> > 
> > ""
> > 
> > The fix checks if newport is greater than or equal to serial->num_ports
> > indicating it is out-of-bounds.
> > 
> > Reported-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> > Closes: https://syzkaller.appspot.com/bug?extid=506479ebf12fe435d01a
> > Tested-by: syzbot <syzbot+506479ebf12fe435d01a@syzkaller.appspotmail.com>
> > Tested-by: Qasim Ijaz <qasdev00@gmail.com>
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> Your signed-off-by does not match your "From:" line :(
> 
> Also, no need to add a tested-by when you sign off on your own patch,
> that is usually implied.
> 
> thanks,
> 
> greg k-h

Hi Greg,

Thank you for your feedback on my patch. I’ve sent a v2 patch in a new thread, addressing the issues with the From: line and removing the redundant Tested-by tag.

Best regards,
Qasim

