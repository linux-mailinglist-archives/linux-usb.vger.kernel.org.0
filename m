Return-Path: <linux-usb+bounces-33809-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB3SCXZRommF1wQAu9opvQ
	(envelope-from <linux-usb+bounces-33809-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 03:22:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BB1BFF54
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 03:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BB2630768D4
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 02:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940E332E728;
	Sat, 28 Feb 2026 02:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RuEYukJz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE832549E
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 02:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772245349; cv=none; b=jehUIMyn4It+pJPeYXWE/hcAc+L/dszmmtPhP+cZFsMB5Y2Sm9i2SVe8hArTV94nOBX7LkoecZfQacAqHZYvMn1litAIsLOgEpRuzD/KGPafCjttuSg/rEw87PUUzzGhOxWYxTGQmUcUbpOQbNoSyolTtdibW3hhNQzozGI70Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772245349; c=relaxed/simple;
	bh=Gfn3aCNT8ZT1wK5WcGcj8Q5BH6obBRnkZU3amLAbYNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgGkf2Oap8nt5FvMxYDcrk/fu+x+pFTASXMXj6NN0+tWkk6oChSFUljUY49AlKuq/sUFfxtu+pELQsvGXxU5gBnuQoK/PheVdpc3mTKb/YyKdTqx9qpEigLd0VYrbOP/rzkgYW/TgUNOIzB34A4u0nkvVTbS0US0oiPftzAJcgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RuEYukJz; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-896f5af3d8aso41036286d6.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772245346; x=1772850146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh4u84aZJXhFp8ppWCmYPAvQ9O43Y7zAm+Txt0TtWbk=;
        b=RuEYukJzLAMQ0EyEEjZlsbx7yqos0jWnOsM4oTKWRf8iifr45N63AK0qmNpSJpecvB
         DzRmMYGNkyXYoCJxXPkLiG6BJ0gXZUMhyugTrsoNBtY1yp4L7npkf1kxE+SrGK4zUsh8
         Up5ii2ixKTczYt4ex5IYZxxQ7b+nEVZChv6cvJjVSccs/AS4RKLvy5WGNf+IQcCNL+1i
         aWh9g1lHiV+HUH4nEGKUvYvC9ZHx+VvNa4/TugPL1TpPqDfzdTAdsJ2xeJ56WHJM+CM0
         pELRHlQgNawSZZRhQIb4C0GKYTXofI2DNt5EbYzwium9bsKtOOJxznt1jF8hLczw2naw
         s7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772245346; x=1772850146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh4u84aZJXhFp8ppWCmYPAvQ9O43Y7zAm+Txt0TtWbk=;
        b=JMy0+4G9gGGAZIy98XZr3zDTtY8RRav5NNq5P5dTTBYK5GHQXVX6cM4J6I5hGHTGxp
         hO/v4vRD3J5PumSyhMDnlZ7B22TpSCv0OwEXs5TfpbtVLiflktB6aPWnEX64uQeOFCL3
         +lOv4edm3LuNwc6yHJwr6JAtnfyilMqQpAdE+p9mbGm2ByJcFGuH4iUNC+H7pRuI0hoL
         UHiEikh9GFXmgux6PLroTAfrddjwVtEh8SNooLKJXhN3Y/O/V1Vah/WlSEAa+GMFgMPq
         68j5MFynQ4qOEz2Y6HX0U4kwGgnWu8LrmQRAVp2PjpZGaQCSgwDpNMBFpBZPvS1kDCdl
         Pzpw==
X-Forwarded-Encrypted: i=1; AJvYcCXYRpPhJvk0Q3UkCeNvkbBX1xrrX8dvNqkrtjjsbGpZA8YeFM72WYajoUUZKyWAUI9dn58lSS9Vucw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMS+aLPe8z+BVHN5kwB8gYR6aeRVLauK8faOcbeJSxoY9cI0to
	zT+V7eGGvxhP3t863m2GWNYS0IP3mDxSv0oxGU51apCV/Oc8kL5uTQlBeNewu7JABw==
X-Gm-Gg: ATEYQzwmT6IaeyUtE2kdEyPE3HePeNzdHeOxY13WZiqoPvvuw+In5GPeMbC1s33NSsw
	j4NkBk2GgmbPSGcrLM1VyIs13CeqcGaH0a/PWV7g3HKP408tb9hZJxGbStIjd/+3YKTqbR/tJQA
	W9Hk9EZ3Dbls2ZkesT+5rzs50SqT9batedAnQEMUEDbRXHbWE7kGDUsOzPySB8UsWGUM1DhyBfI
	9XQuw6u99pVt3AsfmcUv0ErTEqqlE9zwHGsz7fterIWskYsVqetmb8piz8+BtbFDnWVcVil3L3z
	OzkZNXuaEIJQgQxZpsIQNTFhMMCibjDq7cgkzE3zcFolzNyD7P1bzfGcrgv9S15tA/Sk8W8xliP
	QRC+bLt4YRjJ5Jd6/+0AIjwviGk/Oev8IOWFQz08i3VYy6zJO12V/S6+/u7bpt983dd0HNt1f2v
	LmWdDHcIA2oB8RpBJoEPoK6kdT
X-Received: by 2002:a05:6214:62b:b0:895:4a0f:ea79 with SMTP id 6a1803df08f44-899d1e1c4c3mr75778976d6.44.1772245346458;
        Fri, 27 Feb 2026 18:22:26 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7377b0csm58099466d6.31.2026.02.27.18.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 18:22:25 -0800 (PST)
Date: Fri, 27 Feb 2026 21:22:23 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>, Nicholas Carlini <npc@anthropic.com>,
	linux-usb@vger.kernel.org
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
Message-ID: <f45e627b-66a7-424c-8491-8fed677ab9fc@rowland.harvard.edu>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
 <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
 <2026022617-disengage-spinning-c6bd@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026022617-disengage-spinning-c6bd@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33809-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 706BB1BFF54
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:45PM -0800, Greg KH wrote:
> Given that I have to answer this type of question about every other week
> these days given the fuzzing reports we get sent to the
> security@kernel.org alias, I think I need to just write up a "here is
> the Linux USB threat model that we currently support" document to
> describe what the state is.
> 
> We can then work from there, either agreeing that we need to "move" the
> level of interaction for which we trust / do not trust a device in the
> lifecycle of a USB device, or just be happy with where it currently is.
> 
> That should work better with some groups that I know are working to do
> stuff to "harden" the USB device stack for some specific use cases,
> hopefully just using the existing user api that we have today that
> USBGuard uses, or possibly adding to that to handle some missing areas
> that we have not previously considered.

I'll be keen to see the document when it's in close-to-final form!

Alan Stern

