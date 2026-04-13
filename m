Return-Path: <linux-usb+bounces-36196-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDENOVXN3GmcWQkAu9opvQ
	(envelope-from <linux-usb+bounces-36196-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:02:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C03EB0B7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 13:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 584B73013FD1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 10:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13363BD226;
	Mon, 13 Apr 2026 10:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bn845dOv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917D318EE7;
	Mon, 13 Apr 2026 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077872; cv=none; b=kzEHKpKt4jzwV8i9u15e2gxOgDNnMyKJAaWlbM72cSiy5hZV6NG85QMEU1BElWjONOqqK+qg1v3WW8HZq9F+Cm1M9w3vLKayboMMxOB06ROUJqX3gB2yH1bvlEcPLqO9wJlsAOcM/Ex0t3tx6aP3393CrtQbnPWPXFVz6UY0ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077872; c=relaxed/simple;
	bh=rEMbzudmsD/Ya1O80dV5iRsZi+MxAj/TxZXg3yTLXlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi8bej9UxigkMBnneOR3YAz/IWpQvw+T790EuiPCJ5paSaVJEF5yKFeek8FKWsI7fzlsMz6XDblLKwukQWf2fGMZnKdQK4GjpOM7PHuD4faMku0VgK1zHPS5yH8Fgjr2UHzQ0mtiSdkGRbauk4E9Tbg7iJ7AgDSRJxZPiBsI8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bn845dOv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A54C116C6;
	Mon, 13 Apr 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776077871;
	bh=rEMbzudmsD/Ya1O80dV5iRsZi+MxAj/TxZXg3yTLXlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bn845dOvssdgWYOQcLe4tR0YlF03pQvtFLF4zl9wYL9luEriRkZKW9a9IBSgQ8KF5
	 D/7mUGIFVbG7oTR0s207eM21SA8wJ4eEvwe8niCwVoOHdXqxHieRW1Sc9NFuTzm6Oq
	 OL5T43yiaOOymd/IK9L1KoapTK2P5oyRBRqeU1Ns=
Date: Mon, 13 Apr 2026 12:57:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Gil Fine <gil.fine@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
Message-ID: <2026041338-family-sprung-f69c@gregkh>
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36196-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,intel.com,linux.intel.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: E81C03EB0B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Linux TBT subsystem supports hardware aligned with the latest
> USB4 v2.0 specification. In some places though, it assumes registers
> only defined in that specification version (previously marked as
> Reserved) are always accessible.
> 
> Every version of the spec states:
> 
> """
> Unless specified otherwise, the Connection Manager shall not write a
> register with a value that is marked as “Rsvd”. Writing a register with
> a value that is marked as “Rsvd” results in undefined behavior.
> """
> 
> The effective list of SB registers that need this guarding currently
> exclusively contains ones that aren't used outside the debugfs dump
> logic, so just add the required checks there.
> 
> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
>  drivers/thunderbolt/tb.h      |  2 ++
>  4 files changed, 30 insertions(+), 14 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

