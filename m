Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90C741DA117
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 21:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgESTlz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 15:41:55 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:46035 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726059AbgESTly (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 15:41:54 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 0268D5C0109;
        Tue, 19 May 2020 15:41:53 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Tue, 19 May 2020 15:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=VvrLPitF6kyPmws1/0DnIrCIk7zkUMM
        vWaiZkf1KMO0=; b=bZJSbG1Lz+UHE814H9Rmbubs4qPNMUO15NEc+T9+AWNGJLb
        Hajy6BdNGKJlpCmWalYHBuks+AqDDw0Jt20eplJEmdCJCJ0TH5BMTT0CkUULgdjo
        5ihJcSYsjOLsA3+uRLcj2Ys++kMiHuo8W1HeuyScaohtgpAJuVFH+l0biLbK7qPZ
        QfFyJ0m51zJQ7IcXC29NlUxM0DYGX7eRbRlj/3b13ub8gy9z4zJwYpf8Cg0N9QYi
        mKLbQe5BNCl1rLhE2MAcWV9aTi+TI1AkhYGJCvn8msDNYh3aAhy36JoPWMX+YeZ7
        3Z2/eXUc53wCzoOVQgOAm6+yDmEXI2rjiq2LYKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VvrLPi
        tF6kyPmws1/0DnIrCIk7zkUMMvWaiZkf1KMO0=; b=ES2OztV5aqXEtdtTbqIQRc
        fiJsRfVycx/oaVSRre42XjqfFKY0076GtDYt+xC9GCbyBWzSwa2H59rT3PCHwRsV
        RP3Oqd/fvo7f27cbN0kVHNL5Qbwm08xCltxi6WO3UJIC2nRa2nkLfx1kkoze4Dn8
        yUrOqplYbF2vVFwzGvpIYrdYwVg+zDDTjrNA2ufulern0/9Irww4up13p4hRJ5mo
        bmwfabJr/zdP31a5RhejmexU+bIoCHsmDJGMMh+sSJPjxpFU5mUX+ftuHnoGNcyF
        myx5WEl8016tqRzgLgdS1HBexMWipKal9ooUluN9duSKnZlDWdwX3302u/28yc8w
        ==
X-ME-Sender: <xms:gDbEXpZg-zCzb92tYgeQzYdzadSdGlFSl1VOJo17ixHiw3Upp8gyag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhi
    ugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevge
    fhveevteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmh
    druhhs
X-ME-Proxy: <xmx:gDbEXgYADRqxzTTbhuAG4e3cOxpXblVUpRAEoAh6GOAYJSVvasp0lA>
    <xmx:gDbEXr--dvZi9L-hff4Vo9KaDao83SBmwFl0Uvz5YVtiHY04JnCEvw>
    <xmx:gDbEXno95l5WAG3xwM3WPK6nfWxvJPLZWP3zupe2Tf-sHVgaFRPzOw>
    <xmx:gDbEXqHtUplkVqWd6Q2TW0gfNrLEjFnSGAhsTL_V8FuhSJECiOtn4A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 895AF66007E; Tue, 19 May 2020 15:41:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-464-g810d66a-fmstable-20200518v1
Mime-Version: 1.0
Message-Id: <e5f3e26a-8b4b-4c98-ba9b-e912cd75491f@www.fastmail.com>
In-Reply-To: <0eb0d4d7-9ac1-4018-9422-651481ce3125@www.fastmail.com>
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
Date:   Tue, 19 May 2020 14:40:59 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Peter Chen" <peter.chen@nxp.com>
Cc:     "Felipe Balbi" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020, at 2:12 PM, Sid Spry wrote:
> On Mon, May 18, 2020, at 6:58 PM, Peter Chen wrote:
> >  
> > > > 2. Try exactly the same script I gave you, do not try change any
> > > > charaters (except the position for your application)
> > > >
> > > > > > cd /sys/kernel/config/usb_gadget
> > > > > > cd g1
> > > > > > echo "0x1d6b" > idVendor
> > > > > > echo "0x0105" > idProduct
> > > > > > mkdir /dev/usb-ffs
> > > > > > mkdir functions/ffs.usb
> > > > > > mount -t functionfs usb /dev/usb-ffs ln -s functions/ffs.usb
> > > > > > configs/c.1 /home/root/usb_test/ffs_test/ffs-test & /* your own
> > > > > > test application */ while [ ! -e /dev/usb-ffs/ep1 ] do  echo "."
> > > > > >  sleep 1;
> > > > > > done
> > > >
> > > > >
> > > > > [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM
> > > set however the necessary code seemed to have been pulled in some other way
> > > and the modules were available. They were loaded, and as explained my shell-
> > > based configfs code worked. They are set now and the problem persists.
> > > >
> > > 
> > > Hi, sorry I was not clear. The kernel config is fine, and
> > > CONFIG_USB_CONFIGFS_F_FS is set. I run your exact script (minus the ffs-test
> > > line) and it fails to create the functions/ffs.usb directory as I described before. I can
> > > create other functions just fine.
> > 
> > You may enable debug at configfs.c, f_fs.c and your udc driver to see 
> > what happened.
> > 
> 
> Thanks for your help Peter. Unfortunately I have hit a brick wall. The 
> examples in libusbgx also fail to work, and I tried that library after 
> a friend recommended it as perhaps having secret mojo. I enabled the 
> userspace debug helpers in the kernel but they do not seem to offer me 
> any insight, and there's no relevant dmesg output.
> 
> My device is an Allwinner H2+, and the UDC seems to be the Inventra 
> Highspeed Dual Role Controller. I've also got the DesignWare USB3/USB2 
> cores enabled from my upstream but I think they are not being loaded.
> 
> If anyone can look I'd appreciate it, this is just a hobby project. 
> It's a good chance for me to do some kernel debugging but I'm a bit 
> lost.
> 
> Thanks for the help so far.
>

Sorry for double post again. Alternatively, if anyone can recommend a device which they know has working ffs configfs gadget functionality, I'll just buy a board with that instead.
