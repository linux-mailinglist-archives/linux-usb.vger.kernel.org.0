Return-Path: <linux-usb+bounces-32773-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN/EJENPeGmSpQEAu9opvQ
	(envelope-from <linux-usb+bounces-32773-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 06:38:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C405C90220
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 06:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 82B6F3008D35
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 05:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CED3329369;
	Tue, 27 Jan 2026 05:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvd5weqr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2828C006
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769492281; cv=pass; b=r4ABya+h68P4tq45Rfa/+rQqB4Z7LWlSgHY+qJisdLouwEZg4EMLbUxgdwcIxKnqyQcOZ36qL+1H0RVf3grLtaHy3w75ZRCOCczNP+vF+ChTTR7yF3MPIauX1Ttnex2WVbuZIsv5i+raMQO2tTxG57gaXkijowytnSNrv1nOLZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769492281; c=relaxed/simple;
	bh=o3eXaOSbySJmbAV5nxMRG9XRUBCW/3eoH72E8ZR+Pnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiECweEd8/1HtwdK2ZPu/pXwI9090hbSARyWnNI0lbpOQNcx/PlXo2lHP5jiUHAXNyjwman4H0bJnWkr2iHeRcc0XzF5aFCpIq1Knh+He72TENOpbQrUnnTjeaNKLLEMl9M8K/Ga0COXV5vrPawRVk/NdlivTmmApaNr0VhVQYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvd5weqr; arc=pass smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-894638da330so60726066d6.1
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 21:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769492279; cv=none;
        d=google.com; s=arc-20240605;
        b=EFKbkSHiWZ4vqjyDo6Bd+nvhguaaCj/u7l+1SB46nOKG1R9R1k+CnpfEoCWUmaKzpK
         NkY06UiDogRvSFVwBV8EdGBpXl8FmaLSudT89jWo2UL0ve8g02dlM0Sugq4mQmm76k9w
         vjtX965ZiH4JQV73hGJj+xIoAr1+jE9klCD7QtUpXz9qupUaBSwiE4imFZHaV9vT4M3p
         ji21LP+Ixf9KDHMhgmoEuLx0u/wfQhnweKH+9WHJrNiWNQvFn/bPLij/DsgqyY/EVNXJ
         OgGa7QSm07DcPFWL87B4KuKyujBDr39hkqAxErLFWhm/i740F997hbhuzor5x3knJbVd
         lToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3eXaOSbySJmbAV5nxMRG9XRUBCW/3eoH72E8ZR+Pnw=;
        fh=1deeQBBOtgb0u6gvUo6ipR5rTR1+FjLCyqOmYoIJ++8=;
        b=UbS1bysdmmERgoj/7I04+un2LbPnDkUn/a1UbQPhJGCNv4t8lfOOB+TQvRsQleGGnH
         yriiO+424ua/f7AChwfsjx3lag4Kgu67tOzIdJzqxI3ffISBM2BPQi+6D3T5hGsms1Eg
         Ys408wMf3Q6uuPbf9Qi8l8rYJq1dmezDRPnOo56hvBZcvqpOzvDczydP6jobsXcfwdo4
         jUCXOiUN22XMl7PSnXqKGWjpePHLJyh8PxJ1i5EOvie+Nv0+e9ro3dLDzAdTfzwWKE9a
         49touv/Dg/ArP0ryHtrEkuRoxW/hXbKpdNhegKNOi8dL3dO0t5C0uq5RCr/vlUye1tzr
         UrNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769492279; x=1770097079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3eXaOSbySJmbAV5nxMRG9XRUBCW/3eoH72E8ZR+Pnw=;
        b=hvd5weqrfg0L6OyON7oX+IuOm8D3XVqJ2oot+wsnMJoWDcCSRQIkgz3gHisGbEPWQj
         CKTzaQIlidAt5nttH1adjk7/Qc1mop7HmO2ovMqIraEQjWe/CRdVdIPTbU66XX1yVsv6
         FgC8SQRynmNzw7CEOSmi5GH/a1xrRXkp6T/GsW0EjEWS0cdSTbfPTMitslKehtMnulYE
         TjPWQDw2ZIZmaZuUpr5HOl21XJPsULlF2sxdM5WJjj0tvXj8ukTwmnWErRhGjbTPmgDG
         Ajk14YCsBOBWgYwRXa3pZhGn7eMYUBMEvRl5x3O7un9fl3gO7Glq8qm6nJc0fw/Cg128
         eZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769492279; x=1770097079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3eXaOSbySJmbAV5nxMRG9XRUBCW/3eoH72E8ZR+Pnw=;
        b=a6u1rG025V/kkOxDuSQF8jFBO1S6uq64EgSzmXAzczpnFHLhoL1OMxD7LZO1iYN2sT
         4a8Y1jmNp3oNn/swTSkF3GiLgdxtpR3nsxq/zOL9WPknfZRrhQVg+RyA4gWsNpq58ck4
         sllLcNvC9j9kY5DkrkFCzCPJ6CwFSoBxMgA6OOfwYVP+Na1yvBPqZ2kVFUR7/OuNP60k
         sqaEzct0+ksahDrJNLHDjoSV7IJsqbeyIuf9wpnhNGUAlqHaBjFziaurxqxqqOd7ImVf
         FNE3ofxw4jKKT6zJXowgKvy8lPab92SRPWkbmj4dxV+L2oldCxA/qYprrDcdLunrdMoJ
         Bg0w==
X-Forwarded-Encrypted: i=1; AJvYcCV4pcBbN6hP6pB3mOjpSydTOCXfIOmHvh4iOn1sXuPyIW+u7A/OmJYt1VLwKIh5nU7MbnCM+7ugZlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTcgPsyaeUudx1RBtezjg/wlH8zJS3/9q9twhxgi1ztuC2Wr7a
	Ygi+xTXq4kd9h8gc8E0GwIJt+JTg3b7fYhB5J4Ya6zSjTPnYEOoEfD+TxniBMFJGB02Las8w/T6
	LwhS1KV+4yD3C74HJeDJYAgRpNxP5ha8=
X-Gm-Gg: AZuq6aJLI89Cik65bdW1K4VjTzjA3U096eGkAmdP1oSjmP/1KR5IW/q0dbpQSlXITzi
	7ocs1kQ7LZv5lglaZrfsj1rpMY70nJmWVG2WZYf/q7mnx58Afo2xQeOa8Ww0DVMQKFTmQQYsiD1
	c4+iLcPATGmbo99dGFfYJA065ogpP2tB50+WvqMnFokN2uJmO8yIqpeKMe/AYjo3LF4ASr6Sn/z
	XNjwPgdYHYs0yYX0saqZ8HEACBG6P70a9m7y9WRKLDeS/LQaYuXDlQKTV9G+ocULshO376NRssT
	qtpnqd6Wg5ZCPMi3uttDoD14IDfIlzqmAUfu85NOZaT8N8AqpLUMohEEir3q
X-Received: by 2002:a05:6214:300a:b0:894:610c:3a22 with SMTP id
 6a1803df08f44-894cc7f8904mr9554536d6.20.1769492278740; Mon, 26 Jan 2026
 21:37:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123065842.53669-1-enelsonmoore@gmail.com> <aXdvRs1hAC5E4Dex@horms.kernel.org>
In-Reply-To: <aXdvRs1hAC5E4Dex@horms.kernel.org>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 26 Jan 2026 21:37:48 -0800
X-Gm-Features: AZwV_QiVjplkzIhsvBAbS2wLzjFNbC-xq9wp1W6pNPwI1DXHDpZsOx3F3uU6yEk
Message-ID: <CADkSEUiuANFNO9-A_wp8h255o-+MO6yGTy8iWt+25p0zXLyHxw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: usb: sr9700: remove code to drive
 nonexistent multicast filter
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32773-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C405C90220
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 5:42=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
> I would slightly lean towards splitting this patch up,
> say one for the multicast changes and removal of related #defines,
> and another for the remainder of the #define clean-up.
>
> But that notwithstanding this looks good to me.
>
> Reviewed-by: Simon Horman <horms@kernel.org>

Hi, Simon,

Thanks for your feedback.
Would it be appropriate for me to reuse your Reviewed-by tag for my
split patch? (The only other change is to use netdev_mc_empty instead
of checking if netdev_mc_count > 0.)

Ethan

