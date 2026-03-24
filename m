Return-Path: <linux-usb+bounces-35380-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGk+EkNqwmlScwQAu9opvQ
	(envelope-from <linux-usb+bounces-35380-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:41:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE085306958
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 560D53034528
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7076338238F;
	Tue, 24 Mar 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R7BMxyAy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A7296BB6
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348864; cv=none; b=OvUphiOEGTrWNtU7TF6DUhI/UtPncubVtd/4gK0iEfuqZ3ko+l1Ev7JvYeedjvZqmjl1Fd+DJ1zGtMopGfx44dOpmIVWQSkWhuRGsurs0B8P1KhI9ufX4Uz1Hmd9xiyi1pO+KKr4zEdDplf+gv8wUMpFxGubAmj/BGuCHvVeCqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348864; c=relaxed/simple;
	bh=vu8Q6TPpDPN703roMr360klKnJeZHeHCPzq9IGeo4l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAEIihS9WZQHt46YBwkTpiEUyG8d8WHWfUf3PNk+5Rx9gCYoDzGBAsO7Qw01hhLORPLC4knLxvAbczcbKf0Gm1qZ55wHeZ/zXhwR+1Z431mH4PlbwrGTzKZDkpiERbjWlgPDgqs9uJ187r3ROdcEl2dkjhSBNzQ/hYNnEV1+nFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R7BMxyAy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E63BC19424;
	Tue, 24 Mar 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774348863;
	bh=vu8Q6TPpDPN703roMr360klKnJeZHeHCPzq9IGeo4l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7BMxyAyBpmKW8ZcBBgCiFbEm2XmbYairHP7o9gGVreUIGGTPfSN9AWqIUHCK8hKf
	 M69KjwnAbu7PEMoKMCUXhedSuq0W7tgWgT7JgwgNWdQTq9pFeH56e5H1VYoM16moUI
	 H50qv1TY+ePVnUChaD20XubyQ9YE7261+CpFBBQg=
Date: Tue, 24 Mar 2026 11:28:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Francois Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org
Subject: Re: Caldigit TS5+ problem with work in progress patch
Message-ID: <2026032456-washer-uncut-5caf@gregkh>
References: <7333738a-8364-42fa-b334-c4dc4b0ee503@scala.name>
 <2026032244-imprint-reverb-32d0@gregkh>
 <159947f9-e9a3-42e1-b728-842d60f3b3a3@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <159947f9-e9a3-42e1-b728-842d60f3b3a3@scala.name>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-35380-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,archlinux.org:url]
X-Rspamd-Queue-Id: DE085306958
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 11:00:15AM +0100, François Scala wrote:
> Hi Greg,
> 
> I've rebased my patch on the latest kernel version 7.0-rc5 and fixed the
> linting errors: https://gitlab.archlinux.org/fs75/linux-ts5plus/-/blob/v7.0-ts5plus-test/ts5-test.patch?ref_type=heads
> The change log of the patch:
> 
> usb: typec: Allow altmode to have multiple partners
> 
> Signed-off-by: François Scala <francois@scala.name>
> 
> Now, how can this been reviewed/tested ?

Again, read the document I pointed you at, you need to submit this as a
patch like any of the other thousands of patches that get submitted each
day :)

That document should guide you through the process, if you have any
specific questions about it, please let us know

thanks,

greg k-h

