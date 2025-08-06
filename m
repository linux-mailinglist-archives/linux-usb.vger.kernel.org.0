Return-Path: <linux-usb+bounces-26517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6AB1BE32
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 03:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F4AE621FA9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Aug 2025 01:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340E6156F4A;
	Wed,  6 Aug 2025 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hXluepGE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463FF288D6
	for <linux-usb@vger.kernel.org>; Wed,  6 Aug 2025 01:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754442693; cv=none; b=EzOk2wwJSylqIIH0tPKmNaO6HVgwBgwvlm1S08CR+1Bjj5yUBwT8q7+cfCa3FgEM5CagUSzZDUP/8B4Gseso7HUndAhEdhrjE3qQWAqZZZgDKs9BJ6ojvWN7PYlF7RLVugUqbiW1R4VqcxLfxy3Jb4zo82TPNHaewliSmWm3wDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754442693; c=relaxed/simple;
	bh=E/w+DRqXb2jFxDHaU6euhPt7TOxgsKSFsApi1bZjEcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EhobbhkNQvqbh8K+GfGBkMFkOfGVSgG7i2qpBctFAU8cncJTjoiJBfT8srP9BY7qbO51yecK3LZtv/7qxyZfAxOZA/Yb0PEQFJUmEHYPemSrdXSKSW12bkkvRQLUj7N4Z+XoUFvjh9K0jcoT97g/VzscrpuDkRDSYcPBxXnyGr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hXluepGE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af9618282a5so648044666b.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 18:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754442689; x=1755047489; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2GKUutMb+CTg/SBIA+X4H18S3n8qy8/RVR5pHccndQ=;
        b=hXluepGEYp5wYRsC2XH3bvxGPJHXrWuuSV0ur4MOc3NZChAReQeiYrNLL0Y8AGPYFD
         8ubwtkplVBaoEb4ywfTtm4sZHNau29wPDm8PJEfwHNe/ZBxV22b/7cTajmFOLCyvEUmB
         WMvPwtwMQZod6n0FmfjsUR12bfwda90K6AClU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754442689; x=1755047489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2GKUutMb+CTg/SBIA+X4H18S3n8qy8/RVR5pHccndQ=;
        b=oxRFzCrgraSeS5GMc/D11ZKyw8oVM5N86E+kPXNbvxR2lX2rkS8BpW8HthyxACRNFE
         BCcalmG5SDnl/fz4zo+t/kLkO7U1CFNqX3MsU3CiZUIjzUqbAUj+nIlZ3pN6mfgJ55rq
         730Bk6gRBEY88wgH2sZU2zn+XtvLB0/VNOYCBSPvEZsC/ir8b8o7HRJdzWfftrU/fHSQ
         /Vn9YSIfLvReaefty/xOhOu+BRp4HtEFkpjcKPVR6h5luFi7eAfe11vhd6r3oKeuEv6Q
         wRiF3JeYZ0tpdUaVQJmPy6MLs4/6I9sjY+0QfqtdXh+C9AIjaImccnnWqvWaLa9/I0Zu
         JGkA==
X-Forwarded-Encrypted: i=1; AJvYcCUKjhBhZEkmGihSyT2B3q9m7YPbjxMDfdaAMPm77ZQS6b9a8uTGQJJpO0CeHsZMgazo6w5m8V9YhZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZL6GIxhXRK0/DDZp1qa13NactC3GvemVdgPW8+2hCK0ETeC3Q
	9Xo+gCEARqu4rKe2wV5rt2yKF+uuKSQdECBVGlgUXX25qcaS/5jlQKaRD4IGaAZbWJTdD2XXhoZ
	iyiGcqQgTXg==
X-Gm-Gg: ASbGnctLFLN0dCmvJd5gFIPbvKB0XAV3Rx/zVWJ2g7FhcTvs+JfTlP7TAgblpEDJbGS
	AauC469Sv7bb8sIEy82KKksd+etNeyIDk/9CPSn/V2V8YlmX+0Lq9RiYpbYZm7Rr1gFNbNHPN4H
	ld6Xh0Z80beXsnQxHiTrIGX33yQsBe+bwcYz9sByocNNd/uZ9J+6wNp+LU2wMk0xMDKZQx7kop2
	k+1TUv6Wz6UPe28f2xEazjOLIdf7tpCVLJGJqCYLieeQF3ztniQLEhfnv5JFjdxhFBh4885P1iJ
	2a8HndYIWVagNxL7uy1E5qzlBt1w/eh6D6mErUOGhX5E64XzfgZQLs8jOnTQBaKShfhPFxvqvGy
	lCMKo/hTG1fcVyhhS02etUD7s9QG8luIE/CS0garRwS123Ipjy0zLipYZubtvf1D922xszoS7
X-Google-Smtp-Source: AGHT+IFrsKZyv+/YZ4vcFY1Huj0KGoOsRb7Q4T77xWpjb3jPMkqHiznH2VJoRwM4JAw1J4iEWG5CgQ==
X-Received: by 2002:a17:907:7f94:b0:af9:7025:7d5f with SMTP id a640c23a62f3a-af990344f81mr88602866b.46.1754442689265;
        Tue, 05 Aug 2025 18:11:29 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af928c84154sm906978166b.84.2025.08.05.18.11.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 18:11:26 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af9618282a5so648037466b.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Aug 2025 18:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPu62DNRKVO5K/3KU5Vu2veS9R6JZZu4DAOq2ERWrillmumBs/kgZmyoalBSvjDVswyCG8L67QLbM=@vger.kernel.org
