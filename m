Return-Path: <linux-usb+bounces-76-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C37A0A4C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 18:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BA381C20C22
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 16:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C022134F;
	Thu, 14 Sep 2023 16:06:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCC18C34
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 16:06:12 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC651FD2;
	Thu, 14 Sep 2023 09:06:11 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-57328758a72so243055eaf.1;
        Thu, 14 Sep 2023 09:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694707571; x=1695312371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmHCW3v32xS4WL1S5k6AX41XPjZGwiitKf0kAwr1Rlc=;
        b=W3/TFdKMyLv2Qbfewvo/nOkIUDly9DIOlDort66H+nf8XDcdtdq/VYFcInEitUHchv
         So5u56XFFnynr6yohRHD3trORpF0WcJXuT7OtA5U4dPccl5QaUT/iggpgqicGme80byK
         GNBr/U3pdUhouu68jqvqvMftWsJzU2cl8q94RvX1zAEhAheZMoy+vgjErSaHbToikT5W
         y3LhGGN8yO9dk7Shx++lKxTHZa14BcI+Vje4MbbhqZOdkZ6RQBKJtO46tLJSdxE3pwNl
         udVqZg4OyWWNAEKBFwYEuPcwX5BFXX78FmQHjD61GUmMotqV74L8OYZB3fzZMFbg/+a6
         /sKA==
X-Gm-Message-State: AOJu0Yz7EQ34E1h/2aEAmRTTj8bjnNKyjKiZM6nc6wQlpMyoFovgjkhp
	2/Gev5vbigOaj+DDK4rMQnzd1K4ut1Oyc9zzRj5Rwode
X-Google-Smtp-Source: AGHT+IG0RZARy8vKXQB5Ab/irjTMfYo/ToT585rySqeD1fPahfRGLWsoQ2iemNxEnY2XNtU9LXPwv6UdP4T6R7C7yhM=
X-Received: by 2002:a05:6870:889f:b0:1c3:c45b:92a7 with SMTP id
 m31-20020a056870889f00b001c3c45b92a7mr5656166oam.0.1694707570731; Thu, 14 Sep
 2023 09:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230914145332.GA5261@wunner.de> <20230914153303.GA30424@bhelgaas>
In-Reply-To: <20230914153303.GA30424@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Sep 2023 18:05:59 +0200
Message-ID: <CAJZ5v0gbRoDx5bdc9u6o=dq6HPecfBUokq_D1mO8SZo_ob=DAg@mail.gmail.com>
Subject: Re: [PATCH v18 2/2] PCI: Add a quirk for AMD PCIe root ports w/ USB4 controllers
To: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, iain@orangesquash.org.uk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 5:33=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Thu, Sep 14, 2023 at 04:53:32PM +0200, Lukas Wunner wrote:
> > On Thu, Sep 14, 2023 at 09:31:38AM -0500, Mario Limonciello wrote:
> > > On 9/14/2023 09:17, Lukas Wunner wrote:
> > > > On Wed, Sep 13, 2023 at 11:36:49AM -0500, Mario Limonciello wrote:
> > > > > On 9/13/2023 09:31, Lukas Wunner wrote:
> > > > > > If this only affects system sleep, not runtime PM, what you can=
 do is
> > > > > > define a DECLARE_PCI_FIXUP_SUSPEND_LATE() which calls pci_d3col=
d_disable()
> > > > > > and also define a DECLARE_PCI_FIXUP_CLASS_RESUME_EARLY() which =
calls
> > > > > > pci_d3cold_enable().
> > > > > >
> > > > > > And I think you can make those calls conditional on pm_suspend_=
no_platform()
> > > > > > to constrain to s2idle.
> > > > > >
> > > > > > User space should still be able to influence runtime PM via the
> > > > > > d3cold_allowed flag (unless I'm missing something).
> > > > >
> > > > > The part you're missing is that D3hot is affected by this issue t=
oo,
> > > > > otherwise it would be a good proposal.
> > > >
> > > > I recall that in an earlier version of the patch, you solved the is=
sue
> > > > by amending pci_bridge_d3_possible().
> > > >
> > > > Changing the dev->no_d3cold flag indirectly influences the bridge_d=
3
> > > > flag (through pci_dev_check_d3cold() and pci_bridge_d3_update()).
> > > >
> > > > If dev->no_d3cold is set on a device below a port, that port is
> > > > prevented from entring D3hot because it would result in the
> > > > device effectively being in D3cold.
> > > >
> > > > So you might want to take a closer look at this approach despite
> > > > the flag suggesting that it only influences D3cold.
> > >
> > > Ah; I hadn't considered setting it on a device below the port. In thi=
s
> > > particular situation the only devices below the root port are USB
> > > controllers.
> > >
> > > If those devices don't go into D3 the system can't enter hardware sle=
ep.
> >
> > If you set dev->no_d3cold on the USB controllers, they should still
> > be able to go to D3hot, but not D3cold, which perhaps might be sufficie=
nt.
> > It should prevent D3cold *and* D3hot on the Root Port above.  And if yo=
u
> > set that on system sleep in a quirk and clear it on resume, runtime PM
> > shouldn't be affected.
>
> dev->no_d3cold appears to be mainly an administrative policy knob
> twidded via sysfs.
>
> There *are* a few cases where drivers (i915, nouveau, xhci) update it
> via pci_d3cold_enable() or pci_d3cold_disable(), but they all look
> vulnerable to issues if people use the sysfs knob, and I'm a little
> dubious that they're legit in the first place.
>
> This AMD Root Port issue is not an administrative choice; it's purely
> a functional problem of the device advertising that it supports PME#
> but not actually being able to do it.  So if we can do this by fixing
> dev->pme_support (i.e., the copy of what it advertised), I'd rather do
> that.

Besides, it is not really necessary to prevent D3hot on the Root Port
in question in all cases. It can go into D3 just fine if there are no
wakeup devices under it and I suppose that the platform can achieve
more energy savings (over the case when the port is always held in
D0).

