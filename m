Return-Path: <linux-usb+bounces-32656-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFcdGDmhc2lqxgAAu9opvQ
	(envelope-from <linux-usb+bounces-32656-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:26:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F1787AD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 65B5330239F8
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283C23093A8;
	Fri, 23 Jan 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="u6Flo2SG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4941023EA90
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185115; cv=none; b=EZZEzwa9Hoy8M3d51P4m/5VGgxqQy1cibfoBlW0pT+WrM1Bzp0tizHocC24Mmn2sQ8zvnUXZtRW0IY4W5GgJTJe73gsZOU20bniuyEUFIyQhQaAfxzum3f8wa74EVuqmyOJISKV2ptWFTkIDcXyCEJ//3v5ZuWAcN7xV94pPGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185115; c=relaxed/simple;
	bh=huo0Yu0tsEJnGrM1qzNHmJySlhygwCQco6YbEKEORbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb6jzLLkQpWHs1h5/zAFu+xSwQlzgLctb7BnOEmbbUeTuYhDKGxsVU9Y1qG7gvVhh7k6bTT6fgkYtBe4fQbj6gM/0MZ1R1t6Aa1qUvzeybJvra6z8ARD0Wxf3+d8/9kIjR34+nSe+0m2atewlGVTXlqMcAgy4Es8zZ4a9PLCVY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=u6Flo2SG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5013c912f9fso29047081cf.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 08:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1769185113; x=1769789913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiPAFGlFPGblB/lTNkohFdNxzz3SNrUSE7rNHT1X+g8=;
        b=u6Flo2SGj913k6+AWDSTTN6SOyP78boznWo0FFbZdKnuBag+7/U0rpZHrxHCo4N9as
         H7wlzVqdXi5J7L9Tf+Fds11jM1TCq+UCfInLjN2a1x2TEbpehOBdS+nADuk10+43QaCS
         nbmGImlFLu22SPzY54YbEm0DzHxro2CVFkIwKUPRe2K1Z72jXZNoh0FDqsajDYu3V0ib
         WYLomx2Mv5Dh30T86+mqJdQMz0vYObPQJK1q0FmMwGq92Za52qdPXTAOW6AfYlHRsvAB
         JYO8mNDi1JHheq1OmZU5PfUM2hIPuilDx0gAcf4gz2x94oaCzXILcT9mt8ob9Hc+10+1
         s8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185113; x=1769789913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiPAFGlFPGblB/lTNkohFdNxzz3SNrUSE7rNHT1X+g8=;
        b=SHk4lH+k0lRR4GDSvXtIa1Ddk8G0dmsFoxK98PN0WoIP9y1ZTPBNloctzfRaOE0tEF
         EYapAPSE8Ta7rXZFspRsMb/lpTtDwCA6ism9roFXpMDjavwlYCi8ohZG2YqmC3ux9xDV
         pb2r3Qq1lzQCsOC6UcoC6SygiuVz2hv0gRsynidUv2qwzBSM6A2fEZECFbpOwVeExKVI
         K9ErypX/1kX0iA4lOIa3DOhPHobTSJ+U0rTkmIns2HVRI0LH/iKHffTkzKi+Is0NzdFu
         oa5leZLvb7BJs4HokGKCKY1lJZgN3rdrCHklBYEvYa41ETXZvUejDeXAGYJpP8zXsr7o
         12SQ==
X-Forwarded-Encrypted: i=1; AJvYcCURgpGxrDLCF/QOQqt7bjRyhElaHKh3d0gUY4y8L2BMxQWtWC7aG7rvwVxYBVWHviu63wtpx6kskDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JXy2SPeaU09zo0K/IjFxXlxoe0uMi78ul5leammqj2vHrfL/
	JiDiEfPTz3ldx/+dDrlhseWDhiNQ5PRWMG3BkmsfHff12Pto9WqQtwWqLcOzdMhoqg==
X-Gm-Gg: AZuq6aK0EfH1inTt7RUJ5+8PvaOdVYI6TKbOBjagPfF1B7QKH8wQqTFVK7LLDdvGKu4
	b/fPN1NTARggmxXOzO7YJx0FBVtBsb2ZECgDQRFszyEdAcwzpaoc/OnvXgEIm1WIP/5F3vbuRfw
	bOJ9k29jZ6AUwDN/tqNbtIf9K1UN4+rV3uS/8QG50ddZ2J297ETw3r/wUaSA0ahgsJxpLUDviDZ
	UJBLD3TqX6wOvAlEF9TyDCit8NqLzpM5sTBl1W+qNtyfQuDX70WsBCUOfMqfqVl0X7vyH0rVHWl
	YfqKWuKK35z1zysYdaIAj2UGCbzLbmYOj8BXkaidIzW5HGXZkzU2BiZgx0pHh1nrJpf3P838Jbo
	OGMlyRYNOfNFUaaoaLGs/0rii0SmVvUyDq2JZ2wYyiWang1P2GrOip8NczDXfmiOFcKXUgUeCuR
	XL5/XOqS/rsBAz
X-Received: by 2002:a05:622a:199c:b0:4f5:3249:a758 with SMTP id d75a77b69052e-502f7724d6dmr48135341cf.2.1769185113308;
        Fri, 23 Jan 2026 08:18:33 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7dcb])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f9c7d3sm17919481cf.34.2026.01.23.08.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:18:32 -0800 (PST)
Date: Fri, 23 Jan 2026 11:18:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: gadget: Add a prefix to log messages
Message-ID: <04929f5f-8760-45f1-999a-c48e8dea6876@rowland.harvard.edu>
References: <20260123142221.14285-1-jszhang@kernel.org>
 <2026012339-landmine-risk-5c9c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026012339-landmine-risk-5c9c@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32656-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 494F1787AD
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:52:11PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 23, 2026 at 10:22:18PM +0800, Jisheng Zhang wrote:
> > I met some log as below:
> > [  581.262476] read descriptors
> > [  581.265558] bcdVersion must be 0x0100, stored in Little Endian order...
> > 
> > To be honest, if I'm not familiar with the usb gadget framework, I dunno
> > which component is complaining. Add a prefix to log messages, so the
> > above messages will be look as below:
> > 
> > [  581.262476] usb_f_fs: read descriptors
> > [  581.265558] usb_f_fs: bcdVersion must be 0x0100, stored in Little Endian order...
> > 
> > Then solve similar issues for f_mass_storage and f_tcm.
> 
> These should all be using the dev_info() and like calls, not pr_*(), and
> if that happens, then you will get the correct prefix.  Can you make
> that change instead?

Unfortunately, the composite gadget driver doesn't create sub-devices of 
the gadget for the various function drivers to bind to.  The only device 
available is the gadget itself, and its driver's name is just 
"composite".  Therefore dev_info() and others will not show the 
particular function driver, which is what Jisheng wants to see.

Also, some of the calls affected by these changes occur at module 
initialization time, before anything has been bound.  They don't yet 
have any device to refer to.

Alan Stern

