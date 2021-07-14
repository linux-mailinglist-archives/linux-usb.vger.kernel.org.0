Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 946433C8B5D
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 21:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240072AbhGNTFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 15:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhGNTFI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 15:05:08 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C99BC06175F
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 12:02:16 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id r135so4967516ybc.0
        for <linux-usb@vger.kernel.org>; Wed, 14 Jul 2021 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=E7g3VPkEhFOLS+sOAs1+ZHOOPe/5Bp+RGdR8suwX808=;
        b=nwCiTPbR0na6SwMT5PTeW4If+MhelrmfIwPVtMmwfuVlIQSCZYJKxreS3kN2sxg4j1
         KF69W7+kHFdw99mxPEG0TcATSPJHBd2gkzEc7YSb6POd5h1wCPKd2zHQW2jcKZCZgcwI
         dnDvfYuK0EaaN5AS0RngiKq3J5GkFbdWCfTPPO7OciVewKvTBPNdeY4BzvReU34UWC1K
         qKllm2jFNw4nEWIQmQstyYx/P1K+fx132s2AqNwrvobgkBUcSC2UDv5o9J39nnkqFZgd
         6Z+aH+nXGdPkxNE8U6rq4bwNagSBbbqhL6+eaLS2Pi61FVIdDUm287/ER3fdD6jcLR0D
         qHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=E7g3VPkEhFOLS+sOAs1+ZHOOPe/5Bp+RGdR8suwX808=;
        b=ZOgF6rbnFjtn/4tUq/YamtOvnfq+AIlF5JbQuXe0+/NELYhvCBRqNj+Io2ZfVI4BKz
         WFV2iznudBwoKHmwgCqgI9B9zgCrpKrgsmTLH+tpoIQBHSW7VYHDnfMAj6AYtUD58veD
         sYi+pU+nq1bGwYaFQTSlpzkAVnVY4XTJtRexJBrzbwTPJtqXq+SjrVL6xMGgMe1MyJjn
         wzDjhrtzQvCqT9lrD3EvegVzITycoloOs/gyfhO82OK70VEWiLUUpH4LoUWJx3EuOn1c
         gRaWXDWq0ORvPo530W7l+2ZNuOKz80Vg3iT8zqvtJorgEOx2DUMvLWy7Mqtqt3guMa9f
         CiCA==
X-Gm-Message-State: AOAM533PBJZe2XpE/3FNRveqcsUxdwOfYIUqp73N8PsmLgyGgBW9Kahy
        urskynO67gZsnPCpKXqX0rp0ypBX7KbeH5PUT7Ose531+fI=
X-Google-Smtp-Source: ABdhPJyDH/TUIVEMGXLwe/o3iEU9zwFBQVP1AoT8TslWm0LLSPlBouZzXMqWputh5ZhMbtGRydnaCx9RZp2e5x91adI=
X-Received: by 2002:a25:7316:: with SMTP id o22mr15220137ybc.349.1626289335320;
 Wed, 14 Jul 2021 12:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
 <20210713184251.GC355405@rowland.harvard.edu> <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
 <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
 <20210714145423.GB380727@rowland.harvard.edu> <CABUoX8uUhW4bdUZ6Roo=jEn=3UwUq2QVAMPcnyg8rbLzua09=w@mail.gmail.com>
 <20210714180512.GF380727@rowland.harvard.edu> <CABUoX8vWDRtr4hiVOEkT48=doG8xbAVD65Hve0QByLJpV0JsqQ@mail.gmail.com>
 <CABUoX8uiYvDTcc8JvRk=T2n9Dr8ero+9dM1U7kh86_0f_U6rSw@mail.gmail.com>
In-Reply-To: <CABUoX8uiYvDTcc8JvRk=T2n9Dr8ero+9dM1U7kh86_0f_U6rSw@mail.gmail.com>
From:   Hylke Hellinga <hylke.hellinga@gmail.com>
Date:   Wed, 14 Jul 2021 19:02:04 +0000
Message-ID: <CABUoX8sMSjHuq9awkJO8PcH07LQK9pEMRjxeuB2WghrMRUTuew@mail.gmail.com>
Subject: RE: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I think it definitely has to do with my linux distribution being messed up.

I just tried this on a ubuntu live cd with the same hardware, and I'm
not experiencing any issues.
I'll try to ask on the gentoo irc whether someone could help me figure
out what is causing it.

Sorry if I've wasted your time.
