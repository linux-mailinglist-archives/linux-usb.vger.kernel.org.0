Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6FC76A223
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 22:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjGaUrh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 16:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjGaUrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 16:47:35 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8913190
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 13:47:34 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-55b1238cab4so3043403a12.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20221208.gappssmtp.com; s=20221208; t=1690836454; x=1691441254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+N8fz5Ir7ydSzUQZRlDElzwdQfHkofh81oEjm5J2eQ=;
        b=eflG+62yVwUvCdwpQDl6BccROGADuJt2YjF8NQj9CgfFzer7z/3uOiFZiHFxhlFwTs
         5N+fqNBM0JwUtAE+5Wi2QCfPPB/UM4L7gLp5syjJJK/toNxbprpyLI3SDzQlL6YM+vQd
         sfTTk18ak40xu2zLy2GmXOU7Q8wzI7t+iEgfWQiDLnVzqq8Gx8RT8fVEZaB0OCyE6+jk
         g44tk6EDu8hoMnGVT3WP+ZnNhErLqfGf2/iTy7q9hgkuJxOczeMsj793uL5dI+aLnJxh
         7gs2LY7GebrMyt0xDHFOcRDekvNWEOPJuqEyaw08sqDFAtZhFsDvHFaJl9WUTd1GdNiF
         1KOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690836454; x=1691441254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+N8fz5Ir7ydSzUQZRlDElzwdQfHkofh81oEjm5J2eQ=;
        b=E3lOg3AVFMoQkAUGY3SmcqN3U+Vb/E6Xw4oESSiU3eOYT9HnbLaA9OROAo6Qc4Z13+
         ZbbBYsZacL2dEa7/5bKnCCTu6NgAjLRmboquKqpEVCgDSjkgjShsVrI8azhDFIhlgL8c
         lkXy3xYJjbS3CA+hmiCAxVaduJuotkzfnV0GUKu9eXUJuIprX2TBhUz0+Gbuj3Cv2VG+
         WH9JwFDKU2iQHrbqzSuUr7ZGpf0A3+jP8dY42ZNMvkqQNTRNQ0JewmSZGNgIC1qI+aWS
         wzHRV9sUBcCTOUlb89Vh1eW0vKuTOMC/F1ubz5VtWqE30jjPvUgcuxFQIJUJgW96xzKq
         Fgtg==
X-Gm-Message-State: ABy/qLZEAAlFL7UWjI3YIe2jmOpq8AB61u1XPTPEKfvB6dg4XBrQqJw2
        1x4quwSWb0TFWEF1yO98ob0tFQ==
X-Google-Smtp-Source: APBJJlHNIHmtgxk3tUMdehvJxVZu5725AsYKc+b4qiEWYeeFatM/aSiinkWSrPjFpuNkg/0RG6kHOQ==
X-Received: by 2002:a17:90a:4508:b0:262:df1d:8e16 with SMTP id u8-20020a17090a450800b00262df1d8e16mr9880052pjg.33.1690836454026;
        Mon, 31 Jul 2023 13:47:34 -0700 (PDT)
Received: from hermes.local (204-195-127-207.wavecable.com. [204.195.127.207])
        by smtp.gmail.com with ESMTPSA id fz3-20020a17090b024300b00263cca08d95sm8181258pjb.55.2023.07.31.13.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 13:47:33 -0700 (PDT)
Date:   Mon, 31 Jul 2023 13:47:32 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Jakub Kicinski <kuba@kernel.org>, hayeswang@realtek.com,
        edumazet@google.com, LKML <linux-kernel@vger.kernel.org>,
        netdev@vger.kernel.org, davem@davemloft.net,
        linux-usb@vger.kernel.org, pabeni@redhat.com,
        Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: Error 'netif_napi_add_weight() called with weight 256'
Message-ID: <20230731134732.597cb2c0@hermes.local>
In-Reply-To: <673bc252-2b34-6ef9-1765-9c7cac1e8658@amd.com>
References: <0bfd445a-81f7-f702-08b0-bd5a72095e49@amd.com>
        <20230731111330.5211e637@kernel.org>
        <673bc252-2b34-6ef9-1765-9c7cac1e8658@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 31 Jul 2023 13:23:47 -0500
"Limonciello, Mario" <mario.limonciello@amd.com> wrote:

> On 7/31/2023 1:13 PM, Jakub Kicinski wrote:
> > On Mon, 31 Jul 2023 11:02:40 -0500 Limonciello, Mario wrote:  
> >> Hi,
> >>
> >> I noticed today with 6.5-rc4 and also on 6.1.42 that I'm getting an
> >> error from an r8152 based dongle (Framework ethernet expansion card).
> >>
> >> netif_napi_add_weight() called with weight 256
> >>
> >> It seems that this message is likely introduced by
> >> 8ded532cd1cbe ("r8152: switch to netif_napi_add_weight()")
> >>
> >> which if the card has support_2500full set will program the value to 256:
> >>
> >> 	netif_napi_add_weight(netdev, &tp->napi, r8152_poll,
> >> 			      tp->support_2500full ? 256 : 64);
> >>
> >> It's err level from
> >> 82dc3c63c692b ("net: introduce NAPI_POLL_WEIGHT")
> >>
> >> Why is this considered an error but the driver uses the bigger value?
> >> Should it be downgraded to a warning?  
> > 
> > Could you double check that the warning wasn't there before? The code
> > added by commit 195aae321c82 ("r8152: support new chips") in 5.13 looks
> > very much equivalent.  
> 
> Yeah; looking through the history I agree it was probably was there from 
> the beginning of being introduced.
> 
> 6.1 is the earliest kernel that is usable with this laptop (for other 
> reasons).
> 
> > The custom weight is probably due to a misunderstanding. We have 200G
> > adapters using the standard weight of 64, IDK why 2.5G adapter would
> > need anything special.  
> 
> Perhaps Hayes Wang can comment on this (as the author of 195aae321c82).
> 

Large NAPI weights mean that one busy device (DOS attack) can starve the
system. Really doubt that > 64 makes any visible difference in throughput.
