Return-Path: <linux-usb+bounces-37567-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LUheACmeCmpJ4QQAu9opvQ
	(envelope-from <linux-usb+bounces-37567-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:05:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76212565D64
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38E4230036C1
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 05:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B89E38758D;
	Mon, 18 May 2026 05:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g/jURWrx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F574380FCA;
	Mon, 18 May 2026 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080736; cv=none; b=Blb9XhJN+fdxmfy6u+xab6N3zH+1JR8JN1Hg2s0ne02KllsOkw8BmeIV3jmLMHjyQ9sCSwPXVi0T7+v17amUt2cDOvCObufbMqgN0PJgM1iHXS4EUFiyZCUnetDym9Uq798AXXOkt3y6nL4dfDPkEhsDJz6q7ynydoKreGer7v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080736; c=relaxed/simple;
	bh=62iI2IRVQHJ8XyYoKYGriiXwkIua2vc+u9Nkm2Ijpfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqDSTyPqlbQAcxto5kt82y5CxOY6K7KCvNgQXBtRO3XeO3lVWXnXEmsV0ydO0rNKjrMRABv56gBUQtT+lZRbCy3M0+1igcQljTtV9VmE4SrJSmUagUkk+WPLXkonR5nPOE4foCeDEni6jPHSX985A1o5gutJi14FmOXPeMN+keE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g/jURWrx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43FFC2BCB7;
	Mon, 18 May 2026 05:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779080736;
	bh=62iI2IRVQHJ8XyYoKYGriiXwkIua2vc+u9Nkm2Ijpfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/jURWrxkHg9MvUkB6kVaPdA2INo6xdhWX0J+MNBc1tpl+bD7K4WK36aHKlliijK3
	 nWz/Ojus8DD4/A0fvxyJHSOZ4p2N+F5Kgi5dp+iARXBf/DAPftiew9Fosy1mtReqCU
	 x9VH4mD2iyyEX22c7WSFWmnuc8+lMQUY7zmklZgI=
Date: Mon, 18 May 2026 07:05:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jack Wu <jackbb_wu@compal.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: qcserial: add new usb-id for Dell
 Wireless DW5826e-m
Message-ID: <2026051822-throbbing-dried-b5a0@gregkh>
References: <20260518015418.327252-1-jackbb_wu@compal.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518015418.327252-1-jackbb_wu@compal.com>
X-Rspamd-Queue-Id: 76212565D64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37567-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 09:54:18AM +0800, Jack Wu wrote:
> ================================================================================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc. If you are not the intended recipient of this message, please notify the sender and destroy/delete the message. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information, by persons or entities other than the intended recipient is prohibited.
> ================================================================================================================================================================

Now deleted.

