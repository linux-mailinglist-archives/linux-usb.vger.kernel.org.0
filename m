Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E4548FD96
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jan 2022 16:20:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbiAPPUA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jan 2022 10:20:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiAPPT7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jan 2022 10:19:59 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD62C061574
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 07:19:59 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id m1so19882680ybo.5
        for <linux-usb@vger.kernel.org>; Sun, 16 Jan 2022 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zKpUbgpLNu9h87MR+jc5oDvTuqsDe6+GMogYldh5QnY=;
        b=J2idJ5/F4YbNnm7H3+GrA9K8up9SmEwguR9LFiXrMdbSe5yGQ+7xVseDfS+UNheooO
         RsOLRTKq0q7CMRp64Bwp9rLDZVGZPpsoZfFBIeuosmuSy+ko4yzibMlHMTuutY9rQSM6
         hehybkCBsaGMEe9Cob/WK2O4mLEVTzOaUD/WIpTDY0DFcjOZui6GV4cYH4BsYEza8XVH
         X5eWqI15jBO2tPGdnEKEqwO+J/bamNiRaKfNYfi0cNZrJHsy5uvnlN+mRsYk8sOTTnj7
         FDMz8B4DjvetKwaJ581fIawOrivUtd+rZRoxuoTbGWmk0quMW0SshXqfzzX9XEdgHOyu
         4yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zKpUbgpLNu9h87MR+jc5oDvTuqsDe6+GMogYldh5QnY=;
        b=IWkXv9VEMSNyNdZghvdJHKsU6lPSMCwxrZ1bbQN+H32Fuz9GN7K5JOYVOFt2WOmIvf
         28LK4ApePlLZvE/fEsfY39HZC1lQT4J4k8TV+OpHdLWUzGy17bTVrmpDkNZfG9WACxsS
         nnynrqC9YD4qx3r6QNrkh805Te0v3qKpJC8gE6hvj4I0az1iaAqvkJBGOUBD8qYUKh+Q
         d7UigjBUeopOuli7V0VCn+h5KVTcNuQ84rKFfTZVk9wj50h8VdDfhA02GPnCg6Q7KrEP
         cueYdRw7+JnjnM4OZaJSGwqomBsniDc93aBhnqzipmthlc4d6IfRn0Vv5o3+ghaddhJ5
         MJuQ==
X-Gm-Message-State: AOAM532wHMq8Nn793O/SvZinWRE2Rgacja61cbKjPpjVdFVluf+4VdhC
        nqN8hwWKJnnRKVl8K81y3HImLyRiZIL1MApaIPLWHf1KKTI=
X-Google-Smtp-Source: ABdhPJy/JjsJmKSrEDsKLNjbS/yYkmkBHis9e/Zgw+dh3cUh0OAMw+CNDeM9NgkEXcyjHBCcQEcGnJsDRPUwFapVd98=
X-Received: by 2002:a05:6902:1209:: with SMTP id s9mr22869270ybu.48.1642346398370;
 Sun, 16 Jan 2022 07:19:58 -0800 (PST)
MIME-Version: 1.0
From:   Rajaram Regupathy <rajaram.regupathy@gmail.com>
Date:   Sun, 16 Jan 2022 20:49:47 +0530
Message-ID: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
Subject: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
To:     linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI

libtypec
++++++

USB-Type C and USB Power Delivery systems are with multiple
specification versions, platform designs and microcontroller vendors
for managing  data, power and display.

libtypec is aimed to provide a generic way for userspace System
Software on Linux, Android, Chrome OS or Other OSes to build developer
tools or
other management applications for USB-Type C and USB Power Delivery
class devices.

Features
======
- libtypec - get method for port and port-partner capabilities
-  utils/lstypec -  displaying information about USB typec class
devices in the system and the devices connected to them

Release:
=======

Binary : https://github.com/Rajaram-Regupathy/libtypec/releases/download/libtypec_v0.1/libtypec_0.1.tar.xz
Source : https://github.com/Rajaram-Regupathy/libtypec/archive/refs/tags/libtypec_v0.1.tar.gz
