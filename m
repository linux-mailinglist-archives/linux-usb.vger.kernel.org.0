Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECBF14E995
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 09:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgAaIaf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 03:30:35 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:34461 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728099AbgAaIaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 03:30:35 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id F40A722478;
        Fri, 31 Jan 2020 03:30:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 31 Jan 2020 03:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=QjYW3nA9tWlcB+vkqlOtHgj5h+s
        ohOe4otKTpmlc6/w=; b=lpGwBes7B5l9VV3QIzNolXqLEpFmNJxu0pHwYIrYTqY
        YotMh/Yr4yGwTpm2gMq4QjiKWUwXzdtrSu11p1xwtqqvvr35zTq39olZwMLm1Kxh
        5DqWMeDDtgqeANi/nemhSQGnXQ7uS28xlyOAq13iH2jpsviwTJ4BFB9ZfDj+7MBB
        cx7W4Hu+Amq+Xn+/bCqF7hbxj80ikJFSJ9JTuyR10nPpl4K9UmMhfhN+Sum76NIL
        xPy/xlbxqyC9GXuHw77bEHMBvbh9STP0L/ffiG0i9gCj771RFA10O3S4J1ZHVWu7
        9OIhllmi6pUHxATuZ7HKo7l4rUZSnlUqVZ/8aaHySHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QjYW3n
        A9tWlcB+vkqlOtHgj5h+sohOe4otKTpmlc6/w=; b=amCHXZ3kOGd3Of3YbGEyfQ
        G7KPww4QvP2NntGdMwM/YrhGHUvi/sR1DxpBwrrmkM59nfxUruEQElNjREJI1WEM
        rd3QfpN5ePWdbdGWZuVcym4BsNSzI3TzWD2eCC2GU5mQ1vhsT6MII5rM7ccDlRml
        mKCjh2mEdvdfbvfAe3N0XGLC4EduNU/cp79mDui202SnsNxGsEHzj74a7YeJpM8b
        +THbDupIK6T6EUkkCxpZ90mu2lN54bfpwQsoXWH9uAp2ZdQC2w9sCAp+UjTUP4VF
        5JpgNlOKHxq1Jq6F4YFPMuURqdIhECYqleXl6U9oG2mh1Iy/xGy4z/GoH4clEW7A
        ==
X-ME-Sender: <xms:quUzXjh3hSJpgBcV-PrBE6Lj595K--7RTvmo99I_ofHIBRUHf1Vlfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:quUzXgTIMd5qI0AvDJXdHSX2GnPfk0AJ61Q_5F54sF7tcROB-EU3Ww>
    <xmx:quUzXr90xKptyrwWjZe3JoQOgYmCz0WnrVpEmuV5ZDi8_7DjDQ4KPA>
    <xmx:quUzXkI0C6uFc4lydDCaaHtqwEa0DLDTaR-7qlMJN9PB3ZlwKjUDPg>
    <xmx:quUzXuGBwpcCf89F5wwor8kuxxYBCDuGxqlaNjk7DGPe5VmX50qDjQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 4B9C6328005E;
        Fri, 31 Jan 2020 03:30:34 -0500 (EST)
Date:   Fri, 31 Jan 2020 09:30:33 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 206365] New: kernel NULL pointer dereference when charger
 is unplugged
Message-ID: <20200131083033.GA2226722@kroah.com>
References: <bug-206365-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-206365-208809@https.bugzilla.kernel.org/>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 31, 2020 at 08:22:53AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=206365
> 
>             Bug ID: 206365
>            Summary: kernel NULL pointer dereference when charger is
>                     unplugged
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.3.4-300.fc31.x86_64

5.3 is quite old now, please try a 5.4 kernel or newer.
