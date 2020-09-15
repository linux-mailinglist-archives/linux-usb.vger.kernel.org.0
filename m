Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1756F269BD6
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 04:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbgIOCPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Sep 2020 22:15:11 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49211 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726019AbgIOCPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Sep 2020 22:15:08 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8A9245C0150
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2020 22:15:05 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Mon, 14 Sep 2020 22:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm2; bh=d1yNumXVpTymugviT3F4GYdNfqmAolRPzm6e8dxbrGM=; b=Sde4ijiF
        z+zGFjZRsxXe5yCssIHILQeqAUSiG19P36MnFIU3SCDMb5d841B7gkMA6unq8rtF
        8+iUlUeGtJh7e2IC/wRTsQ4MWp3IH6C+kFFNmXgRyAGO9gh9befPKyEqWxxt8dtO
        uEwMF9OR6tu02BQ82weplcaANmiu/clMHk3xkdOlJ+8HRij70MwwEMfv9XHGQxrY
        fCOkYM3mm4sJ5aTCVHkNaK48VYdHDzC5dfHuPHrtKIpvrFjGaknS6detb/bj/zvy
        /Y1UqcHKrPKW6aGQVKRGvKVhXwaZ++I9c1bsLHHNRfJyPSoocjruxSV2TKULvbxc
        QGkRSqcjKAMhsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=d1yNumXVpTymugviT3F4GYdNfqmAo
        lRPzm6e8dxbrGM=; b=F5gtJAkQystIqLBfKQ7RRb+S64oXXzPLwLsIXTKAuocun
        9DkeKfqtlTyoLdCKD9f1B17FWzcfXV7WpCfiCmbXjSXvUcTm71duQQixDfZ4IVjd
        AKcrt+0Tl2p25IrnYxhjWwfgoQLaV8UP+paWOybKrZdeXCHvc+Au5DSvz/ZFn9ah
        +ndYwu5nGqleuSKthX00N3r4qd0bAPTQemLSPjmGRB9CJxMqhCvM449I6Jy96x2L
        jG981fAxvLEVl09/+rjaw0yEXeyebSLgXZTaDpuW8qpNoJBJHQtPLwUTpXZWm7+d
        KO4UJpYuwdVKVIKPhkwr46LAnGVQ8a82NH2dl7ILQ==
X-ME-Sender: <xms:qSNgX_s59Kljssjxqg9v5bJZpJguOG9qFM99G4J5_ihWnpotgGJq8Q>
    <xme:qSNgXwdObi6nt34BLkxZgaLfnHo8JP1dZcfLIucNfk8Y4YFvRcEK7b_plS09nBxtx
    HBqWJEuboaIg31AosQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeijedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedfufhiugcuufhprhihfdcuoehsihgusegrvggrmhdruhhsqeen
    ucggtffrrghtthgvrhhnpeeukeehieeuueegvedvjefhieeugfdvkedvuddvgedugfehfe
    evtdegtedvheduteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehsihgusegrvggrmhdruhhs
X-ME-Proxy: <xmx:qSNgXyzb5dbVYYdH0NWGZMCmTTtUuVGSBfKQVIGEbmsCvVSolFvACA>
    <xmx:qSNgX-NFO3wx7u8M4LBtyHXF7Xye-J2-8C2Q2WBQAiCOTZEXPPLT3A>
    <xmx:qSNgX_93jqljz9uE5WKYcvIPfD2rmIYoMWoz2qOKuW9xKnjk3puzLg>
    <xmx:qSNgXyLJFWsdnW7H9EmJ-Ia91aLHthPJ812pGNffg64wXO-oC2v4sQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 81336660069; Mon, 14 Sep 2020 22:14:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <33a6b755-f1ba-4c9c-9320-601365afbd67@www.fastmail.com>
Date:   Mon, 14 Sep 2020 21:14:44 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     linux-usb@vger.kernel.org
Subject: USB Hardware Power Control, IOCTL_USB_HUB_CYCLE_PORT Equivalent
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, after a fair bit of looking I do not see a way to do a hard reset of
a device. Windows seems to expose some functionality that hints these things
are possible. Does anyone know if it is and is implemented in the Linux
drivers?

I only find reference to automatic power management in /sys.

The ioctl in the title (IOCTL_USB_HUB_CYCLE_PORT) is joined by others that seem
to actually control the power to the port.

I recently saw patches that would control hub power state via additional
hardware. It would be good to have a uniform way for userspace to take
advantage of this power control. Userspace may have further hints that can be
applied to power consumption, and may need to decide to undertake device
recovery.

What originally made me investigate this issue was a series of MCU development
boards that crash needing power removed to recover. This seems to be impossible
to do on most hardware. Why? There's no good reason to remove a complete power
down from the spec. There are also instances where a hard reset for PCIe, e.g.
cards malfunctioning when used with VFIO-VGA would have saved hardware from
being hopelessly broken. So if you are involved in hardware design please
consider these things.

Cheers.
