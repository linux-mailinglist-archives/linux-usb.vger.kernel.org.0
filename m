Return-Path: <linux-usb+bounces-6878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7597785F4EB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 10:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0316D1F21EDB
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBF038DD8;
	Thu, 22 Feb 2024 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0qw/iTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A4381A1
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708595179; cv=none; b=dN8y8+7ACrg1V0Rfze9pvC4CpbwmUym4/BONMQkE+1N76a7FkpeQhRHfI4r/o0Vi908S1NCDNkcGFGGARQ3/PyLqVpWPAjNP54RsUusna5J8aK8kfLqDogts8yMnYTzVxHF9aM3RHiYIVs3a4jExz7fL7qv9sZU6c+9rtye4ymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708595179; c=relaxed/simple;
	bh=OXpl8KtnkdumkkL/oL3Rll5PWQ3rF0whL8FYYh60i3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fu9X+BgSziCIS2IjDB1YgSNFuW1pDV+JW/JI5k8ABz++U6mkM7wIqP5QBU+6Kp01auB68jb/6cEyNhooYSOFW0KVIsN/4VsVfkKrQLYh9Wc5Fb/TGXT8IUdBCsRBrAw58Qx1v2t/d2ho9NIq5HWyYXYth+zKiANKNZNhreykBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0qw/iTE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-564e4477b7cso7156a12.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 01:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708595176; x=1709199976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO9OLuYsn9M5g/f+gNkO5HVcagw8JPRKpX2lST/Z1zc=;
        b=s0qw/iTEvikM/obz5ZM4wbhfhISNkQrUa7hFn1rkYXEX6NvzKwW4mW0NOkfSii1ngM
         3h/2izEzsqN/lNjRF4KHGhIjUPfk/sDhDsiqp8BT6M1xii85NrdM3BmkHgQD0qldxeni
         VdrbZl/X5zeE8BwKgPQt47NC56WUBKWkbbNlOcpONVsa2OAH+KH27TIH/0Ju0fEuZASO
         8OSLNlhrqmDLLblu3TezLmiL0C/QOCCyQzPQscnwusvE6X2fKuPi68+u8bih4kIOSGcW
         JA6/PaZTSk+SgUOU9vdkKZbXP/0m7CfVYwkwiuTrrgQ9pBHKdzgx+zT5Yx+axzx7txUf
         jLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595176; x=1709199976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO9OLuYsn9M5g/f+gNkO5HVcagw8JPRKpX2lST/Z1zc=;
        b=ecjN1X+aFrjav+0YPhDh+hlrOltHGTCQpp0LUYtYBtCerI45mYXQ74x7IajVV6G5/W
         fUY9FpZoaCJAOyNvfu4oT0tR/8DfFTI70drLdhtNEovRHqaQ8BsG8w5Ff8bsTDwNzTx+
         ZmtHlfJr8VgUjJ+9zqt1k6cpuv2bCaI7zSFukeCissdmmpBphJ5v47jRxsdJstdeihJH
         OgB53m216FxvLC/SUiQ43DMReC5k5F5015PxBGCGxv8in5bWjG19EkHkRPcn/WgM51Zl
         wubvL1FONCGXO+P2Lz5n/QDxh0jZ52KC1eEIlpdgx/m+m1Fl0OseyLKrIJbuP97TteQY
         CQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWCqJuQ65lJYC3o/xlMnH6oevG1JXdSQaOYdhglKlZ/OFTe+zuHfaswq/EQSuFPmbCCeFRc6TMOSRMnqKrdyNL/4y8XwONS4/Y8
X-Gm-Message-State: AOJu0YxCoppSzqi5xukMH/LI9CLdx0Y5oh5tpLIkyZ0t6Hd2TKnj28jV
	ZlTxQcIf8Vh0NgGOHrYwV4BPjgDPwC84ZBas5Z6NOMGx6Rn0ng2wslGd0eXfAZy3CZeR/ni4hmS
	KW1EaxCDund0mmNzI/VnBKY5K+Ws3tfRoUTyh
