Return-Path: <linux-usb+bounces-4855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10F827814
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 20:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF76E1C22C3D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jan 2024 19:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E9E54F8F;
	Mon,  8 Jan 2024 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VatbUTs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151954F86
	for <linux-usb@vger.kernel.org>; Mon,  8 Jan 2024 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-557bbcaa4c0so1276a12.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Jan 2024 11:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704740576; x=1705345376; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJHwZDY9S/pUm0bz+X6WG507t3jYQ5Spq8C9eSzA1l8=;
        b=3VatbUTssMUq+ff7dkUxY23vECALV2ulyJ5C0aOYhbc2QRyVqZ+MvDlmt/hYMF3DON
         jP+oTmIMmgDmpJ6Ky1aHsWrsuUkbUS+vBUk4Sc/7rxy5qW1X5Et5fNSrMVTjBFZKFZ5C
         YsxEcKKXvyAPtRG6NkT2VsJUb6//D9NcaNrNpAIYSZonhONnoqzmFrClpP2miq9pux1B
         jJLFS7YLB8wjXJgJq5hEZdc44wJuDJ7cb5DOrYs6igEqxP5D9p3RnzjwSKuATUKsYLmJ
         mKNYBiQsSU6vqFRDWBhY7+F7eLKR1xMEAIJZOj6Dfa2fbfHNd2emhUYWBnsFg+XuOBjj
         9GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704740576; x=1705345376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJHwZDY9S/pUm0bz+X6WG507t3jYQ5Spq8C9eSzA1l8=;
        b=TSNq0N1HypR1u44AtCchbQPdNV3FQVydedex4asQeThMfhwHzk6ukaMMrWjcVWGrwh
         gMJsAjqfY1p6Ik1ZlABnpkW/mRe13aR1tETn5NLHzC3+CBvnttCezo247rDobaDckxPy
         7c22OFPHm8OqT/H7vT9rrDBOjIxeq4J1hQNcZPQwvZ89CrSkaXiaASfaTDXCPCWhrWuT
         nUYPNKXgAUyQEBxFWYooPM6ovTfeAKwD3DcQU6nGR6JertD1yQpAlD2L6tK/BVjQOrZz
         Jj5LujZ6KlgRI/xzhIepY1wF8xUn485vHUPT5V9Rl5om4CaiZzDUtCvy1R6EiT/6B1FN
         XjFA==
X-Gm-Message-State: AOJu0Yy43hQxnzjffkGhGxaFT8xrhfvVYlx0vzd2ZRK7RyIVaCmSsfu6
	kYzwYzbF2CjSogXsIlbGKcTAXc7rGkzJ1G85bve0EmdPU002
X-Google-Smtp-Source: AGHT+IFuJqtqlXqvaMIaC4nKpUc2yLbvb+JIMwYG1OzvM8oUHXWobSdjDlHqoPWblPiztHJZ2SAqoc5dwJ+PIm4IefE=
X-Received: by 2002:a50:d48c:0:b0:557:8cb9:90a1 with SMTP id
 s12-20020a50d48c000000b005578cb990a1mr5219edi.6.1704740576501; Mon, 08 Jan
 2024 11:02:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214230850.379863-14-rdbabiera@google.com>
 <20231214230850.379863-24-rdbabiera@google.com> <ZYGphs1nBu3pnmYd@kuha.fi.intel.com>
In-Reply-To: <ZYGphs1nBu3pnmYd@kuha.fi.intel.com>
From: RD Babiera <rdbabiera@google.com>
Date: Mon, 8 Jan 2024 11:02:45 -0800
Message-ID: <CALzBnUG7tD01jAqyw6=dof7KEdd94+7bXhFhk6bpxo7dRDFnrg@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] usb: typec: tcpm: add discover svids and
 discover modes support for sop'
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, badhri@google.com, 
	bryan.odonoghue@linaro.org, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I must've replaced the partner unregistration instead of adding the
cable one when
splitting the patchset, sorry about that. Thanks for the catch.

On Tue, Dec 19, 2023 at 6:32=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
> I'm probable missing something, but where are the partner altmodes now
> unregistered?
>
> >       memset(modep, 0, sizeof(*modep));
> > +     memset(modep_prime, 0, sizeof(*modep_prime));
> >  }
> >
> >  static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, =
bool capable)
>

best,
rd

