Return-Path: <linux-usb+bounces-34842-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O7+Lc+nt2k2UAEAu9opvQ
	(envelope-from <linux-usb+bounces-34842-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:48:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1505E29541F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51F44300FC7E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7535340280;
	Mon, 16 Mar 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VcuGq0Fv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B65CDF1
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773643694; cv=pass; b=QZKQXRcWR6u/M/YCReEXsjlLo2mwtwNl9D1RSsQ1E7bsB4b+QfLVb85sXvk4BtzzIpN19KXAq4dRrNyWC7kCz+FI2GfSVAaUNsZSdD6GxJT2ZRQ3ZziSFJxACWwpX8lHSFM3zlXWJgkcYQ0u4phvc3UshtGlWB3rGbrfxX+5X7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773643694; c=relaxed/simple;
	bh=IwIr9o98bJTORcYX84PPKdI0NjV59Kyb+bURc4al5qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPum5Fz4LTBnzxd670DQ/f8Aaq5xdXUtFb8SRQvpckL0bcMO1D2/f+j8YVXhDqLMG7yKgZMFEx8Oo/tf9/3c1wot8TxPeh6hphiE5PfYsvhalkqZXg/a39kX7Riyca9TbULpi+KIBKGxmuf/C1cpxb7U+ccnBT5Up4cR5hPrvpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VcuGq0Fv; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a10a116145so5626e87.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 23:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773643691; cv=none;
        d=google.com; s=arc-20240605;
        b=L/Sqt+dCVqwJ5w1nakeCKoyfcR4w47Hxx06Ay6bc+3gVQ1yrfHo965HLjdbjl1MYDZ
         YraUugLi/2oU6Jzg7CwSFbE1MqimA2mH8N0kYNgXfbE7cUT9pmPMr4ysMwR2//UMqn4x
         Zq3RupvAVXXbbO2Jcw/aCPE5tVcRee5izHNfrCo4SDr959D86wYwEcqlvjE7sTgWnovp
         e8cRPw7WBd0xTCRo7jvhoUDlFDSbtSizCShX01Cur5RI1jMSKtl9zjwtTbz+0hjm/vkl
         /NNkm5E/JQsHsLnytLZqU0VBPW1B1XJvIE+vUcS4piXPGfy6xVqrv71p1uXJfzVOOZ+f
         U7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7cmvO/0MW2U1VRJ9E+rD7BZwt4DNdAA3P/GEMYHIi0=;
        fh=Iw2DXgNOiUF8wV1maThd9bOLQUertlwoBiJ6NW2hdmo=;
        b=TZNKjYwuwwwVKi8SYtD6EX2QP5hnMLYeqamnRxP/lDB0FtIYjmEeIbU/ioNUbFXWNc
         lZWOynO9gwFwrzeJBiSF38vBjbUdfMBMk6y0iNn6liigie0vH5O4E7P8TXxi+i0SZct4
         wpu1to9zdKZuf4maLzI21QMHIa2tvliQF5Wl94hpCjFhracZvv7aNrOrq4TE5tJlDG11
         yninuKg74k4VGsX/06mSjLituRByHfzWa+k6R4qycerA0vPMDYE3PD4JkWtp1Ks/YdEn
         4sByIC4+F7ci3P/7ZKacJxPqIiw+dlVhWnuO1IczF1nVEBWpkNMMlHHNgC/zmL61ARc4
         P7UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773643691; x=1774248491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7cmvO/0MW2U1VRJ9E+rD7BZwt4DNdAA3P/GEMYHIi0=;
        b=VcuGq0FviiaOAB+TBjzAv30inBd4B2emzWF1/PDb1YLNw12dVliUmk7r1lqTPj80Xc
         9kYYPfeAwJe5uhXgfUlZtgUONe9CuNINypq5wi2l6v5lsrzTWXP8wIt8a4KqlKSFRMmn
         YllVSWvyLNLkl5ZOKEB7t6/YDLNHd4+fLi/h2EjIYDmmcCPYPY/nWBTNSyQGWxe7U+vy
         aYF0eVlUm7PFZMEan/B9h8xZHo25PjogBI870zhembWM5aO/eP3Hg1uHrHJu4QRCUnpJ
         ++Ic8r7TztnSutaFAZtftu7Khbq8aIT4hSWrYbowJr+L1bo7eoCObx+Vx/JKpaoVjaQm
         T0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773643691; x=1774248491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7cmvO/0MW2U1VRJ9E+rD7BZwt4DNdAA3P/GEMYHIi0=;
        b=J6hhqEB5QNhXz3dTDHnKIIEdHk9Vee+ddui8bVt8y2N+U/uxhefrqAUrsqQNd9JCIO
         W63MEHEVh4MHwjng6e4aMPjlL9YloHlfka1/8HUx0Ak+RlTwUAkSgRSGPBcFFWztsMeG
         k37zSzJir8q1KydI4kokUpnlc5I9Nn+7xb9D9Xav4i4uL/KnzxfhuBHC23JX/ydneIpG
         wOX/XZWw2nOjNy4NtYhuKzlfoa9ynJnjLDCqv+QdDt9RfnHtQbUeOUW54+/m1jL1axeW
         toews9dI9Z4UGGEFoGbmpinr7XoFdN4IyMBtlgo5j4CzcrJEiFYAYoMW5SBephT4bVLl
         GaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkperRfBN3rjPdmcpvqlpx/PsA8c2HxbYi51/TzNDIqyWoVOMDBZx4RZu3lQfNGWKJMfpzu6Y2qfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8u1P0dsSCkOdSDsRhBnalciZq+2XZIMUJR9BC4rUR3WW/i7Z
	PMTGgumGCUucevtPDIPDki/lVADHzPVM8F12xnWkMv9VgsEqLcVfGflXd+39/NK53g7tu+KnyYI
	JBU7f4897wUrRforTGMeW4okZZt3Rsu3iu50YgOdU
X-Gm-Gg: ATEYQzzjZRPyC/juo6K7lr2WfbqJ+JJ8kCSZJv0we5cUaZCLE5/87AS85vKoafzuhwf
	ZlHJ/Ua6mxlr6wtta+TAnUVe0uSgOnSj7Yivpww5K8r0pci93DBh4LHBOu0+bvQ0J2FEY5OdHKQ
	qt62+LpDCy9w4F6NnPGAyGc1zDuAl4uZ2ZJoA0UMwT9qzWvWHDUnVzdmUiCSVm1Qxo6yt3CISP/
	4vCqSlczeHZh/bXntvq8uHnIVg+YCivnGzTNnvvt4vmpDKjDTgN8T6G3wXBr665Prufu/hDuCAk
	QVJbZeU+4HCNTQw535JttoVQhnyzz2oPlbrTDTcqyalU
X-Received: by 2002:ac2:47f5:0:b0:5a1:156e:6a39 with SMTP id
 2adb3069b0e04-5a168c77c49mr151363e87.10.1773643690434; Sun, 15 Mar 2026
 23:48:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com>
 <DH1NU7GOPTJY.149SPB0645W7G@fairphone.com> <CAKzKK0pEgC683icYco8YqPDSMWh47SKiZf_g1TX8N3syB2FhBw@mail.gmail.com>
 <2026031632-catwalk-reshuffle-c819@gregkh>
In-Reply-To: <2026031632-catwalk-reshuffle-c819@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 16 Mar 2026 14:47:43 +0800
X-Gm-Features: AaiRm51ZAdzM-I8PDbeuJ32Cya6bFaza2U6YzLxfe-NU5zwEEDQ0Shx4CcY3FbA
Message-ID: <CAKzKK0oA+oYGOz1okET+FaSiTh7GVVnGnRRXBuRdLr4HsYCWSg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] usb: gadget: Fix net_device lifecycle with device_move
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Heidelberg <david@ixit.cz>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Jon Hunter <jonathanh@nvidia.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34842-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email]
X-Rspamd-Queue-Id: 1505E29541F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 2:36=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 16, 2026 at 02:17:09PM +0800, Kuen-Han Tsai wrote:
> > Hi Luca,
> >
> > On Fri, Mar 13, 2026 at 8:40=E2=80=AFPM Luca Weiss <luca.weiss@fairphon=
e.com> wrote:
> > >
> > > Hi Kuen-Han,
> > >
> > > On Mon Mar 9, 2026 at 1:04 PM CET, Kuen-Han Tsai wrote:
> > > > PROBLEMS
> > > > --------
> > > > The net_device in f_ncm is allocated at function instance creation
> > > > and registered at bind time with the gadget device as its sysfs par=
ent.
> > > > When the gadget unbinds, the parent device is destroyed but the
> > > > net_device survives, leaving dangling sysfs symlinks and a NULL poi=
nter
> > > > dereference when userspace accesses the orphaned interface:
> > > >
> > > > Problem 1: Unable to handle kernel NULL pointer dereference
> > > >  Call trace:
> > > >    __pi_strlen+0x14/0x150
> > > >    rtnl_fill_ifinfo+0x6b4/0x708
> > > >    rtmsg_ifinfo_build_skb+0xd8/0x13c
> > > >    ...
> > > >    netlink_sendmsg+0x2e0/0x3d4
> > > >
> > > > Problem 2: Dangling sysfs symlinks
> > > >  console:/ # ls -l /sys/class/net/ncm0
> > > >  lrwxrwxrwx ... /sys/class/net/ncm0 ->
> > > >  /sys/devices/platform/.../gadget.0/net/ncm0
> > > >  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> > > >  ls: .../gadget.0/net/ncm0: No such file or directory
> > > >
> > > > BACKGROUND & THE REVERTS
> > > > ------------------------
> > > > The deferred allocation causes a regression for userspace tools dur=
ing
> > > > network setup (such as the postmarketOS DHCP daemon). By moving the
> > > > allocation out of alloc_inst, configfs returns the name pattern "us=
b%d"
> > > > instead of the actual interface name (e.g., "usb0") when userspace =
reads
> > > > the 'ifname' attribute.
> > > >
> > > > Investigating a fix for this naming issue revealed a deeper
> > > > architectural flaw introduced by the series. Deferring the allocati=
on to
> > > > bind() means that a single function instance will spawn multiple ne=
twork
> > > > devices if it is symlinked to multiple USB configurations.
> > > >
> > > > Because all configurations tied to the same function instance are
> > > > architecturally designed to share a single network device, and conf=
igfs
> > > > only exposes a single 'ifname' attribute per instance, this 1-to-ma=
ny
> > > > bug cannot be safely patched.
> > > >
> > > > To restore the correct 1:1 mapping and resolve the userspace
> > > > regressions, this series reverts the changes in reverse order, retu=
rning
> > > > the net_device allocation back to the instance level (alloc_inst).
> > > >
> > > > THE NEW SOLUTION
> > > > ----------------
> > > > Use device_move() to reparent the net_device between the gadget dev=
ice
> > > > tree and /sys/devices/virtual across bind/unbind cycles. On the las=
t
> > > > unbind, device_move(NULL) moves the net_device to the virtual devic=
e
> > > > tree before the gadget device is destroyed. On rebind, device_move(=
)
> > > > reparents it back under the new gadget, restoring proper sysfs topo=
logy
> > > > and power management ordering.
> > > >
> > > > The 1:1 mapping between function instance and net_device is maintai=
ned,
> > > > and configfs always reports the resolved interface name.
> > > >
> > > > A bind_count tracks how many configurations reference the function
> > > > instance, ensuring device_move fires only on the first bind.
> > > > __free(detach_gadget) ensures the net_device is moved back to virtu=
al
> > > > if bind fails after a successful device_move, preventing dangling
> > > > sysfs on partial bind failure.
> > >
> > > Applying this series on v7.0-rc3 fixes the reported issues for me on
> > > Qualcomm-based Fairphone (Gen. 6). For v7.0-rc3 the first two commits
> > > need to be skipped, looks like the original commits are only in -next
> > > and not in v7.0-rc?
> > >
> > > Tested-by: Luca Weiss <luca.weiss@fairphone.com> # milos-fairphone-fp=
6
> > >
> > > Thanks for fixing this!
> > >
> > > Regards
> > > Luca
> >
> > Thanks for testing.
> >
> > That is correct. The first two commits:
> >
> > - [Patch v2 1/7] Revert "usb: gadget: f_ncm: Fix atomic context locking=
 issue"
> > - [Patch v2 2/7] Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
> >
> > have not been merged into the mainline yet, so skipping them for your
> > test was the right move. This series is based on Greg's usb-linus
> > branch rather than the Linux's master branch.
>
> These should all now be in 7.0-rc4, right?
>

Right, I saw all these patchsets land in 7.0-rc4 [1].

Thanks for the review and for merging these.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/=
drivers/usb/gadget?h=3Dv7.0-rc4

Regards,
Kuen-Han

