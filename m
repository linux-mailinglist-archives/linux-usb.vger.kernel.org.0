Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2B8138421
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2020 00:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731719AbgAKXwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 18:52:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40983 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731714AbgAKXwW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jan 2020 18:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578786740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ND9W4/0vmTNcxkEoZU06zcCn7oxoH4zMeSv5dTaoTZ4=;
        b=CSXegXW/prBalmapdA98vYIZKfkOBSr21Strx/khK7LdgzgdfB20Bgk+50TtWVzoFHjFQ2
        9ZY4hW8Sg/2yKxj8JWvvGFrv+paaHhMqTWRVNeuq4OJmr4WAl0S7z7cbELYsO+wg3YknWL
        Ru2I2Opg/PjysX84PNuc6D/AnI+TmCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-qb0pz1lKOxqvQkscg-0iQQ-1; Sat, 11 Jan 2020 18:52:19 -0500
X-MC-Unique: qb0pz1lKOxqvQkscg-0iQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15CB91005516;
        Sat, 11 Jan 2020 23:52:18 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-116-78.phx2.redhat.com [10.3.116.78])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2D3107C00F;
        Sat, 11 Jan 2020 23:52:17 +0000 (UTC)
Date:   Sat, 11 Jan 2020 17:52:16 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tomasz =?UTF-8?B?TW/FhA==?= <desowin@gmail.com>,
        linux-usb@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>, zaitcev@redhat.com
Subject: Re: [PATCH] usbmon: Report device address assigned to USB device
Message-ID: <20200111175216.5b5680ea@suzdal.zaitcev.lan>
In-Reply-To: <20200108155513.GB2451129@kroah.com>
References: <20200106093724.22947-1-desowin@gmail.com>
        <20200108155513.GB2451129@kroah.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 8 Jan 2020 16:55:13 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Mon, Jan 06, 2020 at 10:37:17AM +0100, Tomasz Mo=C5=84 wrote:
> > Make USB device addresses match while sniffing USB communication
> > with usbmon and hardware USB sniffer (OpenVizsla) at the same time.
> > On xHCI root hubs the address is assigned by hardware and can be
> > different than devnum.
>=20
> This breaks the userspace abi for matching up the devnum with the number
> that is listed by the kernel to userspace, making it really hard to
> match things up for xhci devices now :(
>=20
> I understand the need to look at this data, but you can't do it in a way
> that will change things like this.

This sounds reasonable, although perhaps unfortunate. I acked Tomasz's
patch because I thought that XHCI is new, and thus it's no big deal
if its results are different.

Of course I rushed to examine the packet structure, but yes, there's
no space in the header, not without some trickery. For example, the
upper 8 bits of the ID are probably the same for all packets, so
it may be stuffed in there. Or, it might be possible to create an
extra header and attach it at the end of ISO descriptors.

Alan's suggestion of leaving the physical address in /sys appeals
the most to me, honestly. One thing though, libpcap will need to
rifle through /sys and then store that address, so its serialization
has to be changed no matter what. Unfortunately, I'm wholly ignorant
as to what syntax it uses and how extensible it is.

-- Pete

