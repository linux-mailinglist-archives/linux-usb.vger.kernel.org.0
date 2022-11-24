Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7F7637D28
	for <lists+linux-usb@lfdr.de>; Thu, 24 Nov 2022 16:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbiKXPku (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Nov 2022 10:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiKXPkt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Nov 2022 10:40:49 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8CEF6D49A
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 07:40:46 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id 4so1784837pli.0
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 07:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zFD5mMWWe7gzGSOkSUP5psIFtNYGADF/IWjkNl9dMSI=;
        b=jVfhWQqy3iK+WTAEwd8NJnhkrPH/zCI9Qd4GR0LhKMxuIoCwBUoa8jUYSBr0z1DmHo
         BBgE3YHA/i3rCuEByJ9XL5n+5VIAOfTRRbGYsqZJwBt3cANI2jVEWtD36rffFai2zb1s
         esG4tR2qdwRMXIQm632sTCYtEQOIHwR116CAjewiNmMrJ/1Xyi8+7yI2VaS5lbKn/dYK
         mo/zy+olp2WhPymzv9Y2ECTGedGKkqse47C+L9l329wEU5b9HTbq1E7g3gR3s5wAF2we
         M3wB3b3IhivoPR5Ckwu7guOW+lDyptiaow43RnTaDflueE5GehKUiIUOkI+0yp5QShEj
         bVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFD5mMWWe7gzGSOkSUP5psIFtNYGADF/IWjkNl9dMSI=;
        b=iW1uIFhVbMCu9qD+IYyGQNCNMIQ1unSrzW1M0JLPLOPoTp1zMG8K8k+EpLpXmXs3V1
         M4X+BP17Gh6tDC6h9PhM2wV8lpJkCjYt+srYlyo9ekIdY+qbhf8FnE2dr7LD8rAQYNdl
         tEM/wuOMV20/5cIAdHvR7Sdpy4zipeFKNDj8NSnvzn5WrikYvZjQzzJxodu4f3v2SJ0s
         QUrIxxdrjnl1RWs5u3J+zV7M+rgsGr21hMKn9iiYpxNO1qnkgxm9j8MEJKLEblxUQ2fp
         mLcimwc1F4gaxQSiGrq8hUTu4i3YYrGcmCRMW2+i9PaNTmKZr4AIhzSFXayE91cRnmJ5
         MWOQ==
X-Gm-Message-State: ANoB5plIN1ICWZuf/Pm7g3j+aguBCpBsYQIp5WUfpCluLKCYBdOnkjPU
        bR1SiI7G3UJraLUCWLL47IjZmJp6+GVOBiFcCBr6DZU8V/8AkA==
X-Google-Smtp-Source: AA0mqf58AfEdxOgBvWDR79FliQtH0DSzC6mWQuyQHGPTv9i1olfucUs/oSn5IxFS1AKtErOvkX7cxi7b+oEUHFsNj8o=
X-Received: by 2002:a17:902:ca04:b0:175:105a:3087 with SMTP id
 w4-20020a170902ca0400b00175105a3087mr14699138pld.65.1669304445759; Thu, 24
 Nov 2022 07:40:45 -0800 (PST)
MIME-Version: 1.0
From:   Vincent Mailhol <vincent.mailhol@gmail.com>
Date:   Fri, 25 Nov 2022 00:40:34 +0900
Message-ID: <CAMZ6RqKB70YohOEeUmYWthbi8N3ADVLQUg-=j6enf5cDQC_eSg@mail.gmail.com>
Subject: [Question] How to check whether or not a device is an USB device?
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am trying to have devlink report default information at the core
level. One of the attributes reported by devlink is the serial number
which is available in usb_device::serial (details: [1]).

This code would work:

        if (!strcmp(dev->parent->type->name, "usb_device")) {
                /* is indeed an USB device */

but the string comparison looks odd.

There is a is_usb_device() which does the check:

  https://elixir.bootlin.com/linux/v6.1-rc1/source/drivers/usb/core/usb.h#L152

but this function is only visible at the USB core level.

Thus my questions:

  * what is the correct way (outside of USB core) to check if a device
is an USB device? Is the string comparaison OK or is there a smarter
way?

  * would it make sense to export the is_usb_device() function?


[1] https://lore.kernel.org/netdev/20221122154934.13937-1-mailhol.vincent@wanadoo.fr/

Thank you for your help,


Yours sincerely,
Vincent Mailhol
