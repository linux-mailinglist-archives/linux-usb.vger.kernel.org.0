Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFED37130D
	for <lists+linux-usb@lfdr.de>; Mon,  3 May 2021 11:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhECJfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 May 2021 05:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbhECJfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 May 2021 05:35:22 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4FEC06174A
        for <linux-usb@vger.kernel.org>; Mon,  3 May 2021 02:34:29 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id p17so2712731pjz.3
        for <linux-usb@vger.kernel.org>; Mon, 03 May 2021 02:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=K1HJFr1G47EnIvufOejlbMqabBIv/gZEmYvyOUo/fzc=;
        b=eSKHP7OtwipwwPUqEW9Z1MTt/mAvdltwvb3f6R8dKyngi1WPK/fmuY+JMerphzXpNy
         X7Ssc9H7i7UwfyYBJN4JOBEpAOzNS8frelylpErVO0QUZEGhC2yaVwTFt27+lt7W7jkH
         6wvMMEOQPyCHs1QY7SlCWfhT7UiZgUu2lWBFHvZXdDPZzVp1LI7LN7kWfKTfJjWpPoUV
         zb3kmb7uTYsGWGxTZThsAgGrrUxDQOdKwi+sUXinWARlb4UIVfw6YrFMBImjdiZl+QTh
         u/KRcYAxrmlxyeXol7N6+AqCaWaJ1g6MA93iXHHXDmkW6htfGMaDMsvOvNIE1bnn5Wvl
         6F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=K1HJFr1G47EnIvufOejlbMqabBIv/gZEmYvyOUo/fzc=;
        b=EKgJbD96SxcoQObU7cMp/CYxvh0Wnvx0pEtlv1VGHgE8Ro2i75Ncu/lgaawz860Pvz
         tmg2UVDoKbQqi3QRfd9SKnSjCy/JxTqMaVDi+3BNcrUGtbwkuOnsJZZrQmIs8KuLUss4
         xHsv0s8pAxyFDcwz14g2SRFnTzYRQZVdaiEP0fMlni+hU/K97lj0P7LnJt8Sphjnewmd
         +tSlnpNeOjsnrq711iQ9oZW95dBHkW6x1udYAgWBgZPzziLSfZAdFy3jEEUeWHcPlKg6
         iJ1e6ImrvnxZt8fsyo3T2uLDUVLIiRhkWx7erBPdrk8couAntUBCUTLasdRBuNiey6ep
         o0uw==
X-Gm-Message-State: AOAM531PgSnskbgsmCxyHTX1JxiJCOTZ2wnqantY0JtpGhYNxvp7lFbh
        P9iYS4oXQrx5Xmraq6m0oIA5gfn4Dy1PV9R9fftHRiUyXRg=
X-Google-Smtp-Source: ABdhPJzpN6vNWLlOSCT3pck+SzSi9FICBWVl0h5yD5/rmWmwQCQ80i0Pl7rSI0+YvVn3msGvdsp2IiAfh8JOgnDZfJY=
X-Received: by 2002:a17:90b:514:: with SMTP id r20mr30123166pjz.193.1620034469230;
 Mon, 03 May 2021 02:34:29 -0700 (PDT)
MIME-Version: 1.0
From:   Sckipper1 <gsckipper@googlemail.com>
Date:   Mon, 3 May 2021 12:34:19 -0700
Message-ID: <CAONUbMc7OGC7i0bfhOED_fgCpBp5yMoAPVa+25Tf_hrE6hh69g@mail.gmail.com>
Subject: Pi redirector with USBIP
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I want to forward a device connected on a linux machine, over ip, to a
Raspberry pi with an OTG port. So i can connect the raspberry as that
usb to another machine.
I have a raspberry pi 4B with usb-c OTG
I want to forward all the USB communication (handshake, data, token,
etc) to rpi otg port. I tried socat for that but not many results.

I am thinking now to fork usbip and modify it to do this. I don't have
that much experience so i wanted to ask you if something like that is
possible.
I am sorry if i bother you with my ideas but i thought to give it a try.

Sorry in advice for such a bother,
R. Daniel
