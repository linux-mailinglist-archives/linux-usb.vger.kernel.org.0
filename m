Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C659651383
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 20:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232302AbiLSTz4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 14:55:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbiLSTzu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 14:55:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D641765A9
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 11:55:48 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id q128so9772735vsa.13
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 11:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KMPbr/YqIXmXwH4UmLhkRJRaeSJKDsuAYf/cvCUotS0=;
        b=JpMeMxjvXxZF5MEHqZayj5kCkPsZw/v9lr0jnSiFzpXYQ8kVg8iUdarQ0ZwCC3eid2
         5NbdCGtZK/moRBdE/R16LNGoegKeWtD/FyfaJZkjNMa5qOfteNHoPl4oFZVNho09xf9Z
         3OR33V9DPWN8q/CxdrR5lPNHhqAVBfBbz/Df2pAvm3QdXyaAo7YqVXfOCjTHcuLJTVna
         r7MjQWa6GNmtFg/SeWc+HFM+d8YiEChdCE0yEBP3zxjoRl3DQclE9dm7CVpNUeTi3vpK
         rhbZ5MUJv2aanF5paAGM6VEvr3aEY0hKnnrBdvojifmah98JYDzAtmhzshMNQXWE66Di
         iSMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMPbr/YqIXmXwH4UmLhkRJRaeSJKDsuAYf/cvCUotS0=;
        b=G26Bdx9ctBFfccucwzFzp/BfR5AEC9xdsp2RAbk9ylx1JS5+irlJuLVLFbxDsJUVic
         gybLk0mFPIjZX7iD24TpBjtmXuePUKEySocWmV78TmRJ+qe6x7YfjR2viOQybVoNfhHv
         DMsLvzatzwwZq+RkiVH39N4tKIHOQcOiZO2UMjiD/oGlmEwsegHDpPTxF9HaTdgG1C7M
         fWeg4ckPC/3ozON5BwGZug1Xae6jeU/LWSATwxchG5Nr8YAGxfOhR3a1GLiQahGO/QaW
         rpu2gO12cgO1VG2nh/RddTZCxd6HggeIjxsV+v+hGwevqvgNncwEetuK8zohhphd1ulj
         dkzQ==
X-Gm-Message-State: AFqh2ko76y4P4LqGHJNZ1e8NzQK/I4boZIOPT7hqkUW3VtqH+jpxUSRR
        UYjqBX5WUUhoetYnAEWnN6nAhYtBs+6Nu84yTXlnww==
X-Google-Smtp-Source: AMrXdXuk31U8gOC1dwtmajZncAh/L7BZwuM0SGNgvvkcZrF/5iJujZch9A45gqAV66xPjI+D9fyJBSlAzehmHEo/6OU=
X-Received: by 2002:a67:ffd5:0:b0:3bc:441f:a808 with SMTP id
 w21-20020a67ffd5000000b003bc441fa808mr940637vsq.36.1671479747842; Mon, 19 Dec
 2022 11:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20221216221703.294683-1-allenwebb@google.com> <20221219191855.2010466-1-allenwebb@google.com>
 <20221219191855.2010466-2-allenwebb@google.com> <Y6C51KVSviGrLmsb@kroah.com>
In-Reply-To: <Y6C51KVSviGrLmsb@kroah.com>
From:   Allen Webb <allenwebb@google.com>
Date:   Mon, 19 Dec 2022 13:55:36 -0600
Message-ID: <CAJzde04Cyw+GswLE0-uKNOXEHe9FH34zmR248MDXE=SB6DgN6g@mail.gmail.com>
Subject: Re: [PATCH v8 1/9] imx: Fix typo
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 19, 2022 at 1:22 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 19, 2022 at 01:18:47PM -0600, Allen Webb wrote:
> > A one character difference in the name supplied to MODULE_DEVICE_TABLE
> > breaks a future patch set, so fix the typo.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Allen Webb <allenwebb@google.com>
> > ---
> >  drivers/soc/imx/imx8mp-blk-ctrl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/soc/imx/imx8mp-blk-ctrl.c b/drivers/soc/imx/imx8mp-blk-ctrl.c
> > index 0e3b6ba22f943..344a0a71df14a 100644
> > --- a/drivers/soc/imx/imx8mp-blk-ctrl.c
> > +++ b/drivers/soc/imx/imx8mp-blk-ctrl.c
> > @@ -743,7 +743,7 @@ static const struct of_device_id imx8mp_blk_ctrl_of_match[] = {
> >               /* Sentinel */
> >       }
> >  };
> > -MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
> > +MODULE_DEVICE_TABLE(of, imx8mp_blk_ctrl_of_match);
>
> What commit id does this fix?  Shouldn't this be also cc: stable to
> resolve this issue for older kernels as obviousl the module device table
> for auto-loading is not correct?

I have included Cc stable and Fixes: for the three patches that were
obvious typos and will upload a follow-up series shortly. It is
unlikely these drivers were being built as modules because the build
would have been broken for that configuration.

This seems to be the most recent case so it is the most likely to make
a difference, but I would imagine SOC drivers might not be loadable in
practice if they are needed to bootstrap the system to a point that
loadable modules can be accessed.

>
> thanks,
>
> greg k-h
