Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65F8215BA2
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 18:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbgGFQPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 12:15:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57195 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729441AbgGFQPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 12:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594052114;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6hkg3JoJm7SOdF/X+VE5hjuLyKt8cFZHRD/UW3ecJKQ=;
        b=GaUcx8YkcvVRyveFbiAJOOIiBKejYN2tCiXVoC+ylpy8dVFazhxxiuXw8Vt45Xv2mCoCvq
        pn3RdKvUZzxbuynSPdGWJ0TiEErtQwVA/srIyW6KLWOF4uEAJnsQ6aEpo0weFLmtXyHQt1
        ygVy3z1lti7GDRtOPMmzDa70WAVaAaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-DFUgpMh5Oe22ug1GgfxT9A-1; Mon, 06 Jul 2020 12:15:11 -0400
X-MC-Unique: DFUgpMh5Oe22ug1GgfxT9A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85958107ACF6;
        Mon,  6 Jul 2020 16:15:10 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-112-162.phx2.redhat.com [10.3.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 204CC5C1B2;
        Mon,  6 Jul 2020 16:15:10 +0000 (UTC)
Date:   Mon, 6 Jul 2020 11:15:09 -0500
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Diego Elio =?UTF-8?B?UGV0dGVuw7I=?= <flameeyes@flameeyes.com>,
        linux-usb@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>, zaitcev@redhat.com
Subject: Re: [PATCH v2] usbmon: expose the usbmon structures and constants
 as an UAPI header.
Message-ID: <20200706111509.5958d95b@suzdal.zaitcev.lan>
In-Reply-To: <20200706124943.GA2270456@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706121509.26439-1-flameeyes@flameeyes.com>
 <20200706124943.GA2270456@kroah.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 6 Jul 2020 14:49:43 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> > +struct mon_bin_get {
> > +	struct mon_bin_hdr __user *hdr;	/* Can be 48 bytes or 64. */
> > +	void __user *data;
> > +	size_t alloc;		/* Length of data (can be zero) */  
> 
> is size_t a value we can pass across user/kernel boundry?  Are you sure
> this isn't __kernel_size_t?

Sorry, it was my fault letting that one through.

Since currently the definitions are separate, userland uses their size_t,
and kernel uses in-kernel size_t. We have a set of MON_IOCX_GET and
MON_IOCX_GET32 with the same base number 6, but using mon_bin_get32,
so the resulting ioctl number magically matched what 32- and 64-bit
applications used. We don't even need an adaptation layer that
re-encodes the argument structure.

Not sure how to resolve this properly once we attempt to export the
structures. Something for the patch submitter to work out, I suppose.

-- Pere

