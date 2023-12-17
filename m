Return-Path: <linux-usb+bounces-4287-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C05068160B0
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 18:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA63282BF9
	for <lists+linux-usb@lfdr.de>; Sun, 17 Dec 2023 17:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB28D45C09;
	Sun, 17 Dec 2023 17:14:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8468D46530
	for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 17:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=interlog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=interlog.com
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id B2E3576D8B;
	Sun, 17 Dec 2023 17:08:55 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id A875460BBB;
	Sun, 17 Dec 2023 17:08:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.2
X-Spam-Level:
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id yUHqzzzZHgjM; Sun, 17 Dec 2023 17:08:55 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id 25CA160AE0;
	Sun, 17 Dec 2023 17:08:55 +0000 (UTC)
Message-ID: <520bd89d-b6e4-4654-adcd-8bb884802f56@interlog.com>
Date: Sun, 17 Dec 2023 12:08:49 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: type-c subsystem is empty on Thinkpad T14 Gen 4 AMD
To: Yaroslav Isakov <yaroslav.isakov@gmail.com>, linux-usb@vger.kernel.org
References: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <CADS+iDWFVZp81Ck48wQjzh--n_7Z-bV2u0SR4Z6-OZOMBLeMKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/23 11:21, Yaroslav Isakov wrote:
> Hello! I recently bought Thinkpad T14 Gen 4 AMD laptop, and I
> installed Gentoo on it, with kernel 6.6.4.
> 
> Even though type-c ports seems to be working (I checked usb3 flash
> stick, lenovo charger, Jabra headset, Yubikey), I cannot see any
> devices in /sys/class/(typec,typec_mux,usb_power_delivery).
> 
> There are no messages in dmesg at all, mentioning typec. I can see
> that modules typec_ucsi, ucsi_acpi, thunderbolt are loaded. I can see
> that device TYPEC000 is present on acpi bus, there are files in
> /sys/bus/acpi/devices/USBC000:00, but, there is no driver linked in
> it.
> 
> I tried to recompile module ucsi_acpi, with adding { "USBC000", 0 }
> to ucsi_acpi_match, but it did not change anything (except that in
> modinfo of this module, USBC000 is now seen.
> 
> I tried to decompile SSDT1 table, which has definition of USBC, but
> there is nothing in it, which is supicious.
> 
> What else can I check, to understand, why can't I see anything in
> typec/PD subsystems?
> 

I have a X13 Gen 3 [i5-1240P] which is about 18 months old. Everything you
mention is present plus the typec ports and the associated pd objects:

$ lsucpd
  port0 [pd0]  <<====  partner [pd2]
  port1 [pd1]  <

A power adapter is connected to port0. Here are the modules loaded:

$ lsmod | grep typec
typec_ucsi             57344  1 ucsi_acpi
roles                  16384  1 typec_ucsi
typec                 114688  1 typec_ucsi
usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi
$ lsmod | grep ucsi
ucsi_acpi              12288  0
typec_ucsi             57344  1 ucsi_acpi
roles                  16384  1 typec_ucsi
typec                 114688  1 typec_ucsi
usb_common             20480  4 xhci_hcd,usbcore,uvcvideo,typec_ucsi

$ ls /sys/bus/acpi/devices/USBC000:00
device:ac  device:ad  hid  modalias  path  physical_node  power  status 
subsystem  uevent  uid  wakeup

Strange that the Thunderbolt module is loaded since I thought only the Intel
variants supported Thunderbolt.

The only thing that I can think of is some BIOS setting. When I poked around
in the X13 BIOS I don't remember any setting that would cause what you are
seeing.]

Doug Gilbert

