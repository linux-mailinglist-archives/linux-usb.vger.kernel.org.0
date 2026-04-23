Return-Path: <linux-usb+bounces-36446-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMUfN/om6mm8vQIAu9opvQ
	(envelope-from <linux-usb+bounces-36446-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:04:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A1453710
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 975033012BEB
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 14:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E24FF30F545;
	Thu, 23 Apr 2026 14:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nBEuW8fq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109430F819
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 14:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952996; cv=none; b=MpuKrd2rEyAq6W9vXGSZHtoVW2Qxl2EVRTEjuIlIkKLfVSzTQz+QluJVyGZ9ay+oZocVH5uB39HwD/z6kpjQ+EDEWSkrKTaMrLoNhoiIt7qxwQo/CVrOdGPMFy9BbSRDZsHVbr1L/uOsZg3U84cHR7BwAqlPTmyCmtZGAz4Obyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952996; c=relaxed/simple;
	bh=Q8SOwjA3n8AyY9yu3gQA97C6u632wXoMoaCNqx1RbBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMRMmXT0pfh9s2tsWS48YAmPgqcT2j8UFRoliYYeTW1Vg+12RQJziMHESgH63zZRWt3tyIB34NBsqRyWNjYS3pTA/WlarotxMNHiCJo+Jf8Irtshh6pZYaUl61PjbsYATvNI2mxvtCTPTOSxfvZYlC/8ydHCcOwIuuHzzLqHlAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nBEuW8fq; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-479e7e88fb5so2342118b6e.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 07:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776952994; x=1777557794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMzADB9T1+5NaZTwqzMz03wrHfVcsLKJ39eezIOEENQ=;
        b=nBEuW8fqquQEGxBF8+3//wlqvBXk/jexWlJ9UKvJF+HlBljYOEY0knm5CZ0RMt9uqz
         Jxsel7Q3DS5hjOyve32MLbUhYhLd/F5rl1sF8wPd3xc9X0wJUpKubMVora9rmtwRXTAv
         nItHpELImTJ5OSqH222zngzzTpn0tHil+4OFk5QVsbl8iisHwHfE4rsaAYpAERx7jXtE
         3Nwe1pV/3IxwU9EHEywygnjVB4kQTfrRjwIJ3GU6tW6MDaNOLOXfrt1f10BzfCZepFkZ
         +lj5+yvpc4wKkpgE8C6mfdYvlvD2/v5h1UFwx99Urp8g+X/U0RV8/2uIU23Abdr6ONkC
         Bj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952994; x=1777557794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMzADB9T1+5NaZTwqzMz03wrHfVcsLKJ39eezIOEENQ=;
        b=XqLBcSpsLQVfeaKKyTj8HkGF6xofI7nubr8I35415t90SfZY3UO8Tzludyhcf/Zhhx
         30tJsvbwlnNkJWQ0WwR4L/x7HarMe94P9bwxcxTQvnl+tSg7jCRnXSkAMLCporrjhpkx
         QKoTAz0Y11ZsHoXqJme4j37uqjDn5ZDNzvD0+5QkmjiNnqTN71lSHHsExuLB+OBu25Io
         uLihMJ1KDq4fdCCF7a9D08URTFy/ZCcVvKRfnuDa1iUmqPsR7i71rOAFsC0/vel0267O
         cT6n1lHB5xCYIYDKCGNAW7sLwcJxasJNQEzjk1dTbxfEWfUZNqcUlEyZfCwZz41YX/9B
         q15w==
X-Forwarded-Encrypted: i=1; AFNElJ8HD3EEN5DQnHPpuiZuaRCVDq060IsfzKEXPXn6FroPdUvQaoxKcELxPNm7b37V3iSZ4lOQ8F1mj/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33viNa1pDpteE9658PbaN7Cq61HvR1exUS8z7ek7/Ws1vy8ad
	OTGloSPgNaby1NLN8+gS8Tv2DQ+nezguByF/49mcABGiTkxx/LTqAdsasmMfiHuJGA==
X-Gm-Gg: AeBDievhfBDZo3sXut6fwpTi8czUP2UAT1HwhHzKKmyaJGnp/esFJiq2XvMwPeb8eYk
	lU5E+LLo2ZJnnzsU0UBfLeXvqFSF1ti3LlF2AAqv1DSW+oG3ZOLRlp16oGB186GzP8eezZsxaTp
	jTpcR6asVJVSmk4oz9mezf3SXuH+sEjHMcQu7e3/nMO4turHTa/hXpyVqjrUSHaODCz1f6qsgiA
	EJuwZ6F55Idzr8ljvBCqp6LXOnggVmcBd9rF0iRhC9eWMr8U1rdxs8Em3ve0TK7Oau447rT+RdG
	cRarAXn4UoWzlaCKx/gxt5D0tl38Bd0UTzc4WHZO7cY1zSIp+aBg63KdDK35nFDR7d0tmGkLtBW
	9adyzF1ta0TV8QfzNrvQW5a2wdDID1wBX1C3EgmiHEtCQZ9uZINKPWO+yRj9G1VB53ZgRmh3JRP
	3Ncp8EWnVImJOLDYEdj0vfPVtccsuXI3t8YgNj71JtT7/cg+JqCceT
X-Received: by 2002:a05:6808:e68f:b0:47b:c703:4231 with SMTP id 5614622812f47-47bc7034dc7mr558199b6e.16.1776952993794;
        Thu, 23 Apr 2026 07:03:13 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae7df88sm166304046d6.35.2026.04.23.07.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:03:12 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:03:11 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <greg@kroah.com>, Eric Naim <dnaim@cachyos.org>,
	Taylor Hewetson <taylor@exponent.digital>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: sanitize hid->uniq against non-printable
 bytes
Message-ID: <75a740e6-89af-4a2e-b3d9-9e0533c39ff3@rowland.harvard.edu>
References: <20260418025823.21767-1-taylor@exponent.digital>
 <2026041845-approve-pelvis-9845@gregkh>
 <81ef5ca0-b070-4afc-bda7-3e5a49677115@cachyos.org>
 <2026042330-underarm-reusable-effa@gregkh>
 <7312e4df-9eab-4678-bd40-ae7187a53827@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7312e4df-9eab-4678-bd40-ae7187a53827@suse.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36446-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MAILSPIKE_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 5E0A1453710
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:49:02AM +0200, Oliver Neukum wrote:
> 
> 
> On 23.04.26 11:29, Greg KH wrote:
> > On Thu, Apr 23, 2026 at 05:55:00AM +0000, Eric Naim wrote:
> > > On 4/18/26 3:14 PM, Greg KH wrote:
> 
> > > [1] https://github.com/systemd/systemd/issues/41339#issuecomment-4266429563
> > 
> > It's either up to the kernel, or every single userspace program that
> > reads the strings from a device.  Might as well do it in one place,
> > right?
> 
> No, because that puts the assumption that user space is not interested
> in what the device actually returns and uses these strings just
> for printing.
> Eg. you can no longer use this in a udev rule.

Also, the USB spec doesn't say anything about what characters are or 
aren't allowed in a string descriptor.  Anything, even a control 
character, is valid.  The kernel should not rule them and certainly 
shouldn't truncate a string descriptor.

Alan Stern

