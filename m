Return-Path: <linux-usb+bounces-34840-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kClPM5qgt2n9TgEAu9opvQ
	(envelope-from <linux-usb+bounces-34840-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:18:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02429507B
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 07:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170F83013255
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 06:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6677134AB06;
	Mon, 16 Mar 2026 06:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V64+isvX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6500D1B808
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773641860; cv=pass; b=sOJXULvHThoWnBwByy/lh9WG0+liRaKfMKNUhw3KYR0fyz1oZfmb6hlIqSBVLjIWccekSsMSgHkghYBo5jl4eW0OJJC5BdUMI/A1TdarGegRZEEXAHanM+ovufRcgDqabMwcsuXEslPWKAXojBCN9rMoj6TcjYT2gtqeLvgbJgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773641860; c=relaxed/simple;
	bh=pIfADA8BD1lfRNokayrTMUj26ifkUVH2CDH/yxkXn6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT6O5K4HZ27C/t6UaIPuwOJ1QaWFjkpyj0Lc0Qdxz8k5AZ7yf+AKJE4CSNK06Nh8sg6+jOUBhYIpuz73mYD24q0V16K1WHZxKXOVbo4+ctWTNbzyvhfAjPiEofqjb1z6EzF5VKvQ72TmUDBlVR0tZ3/p1teeTTHP3TkvKkw1pN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V64+isvX; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a12c1cd400so7453e87.0
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 23:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773641857; cv=none;
        d=google.com; s=arc-20240605;
        b=BvYTIDomAoq7VhtrdJsU6K/GRHuK2GFKOwp0YWLHkmbZT9RQso7arl+UUyoMS6cGYi
         PZfJMQL3iABXtckyyI3WhuuL/B4fjutZTUYqT75jIOnkjgXwpWXpdDqbIx8YFU5VGoh0
         5ohsdji+bzsuKlMQA7sN7EuWquxKq+GQanf6b53kBLb1h7E3HQZywboCe73jiIJRqrXt
         jVh429FPj9bM0KIBgD36cfT/8RtCFw2IRaPfi/EfJrlfz3uOcyuTIXVWveDEy2jz1eOG
         lQWXBAY8mq78er49Bd1jJnkj3oX435qM7o4u4uilrZbVmlCHKqsQ4y5YwlPw9bbmZYW+
         R8VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uCzlskDr3MIDdF8bSXDGQkdCgWDrqd7usgnR56Epl5g=;
        fh=h9xNJ5OTO9BuI+EwPmKh3JW478rmK47W8y3bT/uhC/s=;
        b=PKtUoNUkxSGQe340gKq4M2SeDK2DtTjL1LfuHwL8EHa2IMjVZde0/jy+fzvmxs5mVI
         VB8Ky0WvhVVQxYLq1TN9zMatIwNZdrCz0wDS+wEJxdncs6FIlY8nlzib8xDG+dLhlwWv
         PgmtB8GUL75PFzSphSG8J5IwtxOOtq5xnDswosWZaqeE6Dmy9aCL+O8WbhC0XeL8Tz2R
         TrtPr53daRRviH1vHgHoD20p0yUScycgxxgbtPTu3bc2nVVNetHSqDtzc6P1yMj2V6B1
         3arNT/Gi1ii7xwM97pv17gNPL1BH4Ac+McUNyX2l1rlSA/LB4ypxJHekRC1cfpEjRc5e
         O7Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773641857; x=1774246657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCzlskDr3MIDdF8bSXDGQkdCgWDrqd7usgnR56Epl5g=;
        b=V64+isvXlRjZj5iC8X2KOajpWN146VOCCOE5a9ObqCv4N8NvnU3/ZQiuR+575RLkbw
         TCIDZGXlywE+hHWD6v+fW5XzUCBvpuZSdK22fb67V1IWDUgcOdfnpScDo80UBHhgDkBx
         JyNXTsNmkAA2ZgHUwAusY6Pzs3sEn+0uAGi5zv9KnjjTHcnT0Zq7DmK200lUZTIYj1ik
         9du+CoEHgNw84vP0IXZXY8kmxgM6dIMk4CdGMn0s92naeFn7GBE4pps4a5qHWQW2fgs9
         /vcvrFR1pvDFvOQIV0H/Ul0K2BegvcYe0Z0PMsA4bCMeugeh5kLqjNWiCdoqbgRQlY5P
         c65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773641857; x=1774246657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uCzlskDr3MIDdF8bSXDGQkdCgWDrqd7usgnR56Epl5g=;
        b=Ni0k9yjbq26qhj4KRknN+j7JOxXWP4KFFve0sWbGeCHFcY1EhplzKq0N7giaPImwd5
         f1e6UChg0bBVSflKUD4Dw782llJndbfz1Vumij0b2yhk3BoVoOrCutQECx+5buy/RHM3
         nja0VSF0n66sjo8su+az6S3SsO9iK1F6JFNJIXDje9Y7zUvOn2IDZvXsMxxYBpX1tdwK
         P5NlYBrsJjWHUIba7rCc6+aTw4KWPQZUpnJmAvH2+tJ7LCWDPePrk3OIiStzHKuWkNFw
         hEi74u62iiG9s73zf9o/GI4ab43B3mpm924q8vGx8bVk0x0Zn1s8RRTO4TLXwyHxQpRV
         DvGA==
X-Forwarded-Encrypted: i=1; AJvYcCW/miA4OonmdDRv+QxQiBHqZP00LQFcrdiC90KkT6D+5IDzTaeHTmLpkNXyqEsjoSI0RfslAija/kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YztLfIa4T5L1tSxHJ/ebEOfa7ZhXZwu7UDhNJHXMrFW29NW3Q9g
	Hv72b4JpogO2QQU/jW6JyHKhby/CU7y/XFfUXrnMP+tCHkA5MDwiptYwuLyppF3yKjV92ZWJJzh
	E4eEsi9YiUIPvSmgiHKZP2pw7GeSjndqgLyN0CEDl
X-Gm-Gg: ATEYQzynWU1sI3Ipjo4qvhtnQ/I1uza8NW3RmIZ+V2L3kdab8fZUM/pw61/+pKPINAF
	KKbosRSsn1xwSxTv6yoW2guouw/gWkBy/3RtZzMC25B6esChwddh//cnj248MSL8Hpx9RjmEXff
	uusDdZNp0bgZEiCjwWbHtzl8AsG36G0QVqzG3NLKqVuRpKcMTCDQwzdDLvjTpUl2NjlBBADvWjl
	hwJIyJ2DF4hD3n0tivpj1Y6XX5EsTPky5tZ7DY97N4Kswfu/vlWzXPQoxT+K3wK0ZzhDusdTzEg
	Pl3cT7cP5ejVIx5hNwVFHs/XY6z2EZyK3g==
X-Received: by 2002:a19:c20a:0:b0:5a1:43ca:1ff5 with SMTP id
 2adb3069b0e04-5a168fd53bdmr88286e87.3.1773641855956; Sun, 15 Mar 2026
 23:17:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-f-ncm-revert-v2-0-ea2afbc7d9b2@google.com> <DH1NU7GOPTJY.149SPB0645W7G@fairphone.com>
In-Reply-To: <DH1NU7GOPTJY.149SPB0645W7G@fairphone.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 16 Mar 2026 14:17:09 +0800
X-Gm-Features: AaiRm53oVH9xFxzg-2kWczDy0HK0Nr8-N53pe6jTA5K7Y2nnvLD70tXiO4u-lJw
Message-ID: <CAKzKK0pEgC683icYco8YqPDSMWh47SKiZf_g1TX8N3syB2FhBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] usb: gadget: Fix net_device lifecycle with device_move
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, David Heidelberg <david@ixit.cz>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Jon Hunter <jonathanh@nvidia.com>, 
	LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34840-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3B02429507B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On Fri, Mar 13, 2026 at 8:40=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> Hi Kuen-Han,
