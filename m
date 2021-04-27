Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5BC36C005
	for <lists+linux-usb@lfdr.de>; Tue, 27 Apr 2021 09:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbhD0HW1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Apr 2021 03:22:27 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40077 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230255AbhD0HW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Apr 2021 03:22:26 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BF2595C00F2;
        Tue, 27 Apr 2021 03:21:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 27 Apr 2021 03:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=V
        0x+5v9hsblX6FcSetoQH+QuSErDN91IxHp6Nw3SfgI=; b=NZJltTJjFgqLMayO4
        TkUsOR/q1jlifCKAJKFiBHVKsINPSehq9C89QnovpvRQ1Rf8bpW3XIEoM4JQgmxk
        UCzcxTJOiWvQkLXJe6ciSFpOUng9MD1jVzZT5j7LiDAOYWty5hiYJEsk8O5Ns/oU
        wYe00Y9+SLNhAlwgaoZTINA5tnhZV8wD30iRPxmXC0Y8lVT29xsjUCtC9dcd7sdi
        h90vB4pZExYtlMRh7JesMyU/r/k5ravjZvmy2TZkWCHNmFVeOgOvk9aN+DyLsAUj
        bg1/jeVH7Z7G1CdFxn+/BWDN0I3hIYRO1jLoT9WyPwek2ZJ9bVs2I9I8VXqXDyzY
        3I+Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=V0x+5v9hsblX6FcSetoQH+QuSErDN91IxHp6Nw3Sf
        gI=; b=hwE0Doa9VbW1BHeKqRE7IuvVG1NKpE4SNUFLjcQ62M4kbD/yEsyBPrU8U
        i4GMw/YNsX/GpFU7vdYSlIKvNb+AS4HVZHePmvwt6i8rr0QgM86fxyCo9fB9DYw8
        Sh7jjohyVoXMMwcIPKhYxAk18ticE3ue2oeqT0J9fiIRyrLkIVI8mvRbU+fQ7uW+
        AKRU92u2duHeE9aXZ/hvv9LmPStt51LgGYZ41ntGY5t67DYZtNU/NujHUBRvJbNL
        /yXHDnJ9OR3oUKaI8qPXNd//6V9YVID9wM2JGE/EoiqEoDev58D3EGQrCh5MI69e
        P6f+3OWt3cqIa4ySqn8FJhb4RUSAg==
X-ME-Sender: <xms:h7uHYMEOKY4qru-OHLZ1XB9uNaStW7VkotB4jt6074CGH1-lqCEIPw>
    <xme:h7uHYFXKnqoaNVMZcBgHxLzktjcHJIRSFR6hrLD0fgj196CFloyepTGpV_VkGECBs
    2duQ6XR9tuP3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevtd
    eileeuteeggefgueefhfevgfdttefgtefgtddvgeejheeiuddvtdekffehffenucfkphep
    keefrdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:h7uHYGLcIIPvqDOPgxTUwdU8zOeZwjXQPMvi-p-oBKm5_3xCljnh_A>
    <xmx:h7uHYOFNOcZ8dxE-KZSWyeqZiTRIkPQe7YMQuIUgQM0IRhOdcyBjjQ>
    <xmx:h7uHYCUTDggLz9rOUniKhLcTD6dk76C8uY5XEaAAPH_hsxR5gropeA>
    <xmx:h7uHYBRWxn1UfkN_i8bOEhsVV9Vo9zSDH_KI0PgIK8Gwz9lb97cjEQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Tue, 27 Apr 2021 03:21:43 -0400 (EDT)
Date:   Tue, 27 Apr 2021 09:21:39 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     =?iso-8859-1?Q?Niccol=F2?= Belli <darkbasic@linuxsystems.it>,
        linux-usb@vger.kernel.org
Subject: Re: cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl irq)
 failed
Message-ID: <YIe7g5l4CKhF3Nph@kroah.com>
References: <2fd1819252485b07e38f5154592dad43@linuxsystems.it>
 <YIe4+PSWak6BFpUq@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YIe4+PSWak6BFpUq@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 27, 2021 at 09:10:48AM +0200, Johan Hovold wrote:
> On Mon, Apr 26, 2021 at 09:55:06PM +0200, Niccolò Belli wrote:
> > My Aeon Labs ZWave USB stick doesn't work anymore since 5.11.12-arch1-1:
> > [ 193.677337] usb 2-2: new full-speed USB device number 5 using xhci_hcd
> > [ 193.818112] usb 2-2: New USB device found, idVendor=0658, 
> > idProduct=0200, bcdDevice= 0.00
> > [ 193.818117] usb 2-2: New USB device strings: Mfr=0, Product=0, 
> > SerialNumber=0
> > [ 194.372999] cdc_acm 2-2:1.0: ttyACM0: USB ACM device
> > [ 194.373197] usbcore: registered new interface driver cdc_acm
> > [ 194.373199] cdc_acm: USB Abstract Control Model driver for USB modems 
> > and ISDN adapters
> > [ 200.173616] cdc_acm 2-2:1.0: acm_port_activate - usb_submit_urb(ctrl 
> > irq) failed
> > 
> > It works fine on 5.11.11-arch1-1 and on a Fedora 34 Live USB with kernel 
> > 5.11.16.
> > Arch's 5.11.16 doesn't work and latest Arch's linux-lts doesn't work 
> > either.
> 
> I'm afraid this is a known regression due to a buggy stable backport.
> The fix is now in Linus's tree:
> 
> 	 a8b3b519618f ("USB: CDC-ACM: fix poison/unpoison imbalance")
> 
> and should be backported very soon.

Due to how much this is hitting people, I'm going to go throw that into
this next round of releases to get it out to the world quicker.

thanks,

greg k-h
