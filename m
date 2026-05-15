Return-Path: <linux-usb+bounces-37455-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MC+4BuepBmq8mAIAu9opvQ
	(envelope-from <linux-usb+bounces-37455-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:06:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43E549663
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 07:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53E7330779C4
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 05:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900243DE45A;
	Fri, 15 May 2026 05:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VeK8P9KQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12681357CE4;
	Fri, 15 May 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821504; cv=none; b=O4vIqD7M2WCXAkbJ1pbAez7+HLQtBomiFbe8s46kCktmw4qm4daY4ybFAAMKgQkTYbK5CN4N2gXvQTNEKk1IAeJrgwCZyMTRWE7HyKyjDCzuCIDNrpM5BmUi+y6zbpLg+gp2Rv01uOOZ+VAp9xLcZ8lB84wYb0A9QQ6HQ3VRZNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821504; c=relaxed/simple;
	bh=BPHwYXFKzew4WRctZUguy9DWMMZjyVHKa9O6MGG45Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDp8OhYpFjM3s03+3DLZXA5d+Kkas7kmlBbhN67zL1ocGaeMW6BnCnsdlv8sfdk7DbB9pQ5ZTZREkRWwWaWtLmuPal8vGZ7yW7IIi/0J9a2Ib/i0nXoh4+1UyFwpOKA9l+aOERUVy42n1S2JYT/yFj+l+kfITGJAXJtnSHvxBgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VeK8P9KQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBE9C2BCB8;
	Fri, 15 May 2026 05:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778821503;
	bh=BPHwYXFKzew4WRctZUguy9DWMMZjyVHKa9O6MGG45Sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VeK8P9KQihYA3N+ZmEZ3lgEPy2O8x5YrJLxp3qmgYY1gvhYViYXDtpxfjXXT/Cld9
	 j0ji/FwOgF6JlKJ4jYy9H36Gvm9JOWT3AURowQ424T/Co9QTKxXmZgIOK8++7fdd3O
	 LPSwsoDpt1ogUv2x20yP8WXnInF0MRDigEriAlH0=
Date: Fri, 15 May 2026 07:05:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH 5/8] usb: typec: tcpm: validate VDO count before reading
 Attention status VDO
Message-ID: <2026051545-compress-flinch-da7f@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051350-stimulus-cornflake-d7ae@gregkh>
 <CAPTae5JNa=LxRr_FPcgsVP9CkWRy6Sa8mFiTTsCHppQkqQodBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5JNa=LxRr_FPcgsVP9CkWRy6Sa8mFiTTsCHppQkqQodBw@mail.gmail.com>
X-Rspamd-Queue-Id: 6C43E549663
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37455-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 02:55:31PM -0700, Badhri Jagan Sridharan wrote:
> On Wed, May 13, 2026 at 8:53 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > A broken/malicious device can send the incorrect count for an attention
> > status VDO, which will cause the kernel to read uninitialized stack data
> > and send it off elsewhere.
> >
> > Fix this up by correctly verifying the count for the attention object.
> >
> > Assisted-by: gkh_clanker_t1000
> > Cc: Badhri Jagan Sridharan <badhri@google.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: stable <stable@kernel.org>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 44dab6c32c33..2cab74ed71a7 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -2639,6 +2639,8 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
> >                         }
> >                         break;
> >                 case ADEV_ATTENTION:
> > +                       if (cnt < 2)
> > +                               break;
> >                         if (typec_altmode_attention(adev, p[1]))
> >                                 tcpm_log(port, "typec_altmode_attention no port partner altmode");
> >                         break;
> > --
> 
> Hi Greg,
> 
> While the `cnt` check helps fix this specific case, I do see multiple
> other instances in the same function where the validity of p[0] and
> p[1] seems to be assumed (for instance calls to
> typec_altmode_vdm(adev, p[0], &p[1], cnt)). To make the patch more
> complete and robust, shouldn't p also be initialized to 0? This will
> prevent leaking uninitialized stack data in those instances too.

Good point, we should be checking this for all of these, not just this
one instance.  I'll fix this up and do a new version, thanks.

greg k-h

