Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA76296696
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 23:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506264AbgJVV0G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 17:26:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46555 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505954AbgJVV0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 17:26:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 1959B5C0131;
        Thu, 22 Oct 2020 17:26:05 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute4.internal (MEProxy); Thu, 22 Oct 2020 17:26:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=5lnsQpvweDGNV0drWUXmlf/DnP8rDt7
        /D92qGxrCcAY=; b=D4I6pLAHxujnA9fwZeA1nzVrM6SKS34397q2qsCtqkbxA73
        dpkmRgugls9rhqFvDzpMk78Mv0o83ivUt3qwQ58B5UuFdLkxgodzBSiZSm2DeLgd
        JrIZLoU0peYrvPfE1x1fLznLepTxioXzrdibmD2Qwv5opI5shht19teQRbEk/4vq
        uAo9/cyUl2s8DKX1cPH36aBPRnf1QmMYgmayEZcJ66W0bjUF1WZcTU4eR0iomTba
        o4Xr3OMfVFb2YQ5RWRM1CoPXmttFU9Gm1dYCB4rRNeCWEnWAKaAuANvKRdpkTrb8
        g+nwzCqCT57vYLWAP4muQ1KqKd81XW4CwBT69hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5lnsQp
        vweDGNV0drWUXmlf/DnP8rDt7/D92qGxrCcAY=; b=K3vObpXdhCKln7p6VxHMt7
        73eRNLKylqb/5XAyH6WcQCOZwQ3CdMXXRo+8l1IFXhezsmCbmzCzLc0ZCTcVfmbb
        PX/IyPan40ay5zzsVUSO5zbzVUMmLqOYcP1c9B+zdYC2hJUBxhOXZVc63g+0uOYD
        dsSyWBIcLSiZMOlVb0EQxeKzpF9L54KY2nP4DcKDuUEAHKYMmm5WryEm9MUJXhKH
        GCBCXBbz7i5pLSE2COuAXqANdrxQ/Smx//BR9QQcJ/U3CVWbaYfV71CLt7oyv6hz
        AdGoUJvoz/vSdsXGIsxS02SaJ5z1+KnztaaAgArhXQYON/GS5jOtYvbeEo/wwhWg
        ==
X-ME-Sender: <xms:7PiRXxx1RWRJWmZRRavFN0nTDn4agmiJ4cjvM2nUk4dT6KvFnqqAIw>
    <xme:7PiRXxQhkJ7j24kBmX5yGo0-e47Zm8Kt57K-o1Ca6lwPdLQC7-qhB9cGgaVM1izSy
    FunWbjoRJHiYcbLMx0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeekgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedfufhiugcu
    ufhprhihfdcuoehsihgusegrvggrmhdruhhsqeenucggtffrrghtthgvrhhnpefffeejgf
    dvhefhueetvdeitedtjeejtdeijedvteevffdtheefieelgefhieeuudenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:7PiRX7Vl5s4qdevn2cc-Yijgm_-7WKn9ZjYEeoJuNr0R5-Gmtqv54w>
    <xmx:7PiRXzhYORUY53C5HST0f89thQJ-Pxv-wM_pngjqWMwTCZuhZnLCJA>
    <xmx:7PiRXzCkkK6jjZBolBK_QCuU2AuxFiPQyDVppG4nvJ3IGUIRjaHPvA>
    <xmx:7fiRX2qkVAuj-iSKoi2mPDKnqeIRg-PJV996RITtOFh9K81oiM4EFw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0DF3A660069; Thu, 22 Oct 2020 17:25:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <b2f5eaef-af5f-4c3c-91e6-eece17decd93@www.fastmail.com>
In-Reply-To: <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
 <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
Date:   Thu, 22 Oct 2020 16:25:50 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Dmitry N. Mikushin" <maemarcus@gmail.com>,
        "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: =?UTF-8?Q?Re:_Any_example_of_USB_gadget_for_DRD_device_mode_on_Intel_Gem?=
 =?UTF-8?Q?ini_Lake=3F?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 22, 2020, at 4:06 PM, Dmitry N. Mikushin wrote:
> Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do have it:
> 
> 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (rev 03)
> 
> Board is M1K.
> My kernel is 5.4.0-48-lowlatency with the following additional patch:
> https://lore.kernel.org/patchwork/patch/1037542/
> I have dwc3 as a kernel module.
> I'm not testing any gadget, I just have no idea what to test. Could
> you please suggest some sources on how I should map gadget onto my
> dwc3 port?
> 
> Thanks & Kind Regards,
> - Dmitry.
> 

After you set the DRD switch to device do you see a device in /sys/class/udc?

I will show you how to use configfs. You must enable USB gadget configfs. It
is easier to use in my opinion. The other gadget drivers simply need to be
loaded, but I am unsure how they work with newer DWC3 hardware. Most
of the code is written for android and android uses configfs.

`modprobe libcomposite` then execute the following, using that name:

#!/usr/bin/env bash
cd /sys/kernel/config/usb_gadget
if [[ -d "g0" ]]; then
        echo "" > g0/UDC
        rm -rf g0;
fi

mkdir g0
cd g0

echo "0x1d6b" > idVendor
echo "0x0104" > idProduct

mkdir strings/0x409
echo "0000000000" > strings/0x409/serialnumber
echo "Your Company" > strings/0x409/manufacturer
echo "Your Device" > strings/0x409/product

mkdir functions/ncm.usb0

mkdir configs/c.1
ln -s functions/ncm.usb0 configs/c.1

# List /sys/class/udc and take a name for this line:
echo "" > UDC

This will set up a Ethernet NCM device. There are similar instructions
from the configfs author in a powerpoint. More device types are in the
documentation.
