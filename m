Return-Path: <linux-usb+bounces-37096-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DdWGgPF/Gk8TgAAu9opvQ
	(envelope-from <linux-usb+bounces-37096-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 18:59:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD34EC930
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 18:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71F5F3019B8A
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A263FCB03;
	Thu,  7 May 2026 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="hrmwK3AQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE402C21C5
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173132; cv=pass; b=KJzSwoe80/8SArJCYTNKtGKjmct+cYkECCdwi8p2iHT1GlZRREey3ZIXWLogEkQK0VQIsxhlo/tIfIHP/pCymQL1fIQAkIiOp3LzjIfpbVKwrrSzk2bnhKkpldVSuSiab921kpnfo/9ppNPCShA0Ji/nqcWWdze6BSiUQM+KfDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173132; c=relaxed/simple;
	bh=g7FDcwsGXtXlVfrAGeyj4Y+Olkuw+W69nMSysjG4eQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4vfCXwFEZRQzpR00YarPCkqLtxO3OMRIH1pEI+H71+011T1o+Pythjx21tRXSJ5IVb+vyW7bCf4WOu3uQ4bauseFZ+BHlcTN7gkl/J7t1Uyyliv0GAHqffCYqV8obsH5tatBTjKZqodSVO3AOZrU8e9TvFndp4ta2vC2IIn66w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=hrmwK3AQ; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67c566cb519so2063184a12.3
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 09:58:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778173129; cv=none;
        d=google.com; s=arc-20240605;
        b=aaPt5Kb6PrInDmZpO5QWoYuhJv0r/NdnUyrznSSS7+Ta1gwbFlOogIAvxPdHH885GC
         2D1xgBB4QPW9ansgQEhzg23idcErNwcd99fZogdxzoWEOjOKyAJ5YgIP+Q/5pdsLheTy
         fRwTAelbyNSJrhKsXNE5Sp0g7fAHhYYbnqLeewujT9KSyTwWY6kA93OjW6OIRpNIA9UC
         okRzl7/vr119jz/q0JRyD6N2L/g2M8zzuSmWBSxfXw0CgKcHl0Z16mnRIBttdnNvmVNw
         d3O22Cl8iVzW5y9cz7vPxmG2keZSvWwsKYsTDL1z6TqzEpjya/QcNMq2oarqJF3D5Pch
         Q9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ff06H19+2f8LP/S5t5dnvzF+qtDGghHwzmVQjHYleLo=;
        fh=5kVackAqRJRHwbEJvLGyE/u6qIel2R9qk0Y0YQg3/CY=;
        b=kdZDSvMQunnqL99tH4VIjBd56/x38az8E2AoRipwdh8q9B1f0jXYfFyvWfW4LwSEwz
         znsfUP0uY+72eM5n5ngnGa9VIJ7AO5fvc8ZS06fLJiyAc9EKZg+sS7IyEyF3Q3W/PHsm
         5gvdg/64U7PfRdWbGScUXv0swc9O1pkYUWVVEayCMY1T9Tbr+gqJBwWVgplq6PLQoOGy
         /ztpVSsC24zWhaoL/aWwFzU8nxhUhm6UXhmIsfzf6RqkFlg6Chk1Nvn9IUa4bpiniiyf
         IuyNqe8rRji5J0V2KCqCmawCks1LtXezZ2/0YPA9EGKEkOxE64q0KReCpMmy+A9nuVeE
         fNTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778173129; x=1778777929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ff06H19+2f8LP/S5t5dnvzF+qtDGghHwzmVQjHYleLo=;
        b=hrmwK3AQQWtsOsHYVAwF0NiAYdaYtNKw0GV7rzv2Xa+vOb0SwAC5eAaoNVhVGIGUWF
         iCI0B734J8ent8w71rJdTa7uLiBSNkp+IlDbU0zL5bUtBNllpyfaPW2tS8Qy6nZDAxBF
         9LaWYkpvs986jZznRI8OTflVNRudycjD4WUOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173129; x=1778777929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ff06H19+2f8LP/S5t5dnvzF+qtDGghHwzmVQjHYleLo=;
        b=XKX3Ov5U1J+PnM/NuH5LmH8RUZtJPGeYbTb0+zyRqRVdWoPAAQgOJBdHqpgok+NN9r
         T/fUbygdJ8XurL4l81Et4x0ENQa9146B/VCLY5r5imthxpzzpqrcQFTh7ZJ2IARlyQ9o
         98uS3EruZ7Sx1ABYS8zWn69ubZOuUJ5KneraCwuunUhJfHYMxVywsQdqXlWiCH8UWV22
         v3bwH+sFfBi/RNhXdhIPaiORIPG2rMoapzMckiLngieYmKexhRQmG0ah6KK1lW7ic7Hd
         8nb5WfclhhEa2gc/02Fi0aGhl7G274SdLprQkUz4MhFXTgnM6+No6DNVeSpMyQ85qbDe
         4obQ==
X-Forwarded-Encrypted: i=1; AFNElJ8EO46Goap28bH09b9Z4mOn954xf50KT4gVCqBbq9s4I8bKMfZeO28RJygZ0Nz7DJSo9jeE2lgSviU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw65Sl9ahm1m4R73GN0MsJt5ZJvGqBDgnubEDZ+1Fr0hW/TVPZi
	awQ4HRC3zIB/Yz/wLwP9YJwsAylhsn89xYhkPOTg6HTOPlX/sUPd3fQp1i5ozu7tuYLaffwoObk
	nyLA+QvXrt/hQRIVrbWEGDSUa4BvZPuZ2aMg7m6NrSI3Mnv2xg84S4xHwMg==
X-Gm-Gg: AeBDievDg/uJ5i3IeyyxQu1YVHBe2YgPV9yYfOg+6IvJadTZALKqI0+9jWN3LRixzfN
	GWbNNJI7nUfcWAOIpKybLzOCcU1ezux7wBDUe5PQVWM8alIqNZZ7/hcoc9Cj8e6NWk8WrbsnzEV
	8AG2B/dGhz3IDtdKfa6Qk1ZJsVcDQwuTpzc/A8d675ELxIIiZg/dZxq8JWfMBYSNtV9Yi0QitrO
	P6ekPC/Yztq3RVuB9C/lZvkWOo94V8zGE3tnx/cBCPKx6vonXXGJPVQ+izSQVkmA1/CZHacS6A8
	5hweyFaLjjaewDrbI9I=
X-Received: by 2002:a05:6402:234c:b0:67d:a637:bf77 with SMTP id
 4fb4d7f45d1cf-67da637cb98mr4769671a12.25.1778173129292; Thu, 07 May 2026
 09:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
 <4aa0d528-c911-4537-aa38-6c5b4f9eec75@linux.intel.com>
In-Reply-To: <4aa0d528-c911-4537-aa38-6c5b4f9eec75@linux.intel.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 7 May 2026 12:58:38 -0400
X-Gm-Features: AVHnY4LTpCaUocvOnr8HdC0_P4kURLq2uXkv4Lsm91iDO0ID3yaWysx4SuvmqvM
Message-ID: <CA+Df+jcY4guz0T3oVmy7rG3=+ZWwt+nOBnK2CfHgKBoS50YefQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream
 gap on CFC controllers
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, 
	Michal Pecio <michal.pecio@gmail.com>, nick83ola <nick83ola@gmail.com>, 
	niklas.neronin@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C4FD34EC930
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,intel.com,gmail.com,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37096-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[motu.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 8:12=E2=80=AFAM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> ep->next_frame_id should be used for frame ID calculation after
> the first URB is enqueued and endpoint running.

Agreed.

> Hmm, looks like we are doing way too much checking here.
> All the above are done with spin_lock_irqsave() held, meaning there
> shouldn't be any delay by preemptions or interrupts.
>
> re-reading the MFINDEX (microframe index) register for every TD in this
> URB looks like a waste of time.

Ah, I missed the spinlock, but I agree that the current implementation
involves unnecessary checks.

>    (I'm confident that the non-preemtable loop queuing TRBs
>     does a cycle faster than shortest isoc interval (125us)

That's good. I think a related issue to watch out for is preemption
occurring between URB submissions.

For example, snd-usb-audio submits multiple 1ms URBs at startup. If
preemption occurs between these URB submissions the first URB might
complete before the next one gets enqueued.

While working on an experimental audio driver to avoid this issue, I
found that many test systems required the first submitted URB to
contain more than 10 ms of transfers in order to reliably submit a
second URB before the stream underruns.

> Can I ask you to test some additional patches if I write them?
> I don't have a good setup with frame sensitive usb devices to test this

I would be happy to test some patches!

Dylan

