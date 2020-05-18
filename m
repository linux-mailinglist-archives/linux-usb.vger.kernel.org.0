Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109121D8A8B
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 00:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgERWP2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 18:15:28 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60549 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726386AbgERWP2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 May 2020 18:15:28 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id C39105C00E3;
        Mon, 18 May 2020 18:15:26 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 18 May 2020 18:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=MX0bPRvVsWlP9MJcD9J6i4IwbZqsVHy
        WUUNimFIY4qc=; b=LlW3g+/flIX03VWLhECQzFSpiaeNUr7LTqye1U6TbLetPAX
        EDy/+cwIQ8x6vg/E0Gh2+uDiLk8wdlFSDBIVjBEoRNRiZuR42fsrPXZqpLJZz6NV
        6Kch83NRh8/WXNYfu/RFsvCr4ju3+gYaxDQ2RWr6hKwUYqFU7w7QKQOWOyAAW9YC
        aUGvvoJ0Aaf2vQI8mDidynK61rKaDyoAopgwgFl2XH6E4kaDsk0m3AsxcVgDNE1h
        Gcz4alaNlzed2rScCWXyXzBaVanNsEdYhIoRz/MEK9yXOtHjUlnZWmDuoOmq5d8n
        7ufHK22OHb0CyY2hLmwt+5cT4WVM97kbNUrlbog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MX0bPR
        vVsWlP9MJcD9J6i4IwbZqsVHyWUUNimFIY4qc=; b=113G1tRc76rJcU78R7aKOG
        Nt3p8y+z0CyJL4o6VDxlDH6hl41B0kQn6ggMAMlie2HCLCBgcw+mMCDmKSY56DxT
        OndjrYgu4NoiXDEX0n7EORQ74wUdROZ2amF6RdSCjllu3ZEBZb2C+qr8T6iWRrri
        GW/kjoFa8KH9tVc0B8r5sEUGuCv15RYdkw7Av6XAQL2i5UIyYwtwhMg89PNvBPGj
        7NNH0DEjvmaQxlD3EI3vrBxsj9bSNUvntecTAFVvDAbR18u/16Ksorcer9YQhtYN
        dJB2Bv7qc4UglkivEJ2YRszvH9dob4jlucvhXTmklrkSGyDKKKXjmGJ5iDXGPEfA
        ==
X-ME-Sender: <xms:_gjDXlVQjQrzkv4FR39NPCD7hBt_SuxcfV_8GUG8Hcb2kHCrlLXnsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtiedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepveelie
    dtgeehgfejfffffeffheffteduvefgvefguefgheehudevfefhhffgheeinecuffhomhgr
    ihhnpehtohhgvghthhgvrhdrtggunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:_gjDXlmuqYCWWAdEhaXCFF7wmEmmPKLTKGo5O9PVqv-gftZucvcHgQ>
    <xmx:_gjDXhaKTxo8mlWd__ixkAkI4KgmqB2Pknv0C3eZkUNpsVl4x06lPw>
    <xmx:_gjDXoX7GE_KA32qs38EhoGbLzKoKFPa9ptPtnRxWLIWiflbLtgBCg>
    <xmx:_gjDXlTzyeI0_4pz9C7TjPN2TBaAyKCX3DV7pPoxfOk38HItH4FwDw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 293CC660089; Mon, 18 May 2020 18:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-464-g810d66a-fmstable-20200518v1
Mime-Version: 1.0
Message-Id: <83ac8b7b-e0e7-4615-8ebf-4c98e596577b@www.fastmail.com>
In-Reply-To: <20200518054914.GC27612@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
 <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
 <20200518054914.GC27612@b29397-desktop>
Date:   Mon, 18 May 2020 17:14:33 -0500
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

