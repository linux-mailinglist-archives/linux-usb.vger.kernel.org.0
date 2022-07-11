Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C819570854
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jul 2022 18:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbiGKQ2t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jul 2022 12:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiGKQ2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jul 2022 12:28:46 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E01BE3F
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 09:28:43 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id r6so6911996edd.7
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZMmtVpPiwASBZ5ENHcu9qdCA56EEAIZ9X2ai07zSNO8=;
        b=FhzyZZ/X0td3uXrVpkUrteQnmPw9RajyY9btUHHZVvCoavEZMXbVGoXdWPMA9i/F8v
         XFbdRDHAFBXVEJ/rIf55jlMTy/PAkPgmA7MMEr4AWgo+7+Y3ifG1sTcyvsjOevcatNht
         /CRkMiQEp8SIP1X7zRFUsIXX3pDWosMEyS6HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMmtVpPiwASBZ5ENHcu9qdCA56EEAIZ9X2ai07zSNO8=;
        b=plxa0sTTdffkvCloDvjnGbOFPmJsAPIWbEtlO12OCfaSizbca3NAAxz9PASAv/Gm+o
         eyD76CQLNftfXOvZ1UutGQ2eT1K61R43f0/LS3EcfH7q/ZJd2yTa1j3c9aafciNdXSi0
         NWl1WrvPzfnEmuUEWw03DQIcEqMXmZ8Wxi68NKos56v1RvnS5Vyp1tJLvpcFiKgEHp7k
         7d2ClSM0d9dBzJxGM+HBUupnFY850ibfhOQTop229AVf0YEh3tv68bJO5vb55sl19YHw
         eikBQquWj5IKis0VCWTTwC+VTLo/iPp0KvZq97msi5gzdO1NEnjvStLZunmrDrdYnhQu
         395w==
X-Gm-Message-State: AJIora/9Iq7eBzEFm18BcM3W4BuHbLAv+aatKlvOQ/2w7MpPyUux7ttG
        siwp3fLSOItxgXnONYIXAc8jBRupay0eUdlJcpo=
X-Google-Smtp-Source: AGRyM1vRsFol7C3iY9LAVRJYjmU90p/GdSKgGu7LvSNQw8K1cjIAOijPzdpdlXWHLi4mCqZ5PSRG8A==
X-Received: by 2002:a05:6402:4446:b0:43a:3f52:4172 with SMTP id o6-20020a056402444600b0043a3f524172mr25148758edb.417.1657556921711;
        Mon, 11 Jul 2022 09:28:41 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id o2-20020aa7dd42000000b0043ad162b5e3sm2446625edw.18.2022.07.11.09.28.41
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 09:28:41 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id ay25so3342161wmb.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 09:28:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr16753502wms.57.1657556920698; Mon, 11
 Jul 2022 09:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092431.1.I4016c759fd7fe2b32dd482994a20661f36e2cae3@changeid>
In-Reply-To: <20220711092431.1.I4016c759fd7fe2b32dd482994a20661f36e2cae3@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 09:28:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4Eb9Be=CoJ3nY6__QXp6eLMU2uJirW1HpUcDMYwESeQ@mail.gmail.com>
Message-ID: <CAD=FV=X4Eb9Be=CoJ3nY6__QXp6eLMU2uJirW1HpUcDMYwESeQ@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: onboard_hub: Fix 'missing prototype' warning
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Jul 11, 2022 at 9:25 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> When building with 'W=1' the compiler complains about missing
> prototypes for onboard_hub_create/destroy_pdevs(). Include the
> header with the prototypes to fix this.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  drivers/usb/misc/onboard_usb_hub_pdevs.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
