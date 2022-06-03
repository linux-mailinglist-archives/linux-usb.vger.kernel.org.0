Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE3D53C526
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 08:44:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241533AbiFCGoo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 02:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235799AbiFCGon (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 02:44:43 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E1D38BE6
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 23:44:41 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 000925C0127;
        Fri,  3 Jun 2022 02:44:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 03 Jun 2022 02:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1654238680; x=1654325080; bh=I5UdOY/6vm
        uU3dvbYKOTimJunT8PexuP15hYoCv6Fvk=; b=lFFHYfE0uXe1n7PjmhOIKXgKMz
        BeNWvC0GIX861wbPPZ8CWnDTv9gHRgQUQ3oR6brPP3zUuk8rdNpgFxvmSgDuql6y
        mr+1IRLK22VpM4yBuYKN0nvs5A7PRqOYlMAr1asFfDRrPKnYciSIsz6WqIBvvIcU
        qWVpk5E85cqvtSJK8nT4Y6Mx1EMXEpPEvr7agy+8hTWkZF54tV0A1qT2EBroZDl3
        Kr27GOXaSLsMTY08DJLxZ1cljTgq+EdMzjiU0cywJ4RLM8TgLUYIJ97/6AZet6gy
        8w/5Z8lPi/eO8YMrAWw9CRrb+J29MCuBJ7tcZK1Q34neS/73ohQgit7a4ZOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1654238680; x=1654325080; bh=I5UdOY/6vmuU3dvbYKOTimJunT8P
        exuP15hYoCv6Fvk=; b=bZ0DnMzhaK5YdmYiOKM0e7YXH6BS/0PZNSR/Ibo8aPPk
        8PNuciAeE6Zamc9LUD5WO66XvGqI8/wJTeMcGliw8GVj95KIZbFoxoCIEh6KI3cB
        uefNIMoVUdlrweBv/dKmoMEhmTf7x+FeXh1YDGiNxAXKGiPYTGBdN1WbaRiZBHx2
        pfr8moWhcIZ3IzrzIHmFX1ExM9hvR0k6YyTjIKSPCpo7n9N+MKIxQVtop5Al+RKZ
        2VDhZSHzsSM+0D4P+EWRI1q4upchqNk8Dw4uW3d1apXGaTAdk8h/dBKDSnR4v6Vn
        1V30eeV3ijZdcLTnYNUVwXxVty879hcn9GpMF5bLuQ==
X-ME-Sender: <xms:2K2ZYolXDLlNHBByz7VNk9fYpv92yrFSDHRkPRb8ExnavUPNxMa27Q>
    <xme:2K2ZYn13KKkvrKqlkYm7J6wCMglj-a5HbBzqEfxpl6ASt9SyY99gJrc1B4Pjpu6sG
    ZXg85F-h1tNEg>
X-ME-Received: <xmr:2K2ZYmqGMeY1YTXv8DWYkXlsHzPC5LdKjG-Xj0fTMp7wKM3fMXGOgmnwrR6zIOWH756Jrbag6lqGptQXUHwlsBUGBhoK7-BF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleehgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
    euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:2K2ZYknjdJzaT1NKN2BiJk0HMgb-6HFlehAXH2C96FZGGst6sxIr4g>
    <xmx:2K2ZYm0giLObTTrL2oxEYz0ZQdf8OxUbMQRIyvVlg2sEliETt7dkGQ>
    <xmx:2K2ZYrtYeqlUdCoOtX1sUnfbaV5CzfiZspEGXNrik5bm_sG9xCuYpA>
    <xmx:2K2ZYkDuO9CZ9Y7djUmCzXNikRYsO7W35FVc2OqPgjKGDGo8nH5TEQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 02:44:40 -0400 (EDT)
Date:   Fri, 3 Jun 2022 08:44:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Yuri <info@toniclab.ru>
Cc:     linux-usb@vger.kernel.org
Subject: Re: /dev/ttyUSB0 file disappears on Ubuntu 22.04
Message-ID: <Ypmt2EdQIvTmKEyW@kroah.com>
References: <4b9e024d14c40cba7c04d5879ae64866@toniclab.ru>
 <YphShbNo8cTU65Qj@kroah.com>
 <6391aa3d842029344835b4b085390a2e@toniclab.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6391aa3d842029344835b4b085390a2e@toniclab.ru>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 11:47:50AM +0300, Yuri wrote:
> Thanks for a quick reply, Greg. No, no error here. No matter when I execute
> this on my PC under Ubuntu 22.04
> 
> ls -l /dev/ttyUSB*
> 
> I get this
> 
> ls: cannot access '/dev/ttyUSB*': No such file or directory

Is the device node actually there?

What does /dev/serial/ contain?

> I made this log after attaching and removing the device. Here's dmesg output
> 
> [ 2276.613198] usb 2-1.5: new full-speed USB device number 5 using ehci-pci
> [ 2276.727502] usb 2-1.5: New USB device found, idVendor=0403,
> idProduct=6001, bcdDevice= 6.00
> [ 2276.727511] usb 2-1.5: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 2276.727514] usb 2-1.5: Product: USB Serial
> [ 2276.727516] usb 2-1.5: Manufacturer: FTDI
> [ 2276.727518] usb 2-1.5: SerialNumber: FT0KKBIF
> [ 2276.729550] ftdi_sio 2-1.5:1.0: FTDI USB Serial Device converter detected
> [ 2276.729626] usb 2-1.5: Detected FT232RL
> [ 2276.730487] usb 2-1.5: FTDI USB Serial Device converter now attached to
> ttyUSB0
> [ 3173.152415] usb 2-1.5: USB disconnect, device number 5
> [ 3173.152974] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now
> disconnected from ttyUSB0
> [ 3173.153005] ftdi_sio 2-1.5:1.0: device disconnected
> [ 3182.847132] kauditd_printk_skb: 1 callbacks suppressed
> [ 3396.861511] usb 2-1.5: new full-speed USB device number 6 using ehci-pci
> [ 3396.975858] usb 2-1.5: New USB device found, idVendor=0403,
> idProduct=6001, bcdDevice= 6.00
> [ 3396.975866] usb 2-1.5: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 3396.975870] usb 2-1.5: Product: USB Serial
> [ 3396.975872] usb 2-1.5: Manufacturer: FTDI
> [ 3396.975874] usb 2-1.5: SerialNumber: FT0KKBIF
> [ 3396.978651] ftdi_sio 2-1.5:1.0: FTDI USB Serial Device converter detected
> [ 3396.978714] usb 2-1.5: Detected FT232RL
> [ 3396.979568] usb 2-1.5: FTDI USB Serial Device converter now attached to
> ttyUSB0
> [ 3553.309826] usb 2-1.5: USB disconnect, device number 6
> [ 3553.310371] ftdi_sio ttyUSB0: FTDI USB Serial Device converter now
> disconnected from ttyUSB0
> [ 3553.310404] ftdi_sio 2-1.5:1.0: device disconnected
> 
> 
> And here's the syslog output echoing log above
> 
> Jun  2 10:41:54 qgs-comp kernel: [ 3173.152415] usb 2-1.5: USB disconnect,
> device number 5
> Jun  2 10:41:54 qgs-comp kernel: [ 3173.152974] ftdi_sio ttyUSB0: FTDI USB
> Serial Device converter now disconnected from ttyUSB0
> Jun  2 10:41:54 qgs-comp kernel: [ 3173.153005] ftdi_sio 2-1.5:1.0: device
> disconnected
> Jun  2 10:42:02 qgs-comp systemd[1786]: Started Application launched by
> gnome-shell.
> Jun  2 10:42:03 qgs-comp libreoffice-writer.desktop[7821]: Warning: failed
> to launch javaldx - java may not function correctly
> Jun  2 10:42:04 qgs-comp kernel: [ 3182.847132] kauditd_printk_skb: 1
> callbacks suppressed
> Jun  2 10:42:04 qgs-comp kernel: [ 3182.847137] audit: type=1400
> audit(1654155724.011:126): apparmor="ALLOWED" operation="file_mmap"
> profile="libreoffice-soffice" name="/tmp/.glQ6PDw2" pid=7839
> comm="soffice.bin" requested_mask="m" denied_mask="m" fsuid=1000 ouid=1000
> Jun  2 10:42:04 qgs-comp kernel: [ 3183.137037] audit: type=1400
> audit(1654155724.303:127): apparmor="ALLOWED" operation="connect"
> profile="libreoffice-soffice" name="/run/user/1000/at-spi/bus_1" pid=7838
> comm="soffice.bin" requested_mask="wr" denied_mask="wr" fsuid=1000 ouid=1000
> Jun  2 10:42:04 qgs-comp kernel: [ 3183.137207] audit: type=1400
> audit(1654155724.303:128): apparmor="ALLOWED" operation="file_perm"
> profile="libreoffice-soffice" name="/run/user/1000/at-spi/bus_1" pid=7838
> comm="soffice.bin" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> Jun  2 10:42:04 qgs-comp kernel: [ 3183.137218] audit: type=1400
> audit(1654155724.303:129): apparmor="ALLOWED" operation="file_perm"
> profile="libreoffice-soffice" name="/run/user/1000/at-spi/bus_1" pid=7838
> comm="soffice.bin" requested_mask="r" denied_mask="r" fsuid=1000 ouid=1000
> Jun  2 10:42:14 qgs-comp systemd[1786]:
> app-gnome-libreoffice\x2dwriter-7821.scope: Consumed 3.025s CPU time.
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.861511] usb 2-1.5: new full-speed
> USB device number 6 using ehci-pci
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.975858] usb 2-1.5: New USB device
> found, idVendor=0403, idProduct=6001, bcdDevice= 6.00
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.975866] usb 2-1.5: New USB device
> strings: Mfr=1, Product=2, SerialNumber=3
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.975870] usb 2-1.5: Product: USB
> Serial
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.975872] usb 2-1.5: Manufacturer:
> FTDI
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.975874] usb 2-1.5: SerialNumber:
> FT0KKBIF
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.978651] ftdi_sio 2-1.5:1.0: FTDI USB
> Serial Device converter detected
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.978714] usb 2-1.5: Detected FT232RL
> Jun  2 10:45:38 qgs-comp kernel: [ 3396.979568] usb 2-1.5: FTDI USB Serial
> Device converter now attached to ttyUSB0
> Jun  2 10:45:38 qgs-comp mtp-probe: checking bus 2, device 6:
> "/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
> Jun  2 10:45:38 qgs-comp mtp-probe: bus: 2, device: 6 was not an MTP device
> Jun  2 10:45:38 qgs-comp systemd-udevd[7907]: 2-1.5: Failed to create/update
> device symlink '/dev/ttyUSB0', ignoring: File exists
> Jun  2 10:45:38 qgs-comp snapd[938]: hotplug.go:199: hotplug device add
> event ignored, enable experimental.hotplug
> Jun  2 10:45:38 qgs-comp mtp-probe: checking bus 2, device 6:
> "/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5"
> Jun  2 10:45:38 qgs-comp mtp-probe: bus: 2, device: 6 was not an MTP device
> Jun  2 10:45:40 qgs-comp ModemManager[1055]: <info>  [base-manager] couldn't
> check support for device
> '/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5': not supported by any
> plugin
> Jun  2 10:45:47 qgs-comp kernel: [ 3406.230869] [UFW BLOCK] IN=enp5s0 OUT=
> MAC=01:00:5e:00:00:01:c4:6e:1f:70:4f:f4:08:00 SRC=192.168.0.1 DST=224.0.0.1
> LEN=32 TOS=0x00 PREC=0xC0 TTL=1 ID=0 DF PROTO=2
> Jun  2 10:46:34 qgs-comp systemd[1786]: Started Application launched by
> gnome-shell.
> Jun  2 10:46:34 qgs-comp systemd[1786]: Started VTE child process 7940
> launched by gnome-terminal-server process 5736.
> Jun  2 10:46:34 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaWindowGroup>:0x55cea707c320] is on because it needs an
> allocation.
> Jun  2 10:46:34 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaWindowActorX11>:0x55ceb6917ed0] is on because it needs an
> allocation.
> Jun  2 10:46:34 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaSurfaceActorX11>:0x55cea8afc6c0] is on because it needs an
> allocation.
> Jun  2 10:46:37 qgs-comp systemd[1786]: Started Application launched by
> gnome-shell.
> Jun  2 10:46:37 qgs-comp systemd[1786]: Started VTE child process 7958
> launched by gnome-terminal-server process 5736.
> Jun  2 10:46:37 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaWindowGroup>:0x55cea707c320] is on because it needs an
> allocation.
> Jun  2 10:46:37 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaWindowActorX11>:0x55cea8e32360] is on because it needs an
> allocation.
> Jun  2 10:46:37 qgs-comp gnome-shell[2070]: Can't update stage views actor
> <unnamed>[<MetaSurfaceActorX11>:0x55cea8afca40] is on because it needs an
> allocation.
> Jun  2 10:48:14 qgs-comp kernel: [ 3553.309826] usb 2-1.5: USB disconnect,
> device number 6
> Jun  2 10:48:14 qgs-comp kernel: [ 3553.310371] ftdi_sio ttyUSB0: FTDI USB
> Serial Device converter now disconnected from ttyUSB0
> Jun  2 10:48:14 qgs-comp kernel: [ 3553.310404] ftdi_sio 2-1.5:1.0: device
> disconnected
> 
> 
> No problems on the same PC working under Ubuntu 18.04 and 16.04 whatsoever:
> 
> ls -l /dev/ttyUSB*
> crw-rw---- 1 root dialout 188, 0 Jun  2 10:36 /dev/ttyUSB0

I think you are going to have to contact ubuntu for this issue and get
support from them as it's their kernel and overall system configuration
here, the kernel looks like it is working just fine.

good luck!

greg k-h
