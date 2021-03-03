Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3369232C616
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 02:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346704AbhCDA1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 19:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38615 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344341AbhCCP6g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 10:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614787028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zG7EkI0+Z0fs1sv0X+3NbJhiR2cohFxDwftaROqThkM=;
        b=N8W0c216TEtL+Mcacvnv4DEY1AyTjkAWnN3Ou+j5DelhFdw6wE2LLGzm8fPhVIf6+VP3g5
        WCy1bF/4tPrQkaqcwbybhsRZW8gLwgjIXpfU8BnUKb2KELzzW3HED7f3kRChAbNvYcS8CH
        RxLhN6cgs1/5iCp+zsqjOsbeS8wAFi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-qQHYEP24OvKlva0egrxthg-1; Wed, 03 Mar 2021 10:57:04 -0500
X-MC-Unique: qQHYEP24OvKlva0egrxthg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF29385EE63;
        Wed,  3 Mar 2021 15:57:02 +0000 (UTC)
Received: from suzdal.zaitcev.lan (ovpn-114-139.phx2.redhat.com [10.3.114.139])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6F27960D01;
        Wed,  3 Mar 2021 15:57:02 +0000 (UTC)
Date:   Wed, 3 Mar 2021 09:57:02 -0600
From:   Pete Zaitcev <zaitcev@redhat.com>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Message-ID: <20210303095702.0ad1e5d7@suzdal.zaitcev.lan>
In-Reply-To: <BYAPR11MB2632D5B277F40BB273D639CAFF989@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
        <YDyfL/yg9QNM4nku@kroah.com>
        <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YDymu1AlS+8UjdXG@kroah.com>
        <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YD3jlIR7UJjXT6Se@kroah.com>
        <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>
        <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
        <BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
        <BYAPR11MB2632D5B277F40BB273D639CAFF989@BYAPR11MB2632.namprd11.prod.outlook.com>
Organization: Red Hat, Inc.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 3 Mar 2021 07:15:08 +0000
"Zhang, Qiang" <Qiang.Zhang@windriver.com> wrote:

> >+       if (!usblp->present)
> >+               ret != EPOLLHUP;

> Should it be  ret |= EPOLLHUP;  
> Reviewed-by: Zqiang <qiang.zhang@windriver.com>

Ouch. I'll fix that, do some (sadly minimal) tests, and submit.

-- Pete

