Return-Path: <linux-usb+bounces-32811-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPx+FhTLeGmNtQEAu9opvQ
	(envelope-from <linux-usb+bounces-32811-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:26:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A779599E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 15:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F09F308690A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 14:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B356357A26;
	Tue, 27 Jan 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bj1Di1J7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8436F29CB52;
	Tue, 27 Jan 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523673; cv=none; b=SxfgvV3uPandO+6hHXQvaCzVYLHmYJk8h0jo3Y5UFRYB76Dg6lhbkg+HgACtD1dOMiNVDUbR+sqJwh7ibNQ+NTSQQVeP30O3kd6qejJrJ55vxxIibzuyDJPrmDa/Yn12ZglxQG+NeT9L1DA2gELvdC6h+0akUcO33fXAUBXgzW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523673; c=relaxed/simple;
	bh=wBeGSjwY8U0HhnZh/gML77jeYXE+uMuupIvLoDqkjjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igCdb5nKdoaIdT65xX6UTe1T3glac0RH3dUtojvgRwCpblvD8RiG4qGRYwbJLHQ0XtTBBVCQ4p9FNABbQ4MGaRROKIAHx/0CD4i1/jHqQzTqaQzcmTOJ2HLx3LUFjH7PdAeI3MnYVue5v0xeVMokLdcWI1T3W7AfvVYv7+mk2FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bj1Di1J7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9628C116C6;
	Tue, 27 Jan 2026 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769523673;
	bh=wBeGSjwY8U0HhnZh/gML77jeYXE+uMuupIvLoDqkjjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bj1Di1J7auP2frDfyvDpEAlI8IpaRNgW4TuVLc6327snNcs7KYz71Z7U0qb+WFJx3
	 eEvDwPDnNPBiMEjz186PeD3sXa0Q6i8uS8RiacMNMcjH5MwaAnw2IKeNMHxRh+ynjW
	 YxolZ5Mp1/gK/iAHIRYo9FwQXq1tWVoSzia141Qk=
Date: Tue, 27 Jan 2026 15:21:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <J.Remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH] usb: typec: hd3ss3220: Check if regulator needs to be
 switched
Message-ID: <2026012754-trump-coziness-cda1@gregkh>
References: <20260126-wip-jremmet-hd3ss3220_vbus_split-v1-1-b2f946f1a4ae@phytec.de>
 <aXd7EN9KAmtEHODq@kuha>
 <1c36ebc4-9a37-4e88-a39f-e6472c0df11b@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c36ebc4-9a37-4e88-a39f-e6472c0df11b@phytec.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32811-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: A5A779599E
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 03:22:01PM +0000, Jan Remmet wrote:
> Am 26.01.26 um 15:32 schrieb Heikki Krogerus:
> > Mon, Jan 26, 2026 at 01:06:36PM +0100, Jan Remmet kirjoitti:
> >> Check regulator state as peripheral and detach can disable vbus.
> >> Without this check we will try to disable the regulator twice if
> >> we disconnect host and then connect as device.
> >>
> >> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> >> ---
> >> This is a fixup from
> >> - Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
> >> To
> >> - Link to v2: https://lore.kernel.org/r/20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de
> > 
> > I don't understand that, but I think you are fixing a commit in Greg's
> > tree, right?
> Yes
> > 
> > If that's the case, then you need the Fixes tag.
> 
> Sorry, I'm not familar with the workflow here. Should it be a "--fixup" 
> git commit against the usb-next commit id?
> 
> Or
> Fixes: 7e7025811579 ("usb: typec: hd3ss3220: Check if regulator needs to 
> be switched")
> 
> In the commit message (again with commit sha from Greg's usb-next

This one, Fixes: is the correct way to do it.

thanks,

greg k-h

