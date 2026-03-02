Return-Path: <linux-usb+bounces-33872-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBn6GRR2pWkNBgYAu9opvQ
	(envelope-from <linux-usb+bounces-33872-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:35:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9A01D7916
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 12:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CF083075FB7
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 11:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35583451D5;
	Mon,  2 Mar 2026 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6ayZ6e0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEEC430B98
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772451085; cv=pass; b=quAvbA1V0S36RzLyFKTYfWwLcL4UKGa0DkVsj555oWkIVy+v8nTsvgoH+9bJCat+0SqMdVpa/vW7i/Z360qZnfXhy5Tzhk4b635FYNeh/jLMpLn5K+DcwGpfc2I0PDNiVJ74KadE2tYzV6nBo348MxG8DKus7VsZ09yP0vn9450=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772451085; c=relaxed/simple;
	bh=MIrebT36/abwugfBFswhZDckaWH+gbdfDnt3JmA9oBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkfWZ/XrBvzGpMBNc8XnMRep9IiEDdUfL9tT2+zS6loLPcTVKXPt8adtJ/fXObEzF7pFqOQh0frbcAjfNbpPAr11Yy8/SV6/awdfKmE5VYNf7aWfCFmptvcLO/XVByzJOMB4SUiuT0WFwFo5yALqLPYiriydRfH/a1UipDR2w1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6ayZ6e0; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1270fc2bdf2so16427c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 03:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772451083; cv=none;
        d=google.com; s=arc-20240605;
        b=dInXhLQNOD5a0B4TksD4B25fArnAMl8ysR0gddXjYbgJxh3jrNlAA7g3/6Jr3+3rna
         mOehtmr8Y7c9BdnpFEfmEU7wtggaN8fLBjEr3n32DgHArzOhdS8lDGP6NnuiN+JzkO11
         IXwIyHKcl5XGOz/Nux2ymT+Z3n9h/DiWA32BK5bsM+g054NSYIngZkAZClAFA4vBNgMr
         8LnieS4nJw9FmoQ4hoPiZXAZcFoHVcFTf0RcIl/g8qShlgVtK9dsHqj6jLvI3/WonZOb
         VNqJzhY22+EhOF+5QFVMOmk3pEjok3QDxDoZsAYBYbMNJ8ZZ5p/LJg3qgTZqWxhwgUdO
         YEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        fh=eiVwwxuBExMfCBlYPSMCxm61lj34KbtXh+rgLc+pjRc=;
        b=NtmBd4ri6/bHJGFKgYrYFvNPgpzf3kzxOiuKZ1KMu7e8iKkGmmbq1CAGdgWToGkDkz
         kBURCm8fvuZpIRzgJjw/2lrMV6kToJ+mJTZ1Pw2bOe75tdg9SqbpSQxznN4exEO+dajV
         4ZwQB3Q0gN/aEP71zmjU2EGDo9xJMWo9UqyCNJJFokUanMW0RD73l6D1/Je9xo82aniz
         gIqZimWd7bh5N6fF/VKGcwcrP0pIctJgCgSCH4qVzEwMvVclJOLQ+P+QChH5684DZvfJ
         UyciVbCh/x6/lcB9OFJ3cITOs27QUU8kyveTj0UkGvMUbUhj3qlCUbdP9Isg9JBCOdXS
         HypA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772451083; x=1773055883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        b=t6ayZ6e03hxHF0J9iKX5UDBjCwRowbhkonU9CMZU+MSFIeMnj8Mlbv0fQ1iF5OIhgO
         MCa1bQiTdtYd4CfWUuNUHkurwcqycerKpMmq5uC0U3dST07xg/mtyhoYrzKANEEWVUFM
         zGG1iV5gWW/cZaq8cSDHDxBM11bEy+n/Fksd9dohlHbgrpPe6Cr5M27D3rW5v20GPiQn
         /ANzLSS17L0VlEyDsYAPkeqUXNlFEU8ClcDZ4gxs4+IedJ7uPcaVUdWb4xuiW785l/qn
         vxKzPVmMVx0zCivlqpXa+4H3RjSzEQkKWYZxt0P8GfxmLHYvx/r6ijZLYKkHYoW6LPnH
         yNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772451083; x=1773055883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRcH+v7tmIyTZLn4oUBFcSFT1/NFdo0CrZxQPruKMXE=;
        b=GPEWpO3PXINc5bkvZlDj83JUWI5bgiWc3MYBQfdZArKCJt+e/sDWj2gIBUDZYYlM69
         ktWLVq7xCDv/3O+UdhQ3OzaS4dscOKOEB0wIwcoyaFWKzjE9jkBWr12re0JMZCLmAL/h
         8I1W0oaWs5E1+FHN17m0/y7A1bxPeuk3sh2aDKzuWc/EupCFmN9M5XUY0DGuHZ7tESmc
         73YDmi9hWwuDOQU4/iy1bra21OSu8kcKXOsEUvgpI4bC0yhrZAzXaapksye7dJ7MhN54
         1kxm+F4Ifimv8LOknRyfmO1JDBHoVgBl24qpIIm+qE2ckLE4kZxvQgiIME0UPvCJ9+rl
         MjTg==
X-Forwarded-Encrypted: i=1; AJvYcCUVhzpAYNh+geJXfDANcGUv55DKVQbA9ncOvfBo9kCqBSpUQgz0sFYo9QQB1SWCUtBmonfcgPj+NCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDAcJ0JPNVbB6QFioJIIVRfGR5l5EEb4+HYmDef2iLx2W09rsd
	x2Dotj5DAU/HHqd0P5VQQD0Eig05utrAaC9lQNu43T/GLNu29rtpMe5RA7ctvz8/mCnuofx6tLr
	czzLqBHL7qC1wf7JDugtkAThw/OP0OyMig8c264V2
X-Gm-Gg: ATEYQzxRKavRQOOkSnPKD3H50sNXf+YP3vUkn1VaIGEtUTsugpdGEIDvbm8zJbNFEGb
	N7PuFuP7HjP+M/kklFO7XIWbIilW5LYOuvcxVVZCEUmMoYEE3vo+DarIQhrYByP6jhXSLJj8t/7
	xjduhml4CVFhU1xH9VvciftQozEQZ/yHkryK21sJkPiVtMw0wO3iVJ9JEI8t95gewPZIyoGoMkk
	ma0QqUwTgpVTH5ra61WIpm4tdMynoUk2qMOwbNAK8bVdPwoUlb3/3lKzuA3YwjfFP3xjgzj+bwI
	ap476Uf3YC4KgUwd+cznKHtJNARcxj8oU7B/f6TtjwWczIk=
X-Received: by 2002:a05:701b:4194:20b0:120:5719:1853 with SMTP id
 a92af1059eb24-12796e45d7dmr157828c88.17.1772451082766; Mon, 02 Mar 2026
 03:31:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid> <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
In-Reply-To: <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
From: Andrei Kuchynski <akuchynski@google.com>
Date: Mon, 2 Mar 2026 12:31:11 +0100
X-Gm-Features: AaiRm53KB1yuktTjhOlTzjSiqZ6UkY3SEYaZLnV06Gs1s3UIAvzs2gJSbxllh2U
Message-ID: <CAD3SCTF7CG342tLe4ShMJHczrMUvnSRTxowt-EsGD1tt2TKmjw@mail.gmail.com>
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt support
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, heikki.krogerus@linux.intel.com, 
	tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, sboyd@kernel.org, pmalani@chromium.org, 
	badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org, 
	jthies@google.com, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	"akuchynski@chromium.org" <akuchynski@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33872-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@google.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,chromium.org:email]
X-Rspamd-Queue-Id: BA9A01D7916
X-Rspamd-Action: no action

Hi Dzmitry,

On Mon, Mar 2, 2026 at 10:36=E2=80=AFAM Dzmitry Sankouski <dsankouski@gmail=
.com> wrote:
>
>
>
> On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> > Add support for entering and exiting Thunderbolt alt-mode using AP
> > driven alt-mode.
> >
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > ---
> >
> (...)
>
> > -     amode =3D typec_port_register_altmode(port->port, &desc);
> > -     typec_altmode_set_drvdata(amode, port);
> > -     amode->ops =3D &port_amode_ops;
>
> The last usage of port_amode_ops is deleted here. Is this a mistake?
> AFAIU from kernel docs, port_amode_ops needed for alternate mode driver
> to send vdm messages to partner. Now, when it's unused, how does
> alternate modes work in this driver?
>

The assignment of the typec_altmode_ops struct pointer is still here;
see the cros_typec_register_thunderbolt / typec_altmode_set_ops
implementation.

> > +             amode =3D cros_typec_register_thunderbolt(port, &desc);

Thanks,
Andrei