X-Google-Smtp-Source: AGHT+IHM+zVGs1vfCf6mEt0YThwspRts0ylLL/r+issShzGze5aBxEviehGvjwwmjLZ77XUgJQ4G1x6+ofxUaAbkDfU=
X-Received: by 2002:a50:9f04:0:b0:562:9d2:8857 with SMTP id
 b4-20020a509f04000000b0056209d28857mr385846edf.6.1708595175380; Thu, 22 Feb
 2024 01:46:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219061008.1761102-1-pumahsu@google.com> <20240219061008.1761102-3-pumahsu@google.com>
 <0b4464eb-631e-4c9f-a7c8-3451be15d8b4@kernel.org> <CAGCq0LYFMrFmxeKZE9g-O61+N03rJoGL0XvXJVya0Yx-ZasvBA@mail.gmail.com>
 <bea850fe-19e8-492e-b885-6d01b389c32c@kernel.org>
In-Reply-To: <bea850fe-19e8-492e-b885-6d01b389c32c@kernel.org>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 22 Feb 2024 17:45:37 +0800
Message-ID: <CAGCq0La_XHJw4cscahiDWM-n03dWf8SUQ2Zw0YZgHyXwKcURyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: xhci: Add support for Google XHCI controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	Thinh.Nguyen@synopsys.com, badhri@google.com, royluo@google.com, 
	howardyen@google.com, albertccwang@google.com, raychi@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 5:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 21/02/2024 10:31, Puma Hsu wrote:
> > On Mon, Feb 19, 2024 at 8:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/02/2024 07:10, Puma Hsu wrote:
> >>> In our SoC platform, we support allocating dedicated memory spaces
> >>> other than system memory for XHCI, which also requires IOMMU mapping.
> >>> The rest of driver probing and executing will use the generic
> >>> xhci-plat driver.
> >>>
> >>> We support USB dual roles and switch roles by generic dwc3 driver,
> >>> the dwc3 driver always probes xhci-plat driver now, so we introduce
> >>> a device tree property to probe a XHCI glue driver.
> >>>
> >>> Sample:
> >>>   xhci_dma: xhci_dma@99C0000 {
> >>>     compatible =3D "shared-dma-pool";
> >>>     reg =3D <0x00000000 0x99C0000 0x00000000 0x40000>;
> >>>     no-map;
> >>>   };
> >>>
> >>>   dwc3: dwc3@c400000 {
> >>>     compatible =3D "snps,dwc3";
> >>>     reg =3D <0 0x0c400000  0 0x10000>;
> >>>     xhci-glue =3D "xhci-hcd-goog";
> >>
> >> NAK, that's not DWC3 hardware in such case.
> >
> > By introducing this property, users can specify the name of their
> > dedicated driver in the device tree. The generic dwc3 driver will
>
> DT is not a place for driver stuff.
>
>
> > read this property to initiate the probing of the dedicated driver.
>
> I know, but it is not a reason to add stuff to DT.
>
> > The motivation behind this is that we have dedicated things
> > (described in commit message) to do for the XHCI driver in our
> > device. BTW, I put this property here because currently there is
> > no xhci node, xhci related properties are put under dwc3 node.
>
> Sorry, you miss the point. Either you have pure DWC3 hardware or not.
> You claim now you do not have pure hardware, which is reasonable,
> because it is always customized per-vendor. In such case you cannot
> claim this is a pure DWC3. You must provide bindings for your hardware.
>
> Now, if you claim you have a pure DWC3 hardware without need for any
> vendor customizations, then entire patchset is fake try to upstream your
> Android vendor stuff. We talked about such stuff many times on mailing
> list, so for obvious reasons I won't repeat it. Trying to push vendor
> hooks and vendor quirks is one of the most common mistakes, so several
> talks already say: don't do this.
>
> > It will be appreciated if there are alternative or more appropriate
> > approaches, we welcome discussion to explore the best possible
> > solution. Thanks.
>
> And what's wrong with all previous feedbacks for similar
> Google/Samsung/Artpec/Tensor vendor hacks? Once or twice per year some
> folks around Google or Samsung try to push such, they all receive the
> same feedback and they disappear, so I have to repeat the same feedback
> to the next person... Please go through previous patches from
> @samsung.com for various subsystems.
>
> Documentation/devicetree/bindings/submitting-patches.rst
> Documentation/devicetree/bindings/writing-bindings.rst
> +other people or my talks on Devicetree
>
> Summarizing: Devicetree is for hardware, not for your driver
> hooks/quirks/needs. Describe properly and fully the hardware, not your
> driver.

Thank you Krzysztof for the explanation. I will study and explore
the possibility of integrating the stuff we want into the generic driver.

>
> Best regards,
> Krzysztof
>

