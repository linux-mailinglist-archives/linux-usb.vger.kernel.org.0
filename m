Return-Path: <linux-usb+bounces-9427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A898A8258
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 13:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5D911C2277C
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 11:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7744E13CF88;
	Wed, 17 Apr 2024 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ru9R4vdv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5AAD48
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 11:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713354575; cv=none; b=O5UmvJSRbdM1RSZamKpbcBlxt2EnQXFrNqcnM8DyfkFp8cUvjNn9x7XAt9JYAWtF9yQ01Nq5wwYP+fNUki/QKTJtTEP+3tvHuovXfJcOozfl/l1q9HkGqpjIXIm81GpVNBHwzYrQAYbHt0Q/oXhpL9quvbfPuFRreF0SA/7fPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713354575; c=relaxed/simple;
	bh=ClJidy8Ue7FH3S+CcJ6CcfjM4DE+NE8HOLwf1T5krV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqlN73f8MbxxzYwqmOfArx1qEQbpP30cH3kKVcCVeiA9HRMjlhOAyESN/SyoebVjo7iooVEY5ndMrmbxN9wfBh+5kKur8GFgy9PDDBsEk+G6GP2OJ1a0IsJkqONwowgfGacgriqnbHbxc5wcdDx9XO/PLn4W1QIyjOI9vBs7DzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ru9R4vdv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-418426e446bso55745e9.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713354571; x=1713959371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROcY5xU6WLoO9x6w2II6RlDDMynjPhmXGBiDF2pK2dw=;
        b=ru9R4vdvg2JGhdNBrmMzmyRVXQFcv9kXuisBSRxxjKBeLwMVcz265ja5l3OdhfaZKr
         Ynrs1pwl8DE+TosdRfpntu2M4csUgWdJzVIcGFa9R5KBrlYJbH1jperadfVITwj2kyTr
         153RnnQBY6ooSKwsk5z2dLawmmGCoVpjxHCxoBX6MtbpDyiVEBNrL8ddrJNjCpsrJLxl
         rwG5wT8LhBMFfXitFLVfsT+LNcg1J0j0tq7o1de5WTiF67B3m8lixGqOAgO8R3XxoCNR
         bO2qchd6lzTpFB10mKS/WUTBvf5X7pp8LBaod5xzq11mT6ZVWIqDlF/bJivMewytSwAO
         ip9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713354571; x=1713959371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROcY5xU6WLoO9x6w2II6RlDDMynjPhmXGBiDF2pK2dw=;
        b=Qe3i3GtceasuPyZ0kua5amTL0IV/6GgbwSKZjnWQa/1DbyKr4CgUShoeWPAlX2+Otg
         pH57bXChXQJf+9X2oqzemh3t3nlQS8qyF8fnD+6fewa4BqJjtjqGublPlGOhCDafcLRY
         8gY9Q1Wlkcul66YY2KdxMTxS/zwpiLP9n3z14z7RTdux8iSvLnqnzdctLdtKkVR5cJzG
         qzH/SCKLB1vONFKPxf8aMsgcY6cqH0g9wr/rFxtSHja8B5SpLtgRdvPyrVmu1HMcXHBn
         /WdWo2Ayc/JHxWjymdrmuro5La/NnwEWO0ZTz+kjbmTwpiaddGWyWapKtcGsGHoig8od
         K1TA==
X-Forwarded-Encrypted: i=1; AJvYcCUIOCajrlh/s9gOcVabuiGM6jTw0CiGJeO86RVzXgFkEw7xITtTMtzPV2+Jf0MlSgIAnJjZcyYzqr4Z0HCfzYppg8GaH7eV5wj8
X-Gm-Message-State: AOJu0YwG8fYcS8BjGkIBkB8KnUN9wKthh/tEGOWOXrMACPqa0GnxVN/a
	KJFQQkHKXoD0WndWXbLJ2dGuq0sYtH74+ZCGmATwzXZgOGcYHc1AP/+p+zt5tLwC8wLkWuIxgla
	DgsvLHyQwbWbJPDtOqgZocyIBAOoXv9v3CE/n
X-Google-Smtp-Source: AGHT+IFkOgXrHXToLFJwFBCxpG45TpWK+XOckeYp8njxhDbDTqWND4VRrcd+DJdJpfa+LGdRg0rFqadzmvgrA/lmUvE=
X-Received: by 2002:a05:600c:1c06:b0:416:bc07:a3c9 with SMTP id
 j6-20020a05600c1c0600b00416bc07a3c9mr186474wms.6.1713354570572; Wed, 17 Apr
 2024 04:49:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
 <CAJnM4-xYjmYUa4ePaYG3P8O3CYCWOMJwF=e7D1Pv8vvk6pBtNw@mail.gmail.com> <20240411002156.tlyqofiw7erfq7eo@synopsys.com>
In-Reply-To: <20240411002156.tlyqofiw7erfq7eo@synopsys.com>
From: Manan Aurora <maurora@google.com>
Date: Wed, 17 Apr 2024 17:19:16 +0530
Message-ID: <CAJnM4-zq47f_1NWAfoKpm1Z56UTKjcCrMrjVunMC-3JO=cnLyw@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Youn <John.Youn@synopsys.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Will McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2024 at 5:52=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
>
> On Wed, Apr 10, 2024, Manan Aurora wrote:
> > Hi Thinh,
> >
> > I'm working on a patch to bring EBC support back, I had a doubt
> > regarding some of the required corrections though (inlined)
> >
> > Please take a look and advise, I'll proceed accordingly.
> >
>
> >
> > On Fri, Feb 9, 2024 at 6:55=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synop=
sys.com> wrote:
> > >
> > > This reverts commit 398aa9a7e77cf23c2a6f882ddd3dcd96f21771dc.
> > >
> > > The update to the gadget API to support EBC feature is incomplete. It=
's
> > > missing at least the following:
> > >  * New usage documentation
> > I will address this
> > >  * Gadget capability check
> > >  * Condition for the user to check how many and which endpoints can b=
e
> > >    used as "fifo_mode"
>
> > The easiest option seems to be to add a new function that lets users
> > specifically request
> > fifo_mode endpoints eg: usb_fifo_mode_ep_autoconfig_ss
> > This function will cover ensuring that the device supports
> > fifo_endpoints and returning a suitable
> > endpoint (if available) and NULL otherwise. This can be indicated by
> > adding a new bit to
> > the existing ep_caps  structure.
> > Does this seem like an acceptable solution?
>
> That sounds fine to me. For the naming, perhaps just name it as EBC for
> External Buffer Control and provide proper description in documentation.
> "fifo_mode" may not be clear.
>
> Maybe usb_ep_autoconfig_ss_with_ebc()?
>
> How are you planning to implement the above function? Are you going to
> apply the DWC_usb3x specific requirements directly or implement
> gadget_ops->match_ep() to properly return the right endpoint base on the
> endpoint desc? As you're aware, EBC is only applicable to non-streams
> bulk only. Also it doesn't apply to full-speed.
The issue with implementing match_ep is that the API doesn't let us
specify that
an EBC endpoint is desired. What about adding a new function to usb_gadget_=
ops?
Then we could apply IP-specific restrictions in one place.

Speed can be enforced when we attempt to configure the EP
(config_ep_by_speed etc)

>
> >
> > >  * Description of how it can affect completed request (e.g. dwc3 won'=
t
> > >    update TRB on completion -- ie. how it can affect request's actual
> > >    length report)
> > I will remove the NO_WB bit for the EBC endpoint and leave it up to
> > the user to enable/disable this
>
> Thanks,
> Thinh

