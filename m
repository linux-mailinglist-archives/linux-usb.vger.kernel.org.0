Return-Path: <linux-usb+bounces-36422-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJe3E0bb6GnOQwIAu9opvQ
	(envelope-from <linux-usb+bounces-36422-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 16:29:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8351447402
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 16:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D14703040AB2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 14:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A493EC2EB;
	Wed, 22 Apr 2026 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zvd+ipeU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2830BF4F
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867879; cv=none; b=G6vnJ2u0bT9v/XM/qvYDQQlqETu4j5WZNuZDKRk8lk8xjJ/KgjgqneDnfuWLYxUHnIm5c1GWWFn1/bIBAP7rKQ6+dZ2lBux7d4HsIbtdXHxk+iJQ85vzhLOkg5IqBavo8ePJ8pRFfj+Y70ae4qKJ85CuGtW1cDL+XpNftr/Zo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867879; c=relaxed/simple;
	bh=Uxvd0KqwaXo0u2n8Yj1F6rTUdVtaeT+W3t/FWkIUrKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eN+t8s5GRu4NGz79IjUdY1OjeARXCy2jeoBgO/7cC8z5iN/jkExx9Pi0rZnRvvBlB9h1T2edtmJZ+rbip5cMEk1xdKrTHzsJ7o6asR4qXNhaPY6jCremAMGlzYW6udOzgJ66v4mU78857t7f5RvFJyisoDlKEOY8IXGSzqviE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zvd+ipeU; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d68f702851so614953085a.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776867877; x=1777472677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+YAjpkmeo8k9M81XAobtJXWA9yyNfkttkyDTeEyrG8=;
        b=Zvd+ipeUmXjjdtcDbUnUEBDRv6IugiIuB/B8wcqWswvDwpcPxdwy028RKeneC1TnJF
         Pogj0Pb/3ELqIh9ZeXZUYCsQlufmE6yQh8XZiNWiVhhCmmnZJg7fS9YneWr8erUvo2G+
         ZgFYl54OQ9hsVM+4MwN5JPsF8XjylwQnbISZDEaeqoyaziZdhU4s/UCadS0W8d07yFkJ
         vyYl2ZIZH/Hohxtp1G57KvW7JRUU1LxjtdKsAAG4qrdZyS5nnskjYdsRvGqSQg3QtYUg
         RlURglUovX1iksxmbSqw4uvVbqcmu4Th7ffDQHXv3Gc5V+UyVBMJDiZWaOEF4+2cE6Ae
         KtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867877; x=1777472677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+YAjpkmeo8k9M81XAobtJXWA9yyNfkttkyDTeEyrG8=;
        b=hvNGQ3ENeRu61qZtwnseAG6peV1VQI32d60fsLrxAKDXxLxTP77mxgN9ZqJFuBRaSY
         nkkrFzt33nR9XWcozIqHhD7J0jV4kdsfUNno0tlQAfKk1Ua21qxHOKw7Mz9ZzdLw9nLZ
         m6wQKyhBfV10HfDoWBZ3Aon1Rs5xTYUqjc4uTcFX7O+Y0GqDnsNbXhEm+kHRqH2txwT2
         v9+Vow9wyaIUA6V/5vtLW07adhXOWOcBJxL5F4puPX8cFhls4wZgDJ/lGp2JXP2tAryW
         InI3zYmkbDGk0XurH83+YGJXLzIDR4Mrgqli4Y6aqVUarDDtrMtGMq7Uc3hpy68qJSVR
         dkLQ==
X-Forwarded-Encrypted: i=1; AFNElJ89QYpp5K9PdB5uTYKvIGDe+7kd7SVYLjz9gn7K2qDX2FiJGt2qKTQWqFpW5KTPP7wcsBAQ4P+ljTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Z0oiZ6MHBybLD4u+BxKN7ikAe8vpq7cqjKuVxf11l86U/BfJ
	R/s1QNCoezkfFRMnI5Xcuef3SW0N/l91YwZPyry+0tNgkX0icRX2AoyuBAtoVxbPzA==
X-Gm-Gg: AeBDiesRyj5WdP/1LSbYw2EzWlfVByGgqNK8B5Rzftq+/th/SxGxK/h5pV2+bTUH8b0
	XRwBHap1fOSwifxPQctGskodUe68QfsMa/rRgpL6+8upb1/u9KffMQs3NkFztC7zMP6t3GapFvL
	N3oCcMvpNR2cpjCT1jL0EUXL6im/m0Es7HfBXNr4i86frL038mpMjG2LPVpOETTKHnsh2HVPkhi
	9SZCNjb4iErAahPMY1ipNFvdALGD5SO/VooQTP5dlJsy3I/JmUDnrl2YdOycOl6tgwkbaynr1eA
	iII1nhi6u2icjaLDvwPd2vc9uJPo29MxiMPyWEoXiLqAUSMOvok7uFKgbUcZJrOh7OAEhDglEa4
	LI2X7XAoi+pEWr3Jm2/UTTDIrAf+XjBcgtew7R+C11qBfumizf9ujJW1UnMPdJ52IFAB4DZv+1f
	JdfuYynLBBn9Zk/8U9B2FhT4LWy42PhiX/ZSocKpDu6HwLKQW1xuOS
X-Received: by 2002:a05:620a:40d6:b0:8ed:2b66:9eb2 with SMTP id af79cd13be357-8ed2b66a1f2mr1490304485a.15.1776867876500;
        Wed, 22 Apr 2026 07:24:36 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ee67115aeasm467576585a.44.2026.04.22.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 07:24:35 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:24:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
Message-ID: <9832a30a-ee4b-4e94-94d4-36bc1e658d9a@rowland.harvard.edu>
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
 <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
 <5ybgpy342zdtcudp3brizuxyisrv5zxsfegwawtaxyvlncnvcn@htqd6bnqdv5j>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ybgpy342zdtcudp3brizuxyisrv5zxsfegwawtaxyvlncnvcn@htqd6bnqdv5j>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36422-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8351447402
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 07:31:16PM +0800, Xu Yang wrote:
> On Tue, Apr 21, 2026 at 10:37:53AM -0400, Alan Stern wrote:
> > On Tue, Apr 21, 2026 at 04:20:50PM +0800, Xu Yang wrote:
> > > The device controller may update vbus status via usb_udc_vbus_handler(),
> > > which tries to connect the gadget even though gadget_bind_driver() has
> > > already called usb_udc_connect_control_locked(). This causes pullup() to
> > > be called twice. Avoid this by checking if gadget->connected is true.
> > 
> > This patch is wrong.  To see why, read the comments just below the end 
> > of the patch and see also usb_gadget_activate().
> 
> OK. So it breaks usb_gadget_activate() as usb_udc_connect_control_locked()
> return early.
> 
> I think usb_gadget_activate() needs to set gadget->connected as false before
> running usb_gadget_connect_locked() just like usb_gadget_deactivate() sets
> gadget->connected as true after running usb_gadget_disconnect_locked().
> 
> Then it will work correctly, do you agree?

Yes, that should take care of it.  Don't forget to update the patch 
description as well.

> > (Also, is there really anything wrong with calling pullup() twice in a 
> > row?)
> 
> It depends on the device controller driver. But currently only a few drivers
> call usb_udc_vbus_handler(), so I think the issue hasn't shown up.
> 
> When you look at the pullup() implementation of some UDC driver, you may see
> they do more complicated thing than just pulling the data line up. Such as
> cdnsp_gadget_pullup(), dwc3_gadget_pullup(), etc.
> 
> Therefore, I think the UDC core need to handle this well to avoid calling
> pullup() twice in a row.

Okay.

Alan Stern

