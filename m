Return-Path: <linux-usb+bounces-9428-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14748A8377
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 14:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071CC1C21E74
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 12:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0618013D285;
	Wed, 17 Apr 2024 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6RqUAwY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39813CFA6
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 12:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713358362; cv=none; b=ITVOf4NCzYuJxlE+nvLhPYTMex9r93rAHGMOmA4oGyghuui+DR5hksS0VhQWU8YOuKy+64Ndid8fk6i4TrBLcdb7wwO6TOPSSWaaw8HQoDBM6dnR6mz7sHJt/lutVwFMc/Mv5AdBDdJwrPF4Cu4L4l1lzbjcBedIsAYfZMN1D9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713358362; c=relaxed/simple;
	bh=djbmwNqV1T+fIz55LlQUHZgjFsDZ7gV93lfvX92UUkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jUrCG/N4fpCIhuFSCOuuBzIPvWm+LjQfs8HzdjJjtzrct+sWpAv9f1cudyGarHpg7jcRJoz52fZZrDxetsqSHLOQqy0YN4+yLejvz/m5Ajm0/JpwFvH6Ou85Wp1sWkIWCdTILJjwDvyijIv3hcfq7CEVQ2ndFajyn00c42eIYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6RqUAwY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so8605790a12.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713358359; x=1713963159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4QX8RCn4elswJrshCxrb7GwmrnHcmx33dwi2t+0ZG/s=;
        b=C6RqUAwY75I6zHgx6sYt4mb34lOtN6chRTIMpY5q3f6EOQv0vGrvpKBroqEhmEsX3H
         +vLktp9R9bnOuJg4FelWss3nq+aJqLEdD1C7t8rX/pQHm3LMHOk6uyApdfVkgbo0GY3N
         ITAU/OEvf2dIkD8d7OkP+5RNTxtXCO/D6uCjq7jcJJS5tvsttCgqcLb80p6RGEBgSTqF
         5q2mH+NA1v8UaO1gd1FxNWv/+rWkjNo4jLXbq4j9Av91MgTjKTT5RHSa3AbBSpp+vWZU
         04Vu8UKDewxwYP7DRH0p3uureKNlqXwUW1pfPXubclrwwArxqiyYcBbCZ+02mjm8HG1B
         8T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713358359; x=1713963159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4QX8RCn4elswJrshCxrb7GwmrnHcmx33dwi2t+0ZG/s=;
        b=ggI4HBm3aYImBOAWtUV/zLNSXNFQCcsDyDHdk3eKsdVO4svA3kjdv/MnPBoBsFONAn
         kiDJxGHjq6KpP8UVc5GuvjDAXIuJGHs8bHJS3L1NMbKP84WH+dMX/2EsK6fxNGc8i3lh
         Ywcw1Y5+a87IDnwEpyTq3BVEY1ro8JWCfjsGEY8QSGSBLLwdEE3YwjxiyrYB0CAvvXMW
         iH2v4YbIuNffImZ0AKSoW0PLJvQ+oolJF/yLXueLMmh9PZonyWqlqIKURJOTDYLTntjb
         UeK5KOIunjZx+MVGXyIS0G/BOtBw15Jfe2NBpFP040nQr35pVqGQbLtD19Ez/la9MY1Q
         Z20w==
X-Gm-Message-State: AOJu0Yx5Dzkk2/FIZaKJlPlfYj5QhN0aWOkgLEq1PRPsqY7V2yaILc82
	Vs4KKUi4qJnhbpeJp94UMBn2pGYLUrr8t7pG/ISmqyOhsFIPTxzGGPJVJwrohv/98mYvtfLJUMM
	0
X-Google-Smtp-Source: AGHT+IH6NbVg3OaTVcHg1EKwubIgE/tScXiADmzL/JK53F4ylrot4xtE/HFlRfWZw28pL9BO3BrKIw==
X-Received: by 2002:a50:cd9a:0:b0:56e:232f:e4a with SMTP id p26-20020a50cd9a000000b0056e232f0e4amr14816801edi.6.1713358358578;
        Wed, 17 Apr 2024 05:52:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id es20-20020a056402381400b0056fe4dff5e3sm7201068edb.60.2024.04.17.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 05:52:38 -0700 (PDT)
Date: Wed, 17 Apr 2024 15:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: gil.fine@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] thunderbolt: Allow USB3 bandwidth to be lower than
 maximum supported
Message-ID: <6289898b-cd63-4fb8-906a-1b6977321af9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Gil Fine,

Commit 25d905d2b819 ("thunderbolt: Allow USB3 bandwidth to be lower
than maximum supported") from Feb 12, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/thunderbolt/tunnel.c:2113 tb_tunnel_alloc_usb3()
	error: uninitialized symbol 'max_rate'.

drivers/thunderbolt/tunnel.c
    2061 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
    2062                                        struct tb_port *down, int max_up,
    2063                                        int max_down)
    2064 {
    2065         struct tb_tunnel *tunnel;
    2066         struct tb_path *path;
    2067         int max_rate;
    2068 
    2069         if (!tb_route(down->sw) && (max_up > 0 || max_down > 0)) {
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The patch adds this condition.  If both of these are <= 0 then
max_rate is uninitialized.

    2070                 /*
    2071                  * For USB3 isochronous transfers, we allow bandwidth which is
    2072                  * not higher than 90% of maximum supported bandwidth by USB3
    2073                  * adapters.
    2074                  */
    2075                 max_rate = tb_usb3_max_link_rate(down, up);
    2076                 if (max_rate < 0)
    2077                         return NULL;
    2078 
    2079                 max_rate = max_rate * 90 / 100;
    2080                 tb_port_dbg(up, "maximum required bandwidth for USB3 tunnel %d Mb/s\n",
    2081                             max_rate);
    2082         }
    2083 
    2084         tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB3);
    2085         if (!tunnel)
    2086                 return NULL;
    2087 
    2088         tunnel->activate = tb_usb3_activate;
    2089         tunnel->src_port = down;
    2090         tunnel->dst_port = up;
    2091         tunnel->max_up = max_up;
    2092         tunnel->max_down = max_down;
    2093 
    2094         path = tb_path_alloc(tb, down, TB_USB3_HOPID, up, TB_USB3_HOPID, 0,
    2095                              "USB3 Down");
    2096         if (!path) {
    2097                 tb_tunnel_free(tunnel);
    2098                 return NULL;
    2099         }
    2100         tb_usb3_init_path(path);
    2101         tunnel->paths[TB_USB3_PATH_DOWN] = path;
    2102 
    2103         path = tb_path_alloc(tb, up, TB_USB3_HOPID, down, TB_USB3_HOPID, 0,
    2104                              "USB3 Up");
    2105         if (!path) {
    2106                 tb_tunnel_free(tunnel);
    2107                 return NULL;
    2108         }
    2109         tb_usb3_init_path(path);
    2110         tunnel->paths[TB_USB3_PATH_UP] = path;
    2111 
    2112         if (!tb_route(down->sw)) {
--> 2113                 tunnel->allocated_up = min(max_rate, max_up);
                                                    ^^^^^^^^
    2114                 tunnel->allocated_down = min(max_rate, max_down);
                                                      ^^^^^^^^
Uninitialized.

    2115 
    2116                 tunnel->init = tb_usb3_init;
    2117                 tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
    2118                 tunnel->release_unused_bandwidth =
    2119                         tb_usb3_release_unused_bandwidth;
    2120                 tunnel->reclaim_available_bandwidth =
    2121                         tb_usb3_reclaim_available_bandwidth;
    2122         }
    2123 
    2124         return tunnel;
    2125 }

regards,
dan carpenter

