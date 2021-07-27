Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16ABC3D7A95
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 18:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhG0QLK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 12:11:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhG0QLK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jul 2021 12:11:10 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4F8C061757
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 09:11:10 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id l18so8167666wrv.5
        for <linux-usb@vger.kernel.org>; Tue, 27 Jul 2021 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wpEf9p7UMQGgSZZTrSWyqoTd9VV7irjRPOQbPpt/P10=;
        b=U90evKvWGf1QBvfQPnThI0XkuIUrGQExrXmvXjgpDCeoSSMJ5qshbS3veLZHd2Fdz2
         3BmZLAZSk3CFeHUyhzCyTmQYgyX7Iyz02rVph2tE3zbq+Ce54Q726LJMwpdT7Xg2d+5L
         aWxMbMY4545AT5fw5okB1M0Spu6/Runh9ntpEY1U5uoekUj8lf6T9rjiYjjk+RpKrYPx
         0ljahT1TsXaSVbkPBskGtnrbdlOtfXSrqMbKxd+Duv8q5jdlI29lOtl7T6BPw7yAhj5P
         VBSf7z0xSVTrLgSISEjZWHITvsruWHuR5BVD6bwBNKyUJmrv2W4rCMGPrrS5TmZ1ApQr
         HXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wpEf9p7UMQGgSZZTrSWyqoTd9VV7irjRPOQbPpt/P10=;
        b=msGYKyOpvXrf8lgrhsfNq+rWjD/0YPzEsL5Y9SRAiPakaW+I1NNjltHDRu5Mee6pbc
         CNT9dahh9XG1D7MAGgRHBYzo1kDipa2Sok1naPH0ucUB5wIBCYAqXjkFTbZzJYzR5bj2
         pIYPo60wgnTSps9ld+RmQJ6seBq68Oc7U44uotKO1XoQqnAv1cpl0TsE24LPNZ71njaM
         0DJbq7Lvuklla2VGkWsTWO4ee9yTjG898S8PXsGYikQZULeFrtToRjwi6pgn8SEtmGSJ
         o55uQRVMNZ2NtnucTNh8IGBOYhBAsNo5ceMVVeAzf7siXYk5Whq/RNi/tJJDmipDTdid
         dOOA==
X-Gm-Message-State: AOAM532fyOPGUQiWq4WcpebdKJhV0c/6LnkJNBv/Yohoi/hsgxigpRkn
        QJ3zV+BYa6jSIp0HeU39+g4=
X-Google-Smtp-Source: ABdhPJz1hLIl8Xtqjcb7gJi9ABZ96yHYVOWHT6PUnhOnJ0OGkH+NIafsnNYhslbn/q9b6KDPNhOqoQ==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr25157134wrp.3.1627402268792;
        Tue, 27 Jul 2021 09:11:08 -0700 (PDT)
Received: from [192.168.86.232] (xo2wyvern.plus.com. [195.166.158.71])
        by smtp.gmail.com with ESMTPSA id v5sm3925252wrd.74.2021.07.27.09.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 09:11:08 -0700 (PDT)
Date:   Tue, 27 Jul 2021 17:11:01 +0100
From:   AMoonRabbit <razgriz.wilson6@gmail.com>
Subject: RE: Fwd: Linux Kernel 5.12.10 Walkman USB DAC support issues
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Message-Id: <DMVWWQ.LUXSRV2XQXCW2@gmail.com>
In-Reply-To: <adddde7315464623ba329dc4e5dcc5d7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <QUKVWQ.1T8HV94AM5X6@gmail.com>
        <CAJpVOidqd+tpNNkHGvC6fUQ7g3Z+FLpiDJrmPWtQmiL-AsYsLw@mail.gmail.com>
        <YP+kqqimY1BYZAwL@kroah.com>
        <a59c1173b77b4ace8db7181b1b0fc446@SVR-IES-MBX-03.mgc.mentorg.com>
        <RBHWWQ.R54EUTRRR5DN@gmail.com>
        <2c9ddbc65d1e4ce3a368c1d894281178@SVR-IES-MBX-03.mgc.mentorg.com>
        <GBNWWQ.KWQ1PXLOHKYW2@gmail.com>
        <adddde7315464623ba329dc4e5dcc5d7@SVR-IES-MBX-03.mgc.mentorg.com>
X-Mailer: geary/3.38.2
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On Tue, 27 Jul, 2021 at 3:05 pm, "Schmid, Carsten"=20
<Carsten_Schmid@mentor.com> wrote:
> Hi,
>=20
>>  Dmesg output with the system rebooted and the Walkman kept in DAC=20
>> mode
>>  so the system will only have seen the device in that mode. And=20
>> sorry,
>>  not sure what you mean by no top posts, but guessing it has=20
>> something
>>  to do with leaving the original email I used in the CC?
>=20
> No top posting means:
> Write your answers _below_ the text that you answer to, not on top of=20
> it.
>=20
> When you read books, you read from top to bottom, isn't it?
>=20
> Thanks,
> Carsten
> -----------------
> Siemens Electronic Design Automation GmbH; Anschrift: Arnulfstra=DFe=20
> 201, 80634 M=FCnchen; Gesellschaft mit beschr=E4nkter Haftung;=20
> Gesch=E4ftsf=FChrer: Thomas Heurung, Frank Th=FCrauf; Sitz der=20
> Gesellschaft: M=FCnchen; Registergericht M=FCnchen, HRB 106955

Apologies, but that's not a concept I've heard of until now for emails.=20
Will put responses below the chain from now on.







