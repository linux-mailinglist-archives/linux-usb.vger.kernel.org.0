Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB1F1FA3DB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jun 2020 01:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgFOXGQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 19:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFOXGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 19:06:15 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C93C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2020 16:06:15 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id s88so595850pjb.5
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2020 16:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arpad-me.20150623.gappssmtp.com; s=20150623;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=sj60GPNtk4ZwgPdU6vvXssVVM4fqTo+B2Xu0Pc5mU64=;
        b=GEl8h8XZGTvR1qgD1cIcTMPfHY5ImOKlMDOX4bD1u9E8Y/F4V2pPk9BxJW36/kU5qd
         YzhqUSJvpKsdJNUpcwBPwcgC/aTdaKqo/fXaSqGWuzAI0cNUAJdtUjkIGm7/L0DFgc90
         rij2wEHJIBqjbeQeqxJF3g0elZ4f+3qpKWs/3462rua5DTzHOP32B2D7e8vIY4lgipHv
         py1M4txuj49gxSfFytgz5PgSN4XOoTDuRVHe9uZYuAZ6QPRgZrw7SK94Mq3C/b7QMY9i
         yZV0dlXeU+nYG9ZGu/jgRIesTuyjyuBbT8GOKNKoaiNd2Z2npMOOQgGj4FfEREtdmnMa
         ZaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=sj60GPNtk4ZwgPdU6vvXssVVM4fqTo+B2Xu0Pc5mU64=;
        b=fbq4LGbpCW54nZidSU9daNvatdV/qx5Z04qHYOcLwl+BM+63Vz2+6cFMG+huDggg2i
         AVyYouIVuz5mdUhXe1ktfyi5dHed0atOUX5sgN09RU3avC9B0HJm+3RGb83sLCnlGdZT
         PST9Mf90UZz9T37K31bk1Tw0+X3Lp3K5TBsb3A/GLdAgu6V+Hv15wmAkpr5qiCfzNPz0
         0DYnqc2PpHWMBk8NHhlnTr6AxuGk26g374e5V7aWf0ffP1tg13vU6AN9wxXErWYg0r98
         auNKHJrUzboChfmIYli+jKsp174imW89H7tnsRoVUCu2GyGijcRLBKhcjZFGxpgcJnpO
         +4Jg==
X-Gm-Message-State: AOAM530YviIT0K/NijVpOPpqveNjAHMGXLTtYZJyddZY4KzqlDurk+dy
        Ya9s2fPZlZbvpeiVVizaBojdM8LqRwy9rg==
X-Google-Smtp-Source: ABdhPJwa6BBm5PNAAN+d16HeAbfz32ky6BVUQ0RsipSySjl+g3br7saUwczZzVU5BZjsmjDH5uFXbw==
X-Received: by 2002:a17:90a:8c14:: with SMTP id a20mr1481382pjo.83.1592262373524;
        Mon, 15 Jun 2020 16:06:13 -0700 (PDT)
Received: from bela.lan (c-71-198-177-42.hsd1.ca.comcast.net. [71.198.177.42])
        by smtp.gmail.com with ESMTPSA id j130sm15534611pfd.94.2020.06.15.16.06.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2020 16:06:12 -0700 (PDT)
From:   Arpad Kun <kun@arpad.me>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Running multiple gadgets in mass storage mode?
Message-Id: <8A08E690-674B-413C-BBC2-0B6A6B170871@arpad.me>
Date:   Mon, 15 Jun 2020 16:06:12 -0700
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Everyone,

Seeking advice please on:   if it was possible to run multiple USB =
devices within the same Linux system in device mode and use =
g_mass_storage to emulate different "volumes" through each.

This is how far I got:
	- Have two  USB3380-EVB  boards hooked up in a Linux machine =
(x86)
	- I see both of them via `lspci`, net2280 module runs them.

		# lspci -nn |grep 3380
		04:00.0 USB controller [0c03]: PLX Technology, Inc. =
Device [10b5:3380] (rev ab)
		65:00.0 USB controller [0c03]: PLX Technology, Inc. =
Device [10b5:3380] (rev ab)


	- Loading the `g_mass_storage` to allow me to "insert" an image =
to to emulate:

		# modprobe g_mass_storage removable=3Dy stall=3D0 =
nofua=3D1
		# find /sys/ -name "*gadget*"=20
		[...]
		/sys/devices/pci0000:64/0000:64:00.0/0000:65:00.0/gadget
		/sys/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/gadget


	- But when I look at sysfs, only one of them has `lun0/file` =
that I can echo into:

		# ls -1 =
/sys/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/gadget
		lun0   <--- lun0 is here, looks good
		power
		suspended
		uevent

		# ls -1 =
/sys/devices/pci0000:64/0000:64:00.0/0000:65:00.0/gadget
		power
		uevent
		<-- lun0 is missing :(

	- The following works for one image, but I am trying to insert =
an another image to through the other controller:

		echo "/home/test.img" > =
/sys/devices/pci0000:00/0000:00:1c.5/0000:04:00.0/gadget/lun0/file


In the kernel documentation I found the following in the USB Controller =
Driver section:  "The controller driver can support any number of =
different gadget drivers, but only one of them can be used at a time."
It was not clear whether it means one driver at a time or one controller =
at a time.  =
(https://www.kernel.org/doc/html/latest/driver-api/usb/gadget.html)

Questions please:
- Is there something I missed or oversee?
- Would you have any suggestions how to make it work? Is it possible?
- Any advice on cards I could use in x86 machines other than this? I =
haven't found any other than the 3380, which is end of life now.

Really appreciate advice and direction.

Regards,
Arpad

