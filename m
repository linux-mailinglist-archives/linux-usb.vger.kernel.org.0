Return-Path: <linux-usb+bounces-35791-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHEnJYopzWnyaQYAu9opvQ
	(envelope-from <linux-usb+bounces-35791-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:19:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 354A437C07D
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 16:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04091301B4C0
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 14:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3EF451076;
	Wed,  1 Apr 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ADxPRo2N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D92D231836
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052927; cv=none; b=ARcxwMSG4RjfK3iJlDjCpJK2WIZYYp+9DEBUI2znOaEhbLBxGVInpldyYqQsCZ1skS/2Hjl+IteoVlN1XHTkrwjatPGlxe/rSwA1nqqO/+bQSzHIpCNErNfqDqmDyseSPfkYSnBY2HinEMv+TAsg3N1DQ0HZdFk+Jwt7VaiBZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052927; c=relaxed/simple;
	bh=mszmYtVvleSaxpldwPZNBt6rkwL1CKMAu+QGmgpdSq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqSgu5WbVhGbEFicMAP93sSXebrSi2icc1ExJ60uPaK8RblOmbyPC6eUnt305/uNGLPEEPVcZ8l0jrFVfcKA3jwU4lRdqyas1MbHUpinYXYibbq13x3W+8ccp0fStWjIUfb/03TMJOzoCM9HnuINf9kRzmZfya49PlReBNZPfA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ADxPRo2N; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a3342d301aso23118196d6.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775052926; x=1775657726; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnLZZpT8jzcsY2tFi1sSTrcknZ1bGmQItjkc1cXfbCQ=;
        b=ADxPRo2NKodM3OHhWL2WsUgsyLBwJ0OYEL+d8mzY83UwD9z+Kru7pj1EEf3BvMJ1FD
         0UsxMiYK3yQcWkkZKclvyVVTLNIsivVdioaQ70KAcVbrl4RO9OUxY65SgyAs12dTnfL5
         0ysktfiuNEsMkH3ifk/bP9AbP1YVr8G5WKUVbjvjYtXnT7F7x0rrMQhMMf9oKpfqxLaD
         nkn9xsnt7UGlunvkhSg4eF176r++anoHyqBE8zjRwQQn9Tlt+o6jlRrQqBoeentogZAg
         CkLKSXTh7knTLw2DmvD/syIBZ9xNk+oTuRPONkXutqIJcW/ScCO12tx9SV6LjT+maVg2
         6r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052926; x=1775657726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnLZZpT8jzcsY2tFi1sSTrcknZ1bGmQItjkc1cXfbCQ=;
        b=T8W5phlq1v1dskKer2H90oqsWpS/3c7RHqQDTwfGaPuv7d2tH1c7YIeUb//XxtcoX8
         5ZB5U5TnDdGR12MEFMS7nTWurmDpv1Ih1N3o9nDewrdwhJIOrUrLSArGZwGSzLvoEDSL
         An5TdvkmVQPu4zc7WB46T4SEQMfJrG7FtPKRgLz2Zlwp2vCOi3SECb1JyBRcJCWl+rN+
         3lJpX38C8B9frzsuPNtYU5i5UW6yAHQbKIlQ1iDoZMDeTHQAD0n6iJxoUd5rikH0DYtg
         LgSgytvbn+8rwbX8sYeFDNgK1jIrE2Fzh1Ta0LpQNqGtvoa9/eq3O2KeNtd8Xv7HNC28
         OFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU720su1NgN6sPD2yU5fALrzRUKEHT+TdOTnVupP1kjrgA0p2OF3gjilOudxumGkLNZSnynD5CYxuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIFDj95VHECrNMy88vs5BPZSZ5mgwanDQ3t16ceRyEp+RgRK1+
	FaYks3lACNaWmi8TbWd8mXM0GHakOyqdJOPPB4MgaGj3c00Wle5ndr+OGq8C6MUoxw==
X-Gm-Gg: ATEYQzyAEPPbL4sSM4RPCtDUOL44GuTj/qeb1TzPeFaiFZJRnjsYGDu+00Se4nnSSJx
	y4WPphcDsq2ZvR2EXatd4hi+Mdir3qQ9kHpE3kZn8Ltj96nTpL0s00cpTsyEd7nAfH0sdftqO1W
	2tMsI79syB6gltHgwwS1OXH9Z945I0quwyn9eWUrLk7dVrliq0XOD1TEhcKCWo+k+1PMSEalXiJ
	AvLUmmScflXJxGRzTrie++A0FJhU00WugzEEjsK+1ZX44XLnJUyGmtrmBvpdNWFk1XSjiJez+nr
	uRuI6L+OmJuH95qR5UCpZAJQ3Phka5ncoRTBm/WPAG5uNy/vBmA1JlFUi+4NeAkHWBMnCmMTSCd
	GJ5KZdPocEorllIAcNQrqp30Vzca9APK5SenDOi7WMBN3sVBavHYJlidIMzj5VbL5dYla8pLJPw
	xvdVLVmhgSMPVWRk6ikNhQodYyT6AIPzy/U+KVWgX2Dg==
X-Received: by 2002:a05:6214:498c:b0:89f:6757:aa6e with SMTP id 6a1803df08f44-8a439f8c37amr59602266d6.44.1775052925076;
        Wed, 01 Apr 2026 07:15:25 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cc439sm114067206d6.3.2026.04.01.07.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:15:24 -0700 (PDT)
Date: Wed, 1 Apr 2026 10:15:22 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Message-ID: <2c698031-a42b-4812-b8f5-cc8290306da1@rowland.harvard.edu>
References: <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
 <04f515ee-2213-4489-9734-d871e0d3d682@rowland.harvard.edu>
 <FRYP281MB2618D382481440BFDFAEB2FCEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <FRYP281MB2618D382481440BFDFAEB2FCEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35791-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid,td.next:url]
