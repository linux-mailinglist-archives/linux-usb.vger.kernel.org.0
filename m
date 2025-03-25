Return-Path: <linux-usb+bounces-22129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE9DA7086D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 18:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0394B175ECD
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 17:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FFF263F4E;
	Tue, 25 Mar 2025 17:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RiFmS2yP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBAC263C8B
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 17:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742924842; cv=none; b=KozjTa/QsSZrxVnXIWZU2q9eE/xXrA2+OoEqHJB75fg2uuOealJ65B/qACHaJ0rYHDAXAYtY/B4jc7YyOytcGzuL0IgrfOTnHXhAwhwZXRYOSJYS3AbXucOSt57eyFuQVI+pQ9OiCHKd4Gtp4acFfexeFmVLj20y0uoz/+YoKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742924842; c=relaxed/simple;
	bh=goKPkMeXynwdrhBXnRq9X1VvT6tW+FJCFrUGgCdOnmg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEEyYDWXUlpVCLtHk804OSQcw7SVxdWABRbAcIz2LA0gIlWbO6D2NXVxEKTX/Ib/Qx5HGwnEhc5jtfl7SS96n4KA7jiKLh6cUOu+AvGi2s55LGV7QqlFrzIwWAerntGNhHO0SjQ1I8XtD2dmYGKQup5j47oOpR30T288PEv7G3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RiFmS2yP; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so45821326d6.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742924838; x=1743529638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjH1g6ftKk1WIu6TE8/3Mya2cmPNBafybymHxTD9mE4=;
        b=RiFmS2yPwpzXwLruNurFXEeXSL2ike4PAgZjfJvw3f2bMQp7D+X5aQdEi+/iHOD6xb
         QEXChE3bWBBE0BQXE+G0KwrGRxKb+BUFPVrblKcVnlgY+9t1Co34dsS6M6KReUaHicen
         J8Y6tilYG818HT0ShqpexiSCxaeXC9GH3VZtUJvbMgZZICUHDAvgad0c+xTuBDgCqmVz
         XcmPVcz0YqWGZLHenjXXW9syLh61SwAlL33m/RsgyYXm10vCl98ALzk3rEgQmq8eB+UF
         yxvMWP2D7JV1Ab70eClf6abpx16+bPDt4nVOTV6LbuWKXIBBQNzcn52uQOUzNPEKIiPb
         hjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742924838; x=1743529638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjH1g6ftKk1WIu6TE8/3Mya2cmPNBafybymHxTD9mE4=;
        b=LCou8ZP9dHJCkKcmMoTJ5fHQdkjbEAcqh8FGUPunMcenwf2h+oFUT4zcUDtMCzm+I/
         HmjqBkwe6HeGk7dCDpKCEtvV6tCQEGH3JF+bYAPRYg+/jkcOhAOGX1M1SOtVWMyTTjkl
         TatuoiAjveWuB719wYKZlBa2z7SVRo8MFbPuc+z9Fuu0LoS64uY+sTx499eJ/bdR5k6b
         Vp8dWPPrtckl9rfA5B8qIgA7IoiaaQXLBGo/2ACQegKuXD5wzLslZr6cEIRH/t4+tvO+
         egHkSrVJgBpd6cdZAFqj0owFq7m+vfMMGf/tnTKT9G7xsf8e+Zie24iOzdkG8gvFt3qW
         LapQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeHfMLn5cQbsSwTbZlQKuhfO8YSZyLl4PTXOknY9vIT50fg9AW9WD2KE64Gj0wmdPLyylv0RA6cz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN5gpM8GUl8EELeC0/gjBvgWbWLEVHRYOe5CCTNtgW+HIP5H2k
	NJI+4eOTwUE6Ly8jFAhK8NLGccVXBcjBg0XdtBqq4AwfKh+nXOAcl5Oip4Csyw==
