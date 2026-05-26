Return-Path: <linux-usb+bounces-38059-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AbnJw9zFWpbVAcAu9opvQ
	(envelope-from <linux-usb+bounces-38059-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:16:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 484325D407B
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 12:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75DB93008D2E
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102263DD501;
	Tue, 26 May 2026 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfVCb2qO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031793D9020
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779790572; cv=none; b=Su/0zxP9nXREJuS4nC5kWf6GT6YrDS3iA/Pwry37ZFan65wbOVzo/D0NIRc+MCPlG/Sbzyc5+lmjj/4wdqRmNN9qRBU9qhR4BO2BslcX1HRGyfgJHd4DyWVM0DIDS3ad87doQ7vi4/hq4kW2/TSJgmRyLL3zJ/24MuEB9bAG4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779790572; c=relaxed/simple;
	bh=rN2MvPfs055AMgL32gwkCjC3SyRQ4Iy9ilVef64xrEI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mEqeCDxLQ5msJJJhEhyRGlA2O3CJQeYcYwg/Rwt8X2e6jghAHk1j+FkQUF52L6ECndPYQkd0dBUZ708W24zVf+iYccJrb3liXj+eSs2gN3QTfUVvKH1yVokePtbVXR19m7yW/uQ6MMRnti540vIFVvJMvauw00Ru/1Twp4+V/1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfVCb2qO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso9447115e87.0
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779790569; x=1780395369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhVntoO4L4jeG0qFQfrSf/BPrwX4k6HGmZPXuadJ31w=;
        b=bfVCb2qOa771zVdSOZmauf20nHrbjODs5HFrQbhW5gTzAhOJ6cDiED7MODhAa642Gy
         xLPXstQqkBOPjVjPieqRYmwy3IqUZSyPgMjl5TPq+O3kQ+iAmmtQL8xxHwwweILaULwp
         qxoAC+W8lRZAg79QDJCjpmKopgqTcPFEqc7JRtZlmLzDO+62Z/w+uPBK/obtmFiw2S27
         AaNVeJPoMVrLPZV0y9uDE3MgO5L+uIhrJWEAcmVNTBqWZuHUykarPm2Vs3DJFJiwSIq6
         ueW4z2JL1mhFDWZJi9KZYrmAu1yKiB7i3gi+motY3c1I2JasGpxIpwkIuYU9zjEZcfar
         zOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779790569; x=1780395369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhVntoO4L4jeG0qFQfrSf/BPrwX4k6HGmZPXuadJ31w=;
        b=IvCuYfuulLBXGqp7BtvOVGFe105ebWTnbL9zrKAdNiFtqG5WWJg5+Dal566jzFSsQy
         F5+J5kM1pXFX2NptospyanprxmErIu8YWfDgARlMkiX3uDKF/WBgVv+jFjQpjp6fQ+mL
         Nyjmn5VWnGAlfn3TFMF+R9r/4PLGY5C6U+rXVF4OQnZycIR7rO7+agbSS6vPWddGzKxC
         PkdJgNcnnIuCCkg9rSUyAe/JfcH4mp22E7x68lfp3SREKSEEf4RgYojmukUkF6njSu0W
         7w7Z0AL++pY2zP5BZi8g1l3C5fSnpmVDGP76sprgA1WFkIWFSaEAOIMCWOPo87JDk7xW
         MWpQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xYVnUfZqwcN8Go/ArWJc6TgTafWgnPl/5MDaUDpN2ymtqbh4W2u4BgEIm90S7p9E2S0oVT0a7G+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48JXOKP449KMIsOhpIo0+YHNNZnDyBC5Y25Yg1QN3pDFJQCK4
	n3zkGmLtCBZ7ZQbC5aznzB++ChF5a94uAoSODf+MHpup2d/MHZsMikzn
X-Gm-Gg: Acq92OHHAkJ+TQrdTvgDw1O8FsQTHT9+Ti3OMo2r8iIiC4h2Nu2g8Cw6OuNFGYG9JKs
	LhGetaWPx5Wuzyz7LiRGD0P8Sdskvu8Sghgh9r1gu5mPMe1SUptBWNI3vEHFeuy4xkiIurFDlV3
	DBozCNngAFgscogkm3c09OpNtlQ2emPv3gMfXxy0RcP2AHgQJBcbvq0LqonYoE64CyT7xzUgHZp
	4J5xtL1/9ERRvyoo9b2gMNsmGYgKaQkFsvdDsBXTGo+YNJEtau9oIjJJLPhXKr9Er8Pe/prpjlV
	7ugb6H5NdlHOrLhV0DAjiuhBe7zQggotzgjZyQq7aPO8CqWM5povdwyx0H30nLPzGVAiH4OIL5c
	0cemaGqMhi6Nwm2ZEDZXi/5TVGGq+q6TIRP8h411722OQYLJXvw4pnmUtzzjyX747WQ2i201niT
	fnH2iQrI7dlxsTg60rNkqGAgFxnRKp0BuW0Bk=
X-Received: by 2002:a05:6512:3981:b0:5aa:2a30:217a with SMTP id 2adb3069b0e04-5aa323dbef6mr4963905e87.34.1779790568814;
        Tue, 26 May 2026 03:16:08 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa462cf605sm333990e87.15.2026.05.26.03.16.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 26 May 2026 03:16:08 -0700 (PDT)
Date: Tue, 26 May 2026 12:16:05 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Henry Lin <henryl@nvidia.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream
 stop
Message-ID: <20260526121605.332525c6.michal.pecio@gmail.com>
In-Reply-To: <SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
References: <20260525182028.2148267-1-henryl@nvidia.com>
	<20260526015514.466b72d4.michal.pecio@gmail.com>
	<SAWPR12MB99911841F75A9492A6FA875421AC0B2@SAWPR12MB999118.namprd12.prod.outlook.com>
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
	TAGGED_FROM(0.00)[bounces-38059-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 484325D407B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 09:55:19 +0000, Henry Lin wrote:
> I tested 25e531b422dc ("usb: xhci: Make usb_host_endpoint.hcpriv
> survive endpoint_disable()") on the affected setup, and it fixes the
> issue.

Good.
 
> With that change applied, repeated stop/start cycles complete
> successfully, and I no longer see the uvcvideo -71 transfer errors.

Were you seeing one such error for each restart, followed by uvcvideo
dropping a few frames and continuing to stream normally, or multiple
transaction errors and complete functional failure?

I was seeing the formrer on several tested HCs, except for those from
ASMedia which never completed the affected URB at all (IMO a HW bug).

I think multiple errors would also be an indication of some bug,
possibly in HW, possibly worth looking into in its own right.

Regards,
Michal

