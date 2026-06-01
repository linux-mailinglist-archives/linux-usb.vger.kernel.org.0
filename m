Return-Path: <linux-usb+bounces-38222-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JHSE0wsHWplWAkAu9opvQ
	(envelope-from <linux-usb+bounces-38222-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:53:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A861A6CF
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 08:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0ECC3032775
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 06:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C94237FF4E;
	Mon,  1 Jun 2026 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="kq15ppG6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0A3803D3
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296640; cv=pass; b=b0BOl1Uas+L0eYIsnISH8/9/IvEC3OBSfbQMXUiGVPgunsf+daJfNjS5BawlVkfMgMIJeNEyYn5PkfJT4U01BrOIRPq56INZtSp5pUN8R1177iv6fgvx4rnGGfnQldUd1qVla4foO7Wt6W0vBRVzMBYQEHAyrHmLhcbeEg9z5Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296640; c=relaxed/simple;
	bh=Gq3Fhr3JodMbCB04VWPzW0cq22DDA5eKs6XS+mLoUWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeZr28PadmZcvwVAoS6waMliHnG869nDB2HCvj6IXaRdDma8586eCe6z2mXb3s4GYQQSH8bHoTzk9E211wxKDxxBzfWSL0BQjb0xl2eefghlp5FXHZkSI61viUuV1chnLNNKOtvJhAdn0F6OUNXEOyiUy91nufxmCodaaJh64KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=kq15ppG6; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B8773F180
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780296634;
	bh=GYjw/HYSvquU6pfEeJ7tubCnhoXG1vRtQA5lD0F2b7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kq15ppG6XmbbUAf41rKMsuuGdreZ5oMQhZVsgiN0iXbU8wLGaLF5eY53ZM41xHVam
	 WKC0Qy7+KZEw2b/qDC5lRhiqvz6Loq9YFv5gQ4o6z6waZA/jltbY+CfwEZ9vurstYS
	 XUfsQ66+3jTTUw9YWCp3nJs8fxa0zZ5F6VB/1b+6J0mD3YG9xKIhX4SRcbx9DMxYwK
	 M0Na4JpebRh9GP4smf7qXFDGeRY+6l51xGTKYNo+esZ8aw6ELFiuObEpo9qui3paXD
	 Ny8+10azTNFrRfhWvZK6jvqDfxsIYz54lzFSXsH5k23iu2Y7HCBEW2Mlq5udbB9X6S
	 BuVvXKe5sxkmQ9db/K6rSHTEZCo8KeS7ekbJW1PnpUTLfx+oWn2Ur2Mdjsol2L7vzc
	 CJ9w8Ucjpw6HDmYZ0I6IZsV30IaCeuID+OV7iJ8WMIzStDZ4UiBGu2XYgUl+Sl+xuD
	 IoBDPGTd7lo6JJZvuq915ydAbubXm/ZyCoh3REPEIa1lmjRMduvdBwZaKVsdHElOEL
	 9ki3IQOvrx12OHl1I5yiPTOYbarde41l7fnw+srckrsuhasOPXCKP4JQZzaI4vgDiq
	 UdVLUCGQQq3SFoOwqHbU/0hzB92w1OpuTgPXsKAhrcFx5N3m7Y/gdU+T9Mqc2ZUtsT
	 IWuYB3Hq9bOGM/dYhRfSaWxY=
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43cceb2fd5fso111532fac.2
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 23:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780296633; cv=none;
        d=google.com; s=arc-20240605;
        b=hVFfOBbCBwL0Gy8kPmrx63m/teIqOZZjvK/XCvjgdIG0hC81Fi8nym/uWtsR8/NJA3
         riM3yk06wv1pB76jEZuuhJRiMVI8KOCkKTRcyMWqB+D+RDpcAZtooAFcSil7YJLsKKse
         JbFZGut7w6Dkin78jVnnZriD1gU6vPb/xR1jmlqPauxmh48Z7gaMn7AmeOb5ptr+EQX1
         DIbcspY9ePdVD8Z6bVMpL3ZAvOH0Hc7nKaFeRtBgrOAe+hNjy+Q12b6ceWlKyRcuwQst
         4I2NKZ2e+3tQFWFbzPqzpDo385E08eufvxchxrqadoR+cCghT3qMej2/o3GEBt5sMefz
         kYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=GYjw/HYSvquU6pfEeJ7tubCnhoXG1vRtQA5lD0F2b7I=;
        fh=WeUPOv/pNLXT6jsEtm7jahjk3ia0m4EpVS/eFGjlA2Q=;
        b=iMPxxiBhpD/DODUA0edWfeuuE1Yx2H0iDM51pRGCp6hd6qLDEhc1VsneE+F8CcwjCo
         b+ASHKfxei/gcpXg4ArvZ7lLaQv7KcQLvVmT5zCcjW2xwTlRKmOjKC6J4upY1YsCd7gB
         l8GJ7CL8QqlpCMsjuoN6DP+84hzr3ENtUzdsxnFZQ4sBE1HgL6o5GfguJbiMHByYQUVZ
         QhDW+c8ciwbnTTSxQm/qRWwABqUjwlfJL6FN82ajZVei4qRs8HqF0F/8yHC+x5gIW/YD
         eMWM+yqe4q2OvIk5tla3cwZ23XGnHo41MBz95O7RZH9LdbDYEpZfLRqlO/HzRLEjbz5A
         /IJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296633; x=1780901433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GYjw/HYSvquU6pfEeJ7tubCnhoXG1vRtQA5lD0F2b7I=;
        b=bor5gt5SMx6d0Js6+88dpH6efx25cfANsQhwi2+Wtyr54BaCkT6aw2tk+7na1FuGu3
         Xe77DbeVn7DDzmkzCU10a5WAVSe1ZiwsFKcBI0R2Bek3FaCvsBGQ9LuZF7tYKOcLsR5J
         z8XkJO/LjvnovRhfbQ16lSdi54qFYjB54fNSVx0jDAxyEZUr+UqJjaAmxYei3Qb8Fm+e
         4C5IGaUDrqdHL13ZpLKMoGZKa+Vq0dZA5UjvCQsQno/0setvQXGJZwaJVNy/Px5LYTwn
         bIBkMGP4HxaavrY/mLe6jvBPGqo7eOlM811wyzWjPHYm887jXQt2WjaVBM1aZm6GkmQT
         3oRA==
X-Forwarded-Encrypted: i=1; AFNElJ/dCi0YnJ4NcmFEMCGxQI77sWxI06+YX1BqFQlN+Gu1Y3NbLdsXd/xVDwYwW2vkLZBGJMbZpNa48Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9fyFuc6MjcISeQSTvLPBvqmiVkT/5ZgmC83USWUF1uKFpYCLK
	k7fsW7rYls9D23CGV0TRYLieyfFeQWpOLvIOrfSff/FxoctU2p1Vi+JC0BdHgY0Ik5cmle+3D7c
	ZjesBQoipJUQCEKRUX0xg4kU0u5Xuj5LzqQ2+ERXy55MQKSx1wYXLHFhha3eiVJjU3ekig9cwPn
	TbGUcYdPKnh7jMKtF1xPG8RY7jr6kvXuOfphDwyZtVBNrYsnDw8k5m
X-Gm-Gg: Acq92OHKqKOUmcL7y10GmSJUFbQCAcOWgFrKAs/RQr8LGIjZn2s6wUtgoTZFPTK0stV
	Q8W1pMPIIpNz+ZASpd6CeM2Lm86nFCOBILOYu1JQHf92+yxR718p38NzBV1NwsOkfULu3WeA5JI
	dhp2yA5BckJFKtJet3law7DrrgkuSqvymTOD0DwQ8QYnLepqOiscKw/MNlvkYHGX+MTqiMvuvxQ
	ulPgfrOPZYZDs2AfFPG1k7GkgiFbZIKGiW2g3ZrrE0RIcwgJvyFu+ZzzX+szihB
X-Received: by 2002:a05:6808:1912:b0:485:5950:c1e4 with SMTP id 5614622812f47-485fb4bcb42mr2896053b6e.8.1780296633261;
        Sun, 31 May 2026 23:50:33 -0700 (PDT)
X-Received: by 2002:a05:6808:1912:b0:485:5950:c1e4 with SMTP id
 5614622812f47-485fb4bcb42mr2896045b6e.8.1780296632880; Sun, 31 May 2026
 23:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com> <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com> <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
In-Reply-To: <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
From: An Wu <an.wu@canonical.com>
Date: Mon, 1 Jun 2026 14:50:21 +0800
X-Gm-Features: AVHnY4LKmk2cUcpgpWx15SZbYGDZIeJ9XIcs7KjB3wZgO-sYQHgX5Itbi-UCaUc
Message-ID: <CAO4Mv0ZbazqxzM9Sjd9=7YzMzZs6w54SLkhq+NtragOau5-eAA@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Defer DP tunnel teardown until display
 driver is ready
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, YehezkelShB@gmail.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38222-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[an.wu@canonical.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[canonical.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,canonical.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Queue-Id: CA8A861A6CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika

Another approach I considered is using register_module_notifier() to
detect when a display driver module is loaded, then retrigger the DP
tunnel setup. However, since struct module does not carry any device
class or subsystem metadata, there is no generic way to identify
whether a loaded module is a display driver. We would need to maintain
a hardcoded list of known GPU module names (i915, xe, amdgpu, etc.),
which is fragile and not scalable.

BR
    An

On Mon, Jun 1, 2026 at 10:45=E2=80=AFAM An Wu <an.wu@canonical.com> wrote:
>
> Hi Mika,
>
>
> Thank you for the suggestion and for explaining the rationale behind
> the current timeout value.
>
> In our case, unfortunately, increasing the timeout alone wouldn't fully
> address the issue. We have LUKS encryption in the middle of the boot
> process, which means the timing of user interaction is unpredictable =E2=
=80=94
> users may walk away and return at arbitrary points, making it difficult
> to rely on any fixed timeout value regardless of how generous it is.
>
> Appreciate you sharing your perspective on this.
> It helps us better understand the constraints we need to work within.
> We=E2=80=99ll continue investigating how to address this problem under th=
e
> current conditions.
>
> Best regards,
>
> An
>
> On Thu, May 28, 2026 at 6:29=E2=80=AFPM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Thu, May 28, 2026 at 09:03:30AM +0800, An Wu wrote:
> > > Hi Mika,
> > >
> > > Thank you for the feedback.
> > >
> > > Sorry for the mess, and I understand the concern that the Thunderbolt
> > > CM core should not call PCI-specific functions, especially since the
> > > direction is to support non-PCIe hosts as well.
> > >
> > > Putting graphics drivers into the initramfs does not look practical
> > > for us, because we may need to include many possible graphics drivers
> > > and dependencies, which would increase the initramfs size and
> > > complexity. Moving Thunderbolt out of the initramfs may also cause
> > > regressions for users relying on Thunderbolt docks early in boot, suc=
h
> > > as keyboards in the recovery/LUKS shell or network devices for
> > > early/rootfs use cases.
> > >
> > > The problem I am trying to solve is that graphics driver readiness ca=
n
> > > affect Thunderbolt DP tunneling, but the graphics and Thunderbolt
> > > drivers currently run independently without any coordination. As a
> > > result, Thunderbolt may treat a temporary graphics-side readiness
> > > issue as a permanent DP tunnel failure.
> > >
> > > So the goal is not to make Thunderbolt depend on PCI, but to find an
> > > acceptable way for these components to coordinate, or for Thunderbolt
> > > to retry/check readiness in a more generic way without adding
> > > PCI-specific logic into the CM core.
> > >
> > > Could you please give us guidance on what direction would be
> > > acceptable upstream?
> >
> > The DPRX timeout is there for a reason, although the reason is not real=
ly
> > that common. Basically if there is nothing connected to the DP IN we ca=
n
> > detect that and be able to use another DP IN to provide user a working =
DP
> > tunnel.
> >
> > The timeout itself is currently 10 + 2 =3D 12s to allow i915 enter runt=
ime
> > suspend and still be able to detect (via polling) a connected monitor.
> > However, it is not really "written in stone". VESA spec wants it to be =
5s
> > but for our usage it is way too short. I have no problem increasing it
> > either but then some users may suffer due to the above reasons (if a DP=
 IN
> > is not connected). Maybe increasing it is a reasonable compromise?
> >
> > The other option is to put the DP IN to a "penalty box" for a while but=
 I
> > don't think this helps because you need the hotplug event for the DP OU=
T
> > part and that's not happening after we have acked it.

