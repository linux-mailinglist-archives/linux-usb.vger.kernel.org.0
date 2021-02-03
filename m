Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694CD30E003
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhBCQtB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 11:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhBCQsx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 11:48:53 -0500
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FD3C061788
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 08:48:13 -0800 (PST)
Received: by mail-qv1-xf36.google.com with SMTP id w11so238718qvz.12
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 08:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TdLRypbeGjXXiOf7S/sdDE2hMXDyoqKgKIlnvFBt3YE=;
        b=ibVKF+7YV/3RbXMhmFqIVycw2nb99oWGcdTh0dsAfTdwRwHEAUkyshkEC8yl0a+juQ
         z4p3DCa7b2Fjm7cg+1ncCazCwInvIh0wwgsCk4R0Wpsde3DTG3g0IYhcMUkCZU3+Ufdv
         Hiz44Pb2fjhqJNVYUGeiVFgbpKh41MoTdsQfJFrxVoCyKbE5jAwwtg0jMzTRR2DNEsy3
         odTvfza5wT/BCiEIKRHJ+BrMQit2TW6sPZA1LjXYjHM+ReZcmGgLJAzKcj3yS5mHvLvx
         jCIU5THbVTeh3OgR6ufiKe2oj23kvcyVRqmpICPfTwYErc6QGkEiXQtOBjM1oyk17T/C
         UaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TdLRypbeGjXXiOf7S/sdDE2hMXDyoqKgKIlnvFBt3YE=;
        b=dGnj6i6VCysXEkt6sgI0Jv+qi8xePGUygRqvt4nB5UL5t9K0j1Ce9us9S2dQtnZk9O
         9ArBGDVqUy4u0YnEIqqmiT1j7ZVATqW7QZu2ex/A9ou+lkqxAoIigouq4XA+5H8g22+n
         64fVL4Wabyph/QAC2XX9/Kqf/lOr3z1LiHD1CxYLugQoGNHCszRWSoxHQvSoG3Ac99wV
         pISAuGCUP/u4cA2+ZaZXhI1DO6NpzdzZQvkvJnkhZZrdQFh95gGFGW4/ioYZkqJctDBZ
         EuPpLx5j041vR0e/LBMTFRcOcgcmKkpUmRVfOD6fx56J/Acev7CxKuj/OU011USyjrrn
         L4iA==
X-Gm-Message-State: AOAM531GXz1LokBsOlDSp9BefkVfiypkQGwoK4Qz/RNyKEoHpoth+Ydk
        R1REK4IuEsDgdyTIN687B7JggOVNkVq9eI7k22xeDQ==
X-Google-Smtp-Source: ABdhPJzL9oH1ubILGnrierFSlcwib2CFzLJFILelxX6HwwlG8wHV9L2fDQGAYTUpUHXWONqi/kzrivcT0YHgDlqBR1M=
X-Received: by 2002:a0c:8365:: with SMTP id j92mr3403716qva.19.1612370892250;
 Wed, 03 Feb 2021 08:48:12 -0800 (PST)
MIME-Version: 1.0
References: <202102032303.xnvdBAo2-lkp@intel.com> <CAGZ6i=2RTX3O9pLSt8xrnCmmKbVx26nnRN9h_Ci08dzmuJwJmQ@mail.gmail.com>
 <CANLzEktC3gL9vxsFOmQQ=0ymgPB+0AWQ+NL_tQVB3Jvr4B5LCw@mail.gmail.com>
In-Reply-To: <CANLzEktC3gL9vxsFOmQQ=0ymgPB+0AWQ+NL_tQVB3Jvr4B5LCw@mail.gmail.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Thu, 4 Feb 2021 00:47:56 +0800
Message-ID: <CAGZ6i=0vdPoFCCJrk0a-ZDk7KaaKzHkv+V65T3RUaAgjAi7ZAg@mail.gmail.com>
Subject: Re: [usb:usb-testing 155/155] drivers/platform/chrome/cros_ec_typec.c:778:8:
 error: 'CABLE_ATYPE' undeclared; did you mean
To:     Benson Leung <bleung@google.com>
Cc:     Prashant Malani <pmalani@google.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 4, 2021 at 12:40 AM Benson Leung <bleung@google.com> wrote:
>
> Hi Kyle,
>
> On Wed, Feb 3, 2021 at 7:39 AM Kyle Tso <kyletso@google.com> wrote:
> >
> > Hi Prashant and Benson,
> >
> > I just got this notification that my patch "usb: pd: Update VDO
> > definitions" caused this build break.
> > The root cause is that I removed the definitions of Type-A and Type-B
> > in Product Type VDOs as they have already been deprecated.
> > And it's my bad that I didn't notice that someone else uses these definitions...
> >
> > I can fix it by simply removing them in the switch case but I am not
> > sure whether they need to be kept for some reason (compatibility ?)
> > What do you think?
>
> Strictly speaking, Type-A and Type-B definitions here are deprecated
> in PD 3.0, but PD 3.0 implementations have to be able to fall back to
> PD 2.0 protocol when the port partner or cable is PD 2.0 only.
>
> In the last version of the PD 2.0 specification released, the Type-A
> and Type-B definitions still remain, so we can't really remove them
> from the Kernel until all of PD 2.0 is deprecated.
>
> They're very rare cables, but I have seen a PD 2.0 cable with an
> e-marker that indicates Type-B here.
>
> Hope this helps,
> Benson
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org

Thanks for the clarification! makes sense to me.
I will provide the fix as soon as possible.

thanks,
Kyle
