Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D272591860
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 04:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbiHMCcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Aug 2022 22:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMCcG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Aug 2022 22:32:06 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F202D6DF9C
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 19:32:04 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 21so4035954ybf.4
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 19:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=O23Csjsevi4K1EQr0R7J99pi/JAgL89SBaGfX1TdfYI=;
        b=ht0yzT78JnByJtS4vPSyIAClOlz+Ptk3VwNGrCY86GuQ86BxtIaDG9ZKchIhOl9+Kc
         EKPs4OolO7Td0jBEgMbxQJypnNTkyHw5qSlgd7PRsi/NZPJLXfzwJ1XgAniQMZJ+mdhL
         Ml/8UVx48D8rn91dzkWZkWTUuj64ijZRBRzKYlqwspadfXprC/AUMxTv467ZE4PMA24e
         OIuuKNYF6U5uoQbQxhZtGm+ndRMIHfyK87DcrSHJgX200RTllC8WScrPmOG2cSFhonTn
         QotY1n1QqUi/tEX9IGeo/tUZ4t6Yg6uec2tMGIGgynLI/KpoYAXVbZwOWmMH7IW2oXEX
         8JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=O23Csjsevi4K1EQr0R7J99pi/JAgL89SBaGfX1TdfYI=;
        b=Fbd/sHsfRa+dJL0rAH8RD5+q7xD+1qXbcWVnqxZHKBTCq+KmQeKjsVgF3JMfZGVAyl
         xfDr/rtH3IUgo2XN3Y76KSbQfxesBEcWN4EYbzXu1HaeQ8gvEmkt1qyV8wuMNa0Qi8ZZ
         vaVorI5f2ktFWay4nur6rDuEzabHq7lsZJ4dvXAZWHKGmN8dJLKgR3yn35eJF20m4fEU
         IgR8pgvikW3pALzsIW6Ey4PcfocZNok9Wy4dlzv9nJC6gQqUm6l2dvycApwRdkPEdWrn
         ZLw4+qBKD+3I35GPnwFK4ZIB1ewzUKUHFIHTEsP48X3d9Rh89mzgyMJYNohGDnXs5pgv
         SQRA==
X-Gm-Message-State: ACgBeo1DF5FV/nXojHkyNPpfBYES9bQlArOlBmjzL2/bSRVuVv6qWka2
        yobjb99wOPpGICsteBc5R1WjGk67/RfvlagN3JBhvtQRd/zgaQ==
X-Google-Smtp-Source: AA6agR75uNVOTWkpnhJhbwMM/NNyPQ5HpCO8cI/KusPRnTwkFWaF1efLZQZk8RDaF8u/OoQJ95YUMP0/CHUFhBLOGEY=
X-Received: by 2002:a05:6902:1081:b0:67a:5c89:2009 with SMTP id
 v1-20020a056902108100b0067a5c892009mr5183874ybu.522.1660357924169; Fri, 12
 Aug 2022 19:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAJz5Opf2Sjdx_At8abHwby7w+HxLcZLZ63my-8qOUA3yuS85wQ@mail.gmail.com>
In-Reply-To: <CAJz5Opf2Sjdx_At8abHwby7w+HxLcZLZ63my-8qOUA3yuS85wQ@mail.gmail.com>
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Fri, 12 Aug 2022 22:31:53 -0400
Message-ID: <CAJz5Opd-p5MoNyTXqPwoQ1+zTHV_hWeb+yhZgh7PbQMJMW7PoA@mail.gmail.com>
Subject: Re: [BUG] usb: usbhid: after -EPIPE from interrupt urb, input state
 is not resynced
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 12, 2022 at 10:27 PM Frank Mori Hess <fmh6jj@gmail.com> wrote:
>
> After an interrupt urb with status -EPIPE is seen in the completion
> handler hid_irq_in, there is no  GetReport performed over the control
> endpoint to compensate for potentially lost interrupt urbs.

Oh, and I should mention I'm using an old kernel 5.4.13, actually not
sure if new kernels behave differently.
