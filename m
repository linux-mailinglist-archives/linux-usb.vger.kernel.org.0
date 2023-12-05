Return-Path: <linux-usb+bounces-3733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EAA8053FF
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 13:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE75D1F212C0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 12:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883855B5A0;
	Tue,  5 Dec 2023 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhwDVaHl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C6AC9
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 04:22:41 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d05212a7c5so21493965ad.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701778961; x=1702383761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DkoNDcu4j63ihXOI4O015vQi/uc6cmZYAURuPc8nI4=;
        b=IhwDVaHl1BfSvluf5v1pDihYBuyZR90C+s24WQkCW9VrOA5i2EH3N0a2PHtUP+BTEK
         Z7qIzyMbR6OCAbigVbn0IL6QUl3xpK6TNJiVZOdFPVb/oT63nwY2YJaoDKEuaozSFQSL
         wJYs/nfytCFW3Xvu0sHhIhX9yeTk40MRjfYYAFa1axXmy4rQXz+j9F3KEVbulae5AWoo
         9XmGmLO2KrjlhqFCPVoJ4+C8BoEgtyhwINqmM/BNzoUGAm4ArjJBajRQQSWpzPAse1t0
         PqRMrqs1YPBn7Ts6f7WnIGOWW/GKkOVaADqmVvS2oRBf8rQbf3R9LKpiuU+HzJBmBiQM
         IOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701778961; x=1702383761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DkoNDcu4j63ihXOI4O015vQi/uc6cmZYAURuPc8nI4=;
        b=p+u5GhW9eIBuJdHdlCT6kix4e1dyFXohcPLIGeRImkBVTRfG3PLCbHM5vE37NpwnF0
         aCSGOM1pTg7YTK2hArgtrGrSze5yK0KRsZvQUv6oF7ixsP+SULutwRiJzIByJPPeff4I
         5luMeYO9sZio5pDikDkq1yL83tu0NDf0mbrIJWcxGpd5Loe0M5MYjnj/GBdEAKyrBl8z
         arJcSg2fnCxorrsb80848Qqs4rzXTjAEojPmjqhalHlNu4/KqZYQu9E9Hxj9z09u4xmw
         /KbRER7E0Z3Ncz6ILsyUfVIJVg20LhQMe5ZH0XKoD5ditzSWKrqyHZ4hdehjgG7njKhO
         qyig==
X-Gm-Message-State: AOJu0Yyd7foetoZACWbhys+8d8zb6/v4/SmS9NLTMd4zerHqwS+1lmNF
	whFutGiUir+bHTCl7btItHY=
X-Google-Smtp-Source: AGHT+IFw6jGhY5iopOrdNVaIUkpaWiMDA1XfzIJAIujwErH4jFtLu6lRbk3CKFANfwJ0GHM16+nExQ==
X-Received: by 2002:a17:902:bc82:b0:1d0:bc8f:eecb with SMTP id bb2-20020a170902bc8200b001d0bc8feecbmr1483873plb.74.1701778960774;
        Tue, 05 Dec 2023 04:22:40 -0800 (PST)
Received: from hdebian.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id j8-20020a170903024800b001cfc67d46efsm10030198plh.191.2023.12.05.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:22:40 -0800 (PST)
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
Date: Tue,  5 Dec 2023 09:22:04 -0300
Message-ID: <20231205122204.10556-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <df7a9e1e-3399-4ebe-bfcc-4cb0ac164f99@suse.com>
References: <df7a9e1e-3399-4ebe-bfcc-4cb0ac164f99@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Hi Oliver,

> At first thought my gut feeling is that the packet bonding is killing
> your performance. What does a simple ping do?

Thanks for the reply.

Pinging the device works with or without the VNC connected.

$ ping 192.168.11.2
PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
64 bytes from 192.168.11.2: icmp_seq=1 ttl=64 time=0.027 ms
64 bytes from 192.168.11.2: icmp_seq=2 ttl=64 time=0.092 ms
64 bytes from 192.168.11.2: icmp_seq=3 ttl=64 time=0.072 ms
...
64 bytes from 192.168.11.2: icmp_seq=37 ttl=64 time=0.065 ms
64 bytes from 192.168.11.2: icmp_seq=38 ttl=64 time=0.070 ms
64 bytes from 192.168.11.2: icmp_seq=39 ttl=64 time=0.090 ms
^C
--- 192.168.11.2 ping statistics ---
39 packets transmitted, 39 received, 0% packet loss, time 38910ms
rtt min/avg/max/mdev = 0.027/0.076/0.105/0.015 ms

During the ping, nothing changes, VNC continues to be extremely slow.

I switched from NCM to ECM for testing purposes. On ECM, everything works
seamlessly without any issues. It appears that the problem may be specific
to the combination of NCM and the Linux host machine, as the setup works
fine on Windows.

I'm curious if there are issues with NCM and small USB packet lengths.
The VNC application tends to send numerous small packets (1514 bytes).

Regards,
Hiago