>
> On Mon Mar 9, 2026 at 1:04 PM CET, Kuen-Han Tsai wrote:
> > PROBLEMS
> > --------
> > The net_device in f_ncm is allocated at function instance creation
> > and registered at bind time with the gadget device as its sysfs parent.
> > When the gadget unbinds, the parent device is destroyed but the
> > net_device survives, leaving dangling sysfs symlinks and a NULL pointer
> > dereference when userspace accesses the orphaned interface:
> >
> > Problem 1: Unable to handle kernel NULL pointer dereference
> >  Call trace:
> >    __pi_strlen+0x14/0x150
> >    rtnl_fill_ifinfo+0x6b4/0x708
> >    rtmsg_ifinfo_build_skb+0xd8/0x13c
> >    ...
> >    netlink_sendmsg+0x2e0/0x3d4
> >
> > Problem 2: Dangling sysfs symlinks
> >  console:/ # ls -l /sys/class/net/ncm0
> >  lrwxrwxrwx ... /sys/class/net/ncm0 ->
> >  /sys/devices/platform/.../gadget.0/net/ncm0
> >  console:/ # ls -l /sys/devices/platform/.../gadget.0/net/ncm0
> >  ls: .../gadget.0/net/ncm0: No such file or directory
> >
> > BACKGROUND & THE REVERTS
> > ------------------------
> > The deferred allocation causes a regression for userspace tools during
> > network setup (such as the postmarketOS DHCP daemon). By moving the
> > allocation out of alloc_inst, configfs returns the name pattern "usb%d"
> > instead of the actual interface name (e.g., "usb0") when userspace read=
s
> > the 'ifname' attribute.
> >
> > Investigating a fix for this naming issue revealed a deeper
> > architectural flaw introduced by the series. Deferring the allocation t=
o
> > bind() means that a single function instance will spawn multiple networ=
k
> > devices if it is symlinked to multiple USB configurations.
> >
> > Because all configurations tied to the same function instance are
> > architecturally designed to share a single network device, and configfs
> > only exposes a single 'ifname' attribute per instance, this 1-to-many
> > bug cannot be safely patched.
> >
> > To restore the correct 1:1 mapping and resolve the userspace
> > regressions, this series reverts the changes in reverse order, returnin=
g
> > the net_device allocation back to the instance level (alloc_inst).
> >
> > THE NEW SOLUTION
> > ----------------
> > Use device_move() to reparent the net_device between the gadget device
> > tree and /sys/devices/virtual across bind/unbind cycles. On the last
> > unbind, device_move(NULL) moves the net_device to the virtual device
> > tree before the gadget device is destroyed. On rebind, device_move()
> > reparents it back under the new gadget, restoring proper sysfs topology
> > and power management ordering.
> >
> > The 1:1 mapping between function instance and net_device is maintained,
> > and configfs always reports the resolved interface name.
> >
> > A bind_count tracks how many configurations reference the function
> > instance, ensuring device_move fires only on the first bind.
> > __free(detach_gadget) ensures the net_device is moved back to virtual
> > if bind fails after a successful device_move, preventing dangling
> > sysfs on partial bind failure.
>
> Applying this series on v7.0-rc3 fixes the reported issues for me on
> Qualcomm-based Fairphone (Gen. 6). For v7.0-rc3 the first two commits
> need to be skipped, looks like the original commits are only in -next
> and not in v7.0-rc?
>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # milos-fairphone-fp6
>
> Thanks for fixing this!
>
> Regards
> Luca

