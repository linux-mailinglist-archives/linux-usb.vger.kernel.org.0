Return-Path: <linux-usb+bounces-22126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E449AA70725
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 17:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517D17A34BE
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 16:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E4F25E833;
	Tue, 25 Mar 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EX82g2J4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE3825E476
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 16:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920885; cv=none; b=UUe/h4utQQA9pMxFtk6fbYnTPwSJkI+pq3u7iEhjQEYJ5oz2lOFnInS9BHl54nR17PjQJJOK43a1EEi0fhoZ37hCPlegiEOLQaSwh/aY7NJA3GLYcITGm2sKbQoDOTeap73GlKUwjpDUCl4LIhkk6NROOdLbwGkTf6GSS23HcFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920885; c=relaxed/simple;
	bh=HE0WwEEjXe2OvIj8FLiwdnpX+f7YNiat07ISj1wGnCQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRG63SPsqzE5FdKk9+O1L/Zgk+/Loz+f4UzqIXNtFOSCn8XVm2Mslpv2wEAWpjPVKJpWqdh+SObxRNcz89qRNqW57lFoQ/xYBw8zvF5CJP5kn50gSQgaFv3lfW91ibIC6pjh8UVGGpAlM40QkmsiBA9q+4M3RWia4ePSY+hOEvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EX82g2J4; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e91d323346so51256d6.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 09:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742920882; x=1743525682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=miqKoY+UYVscqlsw94wZLt2jeTP0mGsCrBdRIv58gSg=;
        b=EX82g2J4RfMYTVP0xtt//t6++4uw1IXPfjARXV/8V+HRSFf8vLvA0/0dXDpoPaDnDZ
         yj3Be3YD1behcXq17dp0qbJzcH8JiYY4lAc9GSzl2DAr2CcT/kIhGSkUEghmxsJp1ElP
         QkSyW7K71jWYFdJSz3tMHdoJe+wHqSi7QQ2ChgTU3xrn2DvYr0vKgCQSW2aKevQWEY+u
         PjyTTyZz9JSwBPV97nBq0IaKUKmQIYQjCFue+3Pt98jj/WlsY22p/ZzkS8HOp5FK9SkG
         lWc6jeTh1lgtQwESsxSo5D5DDm3Wwg6JzGvwcOgs8ox2FTjOjeRZZaeTWLhvl3lLmyFz
         OdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920882; x=1743525682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miqKoY+UYVscqlsw94wZLt2jeTP0mGsCrBdRIv58gSg=;
        b=Q7OrTaUkgno01+86Ms1AEjK3tPf18AOqA4R7LLmUirvulrIqdxUJzSnOQU+c/m6YoJ
         38nA4cKZNERYNiv5ASxXc11dy/hXyWJAY3vw3B6tjhytX5eN46+iTejYJGYUho9C8BAg
         PBgtuomiNQyq60qfpcfa4XF6pTpeKxdaZS0FNZYUxuIUGbCsxgQGjxuGry8JkYzvxjUT
         pK65rVDPcmxF3jv5YU6NkFCLxcyriXBW+2rvAaLVCaeYCTvZFTdbUWFNgI5X6c2C2tAu
         V/wEnvAS9NIsiriZUigQBqSAlPMUB3hMc1tqd7IO88tNfIAWpbQ3Fpg40UWfQyqid6ss
         aiBw==
X-Forwarded-Encrypted: i=1; AJvYcCWilqCXjcKZJZ7OyrJz/PS8X+/0DSkg3xOdCswhCjX36JnbM4puF3FZz/3U9USls5Ou4ku25hr/RgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/ZpXJVxQ76hq9idTUg9GVmjMmvPjsjlCeVRH8+Lc0D1NSyBm
	zygsNng7u4aIDKtUwnrDMp0EVSv5VZK3CqcbJDK2YSwaaI1r+66HqqCOw5BvEQ==
X-Gm-Gg: ASbGncvuokwrOLTjTJKnNM7mNFscjfkASEVm6ORUsPq/pxDgor68J4RakT43wH2jqLf
	RQvGk/srvt64Fs4y3A0B9UO1SSbgSMCpdGEcP1TJp48W7qRK3fq4xpsQsbybz9c8wpGLEn+ri8k
	fE+Jmeht/OfVQi678nUUm+wnbJbErvSCLzMDqqe+G8n5hTzrNk7cv1t75O/3ZfHk3ry4XfO1e9K
	O1ZWgw8KixwUf9lu9NHOhsolmFaRv5CYK8Mu6b/oZm4NlRU98nSnaJVX9ycZ4Ya3KNvrs08DEd7
	xiIcgzs/4WqDYIN0JRJR9pAQl/AQ8Wr9Z2wUkqiSFXWHEhApV+dr+5he9QmxLSsIVTzAzJ1T0D1
	ViptQNmlPWXndfz+6JoM0ejotp7tVb0tMgcZyTg==
X-Google-Smtp-Source: AGHT+IFeP8N81JAGt1FKSNUu0N8sqMwAbRybniXeyxbpbDyGTB3nk4kytpnyLPPjCGdlVLhPquev0w==
X-Received: by 2002:a05:6214:3d9f:b0:6e6:5b8e:7604 with SMTP id 6a1803df08f44-6ed16cbbed1mr7940456d6.12.1742920882545;
        Tue, 25 Mar 2025 09:41:22 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3ef0ed7dsm58440546d6.25.2025.03.25.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:41:22 -0700 (PDT)
Date: Tue, 25 Mar 2025 12:41:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
 <Z-GwRNe8NIigXYtS@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-GwRNe8NIigXYtS@shikoro>

On Mon, Mar 24, 2025 at 08:19:32PM +0100, Wolfram Sang wrote:
> 
> > As far as I can tell from the source code, the dib0700 simply isn't able 
> > to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be 
> > changed simply to return 0 in such cases?
> 
> The adapter (I assume the one in dvb-usb-i2c.c) should populate an
> i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
> bail out for you.

Or the I2C_AQ_NO_ZERO_LEN_READ flag bit.

What about all the other fields in the i2c_adapter_quirks structure?  
How should they be set?  (Note: I don't know anything about this driver 
or these devices; I'm just chasing down the syzbot bug report.)

Alan Stern