X-Gm-Gg: ASbGncvx7bhysB77n5mbXaanGpKQEKP3cQTCeNZxmgpz/FKJM07cRnJARyt5DaMTta3
	iZPhHimtTrLJ1sBQPIKpFWvv1UyNi2uD5wIXYJTXYT/ilrVnmElLKT8LtH3pPyKFnvl06UOmqnx
	xU8kppGChmfHDpPED+eW/J6ixX2jOzpn3JkjCc96wI0jteKkuGgTw5+eZSzHyiEpfpHw729+uaX
	cRjZok8Tcx06tbzHeOgsmKH4JOoLa0wVtXDY8Oxe12K4SFSBk7r2AXaUtKcjO9+KEvRoZGLrCmz
	0tB2SVgAAGF2NdsqojBoC+0uUw9k18pQldD9c1+C5SyfFRUzSQW5DbSF6/YMk/9QLt4VxaHcwk4
	cxoncu3mIayGniyxg3m8pB7rtTkApxs511ENKKA==
X-Google-Smtp-Source: AGHT+IEE3s2WyDicsHyN8I8hDTQsl58ko3gMhcMuYw+oTIF/jYZenScg9DM9xoAREespRcfMxIvUaA==
X-Received: by 2002:a05:6214:19ef:b0:6e8:97f6:3229 with SMTP id 6a1803df08f44-6eb3f294676mr269179956d6.16.1742924838295;
        Tue, 25 Mar 2025 10:47:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc5a1dsm58469186d6.79.2025.03.25.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 10:47:17 -0700 (PDT)
Date: Tue, 25 Mar 2025 13:47:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-i2c@vger.kernel.org
Subject: Re: [syzbot] [usb?] WARNING in dib0700_i2c_xfer/usb_submit_urb
Message-ID: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
References: <67e1a1f5.050a0220.a7ebc.0029.GAE@google.com>
 <acfa19a7-9d24-4cd6-9d1d-580a9ac7473c@rowland.harvard.edu>
 <Z-GwRNe8NIigXYtS@shikoro>
 <ecdc37c4-b178-4e43-bfbf-45bd3ed29ff2@rowland.harvard.edu>
 <Z-Lg3glmnzA44R_H@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Lg3glmnzA44R_H@shikoro>

On Tue, Mar 25, 2025 at 05:59:10PM +0100, Wolfram Sang wrote:
> 
> > > > As far as I can tell from the source code, the dib0700 simply isn't able 
> > > > to handle 0-length reads.  Should the dib0700_ctrl_rd() routine be 
> > > > changed simply to return 0 in such cases?
> > > 
> > > The adapter (I assume the one in dvb-usb-i2c.c) should populate an
> > > i2c_adapter_quirks struct with I2C_AQ_NO_ZERO_LEN and then the core will
> > > bail out for you.
> > 
> > Or the I2C_AQ_NO_ZERO_LEN_READ flag bit.
> 
> Yes, that would be more convervative. Does USB allow zero-length writes?

It does.

> > What about all the other fields in the i2c_adapter_quirks structure?  
> > How should they be set?  (Note: I don't know anything about this driver 
> > or these devices; I'm just chasing down the syzbot bug report.)
> 
> As I also don't know the hardware, I suggest to leave them empty. 0
> means "no quirk".

Okay, let's see if this works.

Alan Stern


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5fc319360819

Index: usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
===================================================================
--- usb-devel.orig/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ usb-devel/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -10,6 +10,9 @@
 
 int dvb_usb_i2c_init(struct dvb_usb_device *d)
 {
+	static const struct i2c_adapter_quirks i2c_usb_quirks = {
+		.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	};
 	int ret = 0;
 
 	if (!(d->props.caps & DVB_USB_IS_AN_I2C_ADAPTER))
@@ -24,6 +27,7 @@ int dvb_usb_i2c_init(struct dvb_usb_devi
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
 	d->i2c_adap.algo      = d->props.i2c_algo;
 	d->i2c_adap.algo_data = NULL;
+	d->i2c_adap.quirks    = &i2c_usb_quirks;
 	d->i2c_adap.dev.parent = &d->udev->dev;
 
 	i2c_set_adapdata(&d->i2c_adap, d);

