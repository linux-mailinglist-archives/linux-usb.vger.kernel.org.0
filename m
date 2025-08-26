Return-Path: <linux-usb+bounces-27279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD954B3526C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 05:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2D111B231D7
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 03:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7197C2D3A74;
	Tue, 26 Aug 2025 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jtlT+5lK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317E29A2
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 03:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756180761; cv=none; b=IeIwc2fwYVIQ/HNngNCbMQLUqsIsJ60ERzFqyA8rNT+6o2xDoLpfvRcI/Q/onnFDnSox73r4PUfdzjlOFXs3tjn7HH982zXSRdiL3iQnwUvYdrkwPeIS1SF8dmmU7GoQNwb/nSqDEdDhx6rc49QMg1GXBI1gF2ONZJpbyex+17Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756180761; c=relaxed/simple;
	bh=ku5dJ7mWu2FTM7kxUCxraGoy0CLlKBaMMxyPMUwygcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6UycKZyeUomIBnQbk4D4yiLCB2coRB7TnA1lJ7JFrS5UA3Zi7mJPbS140GFbyjTRjnh/7fqkBV76FsEzqiqk6FSWMMZLc8wZjcJmDOI/2tf6Di0NAj0X/Atx91bALsr86LnkHvTVtkejowL8JZyZuWbBxS36Vot5dbaXLS2y9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jtlT+5lK; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3edcc634157so108685ab.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 20:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756180758; x=1756785558; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yo9WnTx9CPiI42N/g6zWrAbo0QVqmrz9KkiX1kCO74s=;
        b=jtlT+5lKN/fDKoQeheJPYvHAVagqyU+JSZvC8lfa6D7sRr5Cqqeu9a5LjvOwrdjH8s
         2yfgwxYpZX49iRa9M2pUHapFlOe7rKA17Xz7HJBpyMSrdukkfvLutbOT+LoPhHFANyHE
         kX6dKvA3BFjb7hnZl7/W8ZjYwZOivFoDoQ45ZvkhezsPR3dQpEjubxBbfn/d0CoSj5Gz
         o6w8+Z8sNVk8HHR3rvC/AwExFmW5Og8p+Ejt3fG3wOt1r+EgDX5ysNvy+rz5efO2eEsy
         BDS2cf15WMgawERpjq122dIcaxYSkjr97fDduGEuEevjjVBlE9GT/G7/gLdKIB7zDbg8
         NH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756180758; x=1756785558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yo9WnTx9CPiI42N/g6zWrAbo0QVqmrz9KkiX1kCO74s=;
        b=g5Xw2GJwyLuUaGBjW/hPjrlF9Dh0H1OeoEemNXVst5jdwF4cDMmz8Y9UseKrXqhrD5
         1PPF+cvLvTusYUS+4w8ngzYBwYmP0mS2m4+kJOqAqLBCp/waRS7uo6eWrSmMFbaQprax
         p5bIVfaeXrC/HSx4Ww0TGXy7FTXwiznbsC/WFmm4r5b41vBVdfV1tbCwzQl+/9QaCvls
         kEk2BLenk1aeAgcJQEYCi+3L8HKA3pHVGAkXH6TKARambIhvMzkdiVA6/DYkhNwYGwzM
         PrVQMUjrCMH7togqaamLQQdAOuuVTbo3UMYps5qXKP3Sp/1HN1fgNvW8EcQhrFIDHVi2
         /Qvg==
X-Forwarded-Encrypted: i=1; AJvYcCX/iXQ96M3WPN0NUgK+ITuCq7xsY1qvjpLMr2LbI82/w9uardFuR2JDUxeZ9kWAHr8QD5wgyPhpTDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzLhZ80Par6X15S7AMZOvcP6oeAIztCf2HkQ+jnoKUGXlzRtP
	cMutgagRlg3G0GCCYMv2nST1ni3OUVuC1u0Fa064ZoOiZjIl0fW4yR4f6KyiMjOdbdvQHjSNc8z
	GGVrByTHkqGL4LaxvvpDAyWeL3BbaGtBOR+GjVIn4
X-Gm-Gg: ASbGncsms9q/mimumbauSokNID2Lymbrgsr+DNMCFeqpW3R1e4Q8nv2g7f8fXNOrsm9
	uOiOoBjQcHECVnzd9PiUuEXLMOG2VHvzfir3mv+SGYO6byj6qghEjnNHKKB3vrh+RcAh9RMvg3L
	CuShDqz2Fb2VmLhUgPQY8y+p2s0dtVA6qsnWQLSfTtVc0WcbFtc6WceoqViqDX8s2KaFGqGwSZf
	ox2CkZLynH/ROpby07Ysh6qy9G9mV7U6lho6G3986GpxBPJ6bfpMy6Cb32uDkPK2g5OzdRNznyC
	uLlVD0Ai
X-Google-Smtp-Source: AGHT+IF1HMxC9ND4cbNs4BiCvmeilneBno3bxqFqiKxWpcNNcNxgC7LaTwMjUts1hDaLIlv9jLrTZ845fGAPRxN//xw=
X-Received: by 2002:a05:6e02:1fce:b0:3ec:a6bb:b116 with SMTP id
 e9e14a558f8ab-3eea3ff77abmr2110145ab.3.1756180758266; Mon, 25 Aug 2025
 20:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801034004.3314737-1-guanyulin@google.com>
 <20250801034004.3314737-3-guanyulin@google.com> <2025081326-guileless-lego-ec59@gregkh>
In-Reply-To: <2025081326-guileless-lego-ec59@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Tue, 26 Aug 2025 11:59:00 +0800
X-Gm-Features: Ac12FXyoIUTm8umMVeRWuavw5Mt4DMflONeTo04Ip45unGqnZBeUQSgzyrnb07c
Message-ID: <CAOuDEK3KZHgY7Z2mBOuEhuUn8eLfjS5BPcx3kaMqVYLUhOavWA@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] usb: offload: add apis for offload usage tracking
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, hannelotta@gmail.com, zijun.hu@oss.qualcomm.com, 
	xu.yang_2@nxp.com, stern@rowland.harvard.edu, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	dh10.jung@samsung.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:50=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, Aug 01, 2025 at 03:39:31AM +0000, Guan-Yu Lin wrote:
> > +
> > +config USB_OFFLOAD
> > +     bool "Enable USB offload feature"
>
> I'm confused, we already have a "USB offload feature" that went into the
> last kernel release, why do we need a separate config option for this as
> well?  Shouldn't this code only get built if the drivers that need it
> select it automatically?  Forcing distros to configure this isn't
> generally a good idea if at all possible.
>

Based on the discussion in v13, a new, separate USB configuration
option is required to avoid core USB functions being enabled or
disabled via an xhci-specific option. The USB offload feature involves
a sideband entity that can access xhci resources, which, from the USB
driver's viewpoint, means USB transfers are offloaded to this other
entity. Therefore, the name "USB_OFFLOAD" was chosen to reflect this
functionality.

>
> > +     depends on USB
> > +     depends on USB_XHCI_SIDEBAND_SUSPEND
>
> Especially because all "desktops" do not want this code selected, so
> having it in all distros feels like a waste to me.
>
> thanks,
>
> greg k-h

For the config keywords, we could automatically select USB_OFFLOAD
once USB_XHCI_SIDEBAND_SUSPEND is selected to reduce configuration
efforts.

Regards,
Guan-Yu

