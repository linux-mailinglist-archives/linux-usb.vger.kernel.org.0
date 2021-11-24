Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F3A45B0DA
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 01:46:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhKXAtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Nov 2021 19:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbhKXAtw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Nov 2021 19:49:52 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7495BC061574
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 16:46:43 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id w23so1511700uao.5
        for <linux-usb@vger.kernel.org>; Tue, 23 Nov 2021 16:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=dkwyOAxjB4BLYlEe+hztnb6yd1YhcCXkIympAWHIYao=;
        b=TVD2S5g5pZOQN5ag/deYSLDd5sg90aXdIhwPfUC0FdXXqQWkg3mfCk37ppz4PPcMoY
         iuX9FNmLZDwsZtVvKXEyhAEfKMAbELWGs6VG7wS6DlVqh+bF+0Eh2Z+qM+eLbyYv5TwL
         UUjJQuGGEsmyvcwOpToFvAJsXq3xkNrV30EezehgQIyL6U8Mx2eI1Vz7DEWRjYB9AK/g
         HoAalxVXRjYUfW45lRB87QT49sLDnSaE+3Px8t2fbXUSW7AV9kuBeKh8KbhWbmu+HT0X
         dX47HEI0ciXLAfGDy+BU+ewHZJTQFvpWyOyWlaXptAQd3KY9V4mccFK3mSfx60cwOxyl
         z1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dkwyOAxjB4BLYlEe+hztnb6yd1YhcCXkIympAWHIYao=;
        b=QyyUKyBN/pdrlJrcfG9wn+l3N1qA7sbB80nCrYyzsmRYvG+EE5tEfCYdm58Ift5scg
         zJfpKLF85LozumVDt89hsmD5JigieFHhjm25wMF3TkTlCVL0JwYq01V+eoIlsXpJXD91
         TTpXS6AkMLYie+AkC4Ay+CzVndjIWG8SzY3L0quuKb3paKxbO3dYC4WwrAqHSweph2xC
         mg+MXF9vmrKMIWjag3at5iS5urV/1k/1F8ItHNtlB3z6RPhPcFOFXwE+gcFr+zpnQiK3
         gEaFfkrjRNzOtv21r/wftcmiObVLNFFEcsIPyjOKanwMDTS/FH8kY1NSP+C8Z/Eiy0qk
         cH7w==
X-Gm-Message-State: AOAM532NZa7kg31W037/DHoszevfkUAow85Un0JCm8WUoXGTwl6lOCMt
        vKJBTaSEvXMPS5IMgcsPymi1ZRb8CTCfWx7zrKBChwOfn7k=
X-Google-Smtp-Source: ABdhPJyoLHCMEtbDZjaP9Mowlwa6igyErH5SC+1CoSwbDjFPghVogwPyWGWg8H1oKXq4Mm1FarlzaSbbsSSmz2yMFo0=
X-Received: by 2002:ab0:69c5:: with SMTP id u5mr2995865uaq.92.1637714802433;
 Tue, 23 Nov 2021 16:46:42 -0800 (PST)
MIME-Version: 1.0
From:   Jupiter <jupiter.hce@gmail.com>
Date:   Wed, 24 Nov 2021 11:46:06 +1100
Message-ID: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
Subject: Kernel 5.10 USB issues
To:     linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I connected a USB bus between an iMX6ULZ and an 4G LTE modem, it was
running well in kernel 4.19.75. I've just upgraded kernel to 5.10.59,
the USB is broken, the USB drivers were disconnected / connected
repeatedly:

[12781.730889] usb 1-1: USB disconnect, device number 84
[12781.808317] option1 ttyUSB0: GSM modem (1-port) converter now
disconnected from ttyUSB0
[12781.839256] option 1-1:1.0: device disconnected
[12781.959687] option1 ttyUSB1: GSM modem (1-port) converter now
disconnected from ttyUSB1
[12782.009476] option 1-1:1.2: device disconnected
[12785.607012] usb 1-1: new high-speed USB device number 85 using ci_hdrc
[12785.825218] usb 1-1: New USB device found, idVendor=05c6,
idProduct=90b2, bcdDevice= 0.00
[12785.833828] usb 1-1: New USB device strings: Mfr=3, Product=2, SerialNumber=4
[12785.841222] usb 1-1: Product: Qualcomm CDMA Technologies MSM
[12785.847049] usb 1-1: Manufacturer: Qualcomm, Incorporated
[12785.852536] usb 1-1: SerialNumber: 674a1bcf
[12785.932542] option 1-1:1.0: GSM modem (1-port) converter detected
[12785.957103] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB0
[12785.975924] option 1-1:1.2: GSM modem (1-port) converter detected
[12786.047708] usb 1-1: GSM modem (1-port) converter now attached to ttyUSB1

What could I be missing in kernel 5?

Thank you.

Kind regards,

- JH
