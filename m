Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D171D5A8907
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 00:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiHaWcX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 18:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiHaWcW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 18:32:22 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB6D6D9E3
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 15:32:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z6so21918123lfu.9
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 15:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dTwAMPh/9V/Am+K9PM8dwE1AGq+3RYvXPgc7SOQjnXU=;
        b=AwCm+X3GWpKn0gfiVI5YDWhY7Hf+771k/0DlcRP6gYXp2EXsCGfghmTJ4IKa/KFpIS
         ndqIV2Ht4wC63q6JXp0jzti09VE2ztBngbuRXiGlzbegYrDG7GLZ5jjxBI9UU8gUbaG8
         R+7dCpnkZoa4bYVwZoIQJk9HwWhKNr68vv3LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dTwAMPh/9V/Am+K9PM8dwE1AGq+3RYvXPgc7SOQjnXU=;
        b=qAza96/m37yJzIP+s1Ilnz1S8lklWWFtmquD0+sTsx3C1M0odNyPyje8JwM6ExcSs6
         TStxwb9AjqIWDQEeONzEnw9v54Li3bgz+i5AQ/AUUbOBh/yAmg696I8cWg9MYi0KIpfm
         LEVT63CeF1OZlUx6w7tCEcXQxv0+bG8c4c9P0DVh2bE1gBvkvoHxHQhDbJOWruL2wGPQ
         8NJZXwtERnZh0YxdX9nFgGw7/kzwhb0iRJiHoHlBSuXBrzhtDycD1gAZ6wC0o+J0hgne
         gGWkg5p0D/rt0GSOIqm9NQzfKJB8tUwaD0vw1k2k6OSilrq10GgSQHFPQLwEZ0TXIwHx
         wtJg==
X-Gm-Message-State: ACgBeo33REOVvaNoxbzaZBJAaeZ9cD0iFI1MKxmT/R3ZOOupVefadLgS
        2g+LgbF9O3tpFHiRjFXpmzc6X/nsOblMAs1uq9UlHg==
X-Google-Smtp-Source: AA6agR7Jz8wneNA2jCcibmfzDLOTwx/kA3n1akQcGf9VA2MV6a/QDCFha1GVHrgRTmzbP3S53cIXSQ==
X-Received: by 2002:a19:6402:0:b0:492:967c:1758 with SMTP id y2-20020a196402000000b00492967c1758mr9223437lfb.92.1661985138905;
        Wed, 31 Aug 2022 15:32:18 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id h5-20020ac24d25000000b00494603953b6sm1651288lfk.6.2022.08.31.15.32.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 15:32:14 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id j14so11574643lfu.4
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 15:32:12 -0700 (PDT)
X-Received: by 2002:a05:6512:23a1:b0:48a:fde8:ce8c with SMTP id
 c33-20020a05651223a100b0048afde8ce8cmr10438685lfv.393.1661985132356; Wed, 31
 Aug 2022 15:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220830045923.net-next.v1.1.I4fee0ac057083d4f848caf0fa3a9fd466fc374a0@changeid>
 <166198321700.20200.2886724035407277786.git-patchwork-notify@kernel.org>
In-Reply-To: <166198321700.20200.2886724035407277786.git-patchwork-notify@kernel.org>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Wed, 31 Aug 2022 15:32:00 -0700
X-Gmail-Original-Message-ID: <CAM7w-FWjcQBOsRa=EK8CAiS_1WvFAjUVktzWx_3ksL5Vs2jGfg@mail.gmail.com>
Message-ID: <CAM7w-FWjcQBOsRa=EK8CAiS_1WvFAjUVktzWx_3ksL5Vs2jGfg@mail.gmail.com>
Subject: Re: [PATCH net-next v1] r8152: allow userland to disable multicast
To:     patchwork-bot+netdevbpf@kernel.org
Cc:     linux-kernel@vger.kernel.org, levinale@google.com,
        chithraa@google.com, frankgor@google.com, aaron.ma@canonical.com,
        dober6023@gmail.com, davem@davemloft.net, edumazet@google.com,
        chenhao288@hisilicon.com, hayeswang@realtek.com, kuba@kernel.org,
        jflf_kernel@gmx.com, pabeni@redhat.com, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you Hayes and Jakub for taking this upstream.
