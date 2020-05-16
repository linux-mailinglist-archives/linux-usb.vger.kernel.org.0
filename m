Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5AA1D5EF8
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 07:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgEPF7D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 May 2020 01:59:03 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33671 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbgEPF7D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 May 2020 01:59:03 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id F3CF35C009E;
        Sat, 16 May 2020 01:59:01 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 16 May 2020 01:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=fZCp0GyNy+ELRiIxS6s48B5mLw3hJAw
        JDY0Q9QEq+V0=; b=krLO4EN77NSrL+EnbTysuOIcE1ZNwellISXUAP6pLI0rLeK
        D4gNMIaVTSDcHZWX6Q04z9EjleQ6kZRuMOd14nbMcngpeGGpfU1FcOv75TwzvCYg
        HkrCxgtkwSGveMe1v8zUlC3aZguE2VeDR3miANQesr3onvGfGSuu3cf+q64zm2gQ
        WBvhmsruPlGhkeogxPC8BIoMqK+wMO/lb4UVL89et0m2Q80NAdBQ4MoXOxncvdof
        0eWnP9Fly/gxCI10sjLpaUkFKS1oKI5/Oyr8brZe9BzqwT3PrqevVzHXmBDLGgHt
        gm1yHzdbBDrpVMPU/dGS4D+9VEkS/vTd3OWVh/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fZCp0G
        yNy+ELRiIxS6s48B5mLw3hJAwJDY0Q9QEq+V0=; b=SckLiX2jZPu0npr0rcOZx1
        aGsDZMAf2pCQweMtv8NoA6dJr3zZ14ScPe1F7rL5rScKsr2SmxIuDZEQvVmZU2n8
        ZqrEAeyYCBEnmwkWnAiz9i/FWkASRtuZVqdsuL7Za7LCirDwHhzIK3KnD9pUluhf
        W32F6NUXwDwZAjATWXfLPgmbJCo7ktZ7O/xxNraiGIk8zYCXFwLzDPoOPlBR06A8
        QJZDFbXh1PxAMqtGN9xNM006u7lNwxUXHS/Cg5+rHc9dQ852JJ2IG1gkuVTBgGrW
        +k+1VsZfWVdWIbMxt+h3GYlQUYgxTIdH+XTB4HuW25rFUAA+rKySFJLUTY7r78lA
        ==
X-ME-Sender: <xms:JYG_XiFc8CEnquIDTXn4FFNiqisxHieAD_BJyj-uHT475rLdQhHYhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleelgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevleeitd
    eghefgjeffffefffehffetudevgfevgfeugfehheduveefhffhgfehieenucffohhmrghi
    nhepthhoghgvthhhvghrrdgtugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:JYG_XjX8fjqDRBFlBwMlRo29biTVKqsuKKfpH0f6p5_RpAPeUorarg>
    <xmx:JYG_XsJY5WxAnHcHqejZDLdWCSjJ4jpTvVhTVBCcA3wkLb8X92TM9w>
    <xmx:JYG_XsGCIL9ColJUTUPP88N9v29jplLGIiLGwTqXp4dA5-U0jDrF5A>
    <xmx:JYG_XrCgcDfE9rLMA7JodfcbEisj9R33vhP_J5fiY65_Q5YAsc10Ng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5116F660069; Sat, 16 May 2020 01:59:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <9fee6fcc-6156-489f-838b-114903f8e751@www.fastmail.com>
In-Reply-To: <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
 <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
 <AM7PR04MB71571747B1FD3B2FFBB8DC9F8BBD0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Date:   Sat, 16 May 2020 00:57:55 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Peter Chen" <peter.chen@nxp.com>,
        "Felipe Balbi" <balbi@kernel.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Documentation for Raw USB ConfigFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020, at 8:05 PM, Peter Chen wrote:
> 
> > >
> > > Would you please let ECM gadget work first at your board, then let
> > > f_fs work using test application (you need to compile both host and
> > > device application for it). After that, you may have more precise
> > > concept for Linux USB gadget framework.
> > >
> > 
> > I don't see anything that harmonizes preexsting function usage with specifying
> > custom endpoints.
> > 
> > I've gotten the ECM gadget, and then the ECM gadget via ffs working. I've read
> > through the ffs test but I don't see any way to assign functionality to the endpoints.
> > The example seems to transport raw data via a bulk endpoint. I know enough to
> > instead assign an isochronous endpoint to the UDC and transfer via that, but I don't
> > want it to be the *only* functionality the device offers.
> > 
> > Are you saying I can assign the ECM gadget via ffs and then add another driver
> > after the fact? 
> 
> ffs (f_fs.c) is used for customized function, other functions, like ECM (f_ecm.c)
> and Mass Storage (f_mass_storage.c) are used for certain function. You could
> use configfs (like you have done below) to put customized function and certain functions
> into one configuration, and let the host see them at the same time. Do your
> real requirement is one customized function and one ECM function in one USB gadget?
> If it is, below is the example to combine f_fs, mass_storage, and NCM together.
> 
> cd /sys/kernel/config/usb_gadget
> cd g1
> echo "0x1d6b" > idVendor
> echo "0x0105" > idProduct
> mkdir /dev/usb-ffs
> mkdir functions/ffs.usb
> mount -t functionfs usb /dev/usb-ffs
> ln -s functions/ffs.usb configs/c.1
> /home/root/usb_test/ffs_test/ffs-test & /* your own test application */
> while [ ! -e /dev/usb-ffs/ep1 ]
> do
>  echo "."
>  sleep 1;
> done
> mkdir functions/ncm.0 
> ln -s functions/ncm.0 configs/c.1 
> mkdir functions/mass_storage.0
> ln -s functions/mass_storage.0 configs/c.1
> echo $FILE > functions/mass_storage.0/lun.0/file 
> 
> Peter 
> 

Hi Peter, thanks for the advice. I realized I was confusing FunctionFS and ConfigFS a little while after I sent my message and saw the FFS configuration in the ConfigFS documentation.

And yes, I need ECM/NCM (one is newer and faster, will go look it up again) and my custom function. I may also include a serial port.

I have been having issues creating any file called "ffs.${id}" in the gadget directory. It fails with device or resource busy. I assume this means I have misconfigured it, but I am copying your example; or missing the driver, but I have ensured it is there.[1] I have also tried ensuring the ffs function is added first. Any pointers?


[1]: I actually did not have CONFIG_USB_CONFIGFS_F_FS nor F_NCM/ECM set however the necessary code seemed to have been pulled in some other way and the modules were available. They were loaded, and as explained my shell-based configfs code worked. They are set now and the problem persists.
