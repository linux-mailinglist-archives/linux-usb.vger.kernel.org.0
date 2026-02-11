Return-Path: <linux-usb+bounces-33297-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOOIEvarjGl/sAAAu9opvQ
	(envelope-from <linux-usb+bounces-33297-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:19:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF91260BB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E38530046B8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 16:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A518308F1A;
	Wed, 11 Feb 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rcvKIX06"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4433E355
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770826736; cv=none; b=QHx5JT8IkF+oVFMED76XzCoMfY6dzuhlrtRH9b5yqcxQZZ9+dYCSous/tOOZ8PkAqdA2QQ4hCRbZSXz7gdQ18yPv3+ymNBhkOBMElbeNLwbTbx/8g2NFiyDwTbxawBkX+LU710Dmmek+I0KxqLk9ZkKIe4nyCUCsdpGgack0LsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770826736; c=relaxed/simple;
	bh=8dQ/dIx6Ely8LKDVvks4Q5pXtyZgjYrJn+Wgupm+Cqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pifNSbhYJK1kL9+Nw8Gv7TH6Y6bHWx9Vnehb1HSfV6jGMA7pkDI7j6EDCi8o73I/ncWpSrgBiBthNMjAcLxuy/HGkBqzdx/ypFlyvDUdgRQjN2Rxk2xxgrSuFe0y5I7uSznhdS3798c3qUDDDuai00PfX0Ihz2VLpvw0FkiPx0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rcvKIX06; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506362ac5f7so50575831cf.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770826734; x=1771431534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2Cg6tawiTWNSDSoDdpKyjLTJ801dfTXt3HTYJ2la6I=;
        b=rcvKIX06gg4avDpzkm0Fv3GbR9QA24I1jp85zrpF+Cc/Lp4EyPCWOU9UosxomPcaG2
         pyOKiJKRFbsXYKjFa64Ap7oZTe27pmrP2mHS34Sl15ZJX+j/OUlefz+V6J0Q4EZtFIEJ
         Oe9Vt97xXLpnrZPzUFvyUT1x1JgEmAXHVSh/GlY9we/L8FG2EeqYbMHAzl+SCTfQQLpU
         pk0DTM5nu4jDD1nS+QAhjAwrxsrXvcDNl3Bk3R0cKcyk74adJO8eTpDMBIreuMXuWGuD
         7FTLoAEx9AC5sYnM0s6LSvnOzGb1HUtIsWNdF6spUrt27AV/u7RUVpAam4COoZhNBEHu
         ozkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770826734; x=1771431534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2Cg6tawiTWNSDSoDdpKyjLTJ801dfTXt3HTYJ2la6I=;
        b=OJemBriOt5orWtqluqV44RXd4+E9E4Ntj/26v4e9UoQpi/TGoTDxmtd7iHs5LC/vS+
         pEOh1qSeDcF9wrj4YVgO4s/Yvi8ghDZdos75gVEJy5vQcpIETzaX/pZDbJxGXeNjys78
         fXTqxfoJYTYH0idf1wDNMwXfgohd7PZaxGZVPEwAHpfzsafFfG8vwpN32gx3FOp4zDic
         UXokhcSl0cpgfHRqOjRN2v/d3elCg0UvZLUTXKr4h9+U+HxN7zcYqx5BWH6lk54Hm+Fd
         6M31q+rKoDMfJtG2RSp8KLz3dVHbFRH/X6RJmGzsn7He2Q/WWkqMQ8leoCroUo9RQOQ4
         abSg==
X-Forwarded-Encrypted: i=1; AJvYcCXhdWnT1crkmpwPMvZP97Jq9NTMQZ+1eiKgdUkf0OSoJbxNf31XWmA949E2wk6MZffEDqDL0JfNws0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5f6yVaYq2RX6D/vtVkCZp3bJXTHu0PO/UydIyG6KpHLllLbgw
	0MJQ/DxumC4GuuakH/rT+/OTWUMFWS8hvYy966SIs5Q1DdsJoV7N2WsjI3lh7E35zCTjwMuI0MA
	JOF4=
X-Gm-Gg: AZuq6aLrAWcW6Dm/dPgpEAj/Mh1W5fVChQ+brsK3odGGNWkVInxpgrllmScfGDW4kZS
	nQzPozueqNDbV9x7BB6bJCa8VwFjx7tbWlJQgloe0Etow1IjG04fOs9hQhAAII8fv7hCdzMrQL8
	uiqpX10aE8Yeq3VY2VZiko4qpuqaC6o+5QE3l/vtKMy+ahDmY7HakXDajsEbmk7Bp8A9By3ZVbV
	Q1q1Y0czYvXd5ONJyLVq7In1fGWzrXT3Y5KvtzZa1/BQcvAFhQOHSlnNcalgYkXRN8eBuuxaEMm
	zvMsDqQvH/iqrXZywy8MH5DtL16u1ba3hBvx+BHO03a8Sj7p/Mdm1xYG5dU4VYlTdWl6azL+nJZ
	19E01hU0snNmcEkA7n2wtYcO4YRdMhc0qC/YJ9SfeGLtFxfcUKgaMWIQ/6LgJJXRsniPC626puV
	8xAwtUK6+vop7ho6//XC5hlI2VWN+ckoOGdCX6KGzppQ==
X-Received: by 2002:a05:622a:30c:b0:4f4:a9cf:5d40 with SMTP id d75a77b69052e-5068101e37amr41711691cf.11.1770826734500;
        Wed, 11 Feb 2026 08:18:54 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50684b6b56bsm15830971cf.17.2026.02.11.08.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:18:53 -0800 (PST)
Date: Wed, 11 Feb 2026 11:18:51 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
Message-ID: <7403a3e8-764b-476d-ac45-f2de9e6b67ab@rowland.harvard.edu>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
 <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
 <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
 <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33297-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 48CF91260BB
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 04:59:40PM +0100, Oliver Neukum wrote:
> 
> 
> On 11.02.26 16:31, Alan Stern wrote:
> 
> > First, the change to usbcore.  Rather than giving an error if the
> > requested timeout is too large, I suggest decreasing it to
> > USB_MAX_UNINTERRUPTIBLE_TIMEOUT and continuing.  Does that seem
> > reasonable for the synchronous usbfs ioctls?  (Note that the
> > USBDEVFS_SUBMITURB ioctl is not subject to this problem, since it is
> > asynchronous.)
> 
> Yes, this seems entirely reasonable.

Okay, good, I'll write that.

> > Which leads me to ask: Which consideration do you think is more
> > important for usbtmc: Having a timeout that is possibly too short, or
> > being subject to interruptions by unimportant signals?  I can't think of
> > any way to avoid both.
> 
> May I suggest a third alternative?
> Implement usb_bulk_msg_killable()

Under what circumstances would the transfer be killed?  And how would 
the user be able to do this?  Would you temporarily block all signals 
except for a few like SIGINT, SIGTERM, SIGQUIT, and SIGKILL?  How would 
you choose which ones, exactly?

>  > My opinion is that if usbtmc would really be worried about limiting
> > timeouts to 60 seconds for its usb_bulk_msg() calls then it shouldn't
> > have used usb_bulk_msg() in the first place.  That API was never
> > intended for any transfer that might delay more than 10 seconds or so.
> > For this reason I favor the first approach: Do nothing.
> 
> Well, what conclusion does that support? Not using usb_bulk_msg()?

It all depends on what you want to accomplish.  In this case we don't 
really know what those calls in the usbtmc driver are meant to do.  At 
least, I don't.

Alan Stern

