Return-Path: <linux-usb+bounces-25679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F99CB004C2
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 16:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9401169D8F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 14:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D47E270EB2;
	Thu, 10 Jul 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b/7wNaxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B6C258CD7
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752156370; cv=none; b=nQBg7hciitsys3BvlPKfz2yvbKSElEw596rceCDIB7x35Ww/k0QK0VbPAH+tExVrEIeaydev1rbmPcPip0TR3cUa+BrvInICRP141NImxIWw3XmS3Yfqy/x/qiruzM2Rv9I8JqvlwOOXjWViRq+Q3HMs5B/mIO6pQyCl2tqJn7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752156370; c=relaxed/simple;
	bh=0lB7ayVfjS/ebQsXGCV7KD9ZOZmkw+YXG9IthbK3mqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQ5MwXpAsmeOHrQqy3hoLhxZdvVaR1fvxHHKim01+lQSNlN0DHfdHFvYhuDFXiAUlL+N+VzTpsbCYEWmwKHCGj971TNCnZj3QVc1iLFWhC8E9uo9P2xbGv3gi+Ixr7fnJolp6kDsLSc+f0iMzEv2zbVYBvVZ3p2+BcZe39ffm4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b/7wNaxc; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6face367320so9026366d6.3
        for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752156367; x=1752761167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mUhG6nQixPiwkNwnGkxTsDVIWYYy2y/ruQ2RkH6WpE=;
        b=b/7wNaxcPyNhd4Kto49bsbLScLz2Y1kGizYE+B4OeDwFnaQV4akl2bXPb/ne38U6ma
         BKB+451TaBrijk5xXJuU8qhlSSyUpbjEWtXY7X+NS75bF9V/y40z00OTiZkePI1KMN6J
         tR0segQbORWk+3KuzQoIdw6bF3c18nOadVJ+ALeNRwgdxOpF1TioeRac75AqXH6KV0WC
         jVDdY61uKEvpubkRjXIXjuWMmm+f4MAttCfSmWcZyZ24XMcOp6tT41ZZyULzwILyLAj3
         go3CAE28i3brAOfwcX7KqHfq260FZqLzXWJs5reVA0KyI06nSqYokwuGfoSX2Jyh/VPc
         lMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752156367; x=1752761167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mUhG6nQixPiwkNwnGkxTsDVIWYYy2y/ruQ2RkH6WpE=;
        b=wDorQfHX4n9W9h9OYU1NtWzTnugWdMxX1pLPQ1h9y/RkW4pnoEcID2vpFF2dkZ/e0v
         7gFWmJWddi0RMet5I4m4jqIVMF0LDcRyCZDxPAdHgHOflL6IPanO3Wx4vhEnAVUUVXZY
         6vbINyGsghtmCXpU7p/9MBKPe5+6nDdqh2Tz1YKILBOOSfQv0MZzanpS99Yk5SRauvdb
         OXr7C3fjOof/Voy9XSzJ7U6WOlWRuOCw49jqMFCU1GBu5hu1V/AgbjczKcVkhk916QIK
         qEwdS1iggE3yjKfp6lzvGX37kx+y4Ly11793MLMkr3ohcjH1kU8+GfU44ptgaJt/tu4R
         uh9g==
X-Forwarded-Encrypted: i=1; AJvYcCUyCp8TMb2MvUj6nA7q9nAsmp/eKZBuj2ApIxB8CfTrJ+IZDJEELsxL6IFps6LchhZzdZgZZyVPQY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGNTHXzi9mMPkVobo1a18ZoOmYI3aElrG6KOH1y3ecZnN/9uO
	z6pCWnr2AeYzUj/KbLYG6h2LO5zsczZ5m6HwfmKPuWz4vRelVyrJ2IFK2UuLxyHcDQ==
X-Gm-Gg: ASbGncs8XWedeuT20RIkhymWosvoADR9HUC3bv+kaaFazieNTz6XZriXY+CG1QGnsQO
	ST8PhXeQiFyWCm9rF2OstFPzIycpsiYFKrMAboAP7T7AZL3iEQNqY+kHEZl49NdEioNg90TIHhB
	SczV0GitMmtdlujawBKE2tBCXm3CU+3zUR1+nuU92jhjJ4fECkOvREobziogEMA7Xmbi01hbyoi
	nwmQs4jBv+AufpLP51wR7iUXsOIgQLo8MDi0Ut6vST/y5XGTiSKEOyVurxNdGdO5msX7ErdRUsB
	dliSgqulbk67cnDPjtMNJvt6XCd+KmxCgzcsOOLqgTqqHIY0J1671SbseGc/zSYWRkLfnIqWtgS
	IdNv9
