Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACB14D232A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 22:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350409AbiCHVS5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 16:18:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350347AbiCHVSz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 16:18:55 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A56CDEF6
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 13:17:57 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id yy13so715835ejb.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Mar 2022 13:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aMUI5wNHfK4o2rZYGcQ4S/vaXJq6Pohkek5MekQIM+Y=;
        b=CzfnizVS8xJF0XYcNlZGRC4X3t9oWbY6F50AYJw7V5IHulZd2tgVTPNS397S7hu1kT
         cWEbdXKwxA4eZPfzwlCDFga8/zVZabdhLbDRI0n4vQ8zL7Wpsypxof7EhRLkeSntSi56
         tjjvGMwL7IJs80Bbf+IaYbCzbkp80A4enfr0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aMUI5wNHfK4o2rZYGcQ4S/vaXJq6Pohkek5MekQIM+Y=;
        b=S+iUL7sNQ98FuZvKXVQia3JHBOcpWMh+l1107blbui4+Kc4Gp+BFrH04maLkvlQf0k
         /Vu3bH77OJZbi/FuszeIsvl+02Ixd0bgXVIRupIfzHVDgn9TFbwxt/F626MFDPy+4hzi
         +wTgJ6Oq4mLH7xaut0knjW/9/EdKx7s32wCkCoQCF4sMuh+vLpOPf/b1KLHukcXZiwDL
         WUpByCmx+u1RiQMWQ8kYJgd9Fh1EhSlV7ZcMGhc9HVCpkh5ByYRGRzJFYqvuwkpbbqXr
         K3K+g68+RZK5slR4cehMBTFlo0SdHtg63zdyTZmWHRVPg0Q8cBPTdPUoa+95v+DfgnBV
         ovoA==
X-Gm-Message-State: AOAM533SRHCuA4PyZoUEd81dBXh9w9DEFSWbfjFcoPAOYvCjejPtQbFM
        CA9yK7xjTrn1DHM9J1JRBtkaIS8CasRfS8QpWgc=
X-Google-Smtp-Source: ABdhPJwwLqWeKQQ4i87iLJGNX83ETlr9bJ7GKsjQGravKjtnOAwdz9jDyjmiqq0lU5L3300EqbSUoQ==
X-Received: by 2002:a17:907:7ba3:b0:6db:263c:46d with SMTP id ne35-20020a1709077ba300b006db263c046dmr10954101ejc.586.1646774275870;
        Tue, 08 Mar 2022 13:17:55 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b006db075e5358sm3886317ejc.66.2022.03.08.13.17.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 13:17:55 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id yy13so715729ejb.2
        for <linux-usb@vger.kernel.org>; Tue, 08 Mar 2022 13:17:54 -0800 (PST)
X-Received: by 2002:a2e:6f17:0:b0:248:124:9c08 with SMTP id
 k23-20020a2e6f17000000b0024801249c08mr324137ljc.506.1646774263805; Tue, 08
 Mar 2022 13:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20220308171818.384491-1-jakobkoschel@gmail.com>
In-Reply-To: <20220308171818.384491-1-jakobkoschel@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 8 Mar 2022 13:17:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9FBXiHY1_6jWULY-Pxe6aMAj6EdHc1YkP43DSMWwq+w@mail.gmail.com>
Message-ID: <CAHk-=wj9FBXiHY1_6jWULY-Pxe6aMAj6EdHc1YkP43DSMWwq+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/26] usb: gadget: remove usage of list iterator past
 the loop
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     Greg Kroah-Hartman <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:USB GADGET/PERIPHERAL SUBSYSTEM" 
        <linux-usb@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 8, 2022 at 9:19 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> This patch set removes any use of the list iterator variable past
> the list body [..]

This looks good to me.  It also looks like now all of those cna
trivially be written as that "list_traverse()" thing, but that can be
done separately.

             Linus
