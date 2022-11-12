Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3446626C2E
	for <lists+linux-usb@lfdr.de>; Sat, 12 Nov 2022 23:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbiKLWY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Nov 2022 17:24:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiKLWY5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Nov 2022 17:24:57 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445C8DF05
        for <linux-usb@vger.kernel.org>; Sat, 12 Nov 2022 14:24:56 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t10so8482243ljj.0
        for <linux-usb@vger.kernel.org>; Sat, 12 Nov 2022 14:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dcomp-ufs-br.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ubEOvQPEdqwdfEAm9eb5dhMxLq/OLHh0bdZoUEb/QVc=;
        b=CdH8qowgrTag5BesKp6JuJ1TY38n1HX7qUUNyqfGadszqfoBqYuhy4jw8E7+LMzyPa
         HG2w2VXm+eMMeKCTaH5B3uHdafofiK3q8zqQ2Pex9WyYd5HyM4pMWAWke4T3Gre8/38+
         deNiJOZYgeh6rEcnAQb2mZ1npzp+02WFv2TzjYtYe3wXCHbLidbaYnh6BnvsezbkbVv3
         wUypCwM04X8wiiKxQIBaU1w51Pa5hWVHcVNuQFJeE1XH/HXEnCsx2Ivt3WZn73Po9V6A
         BZvGgB09/ZC6iCQARSYNBnmbIspM+fuBco/+3Sf5XKHWIVsFEyiZ8PFlmCdEKiquAhVc
         Y1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubEOvQPEdqwdfEAm9eb5dhMxLq/OLHh0bdZoUEb/QVc=;
        b=vIP+MxUpUNT0R7sf9f5Z0uW/LdJsQB0pbv9v2MvZSZpkBNyoyhyAWnrETG034BbmBv
         jhGGGAg5/yB9XUFlWeaahyPyI+yFoucfr6qWlUDpALYEfnrOQG00qJvv95mkqnUhAHci
         eLT1CLY407v86j01YcDh9bo7NxUk234jjSQbvlsdGVaUbH9jctTd6BmUduYwYwjJLLu9
         munviKGVx8ZNbojLM0Z3ki9GMmW9230Xm8wOq5Rds5+s9D2irXGiAVnyAKIRktR7mcQo
         8bDSqMuSi+jJK6q76QVOqwR+8OubWdLarm6UmPjbfa9P7jImx1ryidVZLzoaGYQsRn7f
         P5yQ==
X-Gm-Message-State: ANoB5pmfANeU0/SMGjNP6Bb+1ZObu8AvcEnojFxKex7eich1YZBjX5he
        pR/YuG7z643WFItEMpKFFgpGmkTM+GKT9lJkHGSBUEoGTEhHOQ==
X-Google-Smtp-Source: AA0mqf7g2pAEei4+oZIJsttyKKV+aHicvsvkVxFpusb87gRsRI/zKnJVMT72jDzSU+F7yiXib+NO6qiVG9b8v40WryM=
X-Received: by 2002:a05:651c:491:b0:277:21c8:a94f with SMTP id
 s17-20020a05651c049100b0027721c8a94fmr2164761ljc.28.1668291894204; Sat, 12
 Nov 2022 14:24:54 -0800 (PST)
MIME-Version: 1.0
From:   Gabriel Oliveira Santos <gabrielos@dcomp.ufs.br>
Date:   Sat, 12 Nov 2022 19:24:43 -0300
Message-ID: <CAGoM2ZU1ez0sCi5GuTd44xnCM8oVmxWTjUMbi_2L+0S=ERN8BQ@mail.gmail.com>
Subject: How to configure a Linux USB driver to have higher precedence than usbhid?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi! My name is Gabriel Santos and I'm developing a USB driver based on
https://github.com/torvalds/linux/blob/master/drivers/hid/usbhid/usbmouse.c
for a USB joystick.

I changed the device table to use the joystick's vendor and product
id, like the table in
https://github.com/torvalds/linux/blob/master/drivers/usb/usb-skeleton.c.

Currently, if I rmmod usbhid, insmod my driver and plug in the
joystick, everything works. But I do need to rmmod usbhid in order for
my driver to be probed.

Is there a way to make my driver have higher precedence than usbhid,
so I don't need to rmmod usbhid?

Thanks in advance.
