Return-Path: <linux-usb+bounces-3735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C03DA805547
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 13:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79D832818CB
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA245646F;
	Tue,  5 Dec 2023 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlEGNhwi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C189A0
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 04:56:09 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7b373d61694so208653839f.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 04:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701780969; x=1702385769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ob350Ykneq3MaiFFXCw+sDS4aIam9mG91vS+b1SkgQA=;
        b=QlEGNhwiw4SqZKQ+G/qC3dP+ftF5qnlJS8ktG6Zj6ppZy39uonEIxmw/Q8xtJMVXWA
         vIUonK07aNvkJuNSUDMkdJtC1TYVWSzzHHnOAV7rczkDjGB1GEsiG4bkNqY2WbhM8d7G
         oyJ3/8kP3VVNO0g8NtFXfdouF8LO0YMOqURkOJG5WVTa2hdsHYZkZTbWR+3BzDsqLipw
         GBD5GyWry79G4lI1fuDySAUw5II08YAWxxQSQ1Yh0GiZ3IAleLNMYy223CJHlZL92R8S
         R1jLZ3I3ntB+G1nlJvbY1C+pOlOXYDe/WoO83ZdMRyU7M1YXX9e/bs2jFDHexsNuJmZr
         hvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701780969; x=1702385769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ob350Ykneq3MaiFFXCw+sDS4aIam9mG91vS+b1SkgQA=;
        b=wdNxv32J7NDFteY+5iB3Yvoei+59fQH+yWm05xPSm2RuG2LnzCJ6dEoZiJkY+g3+//
         aohBIRAy8NRInU9NWODvBrsg7scsfBm2lJE6SNSrprICVQovIOtljobhF6cxlE05hEEw
         AHKlINj+cvuHz9HoVi385abK91EsXOpgbHJHEB3jXqkgJMdVM6R6KoDKsrW+w17r/LHB
         okWkpd5+AgOTDbTbBggwufIkKrwxpgTDCBMuTzpdcC4u6DwbWDWwjVQLS+5bYWxcUlSR
         QVmO34hKp0ceeWGGh/fJg5xC3C5122oofRX2oZ0Y+mT8mub0Mf+FhKiwalfklbKcqv9T
         63oQ==
X-Gm-Message-State: AOJu0Yw7KkDE+39wlkz3JKmlF6Ax4cX000LXCfbVMz5UkxrlFthOolSG
	m6rd67EoDwjPoQRTZbC8rww=
X-Google-Smtp-Source: AGHT+IFBrY1xCNBLevxnVxS01vxo1dlM5O5f6nP8J6KzF81TyBngCGwHcVB8HiVzcPVi/f8Bf4fW1Q==
X-Received: by 2002:a05:6e02:1ba3:b0:35d:8321:b35b with SMTP id n3-20020a056e021ba300b0035d8321b35bmr821471ili.31.1701780968910;
        Tue, 05 Dec 2023 04:56:08 -0800 (PST)
Received: from hdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id j3-20020a63fc03000000b005bdf59618f9sm9120210pgi.69.2023.12.05.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:56:08 -0800 (PST)
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
Date: Tue,  5 Dec 2023 09:55:41 -0300
Message-ID: <20231205125542.14854-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
References: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Hi Oliver,

In my last reply, I sent the ping command with the wrong target. This is
the correct one:

