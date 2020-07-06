Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D07215165
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 05:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgGFDva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Jul 2020 23:51:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57705 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728703AbgGFDv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Jul 2020 23:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594007487;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VfOsLo6mKvd67D88sG1ANHcRW24oVRHNjoQVU9hJmkw=;
        b=dEK5i0u9jAmLGoyA6ZOyrA9BVLQn+KifZwuFTXjffi1b/g73jAbmTSQrluSiD9btzAzSdD
        ZnvajxnkjnlJbpAzIYGD+3fD/3y1kq3Os0QqqpEhxwhfmGsbtag9RcptwuNgQaRzBXxxX1
        mSxGgkKrNShWuWr6IvQDQXPre1qu49o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-a4cedlPsOke0kV6v3gK-8A-1; Sun, 05 Jul 2020 23:51:25 -0400
X-MC-Unique: a4cedlPsOke0kV6v3gK-8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 152D5805EE6;
        Mon,  6 Jul 2020 03:51:24 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-162.phx2.redhat.com [10.3.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9CAFE1A91F;
        Mon,  6 Jul 2020 03:51:23 +0000 (UTC)
Date:   Sun, 5 Jul 2020 22:51:22 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Diego Elio =?UTF-8?B?UGV0dGVuw7I=?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, zaitcev@redhat.com
Subject: Re: [PATCH] usbmon: expose the usbmon structures and constants as
 an UAPI header.
Message-ID: <20200705223741.496f9603@suzdal.zaitcev.lan>
In-Reply-To: <20200705150225.21500-1-flameeyes@flameeyes.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun,  5 Jul 2020 16:02:25 +0100
Diego Elio Petten=C3=B2 <flameeyes@flameeyes.com> wrote:

> Previously any application wanting to implement the usbmon binary
> interfaces needed to re-declare the structures and constants, leading to
> structure duplication and confusion over whether these structures fall in=
to
> the system call exception or not.

I am not sure I follow the logic in the confusion claim above. Since the
applications define their own headers, they do not use the kernel source
at all. Therefore, there can be no question about any exceptions, and no
confusion. But perhaps I'm missing a turn here. Feel free to educate me.

As for the "duplication", I do not see it as harmful in any way.
And they do not re-declare, they declare. You're trying to create a
centralized language definition that did not exist previously.

> +++ b/Documentation/usb/usbmon.rst
> -  struct usbmon_packet {
> +  struct mon_bin_hdr {
>  	u64 id;			/*  0: URB ID - from submission to callback */

It was named that specifically in order to underscore that it's not
the actual code.

> +++ b/include/uapi/linux/usb/mon.h
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */

Yeah, that. You created the confusion first, and then resolved it
with licensing amendments.

> +/* ioctl macros */
> +#define MON_IOC_MAGIC 0x92
> +
> +#define MON_IOCQ_URB_LEN _IO(MON_IOC_MAGIC, 1)

Okay. Our documentation refers to _IO(), which is a system macro,
so we're not entirely self-containing. I can see an opening for
some sophistry here.=20

Fortunately, include/uapi/asm-generic/ioctl.h already includes
that "GPL-2.0 WITH Linux-syscall-note" thing, so I think we're
clear in usbmon.

-- Pete