Thanks for testing.

That is correct. The first two commits:

- [Patch v2 1/7] Revert "usb: gadget: f_ncm: Fix atomic context locking iss=
ue"
- [Patch v2 2/7] Revert "usb: legacy: ncm: Fix NPE in gncm_bind"

have not been merged into the mainline yet, so skipping them for your
test was the right move. This series is based on Greg's usb-linus
branch rather than the Linux's master branch.

Thanks again!

Regards,
Kuen-Han

>
> >
> > Reported-by: David Heidelberg <david@ixit.cz>
> > Link: https://lore.kernel.org/linux-usb/70b558ea-a12e-4170-9b8e-c951131=
249af@ixit.cz/
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> > Changes in v2:
> > - Introduce a new solution
> > - Link to v1: https://lore.kernel.org/r/20260304-f-ncm-revert-v1-0-57c9=
157b58af@google.com
> >
> > ---
> > Kuen-Han Tsai (7):
> >       Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
> >       Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
> >       Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/=
unbind"
> >       Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing=
 net_device"
> >       Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
> >       Revert "usb: gadget: u_ether: add gether_opts for config caching"
> >       usb: gadget: f_ncm: Fix net_device lifecycle with device_move
> >
> >  drivers/usb/gadget/function/f_ncm.c            | 129 +++++++++++------=
--
> >  drivers/usb/gadget/function/u_ether.c          |  67 ++++------
> >  drivers/usb/gadget/function/u_ether.h          |  56 ++++-----
> >  drivers/usb/gadget/function/u_ether_configfs.h | 168 -----------------=
--------
> >  drivers/usb/gadget/function/u_ncm.h            |   5 +-
> >  drivers/usb/gadget/legacy/ncm.c                |  13 +-
> >  6 files changed, 127 insertions(+), 311 deletions(-)
> > ---
> > base-commit: 1be3b77de4eb89af8ae2fd6610546be778e25589
> > change-id: 20260304-f-ncm-revert-490a66ae8da0
> >
> > Best regards,
>

