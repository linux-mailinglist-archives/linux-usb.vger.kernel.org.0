Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC8810A96D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Nov 2019 05:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfK0EfQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 23:35:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33887 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726546AbfK0EfQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 23:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574829315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kf4tBJeSBpTOghZSEb05jxKmLi+cR7uV56YuDFxVL+o=;
        b=agghuEOHERCkW1TxmH4yPDdtrtJ7eVgCuELSIxSOqrT+wq3dj5IQT3LDICEe5g0GxqIz86
        9ciz9gHdy+yp0GZLk5RRgRbEPq/3/4q4ImrlL0RmKO9qob4V+hr4u4MXj0l3OgrpPD42n8
        fI3zKKW1USUQx32Q9WXRWtmWZUs7hHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-sOp1gPWcP0SzZFWxZGFnzw-1; Tue, 26 Nov 2019 23:35:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65669184CAA2;
        Wed, 27 Nov 2019 04:35:10 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-117-3.phx2.redhat.com [10.3.117.3])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 00C025D6C8;
        Wed, 27 Nov 2019 04:35:09 +0000 (UTC)
Date:   Tue, 26 Nov 2019 22:35:09 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: mon: Fix a deadlock in usbmon between mmap and
 read
Message-ID: <20191126223509.69fb61ed@suzdal.zaitcev.lan>
In-Reply-To: <Pine.LNX.4.44L0.1911261018110.1508-100000@iolanthe.rowland.org>
References: <20191126004407.4b72ef7f@suzdal.zaitcev.lan>
        <Pine.LNX.4.44L0.1911261018110.1508-100000@iolanthe.rowland.org>
Organization: Red Hat, Inc.
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: sOp1gPWcP0SzZFWxZGFnzw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 26 Nov 2019 10:20:14 -0500 (EST)
Alan Stern <stern@rowland.harvard.edu> wrote:

> > Signed-off-by: Pete Zaitcev <zaitcev@redhat.com>
> > Reported-by: syzbot+56f9673bb4cdcbeb0e92@syzkaller.appspotmail.com  
> 
> Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Thanks.

> Fixes: 46eb14a6e158 ("USB: fix usbmon BUG trigger")

Indeed... Either I didn't think that one through, or the copy_to_user
used not to take the mmap_sem.

> CC: <stable@vger.kernel.org>

Do we really need this? The problem was in the code for more than 10 years.
It's not like anyone is exploiting systems because of it.

If we do need it, I should cc: the submission to the same place too, right?

-- Pete

