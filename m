Return-Path: <linux-usb+bounces-35669-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPTZJn97ymnk9AUAu9opvQ
	(envelope-from <linux-usb+bounces-35669-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:32:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA535C04B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C283067775
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED83D3480;
	Mon, 30 Mar 2026 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OXIOSW06"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5ED3CD8BB
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 13:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876636; cv=none; b=U0Idkn2Iqz3i1gBRwxsTyNDYBuSJ8Mf3/1rtDgfg1/Nx394w6Z114m9VihGPuiRPZjNDzWI6aUfPmYscZTu9QNAwJ7JZrAn1mwn/ceKrx4y8luazNfhc2K0PFzFeHessb+yXEG9Ps29+7JrqsbzhLJQXOcAtf/HyfNFbZWhkXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876636; c=relaxed/simple;
	bh=IQHKQYFZqL1pMZne2bQJgRj65z6QMcmVbxUEFWGyHJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw+HgI2rWNZkAMKQn6HKzjSsiW79mwdKpANlZzIicEv/zSXPjSO5ETmHbtxp6m/xhQI5B9cvHb6MsbjYo04ol15yRS0QcIF+JiMKEzRgrTBJ/KPAIDIxzRSVHc+9aWaVc496684fz1i8S9P2xvBrkmnVsjhwGc3tdjN2/7wjhR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OXIOSW06; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7221C4CEF7;
	Mon, 30 Mar 2026 13:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774876635;
	bh=IQHKQYFZqL1pMZne2bQJgRj65z6QMcmVbxUEFWGyHJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXIOSW06C93H51yoDqpYHXCDEYMOGGXggP/xLDrx85J3JhpnhUAn4zMWTurqxN26c
	 5szznBxnRRiYFaprctl2lP5N2XBixkoDle0fXGaVtPrbdWh6eZtZC//GysSbXXv9ZJ
	 vV3100B7JcJPzbnh+xUetaH8jTOSlw3NKOJVoPLY=
Date: Mon, 30 Mar 2026 15:17:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pooja Katiyar <pooja.katiyar@intel.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
	dmitry.baryshkov@oss.qualcomm.com, johan@kernel.org,
	asutosh.pathak@intel.com
Subject: Re: [PATCH 0/3] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <2026033001-commodore-zap-29cf@gregkh>
References: <cover.1773090896.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773090896.git.pooja.katiyar@intel.com>
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
	TAGGED_FROM(0.00)[bounces-35669-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 1ABA535C04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:25:28PM -0700, Pooja Katiyar wrote:
> This series implements support for UCSI SET PDOS command. It provides
> interface to send message out data and update source or sink
> capabilities PDOs on a connector over debugfs interface.
> 
> Pooja Katiyar (3):
>   usb: typec: ucsi: Add support for message_out data structure
>   usb: typec: ucsi: Enable debugfs for message_out data structure
>   usb: typec: ucsi: Add support for SET_PDOS command
> 
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c   |  6 ++-
>  drivers/usb/typec/ucsi/debugfs.c        | 31 +++++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c           | 52 ++++++++++++++++++++-----
>  drivers/usb/typec/ucsi/ucsi.h           | 20 +++++++++-
>  drivers/usb/typec/ucsi/ucsi_acpi.c      | 22 ++++++++++-
>  drivers/usb/typec/ucsi/ucsi_ccg.c       |  6 ++-
>  drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  6 ++-
>  7 files changed, 123 insertions(+), 20 deletions(-)
> 
> -- 
> 2.43.0
> 
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

