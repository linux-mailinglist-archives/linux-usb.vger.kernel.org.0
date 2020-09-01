Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87B2259019
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 16:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgIAOQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 10:16:34 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:37127 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728149AbgIAOQY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 10:16:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 402AB5C0174;
        Tue,  1 Sep 2020 10:06:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 01 Sep 2020 10:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=8RbVxJiEral7B3Pu4a2FKIP62+S
        SGv5Wx/1IGk9gCCs=; b=EYISlXo6DzEjTOukUpPOXNggt4lOJwEx8Z0DSdVrrSj
        xRfaUGJ8xXtyQW239HV+hxwNCGQ/yKPwl0o409yJkwpb61wRu7mvjLJKgexyanmd
        PfKUhvJAR439umQl9yYfu7Sexg7ohEyF7xqwYfQ/3uETyBQfag/9O5bkclS4kQx+
        kS2M5cisbjR+cAW97R8r6dAgHvBQVFtT1ypA4v8nW9LqC9M7MKlsE+kUm9CyE7va
        8M77x0vy8zxYCAnnJAz8oB1Zq9DBko3YZ3fqzrmbD5TUd6UHBojAPprDbDYzB2Xp
        GPXSlrziREPtDRzOBWQtKjpG/3nAWJ00YcMT0spwyOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8RbVxJ
        iEral7B3Pu4a2FKIP62+SSGv5Wx/1IGk9gCCs=; b=At5z4fx8tz7QCTzfLSLr5v
        AzgD5+E+g8ltVOtkmECM6EmOfMCrIZjfvPDnpcI9JNimU9Hqir3iYRO6QHUU7YA8
        A+aNhY0rMoe/KvXQed0oD1+iIwp0W8ZrhEvs5VesCmhDiOZ3Hxw8qqbyhSA+VbVl
        m47mwQK11+SLd5Tdv9oXlWHOdsRdCJnVoxiGSjDeT6QnbW4w67jmgvbdwgIwAso7
        Z0h43dutv0F6FB97HEGg91UgZapdIhGOcLe4oJEsLZOGRfX22RcGuxe3XJLWOvRn
        1aVHq50pTQZxX2577KqdTCNZv8l6j1GAM1H9VUMUChSMRVNp25dTCFxn9wxIz2PA
        ==
X-ME-Sender: <xms:Z1VOX-4m8YArYWs8CIZyr5yc1U-Iw_HGtn_ZyK6SgAXmnevbqHD8Eg>
    <xme:Z1VOX36DBR-jF0fUbfbXLe_UFTvPqZJCS-AXj3Kkr6zQ_qamWEMxwe-yZy1WRMqxS
    KpI68y60keTgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepueelledtheekleethfeludduvdfhffeuvdffudevgeehke
    egieffveehgeeftefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:Z1VOX9eIBJ1pOA3T_f0hp_K5spCCExLCYhy70sJFnz_7yOx4RGv-2Q>
    <xmx:Z1VOX7LZ9sovjilVt3ScAcGIqEOvaBfNVS7WTkhU3f3MIlQxCCYPBA>
    <xmx:Z1VOXyJhDHuIZ5VLPX1sEtbrmRme8Uh_3VbFAa_OQhSGNsS8iaFZbA>
    <xmx:aFVOXxloWx9pStDs5GYWS_QUPaq1oafWozapm0UZGojHZct7nF7zfQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7C85C328006A;
        Tue,  1 Sep 2020 10:06:31 -0400 (EDT)
Date:   Tue, 1 Sep 2020 16:06:59 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208267] usbip broken with latest kernels?
Message-ID: <20200901140659.GA580118@kroah.com>
References: <bug-208267-208809@https.bugzilla.kernel.org/>
 <bug-208267-208809-OFhPjyBGcQ@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208267-208809-OFhPjyBGcQ@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 01, 2020 at 10:41:28AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208267
> 
> --- Comment #12 from DocMAX (forum@docmax.my.to) ---
> Just a side-question: Can things like this happen on LTS versions of the
> kernel?

"things" like what?

Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

for the rules of what type of patches are allowed in the stable kernel
trees.

thanks,

greg k-h
