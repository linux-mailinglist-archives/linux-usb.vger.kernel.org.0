Return-Path: <linux-usb+bounces-38209-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHogJ2LyHGq1UQkAu9opvQ
	(envelope-from <linux-usb+bounces-38209-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:45:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0571618E03
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 04:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20CF83016EC5
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 02:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B5A21ABD7;
	Mon,  1 Jun 2026 02:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="rp9F3CU3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93A27703
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 02:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780281945; cv=pass; b=kWbsbI3y4nbXYtLYkiL0kJH6sPJRuuzfBnuGvDLwN/yzc2gJF83ffG142+o4lBgvMexXLKpn8//7af15s4wppbo8MRWj25ojUO37Xoee/xLnvmI+GJV60kFF7sBvkeYWf6zI3MevQz7lCyrfe5lQQdqlY+BhCHaIhcVQ85xGkOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780281945; c=relaxed/simple;
	bh=wypKlhv5gYtHZRcVGTsoua6gnOl3nTUJbr1ShGdQp1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6vpCTPjCanYp18x2sTVpcRnghxmdFNdcql1djYNk3MgZuEuJOvM21SPHsg4H3YLlOVfm3y2HgjYWtFT49OHA+cwmkExzvBtN09mCcuO1wcbkFhtYJ6fXI2E69f5ggND83leeNh4MhHLUUgCNwYlbInGJnoBnmGslRj1ZxEeGZg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=rp9F3CU3; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3A90D3F185
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 02:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1780281935;
	bh=wypKlhv5gYtHZRcVGTsoua6gnOl3nTUJbr1ShGdQp1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rp9F3CU3kp9S4RPIqNDWoPIYLcsCOZkNtra/CDMrEc25ffv9GFWStZq1gXsaP9YSf
	 srkkRqjR9wLCJeTu/fRRyH9TYRNjm155GB6x7SHfvbRLe5OUxbO/UXlh3xkn8q0gEn
	 6khock1o6obxA8HkQl6yyAo5pmJabaREpAX4/bDclIirxwMj6axXZImNW99t3QWhpG
	 vMQWLkT1VjVND82sPq2pYXb8zDDlKDvSzAqY/7C9rHj8EV/qCuGNMTON1dxc75sqpU
	 ea2SVSaAtqe3z+PvlHNPnJPLBenTf8tYUgBbGo4oVszwmbr334UhHPb69eLkFmhpqP
	 yC8pTyCascS5ugaJVsnuSgXrY3O/EuWNR51fXeayK4TAjULuFYgiuvtoXDRG03Sfgx
	 MF2bI+MwIGu4fPaxx8PYo8Q9p0KersdlB2M1k6k1vsr9Svz4xMw3oVHm7uVX5yPTbR
	 mfT45jLo/kve04usIuEp4mTU9is/poxf4glw2mcKwFwl5TTRQabUGRDtZdLhdwuknl
	 ADq3Vi8JaDXcm4+vhHMiAMFdc2/FCemoZ5OvP369t9fMvBMsY1X8+K/7TW1OCffukW
	 mZqV6iQ1DRvjlVBcR4HWzNAF2On8pGhx/CjFCISSVZewsSS5VnYB+DAt8JbVElUABl
	 2pq1G+vJHxhUp/1+zS4eQnfY=
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-486118c6cafso174585b6e.0
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 19:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780281934; cv=none;
        d=google.com; s=arc-20240605;
        b=VmYvnT/Vl4mgcsMGumwE+K0yt8NLtes88OjT+7yckV3JNKk4xheeqLAODJ5y6nXKxz
         Qfsrx3WQGfO4HCosUoH+VMgUNvd8OkN/Ta8uPbt6LgTwTwsR23lX7Cx/pjTw0lWXGvyw
         FUZkfNnrfpDTocrHXShHvjM3jo801dC28oFS3ED3oejznfZyz8iqPd8IZUPsKb0StZo9
         nTS7Gs7vn51udd6ihJ6FFEMMbq2M7sVw2h9QwWoVCYIgCID2FK/b20o/hZTjwqBPxgAU
         2y9q1dMD8BHCpi5rH2ovQZ+63mXYTAegucXgX58Cef8QJGOcvwuPNG0P1dySV/360jsE
         j11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=wypKlhv5gYtHZRcVGTsoua6gnOl3nTUJbr1ShGdQp1o=;
        fh=GzJQbj4FmkT9QY7cW73Jg+BQA1FDPMsI58prKWSCV1U=;
        b=Z8Gvbcs/BXaK7/BlWMGEGnLVC+J65VeHlxwi0w3vAUxvrc0FCBnDQYfhBzjHe9qi2k
         yc3WbmXOTsYKs7DRaxUmuyxi7+EUC7KVQdZcKISgE3N5EMcdkkObeZ5Nha1wdUefF7N5
         vK+Bcld9Qb++FMsug0JJhs6ZRooKu32Xv5jim+1krvWhWzX5UH4Jxi0WYTSMyBZpEHrf
         5RhQIN3g9x7R9mIsmVazDFOKbMnlE/t7hsvX7X0Cdpdm4KXCWaJPJCx/kMmQwQNLgyL6
         PlsUGwSmiC5URtzgP2R2a29YbPeH9TJ62xBMk0QZPscRLiwMoAT4Ig4LvFdBIKWyKmSj
         RPZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780281934; x=1780886734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wypKlhv5gYtHZRcVGTsoua6gnOl3nTUJbr1ShGdQp1o=;
        b=X6ewu9OB2Bu8NalfsMDlayzJzzi15D6oE9JTt45TWomErwpZCuj3jr8FDx+X7aDA3B
         qkWpVNUCMt1zp22ppgbl7A11JYFJ+7sTvKQ9jDd1apIr5WjjkjBFBKnK2XmYuhJA7T5Z
         wl+wz9TJVeGzJDAu+/RQcQKVo/W1VtLtHrMiFUWrH7KrB56Jrw5HYYQIpb8WsGPYAxT3
         qSXmPy+OT7H/ORRfe33h8yBR4Cld9CaeeFYgjh5n/l8R1muvvt/nQXvtIfPe+Z2QkliG
         GNEP3lymrSPv27QE/vH5gXdXm+aZJuzLznFdOg2rxSpFG/mOCTnQqeXQtrxfy8A0pF/a
         99sg==
X-Forwarded-Encrypted: i=1; AFNElJ8sy2PE7m46eGuaHTgkrOPCx/oTO4DKzZFIUgq4cl/C7/dZTclbZyHsCpNYlnv5qhgblb5HOve46r4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8krbQILF6TjTS/ednMUbNJPt4wx4z5gZYa+9GsCX6Ddxu4e8
	o0E/5XL5J2bQp4nHJo+t/LuRMldHrIbFSkGmG8wvpX+D9slvp5bgd+7H1+y3uU2iGiJdvk3o3Tq
	M7P1qdlaXyThParXVTq45VSP9MS8wIXWpx8zAAXjEUtvjQ8xQSDGntWgl6X1Mxmw8XmB7H715tg
	zLxZWgBxUW2sHM5fhw2F3G/cocL+15EeCukobq2gsXizLfBoL+89Kb
X-Gm-Gg: Acq92OGE4qW8ulB6Kp0CQ7B9MW9IYtHcexVkI+7rJuTP87LQMrAwSw2qIpnqg3HY1iP
	zL1M2rq0rzRQg2udRU3+gjW547lEPqAO1e/lf8rG5SnOM1i4u63zt2LeL2gxCp5Ju9tbUP9eb/f
	lURFjcFcKpD4otAEC234Q9DznewzoNvpVcfV5Wga1eleuYRDqZBgMT/EgNZhnHxhVUivcLlicxd
	UU2+wd4+g4tKk12LmzZjYoVcyMiwEhk4pXhpWjQWw6NvYet2QOo9O6ziJcR7hgP
X-Received: by 2002:a05:6808:1444:b0:485:7c5a:63b6 with SMTP id 5614622812f47-485fb5ff5bcmr2805477b6e.1.1780281934026;
        Sun, 31 May 2026 19:45:34 -0700 (PDT)
X-Received: by 2002:a05:6808:1444:b0:485:7c5a:63b6 with SMTP id
 5614622812f47-485fb5ff5bcmr2805469b6e.1.1780281933720; Sun, 31 May 2026
 19:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260527064121.173952-1-an.wu@canonical.com> <20260527064121.173952-2-an.wu@canonical.com>
 <20260527071445.GB3102@black.igk.intel.com> <CAO4Mv0Y-zAZKCQTvOAb+AS-iMh1Fa97f+BqaLTdDocBWm-_B7w@mail.gmail.com>
 <20260528102934.GH3102@black.igk.intel.com>
In-Reply-To: <20260528102934.GH3102@black.igk.intel.com>
From: An Wu <an.wu@canonical.com>
Date: Mon, 1 Jun 2026 10:45:22 +0800
X-Gm-Features: AVHnY4KcrSJTaDYPznPg-S30S5cXG7-4QqdCV-B_wMQEoNdQRgwac5E-9xHRsg4
Message-ID: <CAO4Mv0aUjtc66AkPmsRyEFTiV5etNNXoBqocMyKpOfS7uKTVKQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38209-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Queue-Id: F0571618E03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mika,


Thank you for the suggestion and for explaining the rationale behind
the current timeout value.

In our case, unfortunately, increasing the timeout alone wouldn't fully
address the issue. We have LUKS encryption in the middle of the boot
process, which means the timing of user interaction is unpredictable =E2=80=
=94
users may walk away and return at arbitrary points, making it difficult
to rely on any fixed timeout value regardless of how generous it is.

Appreciate you sharing your perspective on this.
It helps us better understand the constraints we need to work within.
We=E2=80=99ll continue investigating how to address this problem under the
current conditions.

Best regards,

An

On Thu, May 28, 2026 at 6:29=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Thu, May 28, 2026 at 09:03:30AM +0800, An Wu wrote:
> > Hi Mika,
> >
> > Thank you for the feedback.
> >
> > Sorry for the mess, and I understand the concern that the Thunderbolt
> > CM core should not call PCI-specific functions, especially since the
> > direction is to support non-PCIe hosts as well.
> >
> > Putting graphics drivers into the initramfs does not look practical
> > for us, because we may need to include many possible graphics drivers
> > and dependencies, which would increase the initramfs size and
> > complexity. Moving Thunderbolt out of the initramfs may also cause
> > regressions for users relying on Thunderbolt docks early in boot, such
> > as keyboards in the recovery/LUKS shell or network devices for
> > early/rootfs use cases.
> >
> > The problem I am trying to solve is that graphics driver readiness can
> > affect Thunderbolt DP tunneling, but the graphics and Thunderbolt
> > drivers currently run independently without any coordination. As a
> > result, Thunderbolt may treat a temporary graphics-side readiness
> > issue as a permanent DP tunnel failure.
> >
> > So the goal is not to make Thunderbolt depend on PCI, but to find an
> > acceptable way for these components to coordinate, or for Thunderbolt
> > to retry/check readiness in a more generic way without adding
> > PCI-specific logic into the CM core.
> >
> > Could you please give us guidance on what direction would be
> > acceptable upstream?
>
> The DPRX timeout is there for a reason, although the reason is not really
> that common. Basically if there is nothing connected to the DP IN we can
> detect that and be able to use another DP IN to provide user a working DP
> tunnel.
>
> The timeout itself is currently 10 + 2 =3D 12s to allow i915 enter runtim=
e
> suspend and still be able to detect (via polling) a connected monitor.
> However, it is not really "written in stone". VESA spec wants it to be 5s
> but for our usage it is way too short. I have no problem increasing it
> either but then some users may suffer due to the above reasons (if a DP I=
N
> is not connected). Maybe increasing it is a reasonable compromise?
>
> The other option is to put the DP IN to a "penalty box" for a while but I
> don't think this helps because you need the hotplug event for the DP OUT
> part and that's not happening after we have acked it.

