Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBC7652B74
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 03:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbiLUC0z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 21:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234223AbiLUC0s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 21:26:48 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16FF92034C
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 18:26:36 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id d10so862839pgm.13
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 18:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z13W3xH1nsTvhWnmTXNul5f6es8IjrbA1O/Wf7PIKNI=;
        b=K9QYLOLdztcSsTqUl7QGaammCGHwhV6GDinc1PhhBdLobE/lTqf4Fbdiwti5iLSzDU
         MvGjre3X845BtKnSxgc5U7Bm/GsqqtDeunyDlPhk7+e3YSLu9dJU8GSaHmwaYDRl3PRB
         Q5dwbjfO/M3FGw0Mb21FzIzbufJZnsSb8ztlcBEjBLTwHY6NebUCmTE00bMVGfnQBu92
         6vI2SJD2SPJPzdBDY6Pbo+vDulW6IVbqRVh+HCXvOi0z8DzwouI9DLFchH/1PRapBNRM
         BLevifdSiRso2c17qIyHaLjzlwIULRIhEka7O9uub0NAXMh9PRZSmZTUaJ20YWZ9PvwD
         GD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z13W3xH1nsTvhWnmTXNul5f6es8IjrbA1O/Wf7PIKNI=;
        b=Y/Yng1pDm/zRTR0v+ELPOjjbBXYs9d/QXjS4B3RbluoWt6w2jV6BUYkfAuhw13K9QY
         dqZR5WJWpKDc6jr0dRbpMCASkpeUYhBzVgJVpM7JJU4hPQrBRgtZEbRUm0XW7iApT2rw
         dA1xFf7wofR+kBlyyPUwytHFSyR2vpQdBqvtiux2AVzv0kh66Bz570j4ZkJv6nUz0w6S
         HsIkm1egqpAe8Wk46fiJszms3WOXH+I4cU8WZ2n4dDTjuCXzhvOyDI9Q9DU+JgAHdGa4
         QUR4eEmFNqhRUvoXOg3CXjPzWVPpQjPudoClt1AjaEf/ixnl2/lSybq8dzIRd0qMVpVr
         trtA==
X-Gm-Message-State: ANoB5pmgSJkC3HEwojac2pD9j00yVU3uU+BauhpOk4F52hbB3f8xCsGO
        lWjEF/6oJFJZasVy2RYDE/4t0nkaLZnwnFiVAwW+vElgBYYl1UXLjSnBIA==
X-Google-Smtp-Source: AA0mqf5V/yx0Q8zO5dmug5Y1jw5YLRIhuVHHnHGhsTq9FbPhZwCtCA9tlOs289stSkFMYCoFkO/pg3WzcUnpiib76WU=
X-Received: by 2002:a63:3641:0:b0:478:e542:7d77 with SMTP id
 d62-20020a633641000000b00478e5427d77mr11878033pga.101.1671589596254; Tue, 20
 Dec 2022 18:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com>
 <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com> <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
In-Reply-To: <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
From:   Lei Yu <yulei.sh@bytedance.com>
Date:   Wed, 21 Dec 2022 10:26:25 +0800
Message-ID: <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
Subject: RE: [PATCH] usb: gadget: aspeed: fix buffer overflow
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Jakob Koschel <jakobkoschel@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
> > > > > > Using rndis is able to set MTU to 2000, and the issue can be
> > reproduced.
> >
> > USB ecm is also tested and it is possible to set MTU to 2000, and could
> > reproduce the issue.
> > So I think this patch is needed anyway.
> >
> > @Neal Liu Could you kindly help to verify the USB ECM case?
>
> How to set MTU to 2000 on USB ECM case? I remember last time I cannot set by using "ifconfig ..."
> Regardless ECM or RNDIS, I agree this patch is still needed.

You were able to set MTU to 2000 for RNDIS but not for NCM.
@Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
So I tested ECM and verified it could set MTU 2000 and the issue could
be reproduced.