X-Received: by 2002:a17:907:9703:b0:ae3:6651:58ba with SMTP id
 a640c23a62f3a-af9902dffaemr94719466b.35.1754442686168; Tue, 05 Aug 2025
 18:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801190310.58443-1-ammarfaizi2@gnuweeb.org>
 <20250804100050.GQ8494@horms.kernel.org> <20250805202848.GC61519@horms.kernel.org>
 <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjqL4uF0MG_c8+xHX1Vv8==sPYQrtzbdA3kzi96284nuQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Aug 2025 04:11:09 +0300
X-Gmail-Original-Message-ID: <CAHk-=wh+bnqPjL=9oq3uEkyZ7WB8=F_QMOHsGjHLj98oYk-X3Q@mail.gmail.com>
X-Gm-Features: Ac12FXx151gZKxn5F0B-h1oNAfMmrkA84RTvsrxwBVO-1UWY7oBd7NqVoQGVGt8
Message-ID: <CAHk-=wh+bnqPjL=9oq3uEkyZ7WB8=F_QMOHsGjHLj98oYk-X3Q@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usbnet: Fix the wrong netif_carrier_on() call placement
To: Simon Horman <horms@kernel.org>
Cc: Ammar Faizi <ammarfaizi2@gnuweeb.org>, Oliver Neukum <oneukum@suse.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Netdev Mailing List <netdev@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Armando Budianto <sprite@gnuweeb.org>, gwml@vger.gnuweeb.org, 
	stable@vger.kernel.org, John Ernberg <john.ernberg@actia.se>
Content-Type: multipart/mixed; boundary="00000000000016f79a063ba80507"

--00000000000016f79a063ba80507
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Aug 2025 at 01:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And no, I didn't actually test that version, because I was hoping that
> somebody who actually knows this code better would pipe up.

Bah. Since I'm obviously horribly jetlagged, I decided to just test to
make sure I understand the code.

And yeah, the attached patch also fixes the problem for me and makes
more sense to me.

But again, it would be good to get comments from people who *actually*
know the code.


              Linus

--00000000000016f79a063ba80507
Content-Type: application/x-patch; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mdz5fpf80>
X-Attachment-Id: f_mdz5fpf80

IGRyaXZlcnMvbmV0L3VzYi91c2JuZXQuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3Vz
Yi91c2JuZXQuYyBiL2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYwppbmRleCBhMzhmZmJmNGIzZjAu
LjUxMWM0MTU0Y2Y3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNiL3VzYm5ldC5jCisrKyBi
L2RyaXZlcnMvbmV0L3VzYi91c2JuZXQuYwpAQCAtMTEyMCw2ICsxMTIwLDkgQEAgc3RhdGljIHZv
aWQgX19oYW5kbGVfbGlua19jaGFuZ2Uoc3RydWN0IHVzYm5ldCAqZGV2KQogCWlmICghdGVzdF9i
aXQoRVZFTlRfREVWX09QRU4sICZkZXYtPmZsYWdzKSkKIAkJcmV0dXJuOwogCisJaWYgKHRlc3Rf
YW5kX2NsZWFyX2JpdChFVkVOVF9MSU5LX0NBUlJJRVJfT04sICZkZXYtPmZsYWdzKSkKKwkJbmV0
aWZfY2Fycmllcl9vbihkZXYtPm5ldCk7CisKIAlpZiAoIW5ldGlmX2NhcnJpZXJfb2soZGV2LT5u
ZXQpKSB7CiAJCS8qIGtpbGwgVVJCcyBmb3IgcmVhZGluZyBwYWNrZXRzIHRvIHNhdmUgYnVzIGJh
bmR3aWR0aCAqLwogCQl1bmxpbmtfdXJicyhkZXYsICZkZXYtPnJ4cSk7CkBAIC0xMTI5LDkgKzEx
MzIsNiBAQCBzdGF0aWMgdm9pZCBfX2hhbmRsZV9saW5rX2NoYW5nZShzdHJ1Y3QgdXNibmV0ICpk
ZXYpCiAJCSAqIHR4IHF1ZXVlIGlzIHN0b3BwZWQgYnkgbmV0Y29yZSBhZnRlciBsaW5rIGJlY29t
ZXMgb2ZmCiAJCSAqLwogCX0gZWxzZSB7Ci0JCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoRVZFTlRf
TElOS19DQVJSSUVSX09OLCAmZGV2LT5mbGFncykpCi0JCQluZXRpZl9jYXJyaWVyX29uKGRldi0+
bmV0KTsKLQogCQkvKiBzdWJtaXR0aW5nIFVSQnMgZm9yIHJlYWRpbmcgcGFja2V0cyAqLwogCQlx
dWV1ZV93b3JrKHN5c3RlbV9iaF93cSwgJmRldi0+Ymhfd29yayk7CiAJfQo=
--00000000000016f79a063ba80507--