X-Rspamd-Queue-Id: 354A437C07D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 06:45:24AM +0000, Andreea.Popescu@aumovio.com wrote:
> On Tue, Mar 31, 2026 at 12:21:45PM +0000, Andreea.Popescu@aumovio.com wrote:
> >> When Linux runtime PM autosuspends a ChipIdea UDC that is still
> >> enumerated by the host, the driver gates the PHY clocks and marks
> >> the controller as suspended (ci->in_lpm = 1) but deliberately leaves
> >> gadget.speed unchanged so upper-layer gadget drivers do not see a
> >> spurious disconnect.
> >>
> >> The problem is that those same drivers may continue to call
> >> usb_ep_queue() during the autosuspend window.  _hardware_enqueue()
> >> silently adds the request to the endpoint queue and returns 0, but
> >> hw_ep_prime() cannot succeed with gated clocks, so the completion
> >> interrupt never fires.  The request — and its backing buffer — is
> >> permanently lost.  The caller sees a successful return and never
> >> frees the buffer.
> >Won't the request complete normally after the gadget is resumed, or
> >abnormally after a reset, disconnect, or shutdown?  Either way, it
> >wouldn't be lost permanently.
> >
> >Alan Stern
> Thank you very much for the review!
> On "complete normally after resume":
> This would be true only if the runtime-resume path reprimed the pending endpoints. It does not. ci_controller_resume() clears PORTSC_PHCD and ci->in_lpm, restoring the PHY, but it performs no endpoint repriming. The TD that was enqueued during the suspended window has its DMA node linked in hwep->qh.queue and the QH's td.next is written, but the OP_ENDPTPRIME write inside hw_ep_prime() was a no-op against gated clocks. After resume the controller has no knowledge of that TD — the ENDPTPRIME/ENDPTSTAT bits are clean — so it never processes it. The request is not picked up automatically.
> A subsequent request on the same endpoint would be appended to the existing TD chain via the "non-empty queue" branch of _hardware_enqueue(), which does not issue a fresh prime either; it relies on the hardware already being active on that endpoint. Since the first prime was lost, that chain never becomes active.

Okay.  Then surely the appropriate way to fix the problem is to change 
the runtime-resume path so that it _does_ reprime the pending endpoints.

Alan Stern