$ ping 192.168.11.1
PING 192.168.11.1 (192.168.11.1) 56(84) bytes of data.
...
64 bytes from 192.168.11.1: icmp_seq=23 ttl=64 time=2.23 ms
64 bytes from 192.168.11.1: icmp_seq=24 ttl=64 time=2.27 ms
64 bytes from 192.168.11.1: icmp_seq=25 ttl=64 time=2.14 ms
64 bytes from 192.168.11.1: icmp_seq=26 ttl=64 time=2.24 ms
64 bytes from 192.168.11.1: icmp_seq=27 ttl=64 time=2.26 ms
64 bytes from 192.168.11.1: icmp_seq=28 ttl=64 time=2.14 ms
64 bytes from 192.168.11.1: icmp_seq=29 ttl=64 time=3106 ms
64 bytes from 192.168.11.1: icmp_seq=30 ttl=64 time=2097 ms
64 bytes from 192.168.11.1: icmp_seq=31 ttl=64 time=1073 ms
64 bytes from 192.168.11.1: icmp_seq=32 ttl=64 time=48.7 ms
64 bytes from 192.168.11.1: icmp_seq=33 ttl=64 time=2791 ms
64 bytes from 192.168.11.1: icmp_seq=34 ttl=64 time=1781 ms
64 bytes from 192.168.11.1: icmp_seq=35 ttl=64 time=757 ms
64 bytes from 192.168.11.1: icmp_seq=36 ttl=64 time=6.48 ms
64 bytes from 192.168.11.1: icmp_seq=37 ttl=64 time=5828 ms
64 bytes from 192.168.11.1: icmp_seq=38 ttl=64 time=4821 ms
64 bytes from 192.168.11.1: icmp_seq=39 ttl=64 time=3793 ms
64 bytes from 192.168.11.1: icmp_seq=40 ttl=64 time=2773 ms
64 bytes from 192.168.11.1: icmp_seq=41 ttl=64 time=1745 ms
64 bytes from 192.168.11.1: icmp_seq=42 ttl=64 time=725 ms
64 bytes from 192.168.11.1: icmp_seq=43 ttl=64 time=6.11 ms
64 bytes from 192.168.11.1: icmp_seq=44 ttl=64 time=2467 ms
64 bytes from 192.168.11.1: icmp_seq=45 ttl=64 time=1457 ms
64 bytes from 192.168.11.1: icmp_seq=46 ttl=64 time=437 ms
64 bytes from 192.168.11.1: icmp_seq=47 ttl=64 time=8.34 ms
64 bytes from 192.168.11.1: icmp_seq=48 ttl=64 time=2403 ms
64 bytes from 192.168.11.1: icmp_seq=49 ttl=64 time=1397 ms
64 bytes from 192.168.11.1: icmp_seq=50 ttl=64 time=373 ms
64 bytes from 192.168.11.1: icmp_seq=51 ttl=64 time=3212 ms
64 bytes from 192.168.11.1: icmp_seq=52 ttl=64 time=2197 ms
64 bytes from 192.168.11.1: icmp_seq=53 ttl=64 time=1169 ms
64 bytes from 192.168.11.1: icmp_seq=54 ttl=64 time=145 ms
64 bytes from 192.168.11.1: icmp_seq=55 ttl=64 time=7.27 ms
64 bytes from 192.168.11.1: icmp_seq=56 ttl=64 time=2303 ms
64 bytes from 192.168.11.1: icmp_seq=57 ttl=64 time=1301 ms
64 bytes from 192.168.11.1: icmp_seq=58 ttl=64 time=273 ms
64 bytes from 192.168.11.1: icmp_seq=59 ttl=64 time=2.01 ms
64 bytes from 192.168.11.1: icmp_seq=60 ttl=64 time=2335 ms
64 bytes from 192.168.11.1: icmp_seq=61 ttl=64 time=1333 ms
64 bytes from 192.168.11.1: icmp_seq=62 ttl=64 time=305 ms
64 bytes from 192.168.11.1: icmp_seq=63 ttl=64 time=2.14 ms
64 bytes from 192.168.11.1: icmp_seq=64 ttl=64 time=2.26 ms
64 bytes from 192.168.11.1: icmp_seq=65 ttl=64 time=2.25 ms
64 bytes from 192.168.11.1: icmp_seq=66 ttl=64 time=2.19 ms
64 bytes from 192.168.11.1: icmp_seq=67 ttl=64 time=2.20 ms
64 bytes from 192.168.11.1: icmp_seq=68 ttl=64 time=2.24 ms
64 bytes from 192.168.11.1: icmp_seq=69 ttl=64 time=2.21 ms
64 bytes from 192.168.11.1: icmp_seq=70 ttl=64 time=2.11 ms
64 bytes from 192.168.11.1: icmp_seq=71 ttl=64 time=2.19 ms
64 bytes from 192.168.11.1: icmp_seq=72 ttl=64 time=2.19 ms
^C
--- 192.168.11.1 ping statistics ---
72 packets transmitted, 72 received, 0% packet loss, time 71445ms
rtt min/avg/max/mdev = 2.011/757.798/5827.620/1266.170 ms, pipe 6

So everything is going well, around 2.1 ms, until I connect to VNC. When
this happens, the ping spikes to 1000~2000 ms. Then when I close the
connection, it gets back to ~2 ms. I can also see some "TCP
Retransmission" on Wireshark.

On 05.12.23 13:38, Oliver Neukum wrote:

> 1514 is a standard ethernet packet. What is wNtbOutMaxDatagrams on your
> device?

I couldn't find this file on my device. On my Host Linux machine it
reports 0.

Regards,
Hiago

