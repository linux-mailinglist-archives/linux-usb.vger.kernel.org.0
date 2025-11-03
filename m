Return-Path: <linux-usb+bounces-29998-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D582EC2AE07
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727F63A8725
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 09:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CC32FA0F6;
	Mon,  3 Nov 2025 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2NVrl1KA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159302EAD0D
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163699; cv=none; b=Lxm4OEKfyrzLgqBT4LwvSljSpRrFEaAyZT7akReC/fjDl52iDakIHiF2mqbchH8u3Xj7vQpoW9fTxWy5WIyVM/hybQAjWToaBWMyWmR7nTVhob36Z/9wg1icySN+rB3MjvX6UJ1zcK2TQTAO5u68hgPDATtz8fUwseCQI1Eq6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163699; c=relaxed/simple;
	bh=/dmNkb2EHt4aT9LXPECTFOXPAeXzX851nUixaP6lnpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoO92P8GAMLYu0jnQrNCULh4toHgjDauseZ+fglWQSuAPL3vNREYBMfbdjuu440pouiEIiUu8KY4h8ybLVpAol22hHL1HywsdKOwZeux6VvmtvW9ze0IhSD3GvFzAoN1Le0ace5dN3g4NTxhnsfebE9hU2VKhBQx1f6lAv2RFSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2NVrl1KA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47105bbb8d9so71885e9.1
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 01:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762163696; x=1762768496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBgu/KIV+Xulq0rdAJyjd2BGM79XVBUuPkgRC3lpFzA=;
        b=2NVrl1KAYPFpQicWFXpaAY8SMumhvfK5UNk40JHaCtwBBpSsrE83eGX0iwhUsvTcKw
         91AxNzwpaHd9YIY888dbFmDUmX9qJjBOniW287r86caHSquYou8NIAgcz99lmJifUUoJ
         BIWYKZmfPOGeJQn4A+6O8DsPX0RCIJncAiWCKkxS3mjzPXi/KRbtHmqfSW6GDOW3KJSk
         i5Icpo0p7CvMpv4wOG+qUmmNmuiaZDEGX8tKx0Dzmt+Ft1fZ/jfdhYxAKh3w13t/dsHQ
         p5XedKQG9XXesFpwV8weJ5QTpIsRAQxIvodEDbnadYBwXytTkEDMxZGxCnWLRENQ/7pv
         MBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163696; x=1762768496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBgu/KIV+Xulq0rdAJyjd2BGM79XVBUuPkgRC3lpFzA=;
        b=BEf756g4RnR8ZfvGC0VQv4UsjGqJAC2E5yFDuXV8IEGJss8WOrI5cDGp8eXtrfCwWz
         s0UD4yL7phflSNCVYNPlyrbfh15RAG+bYV9tSKdvjSAvLngc69Uge1iu72o6xPO7eSoD
         1iUCiV4Kr+MOkh8Iz4E6fCUDTISCXoZwvCw61OQpb2IOcLg+lfrzLbvOS/6wQZZuEC+7
         ITNczpBjSZc6tbk0W1jkSyLT2JDvIf7eF3NsAPJA89vNDv43frxVt5FOs3glcMja4isZ
         dVtsm4f/Kgvm4XG57inEBe1Fr8EhLro+LVslO+MzCJsukDyvXxpJgNIbqEviwKlcHRVl
         dGYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZpV9wrteCCZEsqHG/PeCRvP3WWCabG8kgKT/Rov6qOgyO1JzVFDsLjKM9nj99upEhfpmUuN3erj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI3QqiLOu9htkuChgFZu2eEUC1E+54Rz3PQqamMcAT6vp8/UwE
	0/d+stg3MULmIRnnSERXIzi9XCRvDUUH1t/itRbViNwFTLDcNKx7CUT7n2rkGmu5Y56twDOj995
	yw7Svr9n2K1ingmPRu8o44SOCD45UBDy7TRPH0Twt
