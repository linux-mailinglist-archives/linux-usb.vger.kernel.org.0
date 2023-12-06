Return-Path: <linux-usb+bounces-3786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C398074E2
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 17:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A96CC1F211F5
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 16:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4EA47767;
	Wed,  6 Dec 2023 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND5HA78D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5100812F
	for <linux-usb@vger.kernel.org>; Wed,  6 Dec 2023 08:24:38 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6cea1522303so219909b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 06 Dec 2023 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701879878; x=1702484678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJOTrTpUqm2/yA2PuNmmaaoCrS92mCUSOIJoYdr1sog=;
        b=ND5HA78DqHG1M8+wFQDyZQUZOBoB8iASgehIZNsnt3bGPWRtcw1bWzmp34VQwVENJB
         BgIfowW8NTgXc9ZLLLJU4y0HOdr5dZEUVZqzTH82kpDwVM40pzy7jUYq+OHWJR4lDVzM
         Dv2Dcpo8TK077NA1M2xlV+ZFEVSXkbaHGi+qCCT9oJNFpS06ogKxUph2bR9fmpujM9OJ
         TgtlH+YjuGCymz3l+Afbm10yZYwiWogEiiqZk6HYmcvs04AYKI/ONmImh6CHom3IK4PO
         qL1iwaazCCEsGsYFUyUz17ZJorIMTnH1h18yLhIH3EIWOJE5cvRVMCokzVGhON8ZoNr+
         MzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701879878; x=1702484678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJOTrTpUqm2/yA2PuNmmaaoCrS92mCUSOIJoYdr1sog=;
        b=QmaZfjpFys9ThEvjAcJ5JWde6mDtcanneBmEbdDvndCQVnAqHC2Xc0DBfWPdPv56Uz
         buHmLNpA6PqjatuT8DCSshyUpESsFY+M6HQNnBOl1LQMi98SXahkqA04o0FMZcsmyXZF
         G0GbjxvbF74VuaZiP4NexrfWh+uV3i1x29IYM4xoqjq1Z5DsnuD2D0ZCE+uODHKcl/pN
         142fzCAdkkJ0bJ0u+QkL6Gd4Dt/VkeYjNThuUZjbzIQtLEurg657hD4vqGPmAo+6Wy5W
         f7GabPzyH00OjrGuzl8LOEPwJRRnEY674RyGHDPjoTf5OLQ9spt9CdHYX8hd38rKTJeo
         x5hw==
X-Gm-Message-State: AOJu0YyFlNlF7LGq0hTk1YkvJJZgWEXSx1iiiv9qtrDD2nS5T0Z/kr6f
	oN3jwRUJRPJXMhS52jhsH80=
X-Google-Smtp-Source: AGHT+IHUrH4kAu1IE9JDAdRvngr2EyPqz/5SHDIsx2B3xQZIyC7pq3jmEtQuLf9/V3UtlvoDPI/e7A==
X-Received: by 2002:a05:6a00:cd5:b0:6ce:6cf3:38b7 with SMTP id b21-20020a056a000cd500b006ce6cf338b7mr1010778pfv.8.1701879877518;
        Wed, 06 Dec 2023 08:24:37 -0800 (PST)
Received: from hdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id q4-20020aa79824000000b006ce7c28be72sm171915pfl.118.2023.12.06.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 08:24:37 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: oneukum@suse.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	hiago.franco@toradex.com,
	hiagofranco@gmail.com,
	kuba@kernel.org,
	linux-usb@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Date: Wed,  6 Dec 2023 13:23:53 -0300
Message-ID: <20231206162353.53767-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
References: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Hi Oliver,

On 06.12.23 13:21, Oliver Neukum wrote:
> Before we proceed, however, your patch raises a fundamental question:
> Are we talking about gadget or host mode here?
> Could you please describe your setup in detail?

Sure, I'm running a Apalis iMX6QD 512MB, which is basically an ARM 32-bits
device with NXP iMX6QD. This device is running Linux with wayland, weston
and the neatvnc server, so I can access my app using a vnc client on my
host PC (also running Linux, Debian 12).

The device is connected to my host pc using a USB cable. The gadget is my
ARM device, which I'm configuring using the libusbgx to create a new
gadget called 'gncm'. The host, in this case, is my Debian PC. My device
is automatically configured to use the ip 192.168.11.1 and give to my PC,
using the udhcpd from busybox, the ip 192.168.11.2.

Everything works, when I connect the ARM device to my PC with the USB
cable, my Debian automatically detects as a new interface and get the
192.168.11.2 ip:

39: enx4224347674f3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc
fq_codel state UP group default qlen 1000
    link/ether 42:24:34:76:74:f3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.11.2/24 brd 192.168.11.255 scope global dynamic
    noprefixroute enx4224347674f3
       valid_lft 863996sec preferred_lft 863996sec
    inet6 fe80::8959:d7da:f1fc:774e/64 scope link noprefixroute
       valid_lft forever preferred_lft forever

While on the device:

/ #
3: usb0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen
1000
    link/ether 7a:c5:38:46:21:e5 brd ff:ff:ff:ff:ff:ff
    inet 192.168.11.1/24 scope global usb0
       valid_lft forever preferred_lft forever

/ # cat /sys/class/udc/ci_hdrc.0/function
gncm
/ # ls /sys/kernel/config/usb_gadget/gncm/
UDC              bMaxPacketSize0  functions        os_desc
bDeviceClass     bcdDevice        idProduct        strings
bDeviceProtocol  bcdUSB           idVendor
bDeviceSubClass  configs          max_speed

Finally, I open a VNC client on my host PC and connect to 192.168.11.1,
where the issue begins with it being very slow/frozen. After applying the
patch on the device (Apalis iMX6), now VNC runs smoothly.

Now I will also try to debug the driver on the PC host side.

Thanks and regards,
Hiago

