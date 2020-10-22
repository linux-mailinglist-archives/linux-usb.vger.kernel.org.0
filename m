Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCE629677F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 01:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373204AbgJVXFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 19:05:21 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48363 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S373202AbgJVXFU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 19:05:20 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id AA61A5C00CD;
        Thu, 22 Oct 2020 19:05:19 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Thu, 22 Oct 2020 19:05:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=ykFAa
        ApM6x6BnzNOi+6+EPPrA+LzWOn/MTSLfFU99Ac=; b=YypxtjfF6fyz2tF/9W4o1
        Pi6yF3wbh3Fi0FYTgWP8oGwgfXtEtG+ugQBQwArTge3sFqRhV6r0JofggZFjzOlM
        keIAQsf1FJ0eP6y1K4YymxPS6ft5G/5maxN5mIIQ8ycIRq1eNm2j9H3eMOXWFjRC
        CJkji5FKWEbGbeb5Cnt8OvkNqxa1hPOmzgiBNBb4rHozoegofQBR8OYECllyq6k4
        An+p5ZbNdSTAfOLkmyoxzDD1JswShKNi/4suFDgtXd5MRzLUZLraDqP847Du95fI
        X2Q0kRMcW1rXKGL48cVGdx/nIL2AcMYXDqI4I38BkPIZWecpe9XXeTTx5n3NMXaJ
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=ykFAaApM6x6BnzNOi+6+EPPrA+LzWOn/MTSLfFU99
        Ac=; b=O5cWMZtOMefLg1zHU2LCzqgIZneQcU93NYo024AJhiR0pxMUgmPUGlDQF
        wqI05puXqiLvjxont8UNjw8fE2dJdQ7HHvFJmQCgpFa3/jdYj5p14fdAsy/MI13j
        nEpMb2GsEkY61nK/RJ1BwOiV4I8urz1Of79cfEuB9xgqTH46ZYpvtdS/+N/psXwZ
        gZMuQc2zF8tKMCo4/gGOdBuFKq8wIEFcpOk/DZmMPWpMCWFZzMhNjO5tOdf367e7
        esLESKbta+MT69bl1c2Rr/fTJEHcqxi2lCqmSEhAsjZ7CwTEE9vHgsqlK+KGY8qq
        19GaGDBPcT4qBKpgbrm9bBWFJoN0g==
X-ME-Sender: <xms:LxCSX_caawiHkPatqsFPrqFfMmF5mr5b1JaiXT5y0lLvKVqCw_8cNA>
    <xme:LxCSX1OBfiXAgAy6fLSawXon-CMGrAgA1kXV2pqjXH0mVQ2kujAFBFwsuvNuvVHVp
    IvnWqUvEtF9A3IN33Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeelgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepgedtgf
    duuedthffgleeutdeggeeuieejfffgtdffvdeuveffjeevfeffhedtieevnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:LxCSX4j68cgV3YoygoccZ2ECYCWmY-rKolHA54jVPbbTxtGi7s5VHw>
    <xmx:LxCSXw9IYSDBIKbZoeIkmrxdiXq9dXYGZK0O-79zF_XU1EDrTbNXkw>
    <xmx:LxCSX7vsQNxmUMZ0X1eqBhH1NvpRmbTLH95ZWI1ZeLjb5FuvZjBaMQ>
    <xmx:LxCSX53gwAc-Wne4A-1Jp0w4mO5ZvH_DFIR_635nvhnB8MGqk1nFvA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AD8E9660069; Thu, 22 Oct 2020 19:05:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <6eff3a6b-5284-424f-96bf-ebdf5653bba7@www.fastmail.com>
In-Reply-To: <CAGR4S9EnGGpXoU5x1kNmu+J-_4rmfjCbWzT=xRKE+BQgjpmHeQ@mail.gmail.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
 <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <b2f5eaef-af5f-4c3c-91e6-eece17decd93@www.fastmail.com>
 <CAGR4S9EnGGpXoU5x1kNmu+J-_4rmfjCbWzT=xRKE+BQgjpmHeQ@mail.gmail.com>
Date:   Thu, 22 Oct 2020 18:04:57 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Dmitry N. Mikushin" <maemarcus@gmail.com>
Cc:     "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_Any_example_of_USB_gadget_for_DRD_device_mode_on_Intel_Gem?=
 =?UTF-8?Q?ini_Lake=3F?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020, at 4:51 PM, Dmitry N. Mikushin wrote:
> Hi Sid, alas no device in udc, what can I do?
>=20
> marcusmae@m1k:~$ cat /sys/class/usb_role/intel_xhci_usb_sw-role-switch=
/role
> device
> marcusmae@m1k:~$ ls -l /sys/class/udc
> total 0

I don't have an exact answer, but the device in /sys/class/udc must be t=
here
(as far as I am aware) if the kernel is properly communicating with the =
hardware.

On my ARM systems I've found that DRD seems to not work in general, and
I've had to set device mode operation via devicetree. On an Intel board =
I
assume this would be a UEFI/BIOS option.

If Intel is still providing support for the hardware you should try to c=
ontact
them. In the meantime, hopefully someone else can comment.

>=20
> =D1=87=D1=82, 22 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 23:26, Sid Sp=
ry <sid@aeam.us>:
> >
> > On Thu, Oct 22, 2020, at 4:06 PM, Dmitry N. Mikushin wrote:
> > > Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I =
do have it:
> > >
> > > 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8=
] (rev 03)
> > >
> > > Board is M1K.
> > > My kernel is 5.4.0-48-lowlatency with the following additional pat=
ch:
> > > https://lore.kernel.org/patchwork/patch/1037542/
> > > I have dwc3 as a kernel module.
> > > I'm not testing any gadget, I just have no idea what to test. Coul=
d
> > > you please suggest some sources on how I should map gadget onto my=

> > > dwc3 port?
> > >
> > > Thanks & Kind Regards,
> > > - Dmitry.
> > >
> >
> > After you set the DRD switch to device do you see a device in /sys/c=
lass/udc?
> >
> > I will show you how to use configfs. You must enable USB gadget conf=
igfs. It
> > is easier to use in my opinion. The other gadget drivers simply need=
 to be
> > loaded, but I am unsure how they work with newer DWC3 hardware. Most=

> > of the code is written for android and android uses configfs.
> >
> > `modprobe libcomposite` then execute the following, using that name:=

> >
> > #!/usr/bin/env bash
> > cd /sys/kernel/config/usb_gadget
> > if [[ -d "g0" ]]; then
> >         echo "" > g0/UDC
> >         rm -rf g0;
> > fi
> >
> > mkdir g0
> > cd g0
> >
> > echo "0x1d6b" > idVendor
> > echo "0x0104" > idProduct
> >
> > mkdir strings/0x409
> > echo "0000000000" > strings/0x409/serialnumber
> > echo "Your Company" > strings/0x409/manufacturer
> > echo "Your Device" > strings/0x409/product
> >
> > mkdir functions/ncm.usb0
> >
> > mkdir configs/c.1
> > ln -s functions/ncm.usb0 configs/c.1
> >
> > # List /sys/class/udc and take a name for this line:
> > echo "" > UDC
> >
> > This will set up a Ethernet NCM device. There are similar instructio=
ns
> > from the configfs author in a powerpoint. More device types are in t=
he
> > documentation.
>
