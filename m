Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67AA26E9B4
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 02:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgIRAAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 20:00:55 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44743 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726117AbgIRAAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 20:00:55 -0400
X-Greylist: delayed 344 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 20:00:55 EDT
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 00966A97
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 19:55:10 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Thu, 17 Sep 2020 19:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=Q6i5i4YIbs+nARhmaywOz9m9OvvpHgtw90DFlbCrCes=; b=eZqxomoi
        sGuc0v9Go3fcp4APaTRZ1e1S+f+CAv1GlRWFbeWrHUjEA/CrtTaDTkOoqokSbRAw
        yeSGx4UOMW1fPHvuEW0rNKO2pjTeWiXCgHwxx+7vctcUrn+BM29FVh+DSxTCfwtF
        68BcqhMG2PpPhFYKFlZjl6JQZUsSWjAyfqydA30VAmZuMTgR+WB4i5NXEhjcEHnl
        oqoDWrsVxlK78XmPmuxnmmrbSiLsC+S8yL6CbCt6GOo/g8aYIDo3Xny+1YYb5CTf
        OW4R4JKpOS+5ycuKNkPWm+iz9oJBheYLtgkW7BoeBpuz/zAeTv9tLjXxI5uInIM+
        k4p73ufIEf6RvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=Q6i5i4YIbs+nARhmaywOz9m9OvvpH
        gtw90DFlbCrCes=; b=jU74zv2fYg7mhhXOZg9PxQp0hH5fmluJDUAZTPVIsBvTk
        GP0ogBABnLOoA4cv6dlwlIlDoB9beBUt40a9lt+BnV4yyuZp7CPjwOYfCiHlrwL3
        07rNLVVlldG/CGQNEmc4HSIMd6eO730daisP/CUGFu6mA2rA0oJaZXLQ9Alfgai3
        qdEIFXoPe6NVfCa6TWmgrmw9vyCIRVLO+Af07DwPjYLWfi6i94F3AedUu6TteUuU
        fhUE2fWjs8j7XI4uBjSrwr++mqpY7f9qDQeT1NAYk7cfzCihI+bNfP/zvcm05PFO
        PvAxoGp/RLmr9D3D2a2MAnE4uBjXjqI+kMexEHDkg==
X-ME-Sender: <xms:XvdjXz0eRCzwAW1TUrKxf63LXsBl3X-Jd93KyXahm3iq60RV6Yxpjw>
    <xme:XvdjXyHKXRoFUM7Essx6waZs8WUTUVSpmDN2FFRpyw6SF9UZvKBr1eZy1wGh9w3iR
    tMklmT7m__jCyDZRp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdehgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
    ertdenucfhrhhomhepfdfuihguucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecu
    ggftrfgrthhtvghrnhepueekheeiueeugeevvdejhfeiuefgvdekvdduvdegudfgheefve
    dtgeetvdehudetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepshhiugesrggvrghmrdhush
X-ME-Proxy: <xmx:XvdjXz4OVWkqrsIU3J7e4sfzHowpe8uYr7nWZB-x2to1_mY_iufO9Q>
    <xmx:XvdjX40wDm6fpzVl4gyiAiNjHSNOFKGjHmUXD4CF2wge24nvQUEElQ>
    <xmx:XvdjX2Ee6d8mbhKXNwIrg-opFESWDuBhERJFrsWjG-jNahifSINHIQ>
    <xmx:XvdjX6QzsdGRC6ST_F4lHnKcj0GUEsfPwDc-dhcmRi0wGlQ4QapY0Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 48A8666006F; Thu, 17 Sep 2020 19:55:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-324-g0f99587-fm-20200916.004-g0f995879
Mime-Version: 1.0
Message-Id: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
Date:   Thu, 17 Sep 2020 18:54:49 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: Enabling Device DWC3 Device Mode
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've a RK3399 based board (RockPro64) and am unable to find any useful information on how to ensure the USB controller is set up for device/gadget operation. 

The base armbian (Ubuntu Focal based distribution) kernel did not have dwc2/dwc3 modules compiled. I compiled the modules for kernel ~5.7 after ensuring that dual role mode was supported along with gadget configfs and am able to modprobe them, but I see no devices populate in /sys/class/udc and no dmesg errors.

I should be able to target any kernel version, but I am concerned that there may be missing device tree information but am unsure how to check that. Most people seem uninterested in using the device mode on this hardware, but it was 1 of 2 boards, based on the same part, that I found claiming to support device mode USB3.

Cheers!
