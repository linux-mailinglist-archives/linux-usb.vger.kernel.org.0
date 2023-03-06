Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A006AC487
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 16:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjCFPMk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 10:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjCFPMi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 10:12:38 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9622922A26
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 07:12:36 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id r27so13156007lfe.10
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678115555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMeQPhrgL/6R9Z4ZdWsGt9gB9l2W7KYsllfIptwu9o0=;
        b=oPm7YZqA0wTAKcL20Jbyp3pZHnLlTZ4xgTmiUlE0sC1ruCfpWwasFfNzzj+qEk8qtU
         DA0FNKIK6AW1ud31JWqnmVNGIQ2jWvZEieAw6bFMww2pCwqaoXSx3iPQdRK4+a9jDkRg
         GW8Skmaz10UBvUmdSfNDiDPnG7wD9+kslmvIQKWPxdrqvAdPrwDhWqU7MV1iiIuIHya9
         tZM3iGhs/+fuMGidZE1s0KJeP07dsE0hSkwQc0k2tnVf5kZkjtDK7AoQNR3FRmuCm6gM
         J8vOyDy0V/Zc7Am26lFYLq9e46vv4E9DosWeHfCnP4xZ+6iC/wTszBWLYIBwmhh2G4MB
         OaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678115555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMeQPhrgL/6R9Z4ZdWsGt9gB9l2W7KYsllfIptwu9o0=;
        b=QuJIZm3zsfImTU/H+Jt+d6ualbmVKYeQhu8xsr0/DmTaX5EHij+Ail+bkdgCTNs8Ls
         eET+LFd09D8f13GAxlWq2XAth2jPuZc9FomTQfE5yMMu0WZNdDzWLPOHshmHVFqiiRuB
         Dd76GmlXGIBCk+PrtqxBc51/fml4i+KLH4iwm4ByH5igQu1mh4pjctafq2AyaMFNYi16
         UUc8k3O5JIb+h31hjYVQWYgXnhCH0cCLrgWeY9q1KDgcPZJgPPKGFOCQO9umwOLw+rwq
         vrfgjTtZg0D4d6jKewbEGJkf97xR6KQXLjTrXl/WbV0PZgVSA6i2vfzjDaDEoz801a9R
         tdaA==
X-Gm-Message-State: AO0yUKV5babHAON2aPr5Ht8PupFiOitEHHvCWwRv/lUNOQmrJVhnBFb1
        ZcoOl1CrdB9pfhbh5Y10ZJXdKc8UMn6+zsScxFI=
X-Google-Smtp-Source: AK7set8IB1O9uI75qpIbP3c3N6GV8JphdyHgpHwzhHOdLAFBHg7zUQKcGd9SMsh1exy2WQzQmfvT7G30bKWPc53XTVg=
X-Received: by 2002:ac2:5313:0:b0:4d8:5810:1ffa with SMTP id
 c19-20020ac25313000000b004d858101ffamr3223376lfh.11.1678115554697; Mon, 06
 Mar 2023 07:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com> <20230306113605.46137-6-mika.westerberg@linux.intel.com>
In-Reply-To: <20230306113605.46137-6-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Mon, 6 Mar 2023 17:12:18 +0200
Message-ID: <CA+CmpXuzAGD0r4Dtky+_p9yehO=QyHmZY=8ZmosHP1eVaAToZw@mail.gmail.com>
Subject: Re: [PATCH 5/5] thunderbolt: Use scale field when allocating USB3 bandwidth
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        =?UTF-8?Q?Christian_Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 6, 2023 at 1:35=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> When tunneling aggregated USB3 (20 Gb/s) the bandwidth values that are
> programmed to the ADP_USB3_CS_2 go higher than 4096 and that does not
> fit anymmore to the 12-bit field. Fix this by scaling the value using
typo: anymore
