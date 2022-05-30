Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82979537711
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 10:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiE3IdM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 04:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiE3IdK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 04:33:10 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BC56B08B
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 01:33:09 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id m32-20020a05600c3b2000b0039756bb41f2so5971856wms.3
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tO/MLUj0Timj+K0pTZ3wrHGA1lLuP4WoYOcucpSfjek=;
        b=BRw9SK6ED4Fkhp9w4zFnuDjQ5Ze1cfgJ7okEL94qHs8wDav6ti/9pPFJdIW1qT419i
         v9pha7oP1toRP5piLomi0TVTsZaTXaAcqotvTOf99v4fZD3ghJEw6zAUOg4FjqRxwpHb
         X6pzpiskPPINNZFP6a60FXLZ5JFpBmMhikfEGiT/XKR51YKZzdW2rvrTc3SWK4Zbtlgj
         UHylJqhUM8OJkb5EliZ3Ze0b1NI6c6kPQpLWQmTiM7/TOwL1dPuB/BRMoG8mQ6O8pbZT
         3N1CSU3FxJ2K0L5bixAiET5VZ5W6dlwfEl/on1NSqY2xb7JVI8BdqkFCUx5x9cWgPVf0
         NlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tO/MLUj0Timj+K0pTZ3wrHGA1lLuP4WoYOcucpSfjek=;
        b=24Ab9ApZwyxMffGj8Njin8fmx68youvFQsUtibvKc3ebPTKbl/BAzWnlZU4KmXpSkF
         FB5P+Bt7dGJVvmeubyc8owBK1wsly7BfpRtURaohrqzsiWPppAZfX0cDsxLvj32poCZb
         eqXpx/mXkM9vM39Bxk7istb8t+eSQtAYOzmF8AkynL1DntmjZGEMLB2MQulF/OwRQVi0
         KzYKI0daije4UEs22Tan+n3NQoeXmQSU/TVxwvcOWtWjtKq4Yy2rimkzAXRR6brRBt+L
         EL5ft9GudLt1lQfShqolIE86BzJErYeKXliHwv/4DZHQqkXp6vuycBLvnP8VdFiphuqM
         4SNA==
X-Gm-Message-State: AOAM533FEJbHRDECcj/bR/KsIBvIgGo9A7BMmu4d+m5thS2IfWc7PCW1
        w+TGLtbYnbKtkWMUqyN5SNQ=
X-Google-Smtp-Source: ABdhPJzVJ38khsoZ9yPAa1OIo0f8Knb1+TewasVL484R8UKD03ri9LKrHVWzs27QnJqEZ/zDDpWzOg==
X-Received: by 2002:a7b:c041:0:b0:394:44a9:b017 with SMTP id u1-20020a7bc041000000b0039444a9b017mr18229238wmc.169.1653899587775;
        Mon, 30 May 2022 01:33:07 -0700 (PDT)
Received: from tmon-pc ([95.143.242.242])
        by smtp.gmail.com with ESMTPSA id f5-20020a0560001a8500b002101f90001csm7551354wry.11.2022.05.30.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:33:07 -0700 (PDT)
Message-ID: <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <desowin@gmail.com>
To:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Date:   Mon, 30 May 2022 10:33:06 +0200
In-Reply-To: <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
         <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com> <Yoy7oXpMugFFmfBP@lahna>
         <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
         <YpCVc6eYkpmjP9AF@lahna>
         <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 2022-05-29 at 21:51 +0200, Stefan Hoffmeister wrote:
> I have managed to wedge the system into a state where it does not
> know about Thunderbolt, and now, on what I presume to be USB-C only
> ("usb_typec_revision" == 1.2? Seems ... low?), both DisplayPort
> outputs on the docking station are now active, and I do get
> meaningful entries from the DRM subsystem (and hence X). I am half-
> way happy: I want exactly that over Thunderbolt for the bandwidth ;)

Could you please tell how did you wedge the system into a state where
it does not know about Thunderbolt?

> Now, when I unwedge the system to enable Thunderbolt again

I am curious about the wedge/unwedge procedure.

Best Regards,
Tomasz Moń

