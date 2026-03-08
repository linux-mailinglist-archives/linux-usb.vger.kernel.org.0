Return-Path: <linux-usb+bounces-34238-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I+XNPSgrWnp5AEAu9opvQ
	(envelope-from <linux-usb+bounces-34238-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 17:16:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E54D2310BC
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 17:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AFF40300D315
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45A7313E17;
	Sun,  8 Mar 2026 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wsCG/I9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483154739
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772986606; cv=none; b=hi46YSccFvEXXth3aYvH8yR1k4OkrU5S1AxUv12tuwtTPVCP4RWQhQVOFDUnW1DbzXKSiahixkriyxgBIKrcuZhHh0EOvbBn6IgMGxkOeIAZ7MtYcr/3cs3OmgTTeY0nvdjUvqf4dR8TsZUspHndlS6KjZiAu0L4vPxRiVzhapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772986606; c=relaxed/simple;
	bh=/nUK0TRJYMQ09AmMOIFmcQhbrJOCpgLyfN8UElFUDng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kvfaERvxWokF0dX6XWpSaAXuxzrf91AINcHdULumFZQcBYsqLfbKJLUbVYExPYCx+UJPV/N1xxjFY6OIL1mLXU/8BxR6IHntszK9CJWz3BDcJPvPR12DZO82nx+8x+frJ6M/fQT2oeXP3ukejSNO36fww1szq84/ov4xhMUw8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wsCG/I9S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739E2C116C6;
	Sun,  8 Mar 2026 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772986605;
	bh=/nUK0TRJYMQ09AmMOIFmcQhbrJOCpgLyfN8UElFUDng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wsCG/I9SoyixOEME1LmFu0yhtvkfbqT98BeOIXly+ZZmC4HRG/QcxTE9t6hEYBgl8
	 fpJC3wgmsI75SykB0bSijUkuxAKsLpBVFSdwANxJXRmNfQ+C9Jp2JH8KzIVdw2H8ol
	 wSFdKlr2bnQrVBHP8OW8utrH0JxSpdDQuhWo2oN0=
Date: Sun, 8 Mar 2026 17:16:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nils Reuter <nils.reuter@gmx.net>
Cc: linux-usb@vger.kernel.org
Subject: Re: [BUG] UAS protocol hangs on Realtek RTL9210B (0bda:9210,
 bcdDevice f0.01)
Message-ID: <2026030817-cupping-reason-0bb9@gregkh>
References: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <151d1ec4-275a-43d6-bc06-26e013695b7b@gmx.net>
X-Rspamd-Queue-Id: 2E54D2310BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-34238-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.net];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.012];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 03:10:54PM +0100, Nils Reuter wrote:
> Hello,
> 
> I would like to report a persistent UAS protocol issue with a Realtek
> RTL9210B based M.2 enclosure.
> 
> *Hardware Environment:*
> 
>  *
> 
>    Enclosure: Ugreen SKU 15813 (Model CM767)
> 
>  *
> 
>    Bridge Chip: Realtek RTL9210B (ID 0bda:9210, bcdDevice f0.01)
> 
>  *
> 
>    Drive: Transcend TS512GMTS430S (SATA M.2)
> 
>  *
> 
>    System: Debian / OpenMediaVault (Linux omv 6.18.12+deb13-amd64)
> 
>  *
> 
>    Kernel: 6.18.12-amd64
> 
> *Problem Description:* Under heavy I/O load (e.g., backup operations), the
> device experience UAS protocol hangs. The kernel log shows multiple
> |uas_eh_abort_handler| events, followed by SCSI read/write errors and a
> device reset (error -71). Eventually, the device is offlined or remounted as
> read-only.
> 
> SMART logs show incrementing UDMA CRC errors (Attribute 199) during these
> events, even though the hardware (cable/SSD) tests fine on other platforms.
> 
> *Logs:*
> 
> |[timestamp] sd 1:0:0:0: [sdb] tag#18 uas_eh_abort_handler 0 uas-tag 15
> inflight: CMD IN [timestamp] usb 2-1-port3: cannot reset (err = -71)
> [timestamp] sd 1:0:0:0: Device offlined - not ready after error recovery |
> 
> *Workaround:* The device works perfectly stable when UAS is disabled via
> usb-storage quirks: |options usb-storage quirks=0bda:9210:u|
> 
> *Request:* Please consider adding this device (0bda:9210 with bcdDevice
> f0.01) to the kernel's UAS quirks list to ensure out-of-the-box stability
> for other users.

Can you submit a patch that adds this quirk to the kernel so you get
credit for adding it?

thanks,

greg k-h

