Return-Path: <linux-usb+bounces-36866-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HFIHbDw92kOoQIAu9opvQ
	(envelope-from <linux-usb+bounces-36866-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 03:04:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E60034B7D8B
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 03:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B133300F9CE
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 01:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD58D1A9F85;
	Mon,  4 May 2026 01:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hfMrg2KN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F27191F84
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 01:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777856673; cv=none; b=D+xQLLlTxLOBFS5wz2+QkBZ3Uizi/Z/dP50eyfY3yeRydiKLlJTMkEdybZunOQEfNXqnaO+TxQqiX7hNSkA346ijAIEKCdZakHrgomCML+ma3lhfxhfjxPjLY15xIoE62rR8c289IjObPqEIXzrQP8fvYZysfGaqeoITaVdw7xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777856673; c=relaxed/simple;
	bh=VOImGagwUv6VjbT83gC82BU3DmJGdg7wni+ROUxXYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c686jB029AYeJ9asrkHaiJObslSryjSaBjBGW7NJyjBw1wuhm34ittcaaRKKMi9RCFJ4ZO7x9xmGFHwJt1M4RLu45O+j1KVZNP/+elDY7eQUMXAoBe+z4c81vmXRC5UeZuNsg+U/+uy2ro+QrJvZaQ+apQDaUr95sXn1la3n/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hfMrg2KN; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso51133846d6.1
        for <linux-usb@vger.kernel.org>; Sun, 03 May 2026 18:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777856671; x=1778461471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h/sDH7zw22iV9/mg6xQgSxNHz0ndZ1t21cOLtIAurYw=;
        b=hfMrg2KNOjlVt+0mTgpjuxi4QpH10fwvxVux3eVAbxj9g/6dFAPnwC57yOtTh5Czea
         Q3K5Zuek9RVe3VP7ELK6nw5H4cGydY4IzL8a4xGVHgNOQsi1A/QmQauKEpi6j9mlMuov
         xkuOSrmKUmVVJ4C25Ef6377eILWk7bVJtAgCIXN5RFg5T1Cw0uSTgDaizPZua9pQ91YE
         M/+w9f17MJghnws2haHnqV0l1nA+AvqaikkAzc5SD+kbyVffOhnjERceZu4oFVhJeA6/
         HWU7eWsWBe7DaIHqRlp5y2lXHd9P1X3iCmOLvgk4xTGvzZ0yqlTbkgLHGDq2JQxYmHbv
         /bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777856671; x=1778461471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/sDH7zw22iV9/mg6xQgSxNHz0ndZ1t21cOLtIAurYw=;
        b=R8KBA4QwLgB9D37M6AxsyWfpZpPFS2tH9BfvsitxnX/6BpV1OanEXv+uJmahpGEFUC
         UQWwGHv6ohCyTjR31Eh4b2VSJopqKFCVtzLKarxJL7cKTRo75Bkm2bllWHfgsRDm3tHa
         eaFzy9pY6w6kobshZZD9pQjcFhAiDxRa69PacYeOhWga8bIVGi18AQLRSio0H6Vp6I2s
         +vTuzpuQRCAbZMoN4S1t5EsYE1T9nuM/CirQmDctz8UeYR2744CMeBQewXCpweHSjD2M
         nUMjpvi9qTRcLZ5LGhG7wJrLphLxG5OHtjfN7YZtNiathneX1pqr93ci4r+YdZg0bb0Y
         dd8A==
X-Forwarded-Encrypted: i=1; AFNElJ9apxPGO8T1J2+CvF6c/DW6IYqNCvLHhSXxSd9CmYVE3SPGZppz07/5948Xg1DhqVwALka3jMmV0PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW/bFruzxU5+6XyFDEW6WcVa9BtmkHlCTGBucZlZXxwDJ9loo4
	JspcFosbEv6EXyFqK6Ikw5WgaVzGFVmumUoV5nX0ukgcjfjrUD+Zwp044c0UkBFcHQ==
X-Gm-Gg: AeBDietyukMdsUqsb3XLxVRU8mVbFcjvSNYh0OzXckf2sCCTQydQVfGxOvrUBSFTtgi
	X1y/w3oNzcQMSmnEJ8COwqnhar+vkuPrD9lTXwiC3bSAbc5tJ9YOkvc4E8vysM2GCoz4EyS9TIo
	pBpjfvUzVlvUhoLdRNrjjeKdkcgWPhkXqIhFPmveF1SSy0T34M6QdkLflwAFteeRAYh+8Fq/fXv
	qoV8kO78DJSGExZIGKP1YPVYURVr+Uyp8LZkXudlwtOlgyYM76wBHa+RlhwybibmSMAd19YiDAG
	/HRF4uzSf/aZt2RspAeSasZwuLeYwBiITzTYqy1w1m6FJ+yVgY2j+cErz/VOwHw5cR65wPpRpga
	pZMV/HENrEHkOeBjBGbdigY03i2L1jGfkiiGxPGMvmlXscGhnxgXoRq8yOxCJgM+SYe4IHR2CIU
	Z2eLh7fLYGxoakZBrgS5zKUa0Ww3Yrk73JFkeSNfpqlS9XUg==
X-Received: by 2002:a05:6214:f25:b0:89c:867b:a9bb with SMTP id 6a1803df08f44-8b4000806b4mr210752936d6.18.1777856670918;
        Sun, 03 May 2026 18:04:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d35787esm101254086d6.44.2026.05.03.18.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 18:04:30 -0700 (PDT)
Date: Sun, 3 May 2026 21:04:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Haowen Tu <tuhaowen@uniontech.com>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hansg@kernel.org,
	mchehab@kernel.org, pavel@kernel.org, lenb@kernel.org,
	kernel@uniontech.com
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
Message-ID: <aac4e77f-bca4-41e8-a0d2-608d66a25c14@rowland.harvard.edu>
References: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
 <20260430021433.2083281-1-tuhaowen@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430021433.2083281-1-tuhaowen@uniontech.com>
X-Rspamd-Queue-Id: E60034B7D8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-36866-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Thu, Apr 30, 2026 at 10:14:33AM +0800, Haowen Tu wrote:
> So the real issue I wanted to ask about is closer to this:
> 
>   during hibernation image writeout, should PM resume all previously
>   frozen devices, or is there any room for a more minimal resume of only
>   the devices required for writeout and their dependencies?
> 
> If writeout succeeds, the system will power off afterward, which made me
> wonder whether every previously frozen device must be resumed at that
> stage in the same way it would be for ordinary recovery. If not,
> avoiding unnecessary resume work in that phase might also reduce the
> time spent before final poweroff, although I do not have measurements
> for that. On the other hand, if writeout fails, the system needs to
> continue running, so the remaining devices would still have to be
> recovered correctly. I agree that this failure path makes the problem
> much more subtle than I described in the RFC.
> 
> I also agree with Oliver's point that this cannot be expressed as
> "storage devices only". In practice, any such approach would need to
> account for dependencies and for other classes of devices that may still
> matter during the writeout phase.
> 
> So at this point I am no longer trying to argue for a USB-specific
> interface change. Instead, I am trying to understand whether this is a
> valid PM/hibernate design question at all, namely whether the writeout
> phase should conceptually be treated as:
> 
>   1. a full THAW of the suspended system, as it is today, or
>   2. potentially a narrower resume of only the devices needed for
>      writeout, followed by broader recovery only if writeout fails.
> 
> I do not have a concrete implementation in mind yet, and I am not sure
> whether such an approach would even fit well with the current PM core
> model. I first wanted to check whether this is considered a valid
> problem to discuss.
> 
> If the answer is that the current full-THAW behavior is simply the
> intended model, that is also useful for me. In that case, I should not
> treat the UVC behavior as evidence of a missing USB-side mechanism.

As I understand it, the system works the way it currently does because 
there was no good way to tell which devices needed to be powered up for 
storing the memory image.  It's not just the storage device itself, but 
all the other things it depends on, some of which might not be its 
ancestors in the device tree.

By far, the simplest and most reliable solution was to just power 
everything up.

Alan Stern

