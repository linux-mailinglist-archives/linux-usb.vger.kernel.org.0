Return-Path: <linux-usb+bounces-36895-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eI7LLROX+GknwwIAu9opvQ
	(envelope-from <linux-usb+bounces-36895-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 14:54:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6673B4BD465
	for <lists+linux-usb@lfdr.de>; Mon, 04 May 2026 14:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD7E3021B28
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2026 12:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1233D7D7C;
	Mon,  4 May 2026 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtHUDAbQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C93C13FE
	for <linux-usb@vger.kernel.org>; Mon,  4 May 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777899256; cv=pass; b=SfSUEGPtVlKLATBdgDueX5Ohrt899a5zqQJBhc2ri9VIg2+qnikY9drStrX8JwK3eo57ZG4H9T9kvMJkDEIeTEAsf1UpBpjZUIgVaYhrTALyA63sxFnYE6o7QmBQEfZHfXuNK2B2+/oEqGjBEUXm/NjNtahrxrmpe8xOZWeRFxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777899256; c=relaxed/simple;
	bh=v6JgnDVheM6AQTmrvpp8XRzGDsaqQOMw3Z6r1k2vb+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcth+k/R+m+Mxz5/+d1UehWx4YxWK9EFWIhATtBCVKQhAB8iEYJ6En3xfivb1MG0OZ9+h7dbDjk5bclr6w+/yP8coQAMtBl5LHcqeuwO5uDSFvn7xWtKEld68+11/HGED7mjJsIHs4Vujs42Dv+abmu5Tf0oCa4TeC+e+sZ8RLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtHUDAbQ; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c52bb5dd7so827592d50.2
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 05:54:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777899254; cv=none;
        d=google.com; s=arc-20240605;
        b=V58bNgml9wsUHvVx19OPxb07U7iKJEB0dDb//mfB1TpsrE0dFSS9ATgftfHYjk6EXx
         ntYIqda0LlcFziZ15UUdg2SsI5Gyco2Wp2Sqq+IFyvFYc2bKprvP5b7XCCuN0VPno09C
         8lM542C+jM9wTHn1jiDzgqebWiDjLjrGa+6Z6sa7y5XDA21CRtZN7pnmo+XVLxRLPPsW
         VHB+WiYuaEtEhLc8BBSiJGh207oSJ22Jh3xM24rFuofKw8Nz3NFWEvvXnn99hTVe0UDK
         P1Sp9+6O0AV31jEKR1ykefWtozypjyywNX21dniFgv9CL6mjP14LgjKs6bRHjtZIMljh
         W6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qABVt6vtDKOBUqxbTW39Jms/G+sDJzuGpeInjnzgdw4=;
        fh=bZtvafJ3xIDwnGpIai7GTr40cykWAk2cmz/PSEuUlAw=;
        b=ZdOrfIwDk7TfD2K0ttx1mhbDpGrjpO34FaoX8DMf5Eh+MWMOdzBkijG/6UDsUu4U/c
         sp06CH36YvMq3VVZNJ+735CVvVDlwclcMsRJDCQAvX4r3Vd+8dSoHuoLlT8sHpwj98p4
         mlldCMH+kLr6guU9WSqIeoy7BEjJ01gtdDXPC+4Lj20hKzABH1vwh8B9aB6uK4CgNV6K
         c/IiMNDHbYS5b8o8JiAzRYaOXA0jH+MfL+szGwzti+AYff8zX7+QT7RNGKrrNnUSQD8L
         FNoCcqVawzmQxqcG2ckcM4L6d2nQxQDviFBV3js6vFViD2CF37eT6NWCvUvKd6A4iFSP
         CMbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777899254; x=1778504054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qABVt6vtDKOBUqxbTW39Jms/G+sDJzuGpeInjnzgdw4=;
        b=TtHUDAbQIFt4BYSHfZxvpa6/hZb9dUsHLOuVFyI0geUj5hx8mWpKsuU2PzKy9x2+VS
         kHjZn8m56DVsnuGr8x2LgPRy0sek5B6nuSIK/Srz9XsS2raYebCDFQr7hJP+WJ1jnD8s
         ve8nytJuzPWD+eCmDmx1HPKa8u+Mcinv4i4MK/ilhHGyB1y6V3Mh0r5ssd7ye8T6NLHA
         aWg+a5PAT3xeH+DE8IwrEhHVEDKWAtHgRtQtSLNxndZd1COsZeOdUn1otbmgiVJl8tws
         HRTW5WVyOThoQMmWL1215C4/jpgAKHgoSf8bmwVZOiKXAVf/5chtY4LAP/QFPTbV8b9L
         Iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777899254; x=1778504054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qABVt6vtDKOBUqxbTW39Jms/G+sDJzuGpeInjnzgdw4=;
        b=Ebcs3QlJpXG33nEQJigGE0HKBsPGKzVi7jrbiTdS/7jXWUNphCtNHb8H6GHix9/h72
         ckpeCzTwQeTatEH28X9dBedUDxC1WyQWW3AgNZf7zk+BeuVDTDj9c2w5dAZzkKpNj7dD
         ya+siylcJPmcH22Q5ga6t/wZ8YT/CgFtyHHr5sEzgn+Q/H4UvfMT04JhzOeJiQtsdeXg
         3UEaw4BXCVAPtT4yzCGiOu2HiTrKhhfSbOkFm2ZTqHqEka+JKa6uL0FhUo01S9oowf43
         9atoDrewkJ8Daws4/ZEFhd8rgh2mmZYkNmcyHYuSReQ2Elj6Low60Z5Q5zvkzQVJiNYG
         rglA==
X-Forwarded-Encrypted: i=1; AFNElJ/NDHoF07RcOU3BXK1OqoIpr3Zf6HGFND7qt+XWdW/Pdgy5qOAP/LsfdbGD+MK6ndjpk9UO0iRxbig=@vger.kernel.org
X-Gm-Message-State: AOJu0YwebIgS7Bxi1kwYjZiadc30rCkyE0kteJHqGuOOuR+tiKmNxbTM
	9chqlV0h93KNvsEfqFnxwXov8cVjM7Clgrbg3op2muXzrpanSaQZvYfFTsBmuGWTVU0FcM3sZIW
	YEbKcev6+feleKNzyGZZPcD/J9ZMgox0=
X-Gm-Gg: AeBDiesaqSZmbmagA0AXn1qNNHtyc80lGsZuLmCIPF015vq5NjKYjaig7LFHOCXYFGW
	92UKzlIZQ9DWe36b9fT5gmyFPWqXTdsgLn/xYPuGtYQzuyS/AQPWWVQJpnNmEM2RG9aWuMGmAUu
	ku3+TASZohbnMXpJRBuoJ17RXhQgx1yDY/sqPK6j9dPBQ+D+Qc0IusjNsnNcZCFWy8VDelxroJG
	MMKhvrU7B2odZSbAofpVLxUQRxHvBpIf1Sd7QpVG4xp+AcSYRJevZyq5JmFCkMhXK7XBXKCjUhu
	8uNo06Apfck1yFCNQDjs52drC0fKvU/UKS+l1fGP0lZ5+CQ=
X-Received: by 2002:a05:690e:bcc:b0:65c:bfe:80ed with SMTP id
 956f58d0204a3-65c3da6941bmr9169022d50.27.1777899253774; Mon, 04 May 2026
 05:54:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415123221.225149-1-michael.bommarito@gmail.com>
 <cover.1777817011.git.michael.bommarito@gmail.com> <ce8ca06ea5f7a9aa1bf4a82a5aa764b22256f908.1777817011.git.michael.bommarito@gmail.com>
 <afhgWlu2qiwqSLUQ@ashevche-desk.local>
In-Reply-To: <afhgWlu2qiwqSLUQ@ashevche-desk.local>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Mon, 4 May 2026 08:54:01 -0400
X-Gm-Features: AVHnY4Ll85MvdMTZNu8G1pXg5DkL8KGUgGScYRuhsS7hrSy6LP10qWPEVFK5IBM
Message-ID: <CAJJ9bXwkJ=LZZuenHaSQKXpy=y-uE1vUrrwdX4LE6ON-kF2xrg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] thunderbolt: property: cap recursion depth in __tb_property_parse_dir()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, linux-usb@vger.kernel.org, 
	Andreas Noever <andreas.noever@gmail.com>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6673B4BD465
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36895-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,intel.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid]

On Mon, May 4, 2026 at 5:01=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> I would leave this on a single line (yes, slightly longer than 80 charact=
ers).

Sounds good.  I'll give it another ~day for anyone else (like Mika) to
weigh in, then send a v4 with your updates on 1/2/3

