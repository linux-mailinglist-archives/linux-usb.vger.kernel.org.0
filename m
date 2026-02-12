Return-Path: <linux-usb+bounces-33303-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKvwLCo8jWls0QAAu9opvQ
	(envelope-from <linux-usb+bounces-33303-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 03:34:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDEB1292CD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 03:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E03830177AB
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 02:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75C01F4174;
	Thu, 12 Feb 2026 02:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PxWWyrUg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C2150997
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770863652; cv=none; b=kKbnP+k0lgGiWVpeg2fP3X09hnIqnLywlRvjB1bIz7XuX2Xn36uZsoAK68ZNHlzZQIIXGgvE/L9FHlR18ideVXL9CAlje/C+xD6q8EJcxR/MOGKLGjTFGyjnYTtmGsOTgaaY3PzQpdorcRfErfxVxCjrdHfaHGnV26wMNOd+JDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770863652; c=relaxed/simple;
	bh=w+Iul60NR0NV4uvWFbkJmGq5lZBIIyzmn+CZGPLolME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAITv3WXs5ZD+BeAQGxOUunM3fc4HDKI/we5+hKhzAU/SotFfcW6bcVPQzV6cUe6JCY1Cfxmtr2n9wrLuCaIks4ModNBrLQXeANrl1CVr6O2CTBPi1jOx9Po1EXwYMA97eHho18bsKQY+4M+lXoO1ZEhvaqhQeEit9MSNdMGCww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PxWWyrUg; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5033387c80aso20321111cf.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770863650; x=1771468450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=60+hXao+2fy6ms13TTKq5DQiZsqbZfrZOc1cMiKKTec=;
        b=PxWWyrUgAbFVKtAQM+M+0Hs0g3QqI31UhtjJ/5ouP7LFAWVLEqC+JXwmg36YvYME22
         CZWzevYpx/Eh62upK/dimmOUTbxh3s242rPVDlpLC9rrQYv3aueyDHY63qXN8fYkJLIY
         RmR14Ukd7oNkqCpamjKaCFeCPvNCrM1SKNYxANPubLlbrMOYqyaD4K9Skd9Y3IZVU4vZ
         nEEGziz5ejQF8uJHZ8dtVwJGPkXOKacLZIBeRrOinSCXVX/462eVfJJ3dcZnO4rrTAPA
         Y3HTdFwSQG1wWeIY88FtA2G8pmtUV7Wp17/MW2hUvC4J8KsMXYy7WISvqGBuvhhgovIj
         KO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770863650; x=1771468450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60+hXao+2fy6ms13TTKq5DQiZsqbZfrZOc1cMiKKTec=;
        b=wBn06oyBiGyCmX7565XUBDOyy05cU9H525EC3me/qDe3jtEtzDWxfqOTTM2NnI33oe
         ypnkiZHLsPW7dhrLa8lehFrAJd64fYs8SYN49V60XArlycDQixPlDSQf+t0npFIzys7t
         QIf2R4ND+O/WeL1LknjI1ObLh2cZ6gqAuqfV2Tnd3gbfKSzqZP/bVg21MCC7jSydqxWo
         0xow1hRXXZ7TOiaX6jntT0s97/Z9nDFn2Ld66SiNEWQf5G/fF08FEaVYNLI1IdTlfc9a
         H/Mp7C0y8QIEWlwKpqk+C7wyyvVNY4h12OWPG719a2TPvdD9zaG8iHMfe2dcZTJmMf7t
         BDJA==
X-Forwarded-Encrypted: i=1; AJvYcCXBrcmvhZ90whsww84MYfPrVUQJNAyeqVunsJF6HTnl9Gf0Sqk/9w21dj96VHTNrB8Yy8kM9GwLrf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YybZ5p889H4gD/ivBINR7HcJ5j1Da9bYT0SbWKjFlap3Tx3NvBA
	eW+crj+jv0NFHmDuelo5u9o+nseCSVeiww/hwxXhs8ZyPbzawevSvzAdcEB+cwd/eA==
X-Gm-Gg: AZuq6aIXmyUu7Szu0Dq6IQugLKN7R50FcHIr4p4XLsy0uYQcw1YEPdjmku7RDTmiGrp
	DoROHfJImmkB70Fs8xGYVQyQsBf12exp29uOSxL7os88qr7aFbyf2/+iLXT+ND7sNuRAM2LpSot
	a510fG5RfcTxHEQeDnINu+pP0XqoUk7S+Fa+nGnB7zqvxFuK84Uvr82KrLcEfP6jjQYMae6Ab5E
	jj8odIf9I8fVTeFwOrxwrkTjbQIiTTmeTrTh1sLGnA3d47iMVDUku6sJAGV4vP0G79bYtK5PNx0
	aZKQSroGJjZRLQEDVCjJB8UK52LOUcEdpzR/0yl+OlJ1fVvOnEDjLxX+F2pHoHWuGv3se9PQq0f
	gmuwpoHpooycMiU0RCFdEiepWugAWp8GYALJzpnj2cFaCjdSN1MtwfBgkML4cP7s/ZBnIf8/v7Q
	bFm1rxd2AUDESThQ67213SqMxv
X-Received: by 2002:ac8:5ac3:0:b0:501:45d7:10cd with SMTP id d75a77b69052e-50693497729mr16204651cf.20.1770863649860;
        Wed, 11 Feb 2026 18:34:09 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cda8b1fsm28218286d6.37.2026.02.11.18.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 18:34:09 -0800 (PST)
Date: Wed, 11 Feb 2026 21:34:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
Message-ID: <631119a4-6ac4-4142-8200-98a92a71bc8d@rowland.harvard.edu>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
 <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
 <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
 <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
 <7403a3e8-764b-476d-ac45-f2de9e6b67ab@rowland.harvard.edu>
 <efbd1b4e-13c4-4531-bc11-4a9c541a7813@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efbd1b4e-13c4-4531-bc11-4a9c541a7813@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-33303-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCDEB1292CD
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 06:59:17PM +0100, Oliver Neukum wrote:
> On 11.02.26 17:18, Alan Stern wrote:
> 
> > Under what circumstances would the transfer be killed?  And how would
> > the user be able to do this?  Would you temporarily block all signals
> > except for a few like SIGINT, SIGTERM, SIGQUIT, and SIGKILL?  How would
> > you choose which ones, exactly?
> 
> In abstract that is a good question, but it is for user space to solve.
> TASK_KILLABLE does the job for us. In fact I'd suggest that you use
> wait_event_killable() which should delegate the issue fully.
> > It all depends on what you want to accomplish.  In this case we don't
> > really know what those calls in the usbtmc driver are meant to do.  At
> > least, I don't.
> 
> I share that problem. In that case, as little as we can get away with
> and still solve the issue. "Little" being defined with as little
> impact.

In fact, is there any reason not to make usb_start_wait_urb() use 
wait_for_completion_killable_timeout() always?  Presumably a lot of the 
usages occur in the context of kernel threads that don't receive 
signals, and that ones that occur in the context of user threads 
arguably _should_ be killable.

If that was changed then usbtmc wouldn't need any revisions at all.

Alan Stern

