Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDE81CFB5F
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 18:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727104AbgELQyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 12:54:03 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59303 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725987AbgELQyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 12:54:03 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id D0ADF5C019F;
        Tue, 12 May 2020 12:54:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 12 May 2020 12:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=4/tfq2igpNuxv4aA+nGHYw22FQD
        X91w+d5HmJd7P4yY=; b=pr6OisbsjLrafXSJjIFsCqzm6M4bSSkNq1GFb/shoIi
        I39/9DDoEmUbaOoBSp6dWU+2ysB3sNvwthZqBF7GMJB4PBcZylWkb+pyvTkFKNRG
        RFhGg5G6BrnYydK2ZmRTSkQ0aqvsstAQrebW2WW3TBqWLwcJjjjQZSYUFnx8d0LR
        BWsl1JVZpHUbi3lfli0xna+kgdJ14URDLpH8ropBEAGghc5svn3kFOdHFXSd6Gtd
        9vX3em9br1TArrbw8uoFtaJ0dhtk80If9VQY9R6GUv5cP2RYH4QWLowdoxItx7i6
        RXwDpF46bpE1XMCJcTAX8dI7ItkKIGBalNQWkc93plg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4/tfq2
        igpNuxv4aA+nGHYw22FQDX91w+d5HmJd7P4yY=; b=2VMtpSwvhgd0V2Fm8szaXO
        IrsuvVrSNAjEef/5hdxkJz9SRijfsO/dluBW/gs7mNgvg3kH5ZScSadJv40uJ1JV
        6dvBb9cnlGuMEzuZgulSGgshPdR12On6PjwAQ0WsObEch2ZF5ThiYoM1UVd1J062
        dDRquyBVK+ygDYGLmajlBNEQ5hGhFAZ/N+sfcc2Zf4NBGVDHrnFNtcufoge6Qnlb
        qe6XpYcovxWxRbUObQxQNAdruTG6GR9jbo2ovbR809otYy7UfyOnK/0J40U/vcE1
        0YFOM78XoiWYeGJDRS7s0XBAy9wTw8odvuOlDBZPlmBeRJXS8ZmbDdF/2/kggVdQ
        ==
X-ME-Sender: <xms:qdS6XmNhKN5cYz-Mz5c5i_LqBthO0UD_8LFX9dY8ESLzIsr3F--EpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:qdS6Xk-F6scWqGnbgZtNJKLZi5gxyZwrDi9Jp6g7Od_chYomSnPukw>
    <xmx:qdS6XtQU1DAuyBmdaAl33Qx12vjeOnd1mqTVJ4KkbMCsflJDM_iOFw>
    <xmx:qdS6XmvCVqWbr44hj0JnWMFAnMO69gZl8-er3qMhskptqh-pfj9b4Q>
    <xmx:qdS6Xml4N9tLozPCz_quaHcMszOrkOgh0GhYlSlXXi7bQQdCFDRd6A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id DD5B530662D6;
        Tue, 12 May 2020 12:54:00 -0400 (EDT)
Date:   Tue, 12 May 2020 18:53:59 +0200
From:   Greg KH <greg@kroah.com>
To:     Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Cc:     kernelnewbies <kernelnewbies@kernelnewbies.org>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: Re: sound over USB
Message-ID: <20200512165359.GA702234@kroah.com>
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 12, 2020 at 10:13:10PM +0530, Subhashini Rao Beerisetty wrote:
>  Hi all,
> 
> In my Linux machine, I connected the plantronics usb headset with mic
> and I see(with the help of dmesg) that this device detected.
> 
> 
> 
> [116676.507868] usb 2-2: new full-speed USB device number 5 using xhci_hcd
> [116676.923445] usb 2-2: New USB device found, idVendor=047f, idProduct=c012
>  [116676.927091] usb 2-2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=0
>  [116676.934252] usb 2-2: Product: Plantronics .Audio 628 USB
>  [116676.941445] usb 2-2: Manufacturer: Plantronics
>  [116676.945731] usb 2-2: ep 0x84 - rounding interval to 64
> microframes, ep desc says 80 microframes
>  [116677.078071] hidraw: raw HID events driver (C) Jiri Kosina
>  [116677.159669] usbcore: registered new interface driver usbhid
>  [116677.161686] usbhid: USB HID core driver
>  [116677.175458] input: Plantronics Plantronics .Audio 628 USB as
> /devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.3/0003:047F:C012.0001/input/input4
>  [116677.234588] plantronics 0003:047F:C012.0001:
> input,hiddev0,hidraw0: USB HID v1.00 Device [Plantronics Plantronics
> .Audio 628 USB] on usb-0000:00:14.0-2/input3
>  [116677.281756] usbcore: registered new interface driver snd-usb-audio
> 
>  The following nodes are present in the /dev/snd
> 
> $ ls -l /dev/snd/
> 
> total 0
> 
> drwxr-xr-x 2 root root       60 May 12 11:32 by-id
> 
> drwxr-xr-x 2 root root       60 May 12 11:32 by-path
> 
> crw-rw---- 1 root audio 116,  2 May 12 11:32 controlC1
> 
> crw-rw---- 1 root audio 116,  4 May 12 11:32 pcmC1D0c
> 
> crw-rw---- 1 root audio 116,  3 May 12 11:32 pcmC1D0p
> 
> crw-rw---- 1 root audio 116,  1 May 12 11:32 seq
> 
> crw-rw---- 1 root audio 116, 33 May 12 11:32 timer
> 
> 
> 
> What are all these devices present in /dev/snd
> 
> How do I use it for playing and recording an audio?
> 
> Basically first I want to gain knowledge on set of test cases I can
> run on ALSA and then learn ALSA kernel modules stuff including
> snd_usb_audio mdule.
> 
> So please guide me by providing related documentation/Steps.

ALSA should "just work" with this device, no need to do anything to the
kernel driver.  Does it not work properly for you as-is?

thanks,

greg k-h
