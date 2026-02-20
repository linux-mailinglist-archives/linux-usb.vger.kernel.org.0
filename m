Return-Path: <linux-usb+bounces-33502-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jMWWCbgmmGlqBwMAu9opvQ
	(envelope-from <linux-usb+bounces-33502-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3759F16615F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 282EE301C922
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 09:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DCB31AA95;
	Fri, 20 Feb 2026 09:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Nv1b7de3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oagr0plG"
X-Original-To: linux-usb@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B6315D32
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 09:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579060; cv=none; b=ZPMTru11/KyXYy/ZcMbpSYPaSbBfi6IxyCakntt2eh1JfXZt6vD++bGYH/9otqKQX6Z9ZOy21t6dYOhFalbbHy617n4Mg9uo51yB2hOVlUe8gcJXsQUpKiZKcQAz20aV21lyppExrPn6jI+4Of03ESwr74/SELGWbkwNZxnsH+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579060; c=relaxed/simple;
	bh=BVT8fbv8BGs+YSrTQQT7SZCyGyE3P+sKaASzpvYyViQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj4s8ikse34yLGLE0c0l93dB/Ip0aEwNaaUZ0nVPNSKRhNjJ+g7jdQSdIEn1vAyp/0AsST+4+j2iYGGyRr5B/3o1pdWnj1NpsEvsHY/wUSZZsFguKyCovotuC4+zxIKEPBm9wrpIoKw9kCnxZiqTt5uMpC3ax8MfbPhPsKW9ywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Nv1b7de3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oagr0plG; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 9C51C1D0018A;
	Fri, 20 Feb 2026 04:17:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 20 Feb 2026 04:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1771579057; x=1771665457; bh=SBZ+9QvWcy
	5nXQvnpbzwJR2xCSBpYq3L+GnVMuCCDuQ=; b=Nv1b7de3K+V7d5aQWMFvfLTdnR
	cjOuU8FY84flO9ae5JKHHUaZbunjcyD3YlN1Aoyfnq1mOLrAHRZ2Lre5GkRFd0gb
	l9PIJup2Go6w54B8ap+t/uOF4YY06+v4AIk8OCBQof97aYRKfsgY42naDrpof4SU
	AxHP7+xUG7WdGV06LntM3iWYSZR8R13xMjMkkoyWeIHFS5Y5fZCLSTNhU+OVr06g
	4UdzTkCsERyY7AjzhCSAeWT1kB0UQ7I6tu3S0XIBZHSfNuk6QKuJuvta2jYp4oL/
	Ob/GnfRnhCK19Ol4MO7IpqOu+jU5pRC9Xtby8OC7yk7YpC1eO6cYg/vWPTkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771579057; x=1771665457; bh=SBZ+9QvWcy5nXQvnpbzwJR2xCSBpYq3L+Gn
	VMuCCDuQ=; b=oagr0plGV5p8WRe+D7fP7Ll9J0oH633xBcWcYq0BaoE3KRgK7xq
	n2jXIojin1v4Nrrcun0o+ijGqsGlq6SzRKvptn2mMh/I0b2iGAJITnbKg575m19A
	yF3fozHZJCuVuW5P3/hrUkjW2nYmOAkgNGFGMFnQz5Tqy8tJ8tXIC6IY7i2LPJ5m
	8fphHH4O8W426qpFBmGsg41uxBeCxtm6bQG45zfob89DVUDxZMw+LN5kjPfWxRYU
	VSABmo6TisUvzRYZCyAP/GPAmfP+xi06B62SvGIxQTAcGyRFS25QL+3ESDJfp2UH
	yUImAL2W9H21Bs0P6JILh/+MVBjt+qSvC6w==
X-ME-Sender: <xms:sSaYafYoH08TQtAYnhK4zEPh_4vkc-Zv02SOfSjifZpnaWvaq_K00Q>
    <xme:sSaYacOC-Z6ZdXjUkorIQ56FpEXlBgI0upbUj0_uKcBeV83ZZsP3rs4omqG-FfzJ4
    vFReoZWR_nOgBISTa3OvX-QJfSXPURACRa4DlBqaPERsKMhog>
X-ME-Received: <xmr:sSaYacYUvS6Fe8u1Kbwe8-YoZvprBJN-MTRvzZo4bwvUoQraadXMz1krJU5cqWtVGZoxuwwpgV9FiutgIlQw45WoOBOde0P3YKn8IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdektdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduieffvd
    dufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsuhhgiihilhhlrgdquggrvghmohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sSaYaS0KSvA2W55KTAaoBQ7zTWFV7AE8lyVoLpyNhjjNn42Ygh0lkQ>
    <xmx:sSaYaafWEcScIw6ooyOH7f6IFBMCNY2GdPCH-8F_OIV2_Uq_nsJbqA>
    <xmx:sSaYabFVk1EZbLyx6u5LA8aKTjMM13H29uc9x-C_owE3_6RvJfQCaA>
    <xmx:sSaYaT0V9zplJq0U5xYDPfSTycBydSCAZrQc_MqYqVkuy9t_t5h8Gg>
    <xmx:sSaYaQUHRzSd6a_le5G7fZmSe3mRpZ-Qm-kS1D0KQoElaGTAoXP_XJYj>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Feb 2026 04:17:36 -0500 (EST)
Date: Fri, 20 Feb 2026 10:17:34 +0100
From: Greg KH <greg@kroah.com>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Message-ID: <2026022000-culminate-budget-b57e@gregkh>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
 <bug-221103-208809-BCt16QfqPV@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-221103-208809-BCt16QfqPV@https.bugzilla.kernel.org/>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kroah.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kroah.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kroah.com:+,messagingengine.com:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33502-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[greg@kroah.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[unnservice.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kroah.com:dkim]
X-Rspamd-Queue-Id: 3759F16615F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 08:31:37AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221103
> 
> --- Comment #2 from Paul Alesius (paul@unnservice.com) ---
> Try this command: sudo ./usb_poll
> 
> It is definitely in USB.
> This program triggers the system freeze reliably.
> Many of us are affected, as referenced in the ADB bug.

Works just fine for me here, perhaps this is a bug in your USB device
(or hub) that can not handle USB config requests?


