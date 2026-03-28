Return-Path: <linux-usb+bounces-35618-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ev/nAZtGyGl+jQUAu9opvQ
	(envelope-from <linux-usb+bounces-35618-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 22:22:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311E34FFD0
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 22:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9735E30063B0
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2026 21:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF01136492F;
	Sat, 28 Mar 2026 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLi9RVUr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B68E33F5AF
	for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 21:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774732949; cv=none; b=Rg2N0OqUWruVNkTUjXyl4g2md0zlkhT7cUHiKuSGmgISOXkddGqTtyF6SW11fUdD/PiqHciBk35yMyuJtoUsA+/AMZVIA7lo0GSBSZ5qszcjrwy0Yzh2pmftXK/yVYJ3BidzEoRpZB+kizaZSI4YEAx9OXz/wFwExmYskJyp+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774732949; c=relaxed/simple;
	bh=R0hkqY29co8MKnie0sq6siQ7Kf3egWqvjoGDjqu0+8k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ugKsVcpKKSjhlKjqAsv1c33gw/RasmlEZrwPQCekODWtxyplLpYQUI1wNKuDtxRzW6mViXhsRyy19LoCTlfC7z626GiczZ3H1FKeIKphboBG8O0e/rsHhcQL5TotF1XaQXp8kkzys66yFEtsvym79OoPrADDdi1QQHx6ZN9htFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLi9RVUr; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b976536806cso440598766b.0
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2026 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774732946; x=1775337746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjOBTaIyp3A6iO0bqUaE76OnW1EFhxGZozoi6eNR6QY=;
        b=QLi9RVUrdH4+LdlyUhRw3dnjwVC6gzgCLhBxbmpRvq8luSsx2yL0CKmLc1AeznktDo
         8pnI/x69M+TKBDhdG6VrGS+go1CzO9H65z7KgQFfjU7Q1RhRz20giCL/I6+q20a6YbA+
         CcM28r0SuCoMubMtpeesg93tqKSlyj1MHVBSypcgwVRbbiVyNDJdP/zB8sD4Ek4ONEZc
         sjn/d54fhCsPCbmPJRQTjllCw+l2SXMvLITfK1VEINaXG+/N3xph5L98Dof5Qee7PVms
         FW86S2gR72VfMdkK2Mth//65FDA0YnaCCKic9i9CX1d7ZhHIJIfylLZehZtfvu8Mksgi
         63nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774732946; x=1775337746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjOBTaIyp3A6iO0bqUaE76OnW1EFhxGZozoi6eNR6QY=;
        b=H4Lu9pmvbniQsys56WGBsCwVr00b61jkKBG7LUOLHwRezJCJAOingbet0znumSKRyQ
         4WX9zm/XOHdpoiPDa7yTDdWt7yHHKl1f0raNBMrhgwPLlDRXjt8ArhLtYFqWkj9cj2mc
         28VQ4pcPx9nKfgnYstU4dI4zi66PC3VEgL0Ute9VAXi65e2rvQiPWBsCdr+VUmnjGQn6
         TDW+MXONKeKooY7wZ2ZFf5o/s14TZ8Q9zRNWLPN+gHZAOMzyJ8C41rmEd3nARSAvy7Zx
         MT9FetQttvseLnk2NgK8CLJtk3EjXBnUaaMKdCejl3IYUHc8oyx1twQEujB4xk+Ev6/9
         3gHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgrZUmBTwAS1LFtjytvn/xO2Cv22m8EQZ4CQ651x+eVrJOJ1AqcxoK4p1bsmwqhprg2tPhwUxkKUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbnHUzlp6ae6ldmKo9ZNI70Vqo7Vk5rexq9k8WsuDf6h3acd0
	WKs1W+tf0xszCeJkFsqOI9XrFbPKQhvuwCRASeKOzmJA/J13PpC8aJ0l
X-Gm-Gg: ATEYQzztozsJJQNVOOrVoU7py7a2muhN3QiPzHW3MsVcTYEF3iNO6NhvVuYRq7K4DMx
	y1d0HoE2vZfNHuAvGiCMUyxPbPkhiovvQW4w80e6EuEpfgwv3YRNkEpwMoDAHt47HAPhTxF3+a1
	AD7jjUVbPzggaMbRkzqrTJYQqNV3BW1Lv0E2BpoK3DfKm3DYVd0mguSr+5xe3+BwQkqd4pIHWZf
	dKkksNXQDZo4Zimc7Gp/MRv5rV4FkzhSvMXFR4WtgVLR/kztifAiDilDUwWlq4m6u819j1rwCEW
	ZVT0u16P5a79TupWjkYrfThARIEIRPpy/uYhlS08am7BBX1heKnLZO0VkjKUviWsASNankQGO54
	W0HIjmucznhtCjcNkF6+CC7lqlG+5N7L8CwkDNpDLOioI/uyu5Nw6/40kYmxFL6YsjXSr7G63L4
	XmHi1bioIOCDI5bo6k39ojy44r+zaoYveADRc/Bit0k/lDDQ==
X-Received: by 2002:a17:907:3f93:b0:b99:1074:750 with SMTP id a640c23a62f3a-b9b5079aaa5mr411438966b.39.1774732945829;
        Sat, 28 Mar 2026 14:22:25 -0700 (PDT)
Received: from foxbook (bhd145.neoplus.adsl.tpnet.pl. [83.28.93.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52032sm113342366b.20.2026.03.28.14.22.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 28 Mar 2026 14:22:25 -0700 (PDT)
Date: Sat, 28 Mar 2026 22:22:17 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Oliver Neukum
 <oneukum@suse.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB list
 <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260328222217.297200bd.michal.pecio@gmail.com>
In-Reply-To: <d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
References: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
	<8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
	<b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
	<20260318223851.1f6d07d7.michal.pecio@gmail.com>
	<20260318235920.ioek26hdr25rkksp@synopsys.com>
	<1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
	<20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
	<2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
	<20260321021439.7pmcdrpb5oxbivct@synopsys.com>
	<20260321065424.76a80508.michal.pecio@gmail.com>
	<d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35618-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5311E34FFD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 11:58:53 -0400, Alan Stern wrote:
> On Sat, Mar 21, 2026 at 06:54:24AM +0100, Michal Pecio wrote:
> > Nope, for many years now, if not forever, xhci-hcd has been
> > restarting the endpoint after giving back the failed URB if its
> > completion hasn't unlinked all remaining URBs.  
> 
> How can that work in the presence of BH givebacks?

Certainly not reliably and I started a similar thread two years ago
after coming to this exact realization.

Does anyone know class drivers affected by this which could be used
to validate such changes? Writing a patch is one thing, knowing whether
it does any good is another. I recall that last time Mathias tried to
touch this logic it caused a regression by unearthing more issues.

I was reluctant to touch this mess in absence of known impact. The race
is as old as BH giveback (2019) and automatic restarting is even older.
It could get awkward if users (or driver developers) learned to expect
this behavior.

But if somebody can point out serious issues like data loss in storage
then it's a different ball game.

Regards,
Michal

