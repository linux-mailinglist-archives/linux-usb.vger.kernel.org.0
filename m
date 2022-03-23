Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7215A4E5444
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 15:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244287AbiCWOcm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 10:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237222AbiCWOcl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 10:32:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5CC7A9AE
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 07:31:07 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id qx21so3168371ejb.13
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FiqNhl/cI6wxGkLb9mBZPXXy7xwymO3zqp/WgxUHXUI=;
        b=a5D/FC4KmyFXSpkmdd1sTXSjEHekxQNVKadxhzOXj+hHwRSrg2h+vowP4B0S7FumiU
         uWrWRF7pylwGxodIO85iyi6P+gshxkOlR1qNhxl26IIsvcCYfiO/7YDF48fcaKX6v2ic
         qcLgfoogdgP78uaC9hTrNsOSPMDW4bL7Us4UyftSoYC1gvkH7xuC7ESaMHWypZrS9wYP
         nUHfCZb/NSHBbx1UCIzsjITS8UOBXgtYOLsSLWnwpoCz5ICRy8Js6qwwzmcJ9NJjzHIS
         GzTwJATBfnl2VxKEra7WUB+2TbCAuTFO1zGdJUhkYrtHFfNOIbZVqhYXZ8Z+z5nXliK0
         SP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FiqNhl/cI6wxGkLb9mBZPXXy7xwymO3zqp/WgxUHXUI=;
        b=qlVHMEa2F26D7AcAautt6449evzPqhBBPjdyIk4oJFJIt7NNDp9H/WwXF3yiic4eMh
         jNxMSMR1O/PUZf1Ie9rFmyiwYpH9vg2x3oNMg8MVhMaxtqY4A/nnXlsiJOcGlIPr9tId
         qa635whVGMyFM1JtKpxTJjNF8OOxScuX4avc0HTZ6jnUMG2RVBV2e3DRMuRf9Cr+hxqc
         ZO8i4Bab2y6C62vaRYQ7QuXz/K1e6EuXSnobHqf5kF9kqjjRG4+0zZSEo9xajdvImPhW
         n+IXQoiGvyHkMesQd4kStOYOrUhrX/9uPRzHvRVMOu5hK7CrXm/6WtJ9FQ5EGSq3Ubm9
         V8Nw==
X-Gm-Message-State: AOAM5308aL3Wm+ZiysrLG44MnWHDYQHUuYgvRyA5AMhNP+CcepsJmQem
        I0xvt/2OTKZwueq3SkO4vNXSRc1pYTj9svVjBwgP1g==
X-Google-Smtp-Source: ABdhPJy1TIxmXzRn8TzJosm68MZqp3sSSwaNsLtM+mQ429elw5eHsHlHcEP7KzVHxyENGWkFIPzISdjoV99gVJsqu/o=
X-Received: by 2002:a17:906:3014:b0:6da:f381:4dfe with SMTP id
 20-20020a170906301400b006daf3814dfemr230517ejz.670.1648045865895; Wed, 23 Mar
 2022 07:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220323101818.3503-1-rajat.khandelwal@intel.com> <CO1PR11MB48357FE72D34818360D2105E96189@CO1PR11MB4835.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB48357FE72D34818360D2105E96189@CO1PR11MB4835.namprd11.prod.outlook.com>
From:   Benson Leung <bleung@google.com>
Date:   Wed, 23 Mar 2022 07:30:54 -0700
Message-ID: <CANLzEkvGHCwsOu_KfFgDkkYypvW-QQ-_egcVycrSo2WfaToamQ@mail.gmail.com>
Subject: Re: [PATCH] USB4/TBT device routers should wake up during S0ix when
 something gets connected/disconnected or a DP monitor gets plugged in
To:     "Khandelwal, Rajat" <rajat.khandelwal@intel.com>
Cc:     "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "Malani, Prashant" <pmalani@google.com>,
        "jthies@google.com" <jthies@google.com>,
        "Rao, Abhijeet" <abhijeet.rao@intel.com>,
        "Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Westerberg, Mika" <mika.westerberg@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rajat,

On Wed, Mar 23, 2022 at 3:26 AM Khandelwal, Rajat
<rajat.khandelwal@intel.com> wrote:
>
> +Mika
> @Malani, Prashant @bleung@google.com This is the patch which fixes the pa=
rtner issue. Kindly escalate your thoughts.
>
> Thanks
> Rajat
>
> -----Original Message-----
> From: Khandelwal, Rajat <rajat.khandelwal@intel.com>
> Sent: Wednesday, March 23, 2022 3:48 PM
> To: mika.westerberg@linux.intel.com
> Cc: Khandelwal, Rajat <rajat.khandelwal@intel.com>; bleung@google.com; jt=
hies@google.com; Malani, Prashant <pmalani@google.com>; Rao, Abhijeet <abhi=
jeet.rao@intel.com>; Regupathy, Rajaram <rajaram.regupathy@intel.com>; linu=
x-usb@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] USB4/TBT device routers should wake up during S0ix when =
something gets connected/disconnected or a DP monitor gets plugged in
>
> Device routers don't wake up during S0ix when something is plugged in/out=
 or if a DP monitor gets connected. This causes the linux device to not wak=
e up during S0ix cycling as the host router didn't wake up because the devi=
ce router didn't. This patch adds a new functionality to linux.
>
> Signed-off-by: Rajat-Khandelwal <rajat.khandelwal@intel.com>
> ---
>  drivers/thunderbolt/switch.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c =
index d026e305fe5d..4f8056724aa4 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -3067,13 +3067,11 @@ void tb_switch_suspend(struct tb_switch *sw, bool=
 runtime)
>                         tb_switch_suspend(port->remote->sw, runtime);
>         }
>
> -       if (runtime) {
> +       if (runtime || device_may_wakeup(&sw->dev)) {
>                 /* Trigger wake when something is plugged in/out */
>                 flags |=3D TB_WAKE_ON_CONNECT | TB_WAKE_ON_DISCONNECT;
>                 flags |=3D TB_WAKE_ON_USB4;
>                 flags |=3D TB_WAKE_ON_USB3 | TB_WAKE_ON_PCIE | TB_WAKE_ON=
_DP;
> -       } else if (device_may_wakeup(&sw->dev)) {
> -               flags |=3D TB_WAKE_ON_USB4 | TB_WAKE_ON_USB3 | TB_WAKE_ON=
_PCIE;
>         }
>
>         tb_switch_set_wake(sw, flags);
> --
> 2.17.1
>


Can you please help double check your email configuration for sending
patches and responses to the mailing list?
I've checked the linux-usb mailing list archives and they don't
capture your original patch email or your forward.
https://marc.info/?l=3Dlinux-usb&r=3D1&b=3D202203&w=3D2

I did find Mika's response to your forward, though.

Let's get this figured out so that folks can have an easier time
applying your patches for evaluation with b4 or
similar tools.

Thanks,

Benson

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