X-Google-Smtp-Source: AGHT+IHreITphoTLIChq2Z0zBSWyvB3a6PbQi/LJFxUQeY1LJUPn8RY17VoZ6RePs2Nhxk86mKEzFw==
X-Received: by 2002:a05:6214:246f:b0:702:d6e7:18bf with SMTP id 6a1803df08f44-70494ee3ed9mr67061016d6.3.1752156367018;
        Thu, 10 Jul 2025 07:06:07 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7049799e3f1sm8614036d6.14.2025.07.10.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 07:06:06 -0700 (PDT)
Date: Thu, 10 Jul 2025 10:06:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Zongmin Zhou <min_halo@163.com>,
	shuah@kernel.org, valentina.manea.m@gmail.com, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	zhouzongmin@kylinos.cn
Subject: Re: [PATCH v2] usbip: convert to use faux_device
Message-ID: <a735f877-e13b-498f-9eee-53ebefa8ebc9@rowland.harvard.edu>
References: <fac026d8-12c8-4c1f-96a7-264ced8391f1@linuxfoundation.org>
 <a29703bd-08b7-489b-8fb0-15838a1245ab@163.com>
 <1a13cf53-ffed-4521-917e-9c2856a5e348@linuxfoundation.org>
 <4fc877f0-b55b-4fa3-8df4-2de4ba1ac51b@163.com>
 <2a901b8a-9052-41d9-a70d-76508ebd819b@linuxfoundation.org>
 <4759911b-8c35-4ca9-bc34-09dd41b14582@163.com>
 <2025070949-activist-mammal-b806@gregkh>
 <dd3659dd-7e45-479d-ab65-9f5c1bab26a0@rowland.harvard.edu>
 <ce96291b-c0b2-41cf-a71c-c13bd8d0f139@linuxfoundation.org>
 <4478924b-fbd7-4a5a-ad0d-4fe0569b4971@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4478924b-fbd7-4a5a-ad0d-4fe0569b4971@linuxfoundation.org>

On Wed, Jul 09, 2025 at 03:57:35PM -0600, Shuah Khan wrote:
> On 7/9/25 15:49, Shuah Khan wrote:
> > Right. We have a few too many moving pieces here:
> > 
> > usbipd (user-space)
> > vhci_hcd and the usb devices it creates
> > 
> > usbip_host, stub driver that proxies between the device
> > on the server and vhci_client.
> > 
> > PM can be complex and it has to do lot more than it currently
> > does on both server and client end to support seamlessly.
> > 
> > The current suspend took the approach of refusing suspend
> > which doesn't work since usb devices underneath hang in
> > usb_dev_resume(). Looks like this usb device is treated like
> > a real device bu usb core. Is there a way to have usb core
> > PM (suspend and resume) handle them as virtual? Would it
> > help to use "supports_autosuspend" to disable suspend and
> > resume?
> 
> Would it work if usb_disable_autosuspend() on the devices
> that hang off its vitual bus?

You have to consider PM on both the host and client.  And you have to 
consider both runtime PM and system PM (that is, suspend to RAM, 
hibernate, etc.).

On the server, any sort of suspend will interrupt the connection.  
usb_disable_autosuspend() will prevent runtime suspends, but you 
shouldn't try to prevent system suspends.  Instead, the usbip driver on 
the server should have its suspend routine close the connection to the 
client (rather as if the server's user had unplugged the device).

On the client, you've got a choice for how to handle runtime PM.  You 
can leave it enabled, and when the client decides to suspend the device, 
tell the server's driver.  The server driver can then attempt to do a 
runtime suspend on the physical device.  (You might need to add a new 
type of message to the USBIP protocol to accomplish this; I don't know 
the details.)  Alternatively, you can forbid runtime suspend on the 
client entirely, although it would be nice if you could avoid this.

System PM on the client can be handled more less the same as runtime PM.

Alan Stern

