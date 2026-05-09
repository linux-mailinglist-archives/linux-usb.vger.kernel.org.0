Return-Path: <linux-usb+bounces-37182-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDN1BVMu/2mT3AAAu9opvQ
	(envelope-from <linux-usb+bounces-37182-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 14:53:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20A4FFB3A
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 14:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 003433018740
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 12:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAE6383C6F;
	Sat,  9 May 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="einSO+Oo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F0246782;
	Sat,  9 May 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778331215; cv=none; b=a2P9AOBPZ2en8WhwqgmVEtmbv3f/CLs0+THLDO2ni8oMHRDJFXG9A0ai51+39CN6B632mUwI7ebDU4FYlkbESGxe1atPxKIa8wCbv1G0qrEzzOb29GNrqjkFn8HXvJVKHth9gXAxpNZhIKc/KZ6MQS4+cwsxyObtqHJEdgT1Nco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778331215; c=relaxed/simple;
	bh=86ICk8fw54DPgd94nqtiQGhB2I/taGncsTKIe8mdtH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC+IS4qCmPhQwSAVrATreC37EegkrzjFE8glev9AbpVVyrwnUscrTf+QyCOTrt7IFuXDd+5DeMNFfsOWaw89jZHR6JzI/cYQoZcTI9/P1XUJhbY4Akm2FewEw/fBIZcpc63z1KVkiK5PdaT8bgw/1c4JpMfmmMHkEM57m0rwIf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=einSO+Oo; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4E62B1F963;
	Sat,  9 May 2026 14:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1778330805;
	bh=vcZDAYqZuZvTd/H5R6a61erP18H6V558gIpcykPUuzU=;
	h=Received:Received:From:To:Subject;
	b=einSO+OoEJhoKr6r94Hm64J+0cWCC0G6elT2VMo/9g7jVQ5YzFuiycxugg/uGTNq5
	 7hNRXh98UZKOEr+aJ0jcApyVjnAHrZ2SOYhDVLvrzw0GUuEuLOzxTA0ISQEbaAlC97
	 KQ80wimnI088XkcvUdisYVQ6oh0cTfxfiqysnjCeAVf8yLUMcQIOQgxlPo+o9ylvEQ
	 KVQgb5EsSRn7QJKQm74pl50F3yrLLo0itdU+ouetM1Ev86EjCWBz9s38GwucCA/Yeo
	 EUhtHjtZODdAnXQK2JiNK51jZSAT1I2H0FywgzPPeUSAtAZ7KKYqkTUnICKrrZy68O
	 r+tcbIXRNdu3A==
Received: from livingston (unknown [192.168.42.11])
	by gaggiata.pivistrello.it (Postfix) with ESMTP id 046787F9D1;
	Sat, 09 May 2026 14:46:45 +0200 (CEST)
Received: from pivi by livingston with local (Exim 4.98.2)
	(envelope-from <francesco@dolcini.it>)
	id 1wLh4u-000000002l9-3poB;
	Sat, 09 May 2026 14:46:44 +0200
Date: Sat, 9 May 2026 14:46:44 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Franz Schnyder <fra.schnyder@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jun.li@nxp.com,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <af8stIGhzVMfhyIQ@livingston.pivistrello.it>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
X-Rspamd-Queue-Id: 0E20A4FFB3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37182-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,dolcini.it];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francesco@dolcini.it,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[dolcini.it:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,dolcini.it:dkim]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 06:04:49PM +0200, Franz Schnyder wrote:
> On Fri, May 08, 2026 at 06:54:40PM +0800, Xu Yang wrote:
> > It's strange that link->status is not DL_STATE_DORMANT or DL_STATE_NONE at
> > the time which means the device core may not properly unbind consumer devices
> > or handle something. The patch does a simple thing so the issue may not come
> > from the patch itself.
> > 
> > 1639:	list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_node) {
> > 1640:		WARN_ON(link->status != DL_STATE_DORMANT &&
> > 1641:			link->status != DL_STATE_NONE);
> > 1642:		__device_link_del(&link->kref);
> > 1643:	}
> > 
> > Which kernel and dtb are you using? If it's a downstream repo, how do the USB
> > controller and related DTS nodes look like?
> 
> I was using kernel version 7.1-rc2 and noticed it while working on 
> sending the Aquila iMX95 upstream.
> https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-2-69c8ee1c5413@toradex.com/
> > 
> > Does the issue easily happen? Does dwc3_imx8mp_probe() eventually succeed?
> 
> I did various boot attempts with the commit reverted and couldn't 
> reproduce the issue. With the commit I ran into the issue in about one 
> third of all boot attempts. So most of the time dwc3_imx8mp_prove 
> actually succeeds.

...

> > Yes, if you use the new driver, I think this issue won't happen at all.
> > 
> So once your work is merged in the imx95.dtsi we should be fine.

To me it looks like a regression that should be taken care of.

Maybe not relevant for aquila imx95, where you did reproduce it (the reason is
that aquila imx95 is not in mainline, yet), but from the USB point of view this
board is very similar to other boards using the i.MX95 SoC that are therefore
likely affected.

Francesco


