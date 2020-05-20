Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4C71DA9DF
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 07:28:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgETF23 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 01:28:29 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:53123 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726309AbgETF22 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 01:28:28 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 97C06AF4;
        Wed, 20 May 2020 01:28:27 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Wed, 20 May 2020 01:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=WWgqZeVVZeL7PUFyIouoviKWSVHPyJA
        3Ii1yerpBi1I=; b=dAPq3+f8c6Tq9IZ0UsF+3M9JnW6Yj/AIwEctHBzRxrBp40q
        9DGbC+00TGDGIsfu0x9STym+77lmJ2SMg5UjMi10jJJcCY4MYYdw777F/D50TCUC
        dYINdAp8zxLJDujUT8QHjaNc3hZkChbdYK1W1pvJ93Ro5AiGKgJUc/6V/L/A2kQX
        D0WZo2E7LoLwrbxfq6OBdHcuhon9fnWRF6VFJVBimHUtIhBu7oEAPhxE1WvrLmgC
        ZKxT4gUbQG4Wk7pCuFWUro2Yn361SmrtMfdIdb4EbJ6wZd2hsIl4nWnlN7XgOU/W
        uGIf31kNWErOwTkBWsZskYENzb+LVTsoea6EbHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WWgqZe
        VVZeL7PUFyIouoviKWSVHPyJA3Ii1yerpBi1I=; b=WzCK4lyX+rRV1R5uG78MSW
        6cJWUxl5DuudybDZAlqp7WyPR2hLc9qvN2f2c69giIL6raKTRDAPqHrPRZLrd2QX
        uYPz0L7PDraygCwXC5Bd7HMJymdYQ+qfzv24hShpFaCp+EUoCDFk1AnKNcQ0eWTD
        BdrOFInyGNRNLmnBEQ+OhEkusjmFR0bc/jpwYkao0W6dRy0rrvsu5ztZpaDbn1LK
        6C5an7r7w5OEpPYI+pFkOXJc7E19ZJHqHFd5jFBvH6osdRbyBfE6WYxu602tEbmV
        i6IH61C1RKnPjX3KFtNzY7OsZDgItOw+LYCZd3xgazy0yi61ntwdzvtsMOO8n3Xw
        ==
X-ME-Sender: <xms:-b_EXt6QNbN7PR4JeVGyqhyy5X0FHVZjh9RcYLwn9tlnFiXp3an0Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtkedgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepveeghf
    evveetteefteekjeejhedufffffffhuefflefhueffudefudeljeefuefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:-b_EXq4-lMYVfawBrc2v6Eq6XI86iOuZ_pVMAbmEkBpF_HVLuRQm6A>
    <xmx:-b_EXkdcN2Fvi19_aqcGtWhUjafIAIbCETGZr5Ngywvu5bt74RCiXw>
    <xmx:-b_EXmKA0Qmmx1abepMok0wxdthtfYm_dIjR4VL_YPG3v2XvHH8GrQ>
    <xmx:-7_EXjwbA4KR6a19T-46LykgbNqXPvSfWTmr52Wf8nAWrjuG8tiu0g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6C28466007B; Wed, 20 May 2020 01:28:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-464-g810d66a-fmstable-20200518v1
Mime-Version: 1.0
Message-Id: <1aca8e3c-3a60-4b7c-b517-e8409f1c4d2e@www.fastmail.com>
In-Reply-To: <689edc51-b60c-fa4a-e481-10861d67bfb1@samsung.com>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
 <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
 <20200518054914.GC27612@b29397-desktop>
 <83ac8b7b-e0e7-4615-8ebf-4c98e596577b@www.fastmail.com>
 <AM7PR04MB71575A56A92CCFDE8B460FC88BB80@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <0eb0d4d7-9ac1-4018-9422-651481ce3125@www.fastmail.com>
 <CGME20200519194201eucas1p14a5bb237d54c31b7bdb594e831dbcd22@eucas1p1.samsung.com>
 <e5f3e26a-8b4b-4c98-ba9b-e912cd75491f@www.fastmail.com>
 <689edc51-b60c-fa4a-e481-10861d67bfb1@samsung.com>
Date:   Wed, 20 May 2020 00:27:32 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Krzysztof Opasiak" <k.opasiak@samsung.com>,
        "Peter Chen" <peter.chen@nxp.com>
Cc:     "Felipe Balbi" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020, at 2:51 PM, Krzysztof Opasiak wrote:
> 
> 
> On 19.05.2020 21:40, Sid Spry wrote:
> > On Tue, May 19, 2020, at 2:12 PM, Sid Spry wrote:
> >> On Mon, May 18, 2020, at 6:58 PM, Peter Chen wrote:
> >>>   
> >>>>> 2. Try exactly the same script I gave you, do not try change any
> >>>>> charaters (except the position for your application)
> >>>>>
> >>>>>>> cd /sys/kernel/config/usb_gadget
> >>>>>>> cd g1
> >>>>>>> echo "0x1d6b" > idVendor
> >>>>>>> echo "0x0105" > idProduct
> >>>>>>> mkdir /dev/usb-ffs
> >>>>>>> mkdir functions/ffs.usb
> >>>>>>> mount -t functionfs usb /dev/usb-ffs ln -s functions/ffs.usb
> >>>>>>> configs/c.1 /home/root/usb_test/ffs_test/ffs-test & /* your own
> >>>>>>> test application */ while [ ! -e /dev/usb-ffs/ep1 ] do  echo "."
> >>>>>>>   sleep 1;
> >>>>>>> done
> >>>>>
> >>>>>>
> >>>>>> [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM
> >>>> set however the necessary code seemed to have been pulled in some other way
> >>>> and the modules were available. They were loaded, and as explained my shell-
> >>>> based configfs code worked. They are set now and the problem persists.
> >>>>>
> >>>>
> >>>> Hi, sorry I was not clear. The kernel config is fine, and
> >>>> CONFIG_USB_CONFIGFS_F_FS is set. I run your exact script (minus the ffs-test
> >>>> line) and it fails to create the functions/ffs.usb directory as I described before. I can
> >>>> create other functions just fine.
> >>>
> >>> You may enable debug at configfs.c, f_fs.c and your udc driver to see
> >>> what happened.
> >>>
> >>
> >> Thanks for your help Peter. Unfortunately I have hit a brick wall. The
> >> examples in libusbgx also fail to work, and I tried that library after
> >> a friend recommended it as perhaps having secret mojo. I enabled the
> >> userspace debug helpers in the kernel but they do not seem to offer me
> >> any insight, and there's no relevant dmesg output.
> >>
> >> My device is an Allwinner H2+, and the UDC seems to be the Inventra
> >> Highspeed Dual Role Controller. I've also got the DesignWare USB3/USB2
> >> cores enabled from my upstream but I think they are not being loaded.
> >>
> >> If anyone can look I'd appreciate it, this is just a hobby project.
> >> It's a good chance for me to do some kernel debugging but I'm a bit
> >> lost.
> >>
> >> Thanks for the help so far.
> >>
> > 
> > Sorry for double post again. Alternatively, if anyone can recommend a device which they know has working ffs configfs gadget functionality, I'll just buy a board with that instead.
> 
> Can you send me the strace log from the libusbgx example that does not 
> work for you?
> 

I apologize for the anticlimax, but some minor option I changed seemed to gate the bug. It may have been that I compiled in the DWC controller's dual mode instead of leaving it as module and this claimed the UDC in some way? The DWC dual-mode was compiled in as it caused a compilation issue in an older kernel.

I can now create the directory. Will get back if I can get the driver code working, the example references the linux source code in a strange way, haven't figured out how to add all headers.
