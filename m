Return-Path: <linux-usb+bounces-36637-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iACBLdTe8Gl5agEAu9opvQ
	(envelope-from <linux-usb+bounces-36637-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:22:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB597488C74
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E05D3139E04
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 15:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497AF42B75E;
	Tue, 28 Apr 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="alyhf9Ed"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9668C2FFDCC
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777389148; cv=none; b=G4GtwUK7zePXdvug3iHQjcIWvL8kBLlBS2oi47sLylqaFNgHqMycIP3JwN+aEUGZRzebOXGJbBNxgQYCmdjnI4YP2gZoa1/QuFytQOtFqznM+TMBXwXCHdefvDb1BvcUMipllz1jqX4pYWiYwC3WGNlY37ebYXk1Jpfzlnk1/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777389148; c=relaxed/simple;
	bh=d07RbXnaQm9iiHQRxgoSOAz2uScnk3dI9+tWqWrDdzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jb0L9lGzOyCK/tpeFjqYMTy1q8AgI4Mof4jzNDLMXqJiBzwhySpBcjFh72CIa6UcN1q/49yZnp9rkE4gvstvKfKcOaeNT2X/iL4WVXjd6i/LjfBhN+MYup21lgd6G61w7/s/SpsTOPzpNzIuxG2yZPqeK29peIPdv9MmXI/K/xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=alyhf9Ed; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50fbd79350dso74393001cf.3
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777389146; x=1777993946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IaXwzGtLpoQm6CnRmabP6IiFbWb62yALGjzCIAMjPPg=;
        b=alyhf9EdfwCMEHZ5Q+gjfxgJvBWqSEzA0ZAL3HZ3C87VOlDhqbOhufcqfk0Q1vPxYI
         OBS7PxTeG0fpoW1lUBBeMbDpg0ylidQNvvKwGuQsO4X1gcYnatWk3+NGpvDJNBEy6ei9
         G6R0t4dNJ9O9ymVXCaW4IeegMuw/977ySkarYe2IXG3UfB8H8RYmj+BNa8lQm+43Fwlc
         md4vaZs5j0bZhavGxAYtU4JnMHKhdM2MjFMNWcNppxaDzpGxkew+IEbLH/UxHAH+beR4
         lRgGm7WIZnUdxPoxPGNNx5BYf7V0LpjpSwgtUmUchscSaia99C6prRjqM2Luccb/tlRv
         XG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777389146; x=1777993946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaXwzGtLpoQm6CnRmabP6IiFbWb62yALGjzCIAMjPPg=;
        b=l4kZDeCXsHoMNqwklXc524jKd4bFTAuFcp5QEdjA9C9ec9L3JpNpdByBTlyvF1wV4N
         Yeoa3ARBT4W7CkmtKr19jc0reFEba7vgps+cB0jHqbRIKYqgZMV5VUSeSZ/55d3TtWFn
         nMYTZRv71SFLTeYYgeRxBzyHzhBFkhGmESUhUWBSYvW1LtkW4DGorXq5IW5emWA1bBUD
         mraNrfy5DbaBGTUXcxNWJDLZTAp1+S0fsTFHVMkpQoX6k9cQwet5pYmQ0u9JK/KbtUsC
         uD7d5Nm2dx+mLoqBvv9OhA66XS/oJxUM0m4sDbJ1s79EAcwb+u3ZHuXtdVLp8QV02yBW
         ETKg==
X-Forwarded-Encrypted: i=1; AFNElJ/SGnhb2LElNrclxGGKLQx/RzgNR8PzTPptl8J3UkEktJCxTlKeIUvTfqm78XsWKz0fLOS6aOcJrB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8dF2o5OB29JKZmwcg4MyRMdPNqJQ6Ie9GYNhHcFLwzlPF+rjs
	xVg7NLDIA3NR2xupvg0XGGqPnGjUdJsyL0Sg3H27mTemm7cXEIFHmtiivlWfaEM9MA==
X-Gm-Gg: AeBDiev97RelgmwBsPBGQ+gzzO1t844QGPOELtFjUk4oNRMZ55pBJM2+VctD1x6OQSX
	tCu+PTGNZpYeKjnLLeKRiXaxEMGJJvJqLJBwiO/r5HBTeK9XZOmoj9wtVJ5rYkUZA6SAIgOjhmv
	80+aPQJC0B4Erc9KTpYU+ngFZihLlbFmo1AZdUDf4qcJ+HXbs7tayoEQGFNYRb6q+YQf+6jbdN4
	pX6/elCE9zh4TznHGTMj2Xnu+MZvdN9oXAzuEVnBZpzB3fovWvFPQ7EvS44zRPLK8Rhbq9+9U4O
	sI2jPryAlk4n27O6ZOM3OFJiUsltEAiUoJSKcvOb2ZqDqEY5mmBzZZaEDIBTK2gdqiDhIWS4OnN
	76NjDjQkubuXgIxLfRh4Atq+NW5dFH16VECS0eM0FeC1AwIRIYo1kgcePZ18FKtbqLQi6im2PWi
	ofa1G8bXIOyjyGCJJnn3/G8uN5Ln75Fj3Vj/s=
X-Received: by 2002:a05:622a:1f0a:b0:50f:b1be:76f9 with SMTP id d75a77b69052e-5100e12c308mr42084761cf.24.1777389146335;
        Tue, 28 Apr 2026 08:12:26 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100da4d312sm19121911cf.1.2026.04.28.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:12:25 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:12:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] memory leak in hub_event (4)
Message-ID: <e33625b0-70d1-498d-8605-68bfa8dac817@rowland.harvard.edu>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
 <bb39abcf-aefd-42f6-b9e3-e576dbb5fc37@rowland.harvard.edu>
 <5c8e6c36-e8e5-4e88-b789-0f46614cb03e@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c8e6c36-e8e5-4e88-b789-0f46614cb03e@suse.com>
X-Rspamd-Queue-Id: CB597488C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36637-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	SUBJECT_HAS_QUESTION(0.00)[]

On Tue, Apr 28, 2026 at 01:33:20PM +0200, Oliver Neukum wrote:
> 
> 
> On 27.04.26 16:19, Alan Stern wrote:
> > This is not needed.  dev->rawdescriptors and dev->config are deallocated
> > in usb_destroy_configuration(), which gets called when the usb_device
> > structure is released.
> > 
> > The memory leak must have a different cause.
> 
> You are correct. Yet I can see no way for usb_destroy_configuration()
> to not run. Hence we must be overlooking something.

Maybe the usb_device structures are not being released at all.  For 
instance, the snd_usb_audio or snd_usb_caiaq driver may forget to drop a 
reference in an error pathway.

It seems odd that the bug report says there are 5 suspected memory leaks 
right after 5 devices have disconnected, yet the tracebacks are for 
different size allocations, implying that they all refer to the same 
device (i.e., not the same allocation for each of the 5 devices).  But 
it could just be a coincidence.

Alan Stern

