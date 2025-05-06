Return-Path: <linux-usb+bounces-23770-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCADAACC98
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 19:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C85F3B6E43
	for <lists+linux-usb@lfdr.de>; Tue,  6 May 2025 17:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10AA28151D;
	Tue,  6 May 2025 17:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sTIrEd/B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99D11E47AD
	for <linux-usb@vger.kernel.org>; Tue,  6 May 2025 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554244; cv=none; b=lDCasqoBGMae9MES+nmTq7O+/cAkbJKHKdURmbCy2vaSXIcpZejW7gL39sjBhSYnqV2qyhQiR791kAH0XEzfXpMzXSQUd2E6HkZ3evzTsFjaNtyhY2rmfZP38/+uK2UYSFGFEAxX4iaz61Vx9KxqE19W/nP8QNVFWMcMsLu7Lfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554244; c=relaxed/simple;
	bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hif3HxRGkXz2aOYZ8Wgf76yeVRniXRYMkTIvh9IXw+gRgsyXAhK3cyejwMkrmkMa+O8w93fl+oxk2XCP2k08qryFHK6XySR7uRotY3liEbfq9hfMe/j9Xu0Q38+zhpYfguRAuU/Y8hGJcxz9mdYqRO+3m30C4mVXKzL+/tFdRT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sTIrEd/B; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d81768268dso50989205ab.3
        for <linux-usb@vger.kernel.org>; Tue, 06 May 2025 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746554242; x=1747159042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
        b=sTIrEd/Bwk6PNc3kO3RMrStHbr+fodTJnq+BaSySmXqiIwkmJHIMq1TwwU5GtPcd3e
         wN8FAZS3NfrdvbzGabCfupbzpsBa7NkTQaa/Q45+b/Qsm9J1lci95RAlBKLyRToL1LB4
         lvo9JKp1MaRAhdcvR1Tfds47uXGuAKYKpABD7eRDzLXo1E6GsKD2vjECXfivpPOxaogY
         oIwZXr/9Cbroe8CgCvtFOBFUCAG3E9JlqKeVbxtZq6cAlaWQHiGkAY9ZuCtc6l6q7vIX
         DIhZNJb7BEIXNLStNIrH/Flkv5HRHY1b+8WpDGIGWVO+vwhSPCfhxSAuL4jZpHfcj0U4
         i1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746554242; x=1747159042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDEQButXfv1aj9Q3tzx/qG6tDTloS2yb4zcY8iQPhTM=;
        b=unbF6+ZflscmwiuIfHliPntTX0pc1fli7X1or4JlPALsP1lQZjPx37skrp+eLzysMt
         5bv4t0XDd9x8pWXf4CHpplydYhSzH3IYEpB1y9fw3WMXTIlNOso2cjoJ8w269UPgLyX6
         fww4itnd7hvdW00x1tmFlxuRHxuoNmfnf8thFngJ79DhWFBasAw2sJCZSG8Q8F3hOu+S
         o9VIGEfpd3TRqXlSJRYDNVjlomtKD8LWPATCVGTpwBmiYgWNnWY74nt6h0bi7OqNmmid
         U2yyoL2FCQ5nH2Ch/M8TMiV79VLaJAd7kB1VGfdh04qz0IiwL7ibQmanhSyL1lE9iS4i
         CK+A==
X-Forwarded-Encrypted: i=1; AJvYcCVfX2jIw4k7NRbWgqSRgjRyiill8MTUMiIElzZOymZjoDUhG6/71z0L6JXzmN4rdD1UrRKlVNmrqog=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZikZ8bOowEfp9ycH6jtRDqKK0YZU28nB/jbMOqSo9YdhwtVU
	Rcv//IaJB+geiyxd98eCammlQsN6hgLK/HezQeo8nX8PScm8GhHiTpGfxfe3hzAfoVIrYnDwjIg
	NfinXTpH5Z7uQUWEzE76u51nEc+wQ3Vx1iMau
X-Gm-Gg: ASbGnctAmGRK7s3PxCp45sT/BjePpaPMUutmBEsILzEqOQ3keFbit7xEcdCajq8R/+z
	Iv/551FQiYFOqh2yOs5zdv5a/nbuI3oZQoXAkZwmBNl8Z0qBJb63Cu7yIP0NWAZOvpH8gj7/Iii
	bsTQVlsXsh4lKLe6dLEpN2L3pUK9z8Id2wPiSZuuxWTm/QSz01BBufwB1XBnIAzg==
X-Google-Smtp-Source: AGHT+IGCZXgSSxGtX94Coy1Z7IBGImew8w0745inbqWEWkS+WvQgI3CPhCa8c6/8PGm2TCC4kwU0DgyogxMbp6nZpA8=
X-Received: by 2002:a05:6e02:1445:b0:3d8:2187:5cea with SMTP id
 e9e14a558f8ab-3da738ed70cmr108085ab.1.1746554241759; Tue, 06 May 2025
 10:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429234743.3749129-2-rdbabiera@google.com> <2025050116-hardy-twins-913e@gregkh>
In-Reply-To: <2025050116-hardy-twins-913e@gregkh>
From: RD Babiera <rdbabiera@google.com>
Date: Tue, 6 May 2025 10:57:10 -0700
X-Gm-Features: ATxdqUGhlDS5VHX3V_2l33LFj1BJLYgPbYIcE7-K8YutfklngATcqul4qM_jfcQ
Message-ID: <CALzBnUF7zb6F2iq_1xaF=1vbSkrpvPkPd0Ses0iWDG-n4fxHQQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
To: Greg KH <gregkh@linuxfoundation.org>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 8:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:

> Does not apply to my tree, can you rebase against usb-next and resend?

This patch is rebased against usb-next/usb-next, but I think I do need to r=
ebase
against usb-linus. commit 8a50da849151e7e12b43c1d8fe7ad302223aef6b is
present in usb-next but not usb-linus, and my patch as it is now is
dependent on it.

Would you prefer that I rebase against usb-linus and resubmit given
I'm submitting
as a stable fix? It looks like the conflicting patch would be up for
the 6.16 merge
window.

Thanks in advance,
RD

