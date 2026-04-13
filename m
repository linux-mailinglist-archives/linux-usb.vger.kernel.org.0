Return-Path: <linux-usb+bounces-36179-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJTTBH2h3GkEUgkAu9opvQ
	(envelope-from <linux-usb+bounces-36179-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:55:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBD23E898E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 09:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56642301947A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 07:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A8F39E6F3;
	Mon, 13 Apr 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO1RK0xq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97552DEA9B
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066920; cv=pass; b=nwfJb1F6zEvnLA/PzmBJnxc3y4ObeZObVyFDm/UcHqb2E5WkFTFaOk7qPFXz3ALNvbXm929DeodC3qMJgU8vlrx8HiueHqo/a7laITUOftoc8HpC03a8OK8nFadVwLglfkCsB5rFnV9rHIbHxOQkU6/9nRkltP0hMHJZ2H3MWgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066920; c=relaxed/simple;
	bh=9gc0LnLyL5gZ/okwpuRma5xwO90aLrmno7f04MKpCBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmpR6sXsApqLWb9r289dPBn3iQqPriqb1TWROr575ahgOqY12YjYVenCHdqkt3OOvyn3Em2p5uOLxKeRu5ja3l6oEtnjeNdV5ePg1fy+Fl92wvQoorDmu0zDCKAuWT3GoWTWCGmyM6Aoa8X412uswAt7146qfLvsxK3derlWJjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO1RK0xq; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651c7ddf514so642291d50.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 00:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776066918; cv=none;
        d=google.com; s=arc-20240605;
        b=fs4/mU/4Ku4x78lls932Z4fF8IylNH41DaLqB4ZduW5Lb0TF6q6jE4RXVSQ/hU+RYC
         GaR9Jg18MaG/ZgbqnRQDqec7d0XxRccBRWrdyP7Yfmt3/XENW8hDN9HsrDQ0xkpgXGxO
         AkFB6sVL0u0r65zB/qBDBGEkCUSPanDjGdciQy0vU9NijJycBuVlfey3TuVBi1bmBY2h
         LflOrFDX9Kv1u6wyRB0oGriLx4b0vSLHqVX51bZVtlddNKlJ502kiFSSZuecVg6EOs46
         T97PTPx2JZIszB68hnVJSPGZCpA9l7GLXzyC9GpbJLtHXkPvVq9TXRruLD8/BrVgFDYt
         pUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gc0LnLyL5gZ/okwpuRma5xwO90aLrmno7f04MKpCBE=;
        fh=LXlRygqdv1jJ6sAUonp8UA9FN1Z24h7r612x5Z1/JXU=;
        b=TMrj02q4RxwgjNV98adHnlGU9mpvLUvd5oh5nQWo5/3sb9qVnpnlt6DJ0UDyQSwAUU
         61n3R2zYm2oRgVdwCrSs4l5Lkdugoj25pedQyVCxJ34qU1lrPVua5nrl2vXzfD1XPDEd
         n0FyiCHUA61/FudrPPeZgd+M3PSW+KNTgsDuQoRjTJc4bqGaRIBqCHpYfyp+z1uE/Wl4
         OZQ+PmRyhqDrAHyb5+LTOMr/MxTCdtTVK47xEgq9lyoZinjxD8X/m8J5CU43n9yRU3Xk
         UMriIv+lwK2jfRM39fZFbiJ6Vx3E9KVSPGCWh9O25y+nOe3zXinJzNCYu9zcrBRjYFa8
         4ThA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066918; x=1776671718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gc0LnLyL5gZ/okwpuRma5xwO90aLrmno7f04MKpCBE=;
        b=JO1RK0xqPfeEk7i5h/v/lDu9og3nXjLVZuzGecAJR30OafNu3G9vwIWtBY0jalQ7ni
         icBL0v+nu0RQ1zaxNSnm5CMlj3PSIF7bEUxpIZmZpPT16yiQmzjOhlEeybJ9BFHBHYi1
         8B7wyFhw7M90XwKYUXMsN/tZVS/GUVD7h7YkE7YMktxrR4ZCiwM0QfOTose5qxUsTDho
         udOKCYKhMZ6mn31DsV3TrEm3/h0ligtENq7buANUeXZtW4bSWOMbKdZxKo9ZNEIWMIxK
         ApIi0GvYtYWWb9QarDGiewCXi4U3xlXOlmfbdnHvMvuFs5fXZpGUNNJkTImOK5ve/Mgo
         urog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066918; x=1776671718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9gc0LnLyL5gZ/okwpuRma5xwO90aLrmno7f04MKpCBE=;
        b=CpNGogirbiieI/+EqzSf8Q8DTx80neSWl2T2ffNZpT8u/cjVAKaXcM3mpkFqBnJ8Mt
         KtuMvSlW4aO47gCK7McMn1zAZDOz0xa8DW+04dWGRZddUKkN9jpS22dPBjk/QNCXTdlX
         wG7eT/6z9AXKQTqqMsPipyze/Qpmv++vvi4BEwdTCq1ksS6JJvzmrzmrrMnU/ybUT0l3
         J03/quEOyoYqEH3Xslfyz8CPMpV/KSK7Rc/tH5/CCAuVnMJ4HGyo769B0M/cWTvH1Sa8
         X3FEUZQqiPYEUTqsbYLVGHSv8+enAALdLKqj/m67YskRtR8/wdfEg6FEnsClYYz/pWDs
         ZMEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x3qcqDM5aXbxoBA2abE4HRDyO4dKC73ddfSbxlclH+Ma/YNosH8H9goqVT/6+/hQ2u+G8+uFYk3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKR3n5DySH/qm36XRUs29GSDibF30DUDZP3qndIPik4HpxrWwu
	QEzvQKDjji5KUaYbF6ONpUouljAhLM6E+Fn4iOV5s9pBZEdSXLs3QTRNEANEiFbvYD+S2XakNOM
	y+qrbMzwPUXIWvKWK9YZYgQmIuV4fA5Q=
X-Gm-Gg: AeBDies4IU9HboSMA6MBirjeqv9YOZ3tNY4RH2NshntPRvW9oo3NYk2lVBLqb5Sg4dU
	qxHuN+3eF8iGS+8+FzgpVN0Hj6ywl+T461kyC6mQ0LB6ZPAMsKGoY8fHfHoNxQclKBV4JO5GRMf
	o+dwANKyZBs42NqEc8lVpRm36zonXVQskVBKg166wcYVjAFokLb/TtJEiG/hGyffXHs04RLCiR5
	idOsyBAf71o/rVGxejQ2WGwehJeVdSJ4XbwlELy/N1ued8Mqn/V+XgOznVmhq2QP4k58OxwarHW
	B29u4/k=
X-Received: by 2002:a05:690e:134c:b0:651:b7e2:6835 with SMTP id
 956f58d0204a3-651b7e268f5mr6139035d50.35.1776066917886; Mon, 13 Apr 2026
 00:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412165311.2578501-1-lgs201920130244@gmail.com> <adyT6oW0UgvcEQbX@hovoldconsulting.com>
In-Reply-To: <adyT6oW0UgvcEQbX@hovoldconsulting.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 13 Apr 2026 15:55:09 +0800
X-Gm-Features: AQROBzBvM2t448POngzR85HeuLhzGHKLxNZZ_0ViYHX8H0y7B2Cz5TcbmZhUfog
Message-ID: <CANUHTR80npU59MrNq=1nYnb-r1ASKv_nG7=NF_G_Ko9-V-XaVw@mail.gmail.com>
Subject: Re: [PATCH] usb-serial: fix port device refcount leak when
 device_add() fails
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36179-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7CBD23E898E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Johan,

Thanks, you are right.

I had missed the disconnect path: usb_serial_disconnect() retrieves the
serial object from usb_get_intfdata(interface) and then calls
usb_serial_put(serial), which can eventually release the ports through
destroy_serial().

So this is deferred cleanup rather than a refcount leak.

This report came from a static analysis result produced by a tool I am
developing, and my review of the report here was incomplete.

Please disregard this patch.

Best regards,
Guangshuo

Johan Hovold <johan@kernel.org> =E4=BA=8E2026=E5=B9=B44=E6=9C=8813=E6=97=A5=
=E5=91=A8=E4=B8=80 14:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Apr 13, 2026 at 12:53:11AM +0800, Guangshuo Li wrote:
> > usb_serial_probe() initializes each port device with
> > device_initialize() before registering it with device_add().
> >
> > If device_add() fails, the current code only logs an error and
> > continues, but does not drop the reference acquired by
> > device_initialize(). This leaves the failed port device referenced
> > until a later teardown path, if any.
> >
> > Fix it by calling put_device() when device_add() fails. Also clear
> > serial->port[i] after put_device() so destroy_serial() will not try
> > to put the same device again.
>
> Any port that fails to register is released in destroy_serial() which is
> called when the last reference to the device is dropped (e.g. when the
> device is disconnected).
>
> So there is nothing to fix here.
>
> Are you using some kind of tool to find these "issues"?
>
> Johan