X-Gm-Gg: ASbGncvjcoq/zkczosu9BqpXHEujS7QZtYiSq888aFdvTOgEEdQgQn+GpLy8N1cOu93
	nPNcnIgmPgELVStD37zlG5pZgm42dVHDorn5+lSW7cXWl5L4+1kM3G63UzGBsU8Q4sdIyx3gGP2
	smsYqL0kWCH5/2Z+aYGr1lLek3B3V+TueezJA/xTq/p1MKeWO7lgeF3VYN4BKA5eKd+tRbk6ubG
	4VNRPwKX1+U0hh46QfADFsUOCEf+FqGbdQE76A3O4ngRVqUXlGRQhRDnopoc8psFA0nb9vrGA==
X-Google-Smtp-Source: AGHT+IF+wwbvv+ojwATqA5nXuWhHkTQrvhXm59/nkdbf7TSxwRJf0yjjHog5e2OldYnM7FAj7dfK5SxhG6XWraf1Fr0=
X-Received: by 2002:a05:600c:a209:b0:472:ce95:eb44 with SMTP id
 5b1f17b1804b1-4773e15b931mr5435645e9.3.1762163696220; Mon, 03 Nov 2025
 01:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030-auto-cleanup-v1-0-db30584fadfd@google.com>
 <20251030-auto-cleanup-v1-1-db30584fadfd@google.com> <2025103010-awkward-gentleman-150d@gregkh>
In-Reply-To: <2025103010-awkward-gentleman-150d@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 3 Nov 2025 17:54:28 +0800
X-Gm-Features: AWmQ_bmI6bqWoAgz5lZAr7xf3NeBr27ZSoQ4GeEXp10L4-yAusuP75Sa2Y4-8Ps
Message-ID: <CAKzKK0oAAFRXBALv38yOFz+4cyaM5B6ui8+WRXeM-sG32rUfJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: gadget: f_tcm: Use auto-cleanup for usb_request
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks for the detailed review.

On Thu, Oct 30, 2025 at 11:33=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 30, 2025 at 11:14:19PM +0800, Kuen-Han Tsai wrote:
> > Refactor f_tcm.c to use auto-cleanup mechanism for usb_request
> > allocations in bot_prepare_reqs(), uasp_alloc_stream_res(), and
> > uasp_alloc_cmd().
>
> Using guards are great for new code, or for bug fixes, but please don't
> just refactor code to use them for the sake of using them.  It makes it
> hard to review and justify the churn, especially when there is almost no
> code savings here at all.

You're absolutely right. The benefit doesn't justify the churn.

>
> > The explicit nullification of fu->..._req and stream->..._req pointers
> > on error is no longer needed. This is safe because these pointers are
> > only updated after all allocations within the function have succeeded.
> > If an error occurs, the fu structure members retain their previous
> > value, and the existing cleanup functions like bot_cleanup_old_alt() an=
d
> > uasp_cleanup_old_alt() already handle stale pointers in the fu
> > structure.
>
> This seems to imply this is really fragile, and tricky, and maybe not
> worth it?
>
> The comment you added kind of enforces that feeling:
>
> > +     fu->bot_req_in =3D no_free_ptr(bot_req_in);
> > +     fu->bot_req_out =3D no_free_ptr(bot_req_out);
> > +
> > +     /* This line is placed here because free_usb_request also frees i=
ts
> > +      * buffer, which in this case points to the static fu->bot_status=
.csw.
> > +      */
>
> Which is "this line"?
>
> > +     status_req->buf =3D &fu->bot_status.csw;
>
> This one?
>
> > +     status_req->length =3D US_BULK_CS_WRAP_LEN;
>
> Or that one?
>
> Using guards for buffers for other structures is rough, as you have seen
> here, I don't really see the benefit at all, do you?
>

My apologies about the noise. After introducing the auto-cleanup
helpers recently, I had misunderstood that they were a preferred
pattern to proactively refactor existing goto logic with.

I see your point clearly now that these types of guards are best for
new codes or bug fixes, not for refactoring-only changes where the
benefit is minimal.

I will drop this patch series.

Regards,
Kuen-Han

