Return-Path: <linux-usb+bounces-32709-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGkSMNQud2lVdAEAu9opvQ
	(envelope-from <linux-usb+bounces-32709-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:07:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446C85CA4
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E124301950B
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 09:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D8ED3033F0;
	Mon, 26 Jan 2026 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OXlRWAcZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5D4275AF5;
	Mon, 26 Jan 2026 09:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769418333; cv=none; b=nFqMG1OO9wbALUhC0FDG73QuHBFGa+hhzCX/Sa6E/HY86Esrh4R9Co/dm24Qu/5pr/l5SUO+FqCluiFtnLVfN8BI9wqJDKWN6JQ5i+pwg/17OP7Wm44lpn8fYwXRpptr1SFUFxWwvXKySHGI5Ajf44xTn6wYAilR48YT8DvUKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769418333; c=relaxed/simple;
	bh=VHz9W0fjyHimdzVhxxvXRGwkw4JsNNyhLomtkY3aMuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItDoMCPmqCU0GAeK/WrmbACb6+jqiV+RthSWRDi7dRYrVmWe72JnBruggxBZGpnTtA5qdkMDJ73uVkfmK4EbDyQ3p9gP172u5j2qr32sS/rbrhQPH+cvCtfBKz0io9QM+c8LTg5VJl02aBZe7n6y193itRQ2farjH1d5yknOUsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OXlRWAcZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE133C116C6;
	Mon, 26 Jan 2026 09:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769418333;
	bh=VHz9W0fjyHimdzVhxxvXRGwkw4JsNNyhLomtkY3aMuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXlRWAcZ4DeZvqVc7opRcEEKlXvtG8DI7EZAsWq8hLXi3Exz5V+GGQLA+fnVUMVaR
	 mCI13cKNC3Rl4e1zKGNDQNtVkayKK1ZzG09UeypvJVQ/AvCMnMlWPdhZcvW8Qxy192
	 X52IuhKkl/IoBn7HIh2PX5npWbbv63NL03jWNaf4=
Date: Mon, 26 Jan 2026 10:05:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <J.Remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Message-ID: <2026012641-material-guiding-444d@gregkh>
References: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
 <2026012343-rockfish-candle-d3d9@gregkh>
 <4d1e6908-daa2-4322-8c00-055b4c1022bc@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d1e6908-daa2-4322-8c00-055b4c1022bc@phytec.de>
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
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32709-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 6446C85CA4
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 08:04:58AM +0000, Jan Remmet wrote:
> Am 23.01.26 um 17:19 schrieb Greg Kroah-Hartman:
> > Does not apply against my tree, what did you make it against?  Can you
> > redo this against linux-next and resend?
> 
> This is strange. I created it against 944aacb68baf (something after 
> v6.19-rc5). I can cleanly rebase it to next-20260123 without changes.
> Do I miss something?

Probably other changes to this file since then?  linux-next will include
the USB development tree that has the work of everyone else in it that
will go into the next release.

Try rebasing and see what happens :)

thanks,

greg k-h