On Mon, May 18, 2020, at 12:48 AM, Peter Chen wrote:
> On 20-05-16 00:57:55, Sid Spry wrote:
> > On Thu, May 14, 2020, at 8:05 PM, Peter Chen wrote:
> > > 
> > > > >
> > > > > Would you please let ECM gadget work first at your board, then let
> > > > > f_fs work using test application (you need to compile both host and
> > > > > device application for it). After that, you may have more precise
> > > > > concept for Linux USB gadget framework.
> > > > >
> > > > 
> > > > I don't see anything that harmonizes preexsting function usage with specifying
> > > > custom endpoints.
> > > > 
> > > > I've gotten the ECM gadget, and then the ECM gadget via ffs working. I've read
> > > > through the ffs test but I don't see any way to assign functionality to the endpoints.
> > > > The example seems to transport raw data via a bulk endpoint. I know enough to
> > > > instead assign an isochronous endpoint to the UDC and transfer via that, but I don't
> > > > want it to be the *only* functionality the device offers.
> > > > 
> > > > Are you saying I can assign the ECM gadget via ffs and then add another driver
> > > > after the fact? 
> > > 
> > > ffs (f_fs.c) is used for customized function, other functions, like ECM (f_ecm.c)
> > > and Mass Storage (f_mass_storage.c) are used for certain function. You could
> > > use configfs (like you have done below) to put customized function and certain functions
> > > into one configuration, and let the host see them at the same time. Do your
> > > real requirement is one customized function and one ECM function in one USB gadget?
> > > If it is, below is the example to combine f_fs, mass_storage, and NCM together.
> > > 
> > > cd /sys/kernel/config/usb_gadget
> > > cd g1
> > > echo "0x1d6b" > idVendor
> > > echo "0x0105" > idProduct
> > > mkdir /dev/usb-ffs
> > > mkdir functions/ffs.usb
> > > mount -t functionfs usb /dev/usb-ffs
> > > ln -s functions/ffs.usb configs/c.1
> > > /home/root/usb_test/ffs_test/ffs-test & /* your own test application */
> > > while [ ! -e /dev/usb-ffs/ep1 ]
> > > do
> > >  echo "."
> > >  sleep 1;
> > > done
> > > mkdir functions/ncm.0 
> > > ln -s functions/ncm.0 configs/c.1 
> > > mkdir functions/mass_storage.0
> > > ln -s functions/mass_storage.0 configs/c.1
> > > echo $FILE > functions/mass_storage.0/lun.0/file 
> > > 
> > > Peter 
> > > 
> > 
> > Hi Peter, thanks for the advice. I realized I was confusing FunctionFS and ConfigFS a little while after I sent my message and saw the FFS configuration in the ConfigFS documentation.
> > 
> > And yes, I need ECM/NCM (one is newer and faster, will go look it up again) and my custom function. I may also include a serial port.
> > 
> > I have been having issues creating any file called "ffs.${id}" in the gadget directory. It fails with device or resource busy. I assume this means I have misconfigured it, but I am copying your example; or missing the driver, but I have ensured it is there.[1] I have also tried ensuring the ffs function is added first. Any pointers?
> > 
> 
> 1. Please build in all configfs functions, and choose through the
> script.
> 
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_CONFIGFS_SERIAL=y
> CONFIG_USB_CONFIGFS_ACM=y
> CONFIG_USB_CONFIGFS_OBEX=y
> CONFIG_USB_CONFIGFS_NCM=y
> CONFIG_USB_CONFIGFS_ECM=y
> CONFIG_USB_CONFIGFS_ECM_SUBSET=y
> CONFIG_USB_CONFIGFS_RNDIS=y
> CONFIG_USB_CONFIGFS_EEM=y
> CONFIG_USB_CONFIGFS_MASS_STORAGE=y
> CONFIG_USB_CONFIGFS_F_LB_SS=y
> CONFIG_USB_CONFIGFS_F_FS=y
> CONFIG_USB_CONFIGFS_F_UAC1=y
> CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> CONFIG_USB_CONFIGFS_F_UAC2=y
> CONFIG_USB_CONFIGFS_F_MIDI=y
> CONFIG_USB_CONFIGFS_F_HID=y
> CONFIG_USB_CONFIGFS_F_UVC=y
> 
> 2. Try exactly the same script I gave you, do not try change
> any charaters (except the position for your application)
> 
> > > cd /sys/kernel/config/usb_gadget
> > > cd g1
> > > echo "0x1d6b" > idVendor
> > > echo "0x0105" > idProduct
> > > mkdir /dev/usb-ffs
> > > mkdir functions/ffs.usb
> > > mount -t functionfs usb /dev/usb-ffs
> > > ln -s functions/ffs.usb configs/c.1
> > > /home/root/usb_test/ffs_test/ffs-test & /* your own test application */
> > > while [ ! -e /dev/usb-ffs/ep1 ]
> > > do
> > >  echo "."
> > >  sleep 1;
> > > done
> 
> > 
> > [1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM set however the necessary code seemed to have been pulled in some other way and the modules were available. They were loaded, and as explained my shell-based configfs code worked. They are set now and the problem persists.
> 

Hi, sorry I was not clear. The kernel config is fine, and CONFIG_USB_CONFIGFS_F_FS is set. I run your exact script (minus the ffs-test line) and it fails to create the functions/ffs.usb directory as I described before. I can create other functions just fine.
