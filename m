Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D253DFC2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfD2Jsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 05:48:51 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38208 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727368AbfD2Jsu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 05:48:50 -0400
Received: by mail-lf1-f67.google.com with SMTP id v1so7471745lfg.5
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 02:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ATAy9r19kvybs9h4CbAXE4DQCAXKd+gASKqZjx1u6X0=;
        b=VWmgu2+H9QoqVIbxiFxeTm+s8EhFNN+WKaLtABwVLKAgraDc3OJyM7PE98mWovwW+s
         fTEixkyd03woAbuavRRHWw0WxQATD16BIp/g22IwWreuekEd61K1ptQp5UE+DtYLNu3S
         ZgncTU/ym+UyhBDZMWFYNQkbfdzVuDQAQA2IZYXcMkKkHOyOA0+fp0BCrrNWjwdsLOpo
         3wLGLEnyZuqX1gSKqQTnB+UjuDcYvW7l/8jZZhLSP+agF713+7tgzyuA3076YOKuomxa
         UwXSWvKHrdhxycuaETU49EvExpakNYlsGA5gG8fvktvDdwDOxo1cX/IX7I/87m5a34bh
         NSSw==
X-Gm-Message-State: APjAAAWlS6GDA9Jw92QrZt4B0CK88jul6WHV97vaX16tBgTX7AZx/0va
        sNr5bKhitA+imLwzd4wYBBI=
X-Google-Smtp-Source: APXvYqy011PAkbtAsn4bkl5G7+pxAxqX4nwh23aFFd9ruDttABIQmwbsCS6IRCiEE1kLq5e3uT0TCQ==
X-Received: by 2002:a19:4b51:: with SMTP id y78mr31346168lfa.152.1556531328610;
        Mon, 29 Apr 2019 02:48:48 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id m3sm7250676lfh.94.2019.04.29.02.48.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 02:48:47 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hL2tz-00038q-9z; Mon, 29 Apr 2019 11:48:48 +0200
Date:   Mon, 29 Apr 2019 11:48:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "StarostaCZ@gmail.com" <starostacz@gmail.com>
Cc:     linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
 AMD boards.
Message-ID: <20190429094847.GI26546@localhost>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 26, 2019 at 03:47:15PM +0200, StarostaCZ@gmail.com wrote:
> Hello all,
> we are development and manufacturing company that use your FT232R serial 
> converter for couple of years with our software. We consume about a 
> hundreds pcs of FT232R per yer. We use FT232R as USB serial converter 
> with direct access (no virtual serial port) and as a "hardware key" 
> using FTDIChip-ID. We operate our software with FT232R converters on 
> Windows and Debian Linux operating system.
> 
> We have used Intel motherboards with Intel processors so far. We want to 
> use AMD motherboards with AMD processors too. *We made a couple of tests 
> on AMD motherboards with AMD processors and Debian Linux 9.6, but we 
> have come across a big problem.
> **When we open internal EEPROM of FT232R for reading, there will arise 
> many error messages in system log files. And then Debian Linux crash 
> after some time!*
> 
> 
> _1) Hardware configurations:_
> - motherboards with AMD A320M chipset:
>    - MSI A320M PRO-VD PLUS, 
> https://www.msi.com/Motherboard/support/A320M-PRO-VD-PLUS
>    - ASUS PRIME A320M-K, https://www.asus.com/Motherboards/PRIME-A320M-K
>    - GIGABYTE A320M-S2H, 
> https://www.gigabyte.com/Motherboard/GA-A320M-S2H-rev-1x#kf
> - latest bios installed, default bios configuration loaded,
> - CPU AMD Athlon 200GE, AMD Ryzen 3 2200G
> - 4GB RAM, SSD drive Kingston A400 120GB
> 
> _2a) Operating system A:_
> - Debian Linux 9.6 64bit, https://www.debian.org/distrib/, 
> https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.6.0-amd64-netinst.iso
> - installed from Netinst installer WITHOUT graphic dekstop, default 
> configuration
> - tested kernels
>    - default kernel 4.9.0.8-amd64, 
> https://packages.debian.org/stretch/linux-image-4.9.0-8-amd64
>    - backports kernel 4.18.0-0.bpo.1-amd64, 
> https://packages.debian.org/stretch-backports/linux-image-4.18.0-0.bpo.1-amd64
> 
> _2b) Operating system B:_
> - Ubuntu server 19.04 64bit, http://releases.ubuntu.com/19.04/, 
> http://releases.ubuntu.com/19.04/ubuntu-19.04-live-server-amd64.iso
> - installed WITHOUT graphic dekstop, default configuration
> - tested kernels
>    - default kernel 5.0.0-amd64, 
> https://packages.debian.org/stretch/linux-image-4.9.0-8-amd64
>    - experimental kernel 5.0.9-050009-generic amd64, 
> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.0.9/
> 
> _3) Drivers_
> - libftd2xx drivers version 1.4.8, https://www.ftdichip.com/Drivers/D2XX.htm
> 
> _4) Performed tests_
> You can repeat this test:
> - connect FT232R into USB2.0 port (not USB3 port!)
> - use examples in directory: ...\libftd2xx-i386-1.4.8.tar\release\examples\
> - add parameter "-m32" to "CFLAGS" variable into "Rules.make" file
> - compiled "\examples\EEPROM\user\read\"
> - run script "test.sh" - see attached file
> - *Debian Linux or Ubuntu server crashes after some minutes* - see 
> attached kernel logs from our system
> - see "kern.log" https://paste.ee/p/xxIZ2

So this is a debian 4.18 kernel seemingly crashing due to a xhci or
iommu issue.

Can you reproduce this on a mainline kernel?

If so, please post the corresponding logs to the lists and CC the xhci
and iommu maintainers (added to CC).

> _5) Very important note_
> *This problem occurs when FT232R is connected into USB2.0 port only!*
> When it is connected into USB3 port, all works fine, no error messages, 
> no crash.
> 
> _6) Other test that we made_
> - we made other tests on Windows 10
>    - same configuration with ASUS PRIME A320M-K motherboard
>    - latest drivers + latest FTDI drivers
>    - FT232R connected to USB2.0 or USB3 - no problem
> 
> - we made the same tests on Intel architecture (that we use now)
>    - motherboard MSI B250M PRO-VH, CPU Intel Pentium G4560, 4GB RAM, SSD 
> drive Kingston A400 120GB
>    - same operating system Debian Linux 9.6 64bit as descripted above
>    - FT232R connected to USB2.0 or USB3 - no problem

Johan
