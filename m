Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6282245213
	for <lists+linux-usb@lfdr.de>; Sat, 15 Aug 2020 23:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHOVks (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 Aug 2020 17:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgHOVkm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 Aug 2020 17:40:42 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530E0C03D1CC;
        Sat, 15 Aug 2020 14:22:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w25so13427304ljo.12;
        Sat, 15 Aug 2020 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=seHqTX3swnl2iKaYIdyjw1ndrTLNBOZz4lCK3OtDAZY=;
        b=uDKV005SBoRudMGgr2LgjEkcBg8Nwa2ynK9UDygULmXDG2396EZ39cNm5SJjb7amOd
         d+LdJhkz7VT+XnZdpQN3uZYIhLQAwp5Er+uZRRbGfnFNEwS4QA5XMHIylFjuTh/qj2Vq
         dD4znk0PRyM/E+Cr05yDELXSsc+P6qN70NzOQs+EYbueMBD5IeptsZ5LpW2hEjIpEsMY
         MZM3FGW60nLa+ccUHDkNc6szAPV2ADces5XOXrAFZxTf2kOzvmUYL61K8jO/v2LrjTYI
         yj36kz42N8modORXtdroaUDAtgkTxMrHOesFyvVjgjGzNEQXfSE2B4ZIk26FjqT2PNwz
         cZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=seHqTX3swnl2iKaYIdyjw1ndrTLNBOZz4lCK3OtDAZY=;
        b=sCRHzymtb++BrRHdvGIdw8IjRRxUG52cLaA5Abe2AOe6fRq0z71KixqmKlMzlyLW2d
         F7HwJMTVdFW3U8Bo0gngijo89GNV3gK8kXJd3Zlia6Yl/boWxJ4qXXQ+i2qUGo6lXE4H
         HF65Ab7Mr8T2/tp8zQ8kXJx4hbsYFXVQ2K+SczdMIrm8AV2oedH+Vr1WIYTVhIw83/Ss
         AX14b0CyG7rcf9qXETNGZL8OTEBwLITVXCp8lOLIT5zxjyNNw2BHoloEA1VqhnOZViMN
         7ENOJO0cdgI+7F92yfNKSw8yQLfOVMPAJVD8HtBk4825Uo5GR5Ieer20STwBQly6mFY5
         mutA==
X-Gm-Message-State: AOAM530O6sFdaJqNkqAe14BQP/D4LSsd49rMAkEwzE8TwZ/TWijNH9PT
        9PaJsDglx8FzLnEMjpJOG6cbS4YMHus2M0029MzE/OWAWuY=
X-Google-Smtp-Source: ABdhPJxOshegZNBMLYmMDJwILYiKRMrYfWzgVt99YEqIKYL+OrB1HqqyN4rZ+SFQnaBs97dbqKIL8n03sKqW5EU3Pmc=
X-Received: by 2002:a05:651c:1b4:: with SMTP id c20mr4108417ljn.432.1597526538815;
 Sat, 15 Aug 2020 14:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200815211617.86565-1-jaap.aarts1@gmail.com>
In-Reply-To: <20200815211617.86565-1-jaap.aarts1@gmail.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sat, 15 Aug 2020 23:22:07 +0200
Message-ID: <CACtzdJ0c7gADr2OFdz+AjNJCJEXMktTgAqsWmquxNHMtEre6vw@mail.gmail.com>
Subject: Re: [PATCH V4] hwmon: add fan/pwm driver for corsair h100i platinum
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

errr, I am a bit confused, I didn't specify any in-reply-to headers in
`git send-mail`, and I used a different subject anyways.
For me this is being listed as "in reply to" the v3 patch in gmail.
No idea how to "fix" this, maybe a good night's sleep will help.
