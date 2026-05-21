Return-Path: <linux-usb+bounces-37863-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPj8HRbaDmrmCgYAu9opvQ
	(envelope-from <linux-usb+bounces-37863-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:10:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCED5A3004
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:10:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76E29304E4F2
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211A637F8DF;
	Thu, 21 May 2026 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="WuA/sfHV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1725136BCDA
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358117; cv=none; b=oi3MkUrVf8f6NcWURn5lxHWKoqZoDjVSlc7WTlQqJyJM/CdZ7z9v7QcGhK8lxZ/EQyM2JRWmSQBEnrUlg7k1WECDi3RkvblcKAt3BMEiioO3vQ9GFPfEnzKyXykZanyK2cc2PkrQ4He92d/DQQf/H9EVjBIWXsUVA3vdqJbpXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358117; c=relaxed/simple;
	bh=G70cugwSb+Xkn7pFvA7x1LwFYeQkc73WJRTRxnj7PuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRzFf4LKykXKiTkU+vbO3ovmA1qN0rrYpJgW9zrxCKw0nAUupwQ1lOiMosT+1UxVAXYTGsAmyy8N6ojFz7ExhKjlD1sVChcMbH81iHzYC9rGPZAKxLajwW38fEv5NF5eodfLHaaIb0ucL+nkmsQ1DZQnOn5X0zMJVsQd4gdLU1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=WuA/sfHV; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 21716 invoked from network); 21 May 2026 12:08:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1779358104; bh=v3+P+CYbvByaL3kIDKG5D7Oqv2PmmuAG1TMDfr//S6M=;
          h=From:To:Cc:Subject;
          b=WuA/sfHVjN2lmglkVNQjfhNd+susiXzwq4SHzGUl1nxJRXm49n16rSGsUSQUq6hnx
           BFMtecYe/AJDwXV9KCYEsQdZID1n6Ra6LaQBfm3nVcirFHBTmMNsUyohsMeLKGdBFZ
           zn2fgnNo23y6XgQ7CFlyQpa2UTGD42JrTfFSMzgBbC8TdOmVEcnadAWrnzAty7+Dke
           Lnibf/g+hxgUJj4dhw65lyzy0qEXHbJ1G3Owon+EDVIJbM/j3eWw4wgD00tlhL7Nch
           KsJ8EZblbuR256zhIizSqbUb8MvZPJSyNY6vPGni2iL+x0Cz6X6m2YrLCUqjUGMzRW
           ThPVq7kRpYmNw==
Received: from 77-236-5-199.static.play.pl (HELO localhost) (stf_xl@wp.pl@[77.236.5.199])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <mfo@igalia.com>; 21 May 2026 12:08:24 +0200
Date: Thu, 21 May 2026 12:08:23 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel-dev@igalia.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: atm: ueagle-atm: use dev_dbg() for 'device
 found' message
Message-ID: <20260521100823.GA38864@wp.pl>
References: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
 <20260520-ueagle-atm-cleanup-v1-1-010c8bc7b214@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-ueagle-atm-cleanup-v1-1-010c8bc7b214@igalia.com>
X-WP-MailID: 4b537c4515a481c8125d2e67d7c8fe01
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [EdOB]                               
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wp.pl,none];
	R_DKIM_ALLOW(-0.20)[wp.pl:s=20241105];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37863-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[free.fr,linuxfoundation.org,igalia.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[wp.pl];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stf_xl@wp.pl,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[wp.pl:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,wp.pl:email,wp.pl:mid,wp.pl:dkim,igalia.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: EDCED5A3004
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 07:32:50PM -0300, Mauricio Faria de Oliveira wrote:
> Convert dev_info() to dev_dbg().
> 
> Per 'Documentation/process/coding-style.rst':
> 
>   13) Printing kernel messages
> 
>   ...  When drivers are working properly they are quiet,
>   so prefer to use dev_dbg/pr_debug unless something is wrong.
> 
> While in there, correct the verb form and add 'with' for clarity.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Link: https://lore.kernel.org/all/2026051628-squatter-stature-c0e0@gregkh/
> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

> ---
>  drivers/usb/atm/ueagle-atm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
> index f3ae72feb5bfc313ccfa1ab6a9bb40fcd8f5800a..71559a934133a82ddb23d255e0f04d018c13c583 100644
> --- a/drivers/usb/atm/ueagle-atm.c
> +++ b/drivers/usb/atm/ueagle-atm.c
> @@ -2590,7 +2590,7 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
>  	int ret;
>  
>  	uea_enters(usb);
> -	uea_info(usb, "ADSL device founded vid (%#X) pid (%#X) Rev (%#X): %s\n",
> +	uea_dbg(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
>  		le16_to_cpu(usb->descriptor.idVendor),
>  		le16_to_cpu(usb->descriptor.idProduct),
>  		le16_to_cpu(usb->descriptor.bcdDevice),
> 
> -- 
> 2.51.0
> 

