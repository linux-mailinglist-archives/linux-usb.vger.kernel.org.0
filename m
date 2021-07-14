Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B01A3C8A10
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 19:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhGNRv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 13:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhGNRvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 13:51:25 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410DDC06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:48:33 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id a16so4548986ybt.8
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DJe/kKhBsVmdZ3tnIgCvmQhcMHHB8aDgbnkg5/uDir8=;
        b=VfZggBqcMh+TZ1TY9AcxZ0oRGj+o0NAiKy/Hgx+ZzetkFKRFmkBBFOlMV3MIJWXGg0
         Q+mWqKUrVZZCfLeRYdkp8bioD2QpCVmToQZfENuU4b7u1jnuhcizuftz+pMtfoUICwym
         v8lZ3xkFYk89PkHWwD+7e3nB2R62aVbMaNzeFt+cw6WBP2WHCY+KjeEV81iEX1CYjlu7
         Bd4O9fHs6C1fjveYh6DCVUDPlJ3HJwj7JDnSZbYncRbokAauYWngo9kQn7pE1rsRdPpr
         0/9ovx+W3pqQ8aYrPdVnMiT4aSSAfu12DfOXPv7hnhE7bQg4v6jZ78ghqmYCLjcoN+5z
         76bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DJe/kKhBsVmdZ3tnIgCvmQhcMHHB8aDgbnkg5/uDir8=;
        b=laxZ5s3Bfq4q37kGruCgTjy5NJw10yqzeyyYcQp3RQYe+VqhgRbuEM3ihAHaXWL70N
         DE4bu/JuwrAAdUO3TWDmKHWKzitVRi8JrUpcR2DR9lpR7ZIhYp5gQ7Uq9TIztmLVm4G1
         3wdI4dg3gmiGGtp7Cw0OtATi+suGn8t+80ScCqkbUGV5JnCgqXH/i+/6tILglH6JrsVc
         k77I8EK+dGl7Cs9rV2/6OjahMawqDpcvBrtQpL1z70Hrg94JpI6+QTdsAlEuR4wwU3d6
         gQ0X/BbOjik0aelwcrvtgrJ258AzqX8aYVK2KHDqQcObbi+5P8FIKl2T5h3LV/evqQn1
         30nQ==
X-Gm-Message-State: AOAM530NtaLFqxut1Rcp3OOTfWrfe2YCNtmqU6WQAbn+lHBpEFBrl9V7
        +c7mgroDOPves8QtciFJsO6AcdOXNltWRapFmtlaZszWyp9+QA==
X-Google-Smtp-Source: ABdhPJy4ua7NIyXcFr895ZF5tXd8UwGvMYFhB5SjSU2QXtaufz6JRGYMH2mWpuH9ClTB2I0zI+ysdn31XN8tkNXz9dQ=
X-Received: by 2002:a25:4209:: with SMTP id p9mr13690592yba.3.1626284911297;
 Wed, 14 Jul 2021 10:48:31 -0700 (PDT)
MIME-Version: 1.0
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Wed, 14 Jul 2021 19:48:20 +0200
Message-ID: <CABUoX8vtgVcdxydANDg-xM5HpmVCeNRrov3UFppELCJoEsLp_A@mail.gmail.com>
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, I did.

I've connected both the mouse, keyboard and headset to the pc and it
would function normally. I know it has to do with the switch itself.
But I have no idea how to fix it.

The switch works fine under windows and macos, and it is even
advertised to work under linux. But you never know with amazon
products whether that is actually the case.

I don't have a different usb switch I can test. I've tried different
input usb cables as well. The usb cable coming from the switch going
into my computer is pretty long.
