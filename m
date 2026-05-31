Return-Path: <linux-usb+bounces-38189-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QbUDKZCSG2oZEQkAu9opvQ
	(envelope-from <linux-usb+bounces-38189-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 03:44:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE94614287
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 03:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C96F2300F778
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 01:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CB935F60E;
	Sun, 31 May 2026 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="me8Z/ozn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE207260F
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780191882; cv=none; b=MGKXoltHUpopQ39CmG3xCl4Jr6axYMxfL3hbAYJnZMvCiqmwtYLCoJyMJ+KfEijluD6FCuDS/mgNkJbPeRDmmW2+dJVgzw/rpkyi9bonsv6/d3weK+TJFhDti/n3RRIaQUs2rUSueuxLrKlGYlVuPlOuvQGc7dqguv6FVPAzAlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780191882; c=relaxed/simple;
	bh=vaLaKzH/CDQ1wX7xY9XpnFEjoCVut/yFH9WkPYJSSow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IznEOl0P6V/Ri7ttLockpxdzYtE/vnCXLfYIGN1vs4qku7fCyfpV8cHvKDmjKjQAoiOBc77/pVz4JGuiPPcxO+bpo08R+yt2yLBTXu3rGJxbmL/B8Z/1FByNoS8k6ssI6nF1CTBJSXtnEGU1hxfPUq6Wd5FHp5QISwVJM8ikAWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=me8Z/ozn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8ce9df48e1bso3058486d6.1
        for <linux-usb@vger.kernel.org>; Sat, 30 May 2026 18:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780191880; x=1780796680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UtZ8s8sXtULm5XJO2j4rtILmYcujGvNWJqaBTl7IWAg=;
        b=me8Z/ozn87FJYQpQHF1Z/IDe6j/rwA8pga9mAFg+4yN3Mk2T4tJ9Lxs+wr3QOt/+KP
         Q8UR6NjEmseBdrBvj1j1LY0kZwnvBzTpfWU3nC/IJoPtxiQEtAyA3OVsHTqLf7p+jaze
         SFZyZlTXGLGnYmeYQK1bFo7pv+F76sJCSWIIGwiwx3zT4VJJeaUCRKRtEYUQP9Yl2Q8H
         I9ZBl92Syc6H53LX2tmKS4jwLFmmv02brwUBhyPO+OyX5mk1h8NLIixBPd56Sa4r2CVN
         v1ml5Ylz2JS0myiizl/LNBaQbuCseXawRgxPeoHTlpbAbVF0VfknzEkhIpOQVjq8YGsb
         R8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780191880; x=1780796680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UtZ8s8sXtULm5XJO2j4rtILmYcujGvNWJqaBTl7IWAg=;
        b=K+TgT+ncuCMc38Qf12RaJ7KxWUNjcH7z8pWc+UsdfAbe9iPdXeuIK7QK0c1Hs/nqJV
         tGVLmz4O9MlhaZ3crFw0TzbJHXC7NKwsNa9eITSNkrmgoa6lyFSCDnC7K6NYvcA754VV
         lBDnpmD7/runkAwPu8pWuDiiF/wHEKB+0sv9UP0/HERjvARpProx9QZVOuCb638lrjbF
         Il7HafPmgKxaIZ4y9mh0pjs+Dj+cCn+81s+vvagkhqT9J3eckiTLp/4OmDpojrJ1vi4X
         Z6ce++jszhFYGGqvfhVdMCzR2w5nABQL0eZWeYx26J2RIhMB+w6kUlle6JjaERyR2uHI
         cKGg==
X-Gm-Message-State: AOJu0Yxo9+6m43mVCYIzziajcSnx4nPN1XtifTga9W+0KQMQiYtlyo1y
	awA8rofzhKKCawbxPx2IvWJa0b0C3fP6kUoAJUrskjbHXkOeRYuVQWDB7mn+3LFbyg==
X-Gm-Gg: Acq92OFgeeu94VKYYuX2bCc6B+or+DCniWHZMH28l12cqfOudVkwb8Ux7Fd/tI/zAyg
	/kPMsrDkQPMn6VWnFQrke0JT/7oHNQwaoNBBBn0sOUzimZp/mmvzGQ4g6CYVJC6ZchHxhi/T2X/
	LUB/fuY7o5WCKNZAAaHmtwbBBUbW9ie0EMno3fUFOh8Z4WZEmo/3VaLR80Dhx8pdM9fXefIgQyj
	uOEYZK+A1k/Ciaow3DFO3u6k58WhwKzmIkmmGoTMzwz0Oh2oCjgbWMDrX0Yxq7Q6Ye5vnygoA1X
	kZ2CfU43lvxeAn10lsPur3dopEJA11dop500orH5YQPNL6yUb9KegNjDRmc/YPuReVMTKCKWha/
	eXcAN6T6NxMvG9I4eOlC6m1+qBDMNMThLiorxiPIHiEPDhYGfu8bUM/4QBd2FW8M4XdJCqGFPn+
	mE5ouVs82AUh7rB7GweuF5mUGrunNMgPhSd5v6UQT2VC/gmKt5iU/yWA==
X-Received: by 2002:a05:622a:8309:b0:516:e7d0:73a2 with SMTP id d75a77b69052e-5173a70f246mr63241561cf.15.1780191879806;
        Sat, 30 May 2026 18:44:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b06e54sm21629671cf.6.2026.05.30.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 18:44:38 -0700 (PDT)
Date: Sat, 30 May 2026 21:44:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de,
	lijiayi@kylinos.cn, oneukum@suse.com, bence98@sch.bme.hu,
	eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <96dc88f0-15b9-44d0-9238-128e80dac02e@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
 <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
 <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
 <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
 <CAFgddh+3Ksi7aj=ZNdn0qum8zQ=d_HM=hVtoH224rEpfhamsXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+3Ksi7aj=ZNdn0qum8zQ=d_HM=hVtoH224rEpfhamsXA@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38189-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3AE94614287
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 02:17:32AM +0530, Nikhil Solanke wrote:
> > However, there should have been messages in the log saying
> > something like "unable to read config index 1 descriptor start: -71" and
> > "can't read configurations, error -71".
> 
> yep there is. I did mentioned in one of my replies. It does say:
> unable to read config index 0 descriptor/start: -71
> 
> Attaching the packet trace with the USB_QUIRK_DEVICE_QUALIFIER quirk set.

Thanks.  There's no visible difference between the enumeration under 
Linux and under Windows until the disconnection occurs.  Here's the 
relevant part of the Windows trace:

ffffc588ce0c3a20 0.327827 S Ci:2:001:0 s 80 06 0100 0000 0012 18 <
ffffc588ce0c3a20 0.329841 C Ci:2:001:0 0 18 = 12010002 00000040 5e048e02 36000002 0301
ffffc588ce0c3a20 0.329887 S Ci:2:001:0 s 80 06 0200 0000 0009 9 <
ffffc588ce0c3a20 0.332841 C Ci:2:001:0 0 9 = 09023000 01010080 fa

And here's the equivalent portion of the Linux trace:

ffff88e64c1fd440 0.965292 S Ci:3:003:0 s 80 06 0100 0000 0012 18 <
ffff88e64c1fd440 0.967582 C Ci:3:003:0 0 18 = 12010002 00000040 5e048e02 36000002 0301
ffff88e64c1fd440 0.967613 S Ci:3:003:0 s 80 06 0200 0000 0009 9 <
ffff88e605143ec0 0.973464 C Ii:3:001:1 0:2048 1 = 02
ffff88e605143ec0 0.973467 S Ii:3:001:1 -115:2048 4 <
ffff88e64c1fd440 0.975670 C Ci:3:003:0 -71 0

As you can see, the first three lines are the same (from the fifth 
column on).  The fourth line under Windows shows a 9-byte response to 
the Get-Configuration-Descriptor request, and the last three lines under 
Linux show a disconnection and consequent error.

Since the traces agree up until the error occurs, I can only conclude 
that the cause of the difference in behavior must be something not 
captured in the traces.  And since there's no way to tell what it is, 
the only alternative is to add the new quirk flag that you proposed.

Go ahead and submit your patch.

Alan Stern

