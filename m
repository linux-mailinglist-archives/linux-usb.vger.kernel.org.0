Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9940413DD37
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 15:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgAPOQu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 09:16:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38627 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726189AbgAPOQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 09:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579184206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=+eM791Q4Hey50CwTWaFap7VYvLNXZAugVxwugwJGukU=;
        b=K9c1ANRoMygFJVZKkYi45P1fbFIvHXiEov5fheSN9AsPRmQt0+RGadr/598VfsvDQNy//d
        0DnGOlsCCIhmvC/Rd7wdKn5YYyFZMrwbL2SF7Kgw/i+SUJPtsL3GueMvR9m6MD2Cc6GqUL
        qRUY3QgPWtW7tvzdgMoVQPTp9SOntbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-Fn1Oq7pOPN6uTqzQsN5PzA-1; Thu, 16 Jan 2020 09:16:44 -0500
X-MC-Unique: Fn1Oq7pOPN6uTqzQsN5PzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77C5F102C860;
        Thu, 16 Jan 2020 14:16:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-52.rdu2.redhat.com [10.10.120.52])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7A59A80A5C;
        Thu, 16 Jan 2020 14:16:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
To:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
cc:     dhowells@redhat.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Do you have a sink for USB notifications?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8179.1579184166.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
From:   David Howells <dhowells@redhat.com>
Date:   Thu, 16 Jan 2020 14:16:41 +0000
Message-ID: <8232.1579184201@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Eugeniu, Spyridon,

Do you have a consumer program for USB notification events?  I'm would lik=
e to
get my general notification queue patches upstream in this merge window, b=
ut
it appears that Linus would like there to be userspace consumers first.

Greg pointed me at your patch:

	https://lore.kernel.org/lkml/20190605090556.17792-1-erosca@de.adit-jv.com=
/

My latest patch set is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log=
/?h=3Dnotifications-pipe-core

This provides access to keyring, usb and block device notifications.

Thanks,
David

