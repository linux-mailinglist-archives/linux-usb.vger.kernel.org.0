Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D50C1DA99A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 07:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbgETFCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 01:02:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36633 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgETFCF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 01:02:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 842FD5C00E9;
        Wed, 20 May 2020 01:02:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 20 May 2020 01:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=bChJIIkg3DBJcrE9+NeZ9s+OAJ5
        CwT9mZJExOo6AytM=; b=X27+MaIAZaGhS8NGW0u4DVqdB0a0TY0bBTeDh8JMraw
        YK8D/D/JCJV+VknOaCTDtgzYcYrT6pjuykDksLxTSrcvu2Bq+Y9Q0Jv8ExIPdvZ7
        Ww9ZaTuK6GjsOUgPvXaO+3cEU6PdGmduuhB9a2SDBSojJrtnXoCH9ik5wDJjsPeX
        trhpMsUBcAl92NY2LTQzBaUTBXPQhHXDX3csJS2XSJNuZClO6g/1gJns35yI6k3s
        igMPQrPozSGlDM8JgE/u+1iQGwsfHaCG8FCsHVWAagPqhYzwzvGPbaRPpy0TzXpx
        iIOyWV+VfqMecWfdlzMgB28tI1Lly8ro/BjHl130mtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bChJII
        kg3DBJcrE9+NeZ9s+OAJ5CwT9mZJExOo6AytM=; b=a750wh+eE+uIwLiizBZeX1
        fKav+ggFwvonSbnfFXy6SZ6F8G8v0URycUc/qgOPBo46IC50/M55ID1ucn4fajWK
        kGZ+rmGP7KdGgYjpYSZRVA787qRo8ujS/g6yTX9f5COSOAEGJ5GiOZfuJGWsKY2/
        MnaEaQvHl35rPfu5mEz9PJmcdBdtKQD4WJ0qS94lHvR39JKWHyyE/fwsEZVrRdM6
        3cZ47rENzjt5L6EazfwIkWgnHWhuZ8ttdSvqVSEWIy9Xv7SrmOQrwCFBVHkEZ21U
        lQS0uFHpKui7Zzy8xgMUbKKFnCDTkg+nbrFpEWhI9UBBXSyPr9cFPpUE/H9nbT2w
        ==
X-ME-Sender: <xms:yLnEXtTTK6bCegGK9-Sf_tCo5_bbNJP2ZseOb1ICPaTSsQpXeykagw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:yLnEXmzFX4gzD2s76Eiyc6-FWaw2yA26F29CdfEYNKfPapSEAYuHSQ>
    <xmx:yLnEXi1vFrsdP1IVvPjS5PJAwymF28b6OCtoH01VtQIigPELpkmH4g>
    <xmx:yLnEXlAwz5gvV3pxqVf6xOWMv0h-5rC6cz6f6WMZB4lZTGKWG3PYkQ>
    <xmx:zLnEXqb1nShBGVqE24VXq2L5OS3RxulnnUZoNikBRz0fd65qJzz0HA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4D249328005A;
        Wed, 20 May 2020 01:02:00 -0400 (EDT)
Date:   Wed, 20 May 2020 07:01:55 +0200
From:   Greg KH <greg@kroah.com>
To:     Changming Liu <liu.changm@northeastern.edu>
Cc:     "thomas@winischhofer.net" <thomas@winischhofer.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Lu, Long" <l.lu@northeastern.edu>,
        "yaohway@gmail.com" <yaohway@gmail.com>
Subject: Re: [Bug Report] drivers/usb/misc/sisusbvga: undefined result when
 left shift a possible negative value in sisusb_write_mem_bulk
Message-ID: <20200520050155.GB2105777@kroah.com>
References: <BL0PR06MB4548D5526F5BFAD528039FECE5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR06MB4548D5526F5BFAD528039FECE5B60@BL0PR06MB4548.namprd06.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 03:51:04AM +0000, Changming Liu wrote:
> Hi Greg and Thomas,
> Greetings, I'm a first-year PhD student who is interested in the usage of UBSan for linux. And after some experiments, I've found that in drivers/usb/misc/sisusbvga/sisusb.c 
> function sisusb_write_mem_bulk, there is an undefined behavior caused by left shifting a possible negative number.
> 
> More specifically, in the switch statement for case 3, after executing copy_from_user, the the lower 3 bytes of char buf[4] are filled with data from user space.
> And these 3 bytes are left shifted accordingly to form a 32bit unsigned integer, swap32.
> 
> The potential problem is, since the buf is declared as signed char buffer so each byte might be a negative number while being left shifted. According to the C standard, when the left-hand operand of the left shift operator is a negative value, the result is undefined. So I guess change the buf declaration to unsigned will help? Given that it's only used here.

Sounds like a good idea, patches are welcome to fix this.

thanks,

greg k-h
