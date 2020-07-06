Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD233215A31
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 17:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgGFPBv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 11:01:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33006 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729121AbgGFPBu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 11:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594047708;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KRRv4jrLnK8+JoU4Xio8h4nGYxyQ9O1VnS5d3yLqP/0=;
        b=CRdTG88+PT+Yrhm1zFsPc3J6OPXYxwHjOISRpQKKED3ONji1gKeadRh6dB2msJ+UnoW29o
        y7UbsJ9fZhh5Hlo/IU8KLNXALKdi+0wSKCXWRBKOVKulosYeYJr1IObn20PPx/dyWSojBC
        rmzbr/d45C1z+7D47HbQZHUR6cYtWMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-6dFDlTsUNWCaDG2W1_nj5A-1; Mon, 06 Jul 2020 11:01:46 -0400
X-MC-Unique: 6dFDlTsUNWCaDG2W1_nj5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2D8800410;
        Mon,  6 Jul 2020 15:01:45 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-162.phx2.redhat.com [10.3.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A58A87B413;
        Mon,  6 Jul 2020 15:01:44 +0000 (UTC)
Date:   Mon, 6 Jul 2020 10:01:43 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Diego Elio =?UTF-8?B?UGV0dGVuw7I=?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, "Paolo Abeni" <pabeni@redhat.com>,
        "Kris Katterjohn" <katterjohn@gmail.com>,
        "Greg KH" <gregkh@linuxfoundation.org>, zaitcev@redhat.com
Subject: Re: [PATCH] usbmon: expose the usbmon structures and constants as
 an UAPI header.
Message-ID: <20200706100143.69ec2624@suzdal.zaitcev.lan>
In-Reply-To: <4125fc72-473b-48b8-b349-1792ddc60958@www.fastmail.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
        <20200705223741.496f9603@suzdal.zaitcev.lan>
        <4125fc72-473b-48b8-b349-1792ddc60958@www.fastmail.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 06 Jul 2020 09:32:09 +0100
Diego Elio Petten=C3=B2 <flameeyes@flameeyes.com> wrote:

> Most applications rely on one or another kernel header =E2=80=94 this has=
 been
> the norm for Linux kernel interface users for many years.

Fine, I never said what you're proposing is without precedent.

> > As for the "duplication", I do not see it as harmful in any way.
> > And they do not re-declare, they declare. You're trying to create a
> > centralized language definition that did not exist previously. =20
>=20
> It is harmful, because these structures *need* to be exactly
> synchronised or the calls will fail. Or the data will be garbage.

They are already synchronized today. No calls are failing and data
isn't garbage. So you're not proving anything here.

> Either the structure definition is not covered by the syscall exception,
> or it isn't.
> If it is, then we have a bit of an issue, as libpcap is not considering
> itself a derived work of Linux and contains a copy of the same structures.
> [...]

You obviously mised "not", but hey. The important part is, do not see
Paolo doing anything wrong. He has his own definitions, and if he chose
to use the same field names, it's complately fine by me, as a copyright
holder. Your attempts to drag libpcap into this are laughable.

> You _also_ need the structure definition, or at least its size,
> for the _IO macro to be usable.

The question of _IO is a fine point. However, since the handcrafted
application level structs are guaranteed to be the same size, it
seems moot to me.

> Now that does mean that mon_bin_hdr doesn't strictly need to be
> there=E2=80=A6. but what's the point of not defining the structure that
> you _need_ to have to be able to read the data you're requesting?

The point is to avoid licensing complications. Usbmon is much older
than "syscall exception".
=20
> So in short as for "Why all this?"
>=20
> Because without this change, making a new userspace implementation
> of usbmon requires straight-out copying code from the kernel in
> not-quite-clearcut licensing environment.

False. Making a new application for usbmon requires reading the
documentation. It does not requires copying any code from the
kernel. It is your choice to copy that code.

I see that you got Greg to agree to your change in principle, so
I am okay with providing a fixed binary struct for your convenience.
Post a patch that satisfies him and I'll ack it. But please
leave the falsehoods about structs being necessary out of it.
Just don't put them into comments or the commit message.
Can you do at least that much?

-- Pete

