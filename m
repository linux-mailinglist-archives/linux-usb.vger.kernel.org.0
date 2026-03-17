Return-Path: <linux-usb+bounces-34974-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DItBAq+uWnJMQIAu9opvQ
	(envelope-from <linux-usb+bounces-34974-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 21:48:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C32B2657
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 21:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C922310BD3C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 20:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2F838A731;
	Tue, 17 Mar 2026 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aT7Sj6Ba"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED3301004
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773780421; cv=pass; b=IdqutSN2VmUKFrhvvFXEhKd5hpA/RQWoIZ6j98uT3a8I2E1zAe/mfXhZSMaANzrb+LI28T7AHk4eHlBLLFhFKHX6mGvbbKNG1SH6eWhQ+X5DUKy7+ovLuugLHrYi6B5ZOheipUz3LeytaqSUtweq5TesGFp9QllDEsEcPqmLAGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773780421; c=relaxed/simple;
	bh=1UqOfPikprRq6BleZK7camV+7IT1c8k2nbOkIlVFbsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATfZwJjGCRD9MAeN9kSQLRpcuNVlbJs15I589l3I6sMDP/yIlrfRGslvRojSBIeTd69R1BLdaH/KPFFwmc7GRLsHNQDr/RUSvKOefLxKhbHcbtEXUvF3kennrg6LfwsJqW7Sya/kZCXH7ZepTSS/FQWbIV+jdtDZKiof2b3S6RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aT7Sj6Ba; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509069a7a7fso163241cf.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 13:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773780419; cv=none;
        d=google.com; s=arc-20240605;
        b=IS8xARrjmJ5SSeWmnaAh0jn9fS65dmni+L5veMV9c0Fno+mK/btduWGmqPFX3l8x83
         rTS7DSeDQ9whGBj0AAaVtsxeARsRdLZ2bhT8fZq3i5q3VsRBzWQ7+WJdrJgOCYHuD/QX
         9C3FZY1ibQidC1qmm2sezF4qGFNeGhYEYjKzkKXYxMfmpMrfqRx4DzzuV6nK2qYjf3XO
         3WwVZ6URpG3BmzjjyTiIj2x8n3Nf4Rr2Oz7x514D6B3hod612Vc/C2rTJr2tJwJDYi+P
         DdfKueWmMcANLvshwViv7DiH6KWu9srGTONBlYkV2jCZwmUGymVAQ1hF8WWxTiYeq2ru
         z/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        fh=ZF1JWAqkTjc8mRCjjYVVI+JWCBT8RP5KBQLr/lmpUxI=;
        b=ZCyTwBplTQX6DhetYl+sgp42lSmcS0FzVXYtmXqQJJ7jzV130qKAPqMOdpmYpnXSo0
         Z87jaz90NlTr1Yg0Uou2abuIV8NYuJmMrZvk8IXVjQyvn2dN1oVhZB4vCxqKZFiR0H9n
         RJZkYj0zy8Z+k+dQyR/WN3J70qpFadB0e+3ONNu7tUkMnW4I3duGjQ1W+RDthbKyE42H
         xgQiSuyEo7PKszJPGQQy0HsoK/4Rmoc6CHbAy5zp6TRC7tMRQlr3mGMfbvQrMxxiBBCJ
         9T/Ljs707TJGUtrdaklaoE+15urTThaDEeE4qG+1txnWE9iZWn/qTShVlW2trn0qt/2Q
         YTBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773780419; x=1774385219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        b=aT7Sj6BabzKBx878IlyyUISb74AkjW1PDT9d8ftPgN0fauBbZWRFuv+dB4GbvpUYBM
         pgGX0VEnK/0aeJ+tT5aWpvHsHZrRMQI4IjjqDNEYnqgb1NkWbAGGi2N13BODKGsPM6kx
         pzbeQ+5HlMWVXwh8rcNvNskXjn1PTx84Lth2CdGfH10u50xLDWFqcNL4r07twYfgEQLt
         CrZlYwOLMQ2zQsTcd0dL/jLkpXShuXqYjFXtmU2AMWCEfDe2siP9Oz4wVgG3pzNvfbZZ
         ed6lXaCTM9BFRkRbRWmRJpL2GRVxsJhjeISGUXMeKVx0DlHK/PdjdflCAjuDA/Cu0u/4
         IHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773780419; x=1774385219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0g7Ha5KuBuAQFnpUh5T9xFIsqyLN9o7sep6G8COfJE=;
        b=k5KKHSR+cBdDje2UTaNNQnipCKAjrWCzhgLolFP7HeKpa6AldkCJUaGjy2sOCiNJ3b
         Iuc2lylypfcnomd5By72TrNnyb5EhnY1xpIU0yxCh+4I5cqkRPJF0fy9qF1PWt6B3Ecf
         J812vPqvXuFwU9nIep7MGdpkzxWFqrBFkcR33RgLEdv6g/CV+EJeElmeFXI5i9DOkxo9
         NB8nOA8bcV0cplXsuxIgW22G27CxpwqO54Ho5Qh6w9oHouCI0gmblEjd6rcoogyxHgcP
         PaO/MVvLhzdqeEZFvCQdMAddTO8wnyvJSZ5ThvwrfOeOh7m5m1oNSRTJuc8E5FPoibDv
         JAIg==
X-Forwarded-Encrypted: i=1; AJvYcCXd62IpHxYPgxQq1LLf7VpsrFiwbrOsxmcjAJRzGt0z5IxoXttDlr2o3+x7T9NItLOiKXfzRxBefKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrumwvymzY4TXt8D06xJTLY08rPBThrLBf+scg7sGeQd/xcd3Y
	uSEzSKG+rBoBM0vsUscUU2+EwHKB9xZXVH56eWl5BjeFnOVMBiN4c2LttRnLS+Pa+k8goT4vrGg
	CH/CxwwmlrqL34m/nsVzuqcVI+KzMT18pr1NK4pRKh7UZlChYKWu8HQDD
X-Gm-Gg: ATEYQzzSw/6H+OBI2ycGsI6EgHZtjlrhdzedz0tgepc4U4LA3Uubz3LvcaFzUR+X8hm
	+5AAIxTXefm7z88UPv1EdCjTZRadBsBjw2cd4Q7TbTZBTmyqLj1ktp0bVBMF3fhoQQ7R+9pshup
	Oa1mkORXYezTPubw9RdbEJx9xZGPhfBZQGTTksVokQO3u6118MjlB9wn7FwWwlt3b8aTMRD+A3p
	n7WM8udf0xzMG1NnQyxLL6GDS8TqWCJLKTsTMQtxxVTgT61vbIiKyQHKiiSYFpXkeQl1MjZs7aj
	wD+oBA==
X-Received: by 2002:a05:622a:452:b0:509:25d8:9991 with SMTP id
 d75a77b69052e-50b148afba4mr3544991cf.16.1773780419110; Tue, 17 Mar 2026
 13:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309022205.28136-1-guanyulin@google.com> <20260309022205.28136-3-guanyulin@google.com>
 <2026031115-unboxed-spouse-1dcd@gregkh> <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
In-Reply-To: <CAOuDEK3k6nyiHxhcL1kv=QNQaZMF6ms=sLerSZ5JBc5WBd7nAw@mail.gmail.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 17 Mar 2026 16:45:00 -0400
X-Gm-Features: AaiRm52oebfHWYMuJ454hQral2Qma88MIrRh798G5MT3B5G2QN7X35-2OnybgKY
Message-ID: <CAOuDEK2pyt4nKWxXXwtzgRuP6u9kvi_Joe8Ec8qDDHVzSue1rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	christophe.jaillet@wanadoo.fr, xiaopei01@kylinos.cn, 
	wesley.cheng@oss.qualcomm.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34974-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,perex.cz,suse.com,quicinc.com,kernel.org,arndb.de,wanadoo.fr,kylinos.cn,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanyulin@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 881C32B2657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On Wed, Mar 11, 2026 at 5:31=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> >
> > You have multiple levels of locks here, which is always a sign that
> > something has gone really wrong.  This looks even more fragile and easy
> > to get wrong than before.  Are you _SURE_ this is the only way to solve
> > this?  The whole usb_offload_get() api seems more wrong to me than
> > before (and I didn't like it even then...)
> >
> > In other words, this patch set feels rough, and adds more complexity
> > overall, requiring a reviewer to "know" where locks are held and not
> > held while before they did not.  That's a lot to push onto us for
> > something that feels like is due to a broken hardware design?
> >
> > thanks,
> >
> > greg k-h
>

Hi Greg,

Thank you for the feedback. I understand the concern regarding locking
complexity and the reviewer burden. The usb_offload_get/put functions
track sideband activity that runtime PM cannot reflect. This is
necessary to prevent the USB stack from suspending the device while a
sideband stream is active. Ensuring atomicity requires orchestrating
three asynchronous subsystems: System PM, Runtime PM, and USB Core.

To address the concerns effectively in the next iteration, I would
appreciate clarification on your primary concern:
1. Preference for fine-grained locking:
Using USB device lock ensures atomicity across these subsystems, which
is inherently a device-wide requirement. A fine-grained approach risks
races during concurrent software events, such as a reset occurring
during a runtime suspend transition.
2. Preference for improved transparency:
If the coarse lock is acceptable but the implementation is too opaque,
I will refactor the next version to be more explicit. I plan to
include device_lock_assert() calls, __must_hold() macros, and add a
"Locking Hierarchy" comment block documenting the vendor-mutex and
USB-core lock interactions.

To clarify the "broken hardware" point: this isn't a hardware bug.
These races are triggered by standard software events, such as a reset
occurring while a sideband stream is active. Please let me know which
direction you think is more appropriate for the kernel, and I will
refactor the next version accordingly.

Regards,
Guan-Yu

