Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46544C973A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 21:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236280AbiCAUpL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 15:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbiCAUpL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 15:45:11 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D74B55489
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 12:44:29 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id gb39so33936511ejc.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Mar 2022 12:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
        b=F+7BPGYsO9QeRc6BTbvPUJxguXCTYika7fzNVLbSEfMjTVK29FjvhOtCtbBO2oalkB
         9cweHARFFeQAeiDWhTrtcdfTzbCEOfTOrVCN9rTTV3Ek5jpvIVUt3aua8OA61CgDhA1w
         zQABsshAfnGl6gFdFI9HcnnKU8AOre3uWnEew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rAZcpGOFnijhfBt719P+IqprCBqe8sD9TF0Sez9IwiQ=;
        b=m+/0m+IHVBj17x9BAT/lhKiYQsaoJmloiY+HRKUXAk8RvA1b4TAefdUrSOiI6dVHUu
         hOKSRDi31hM23fezgUrPAPGxoc5RzCIvzdaoHg1nEqYTzx9WQMR9ivCVgvYzrdBw+iaY
         rmWPlD2LQ7+8IAV0p2+/Rb91uPDPHjMNekSdN4+jHwJTI0V7PeIIkYxMmMdbFziRD3/y
         XRB6zCLF0GSDj40/HNIAnSAb6EYzF54AK6ibZPScBhx5ZcF/rxdoq6hqAWAH+eAj650w
         OMY1NZk381LZvawtMwgX/IVDFsBhOWRx5wKb2pIz/4qRryjegNdRz9VNUEm4GJh27sd8
         EyLw==
X-Gm-Message-State: AOAM530O7EJRzW9HlvSb2wTVLYaJvoEH8Z6ty3mClHA6zSsEEvcTGE6q
        t/ZKryL04+J1v6tSmAcdNRIPpnkomiUyb4eauSQ=
X-Google-Smtp-Source: ABdhPJwYybTisBi8gEVIMo0QBgrJ8aVBp6/LcslVrIa1SAxOnmMrx4CJfnvDnqkFSSkdb+WyRO6tDA==
X-Received: by 2002:a17:906:2ad5:b0:6cf:9cca:d9db with SMTP id m21-20020a1709062ad500b006cf9ccad9dbmr20067167eje.252.1646167467662;
        Tue, 01 Mar 2022 12:44:27 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id e5-20020a170906374500b006d5825520a7sm5664438ejc.71.2022.03.01.12.44.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 12:44:27 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id t11so1377078wrm.5
        for <linux-usb@vger.kernel.org>; Tue, 01 Mar 2022 12:44:27 -0800 (PST)
X-Received: by 2002:ac2:44a4:0:b0:445:8fc5:a12a with SMTP id
 c4-20020ac244a4000000b004458fc5a12amr10608648lfm.27.1646166980002; Tue, 01
 Mar 2022 12:36:20 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com> <20220228110822.491923-7-jakobkoschel@gmail.com>
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 1 Mar 2022 12:36:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Message-ID: <CAHk-=wgLtKofBbn9kSXRU3MpdX7S2OxN1V5Mc679oJpFnp_VnQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] treewide: remove check of list iterator against head
 past the loop body
To:     Jakob Koschel <jakobkoschel@gmail.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergman <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Mike Rapoport <rppt@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-sgx@vger.kernel.org, drbd-dev@lists.linbit.com,
        linux-block <linux-block@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        dma <dmaengine@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        nouveau@lists.freedesktop.org,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        intel-wired-lan@lists.osuosl.org, Netdev <netdev@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, KVM list <kvm@vger.kernel.org>,
        CIFS <linux-cifs@vger.kernel.org>,
        samba-technical@lists.samba.org,
        Linux F2FS Dev Mailing List 
        <linux-f2fs-devel@lists.sourceforge.net>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        kgdb-bugreport@lists.sourceforge.net,
        v9fs-developer@lists.sourceforge.net,
        tipc-discussion@lists.sourceforge.net, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So looking at this patch, I really reacted to the fact that quite
often the "use outside the loop" case is all kinds of just plain
unnecessary, but _used_ to be a convenience feature.

I'll just quote the first chunk in it's entirely as an example - not
because I think this chunk is particularly important, but because it's
a good example:

On Mon, Feb 28, 2022 at 3:09 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> diff --git a/arch/arm/mach-mmp/sram.c b/arch/arm/mach-mmp/sram.c
> index 6794e2db1ad5..fc47c107059b 100644
> --- a/arch/arm/mach-mmp/sram.c
> +++ b/arch/arm/mach-mmp/sram.c
> @@ -39,19 +39,22 @@ static LIST_HEAD(sram_bank_list);
>  struct gen_pool *sram_get_gpool(char *pool_name)
>  {
>         struct sram_bank_info *info = NULL;
> +       struct sram_bank_info *tmp;
>
>         if (!pool_name)
>                 return NULL;
>
>         mutex_lock(&sram_lock);
>
> -       list_for_each_entry(info, &sram_bank_list, node)
> -               if (!strcmp(pool_name, info->pool_name))
> +       list_for_each_entry(tmp, &sram_bank_list, node)
> +               if (!strcmp(pool_name, tmp->pool_name)) {
> +                       info = tmp;
>                         break;
> +               }
>
>         mutex_unlock(&sram_lock);
>
> -       if (&info->node == &sram_bank_list)
> +       if (!info)
>                 return NULL;
>
>         return info->gpool;

I realize this was probably at least auto-generated with coccinelle,
but maybe that script could be taught to do avoid the "use after loop"
by simply moving the code _into_ the loop.

IOW, this all would be cleaner and clear written as

        if (!pool_name)
                return NULL;

        mutex_lock(&sram_lock);
        list_for_each_entry(info, &sram_bank_list, node) {
                if (!strcmp(pool_name, info->pool_name)) {
                        mutex_unlock(&sram_lock);
                        return info;
                }
        }
        mutex_unlock(&sram_lock);
        return NULL;

Ta-daa - no use outside the loop, no need for new variables, just a
simple "just do it inside the loop". Yes, we end up having that lock
thing twice, but it looks worth it from a "make the code obvious"
standpoint.

Would it be even cleaner if the locking was done in the caller, and
the loop was some simple helper function? It probably would. But that
would require a bit more smarts than probably a simple coccinelle
script would do.

                Linus
