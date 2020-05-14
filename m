Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53C681D3686
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 18:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgENQdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 12:33:25 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:46911 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbgENQdY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 12:33:24 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id F189987C;
        Thu, 14 May 2020 12:33:23 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 14 May 2020 12:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=/jY+8VgS/OwUaVsjHX9NQ4fK3cjC71y
        /3dnCrQOv4RY=; b=WaFWoGSv8EF66cW8Oc0C1U9fTCS15FMUA0qHc6J6RhJ5lKb
        Lqc/qUP+xUDcJDfb0dRgYg3Ou3//FuxfKEw9ckI+aMOqCgtKcmPtcoFyprKpcpEw
        cDpg3dXImMb/esQ1cTvP7CPOSwsVErPq63Um5IyWA77hsUlvofUXZeaRAPHk2ZrC
        w0PnkzKn34LelBWJc1+a+UcA1O+vYaAJ9uLU7/fuzpNmKptdIPqN9dzVhLEP1Ru8
        M8hXANEgLmYhWSTtU6xNBAWMagPU5xCGKBo8F5IisqCOXiRrhFqm3hlxHsWcn4z8
        Pls7mYxnlqpIpsJUcVJmeX/kpmuJDbfLG17XI7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/jY+8V
        gS/OwUaVsjHX9NQ4fK3cjC71y/3dnCrQOv4RY=; b=WYq+J2vy07NIZCI7EBg6cA
        wNtHjzQTiCyHMAoCL4gijd/6abX6OrzU8vuCsEKJVBiIlAso2GHYcwm2g/yosP78
        C5aLRsQazMrq2bEWSpx87d/5h+hyhCONbLAsVImfXJ1u/yC6B6lETinYPOTwco6/
        iW86YWvJxE+vVfoZTYKA0oKO6teyD5SNMk1P4Hu09DuQ0eZOgBG2YTWQ94HhmAz5
        Tp7x/jLtkfKjo+XrzyNAv/rdhadx20rsmkSjgqEuOYVVTMI1Wz14ng4rVlTOsOwC
        vRfaJkbh1KHTk/UP52t7A8Z547fZMUIM7yxdinglZMTlpd+S4MQ2oWbq9f9Oeipw
        ==
X-ME-Sender: <xms:03K9Xqz-u1o5mALCo4Un0pCXyn7EsU7eeyAd97-ImNOs_JyOVczfvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleeigdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpeevgefhve
    evteetfeetkeejjeehudffffffhfeuffelhfeuffdufeduleejfeeugfenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsihgusegrvggrmhdruh
    hs
X-ME-Proxy: <xmx:03K9XmQTYL-fpgVyEPPnHYe9F-xcMCe8oNZzCDriu57dIi9OszzNjA>
    <xmx:03K9XsVx5FwYW2z7Km05N43SVnGsgrkc8adGaaXUF-qSQDTKT_2Viw>
    <xmx:03K9Xgjb-sdDleBxfEu-qeJAYPbjJoJUZ8tplqtcVs9xzMZK3EwvHA>
    <xmx:03K9Xr_OpbBH6B_1hphQwUA7Y75TWy8msDFmBZDtUv3m1kIp1fTAFA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E715566007E; Thu, 14 May 2020 12:33:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <6cab4113-b4ad-43d9-85fc-f68682cf0259@www.fastmail.com>
In-Reply-To: <20200513100614.GA3698@b29397-desktop>
References: <0507a041-44f4-4257-adaf-3b17de3baf81@www.fastmail.com>
 <20200506091750.GE30237@b29397-desktop>
 <8ee3914e-7876-46aa-bade-7cf14df7efdc@www.fastmail.com>
 <87h7wkp9qy.fsf@kernel.org> <20200513100614.GA3698@b29397-desktop>
Date:   Thu, 14 May 2020 11:32:35 -0500
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

On Wed, May 13, 2020, at 5:05 AM, Peter Chen wrote:
> On 20-05-13 10:36:05, Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > "Sid Spry" <sid@aeam.us> writes:
> > 
> > > Hi Peter, thanks for pointing me towards the ffs-test. Unfortunately after
> > > some exploration in that area I still don't see how I would add a preexisting
> > > function to the configuration to be handled by the kernel.
> > >
> > > I do see something in an AIO test in the host code where libusb is used to
> > > bind a kernel driver to an endpoint. Is that something that will be necessary?
> > > Device side, I'm still unsure how I tell the function to handle ECM/ethernet
> > > on a collection of endpoints.
> > >
> > > I understand how USB works fairly well, especially on microcontrollers, but am
> > > a little lost still in understanding the Linux machinery for USB.
> > 
> 
> Would you please let ECM gadget work first at your board, then let f_fs work
> using test application (you need to compile both host and device
> application for it). After that, you may have more precise concept for
> Linux USB gadget framework.
> 

I don't see anything that harmonizes preexsting function usage with specifying custom endpoints.

I've gotten the ECM gadget, and then the ECM gadget via ffs working. I've read through the ffs test but I don't see any way to assign functionality to the endpoints. The example seems to transport raw data via a bulk endpoint. I know enough to instead assign an isochronous endpoint to the UDC and transfer via that, but I don't want it to be the *only* functionality the device offers.

Are you saying I can assign the ECM gadget via ffs and then add another driver after the fact? This isn't really spelled out in the documentation (from what I can see). I was operating under the assumption that assigning the UDC claims it and it's not a shared resource. I've already run into issues where certain configurations use up the available endpoints or cause other issues.

For reference here is what I am currently doing:

---

modprobe g_ffs
cd /sys/kernel/config/usb_gadget

if [[ -d "g1" ]]; then
	echo "" > UAC
	rm -rf g1;
fi

mkdir g1
cd g1

echo "0x1d6b" > idVendor
echo "0x0104" > idProduct

mkdir strings/0x409
echo "0000000000" > strings/0x409/serialnumber
echo "Foo Bar Inc." > strings/0x409/manufacturer
echo "Trololololo" > strings/0x409/product

mkdir functions/ecm.usb0
mkdir functions/uac2.dev0
mkdir functions/midi.dev0

mkdir configs/c.1
ln -s functions/ecm.usb0 configs/c.1
ln -s functions/uac2.dev0 configs/c.1
ln -s functions/midi.dev0 configs/c.1

echo "musb-hdrc.2.auto" > UDC
