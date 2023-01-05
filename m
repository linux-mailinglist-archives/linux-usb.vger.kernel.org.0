Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB0BF65E2E2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 03:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjAECSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 21:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjAECSi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 21:18:38 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A1404437F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 18:18:37 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id c9so19450259pfj.5
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 18:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LRi5ciT2lOj8Kmhm19FdRtAz55fIUieom6sc77nOMcg=;
        b=IspnQgWnlDIzsNurt/MxWjm886yo44f3g8fUFETiWAU6mmj92UcntSXvX8QNHiJSHI
         NgaYk5W7+Zuh17d81T6R7sMpVkG5EenM5Arh6f2MP/PDa53rq3cU8Prs8SWXwc7dsdC9
         dHvvNTBGY5hVpBUWjjWCzBL8qQ3eLdkry79kPSxuuFanTJaSSmdhxI6tC+XI3cl4MApy
         Y8zLTA+awXRUybQb7MU7Xg8gSP+dkOSkdL3R9hDbOTeuowwM4XksZTsYMbbqhiqgm7Pv
         yVUQclR/yaULMhZw57VEMdapeRrKRTeWzEFB1TJrlwqCEBHaF9Y5ZhIp9dCBXvF40wRu
         SgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRi5ciT2lOj8Kmhm19FdRtAz55fIUieom6sc77nOMcg=;
        b=rFW0pKSvGlsDQoRc9wh84P5ajXnGNZx2HCqd90jg/MFoYPOpLPDrwJ3TKEnNIZuRSo
         LOknwuFR09qzXNZ6kgDHMNN4yvkFeTD78MeGtkXTEmW7Zmg3e/+o/6XvEjo1faa/TrSS
         EUn67PIAm7iOmYN6vGtRjxKswPayBhRWspHVbjJnagVfJZDLQ94bR8oabupKuumsmv+V
         I93z3g7AI51Z5bubo1MbNcNsilAOJ7E2ncjCFbJlyTVsw94cD2PHEvdrGkRwEKAvZYfW
         4TYJihymReMjU9DKxsaywU02JxjMbgv3Nsp6djk+FT06vDSaoKnrpu4aCJmEGf6ZhF3r
         bjRg==
X-Gm-Message-State: AFqh2kpbIsPSFRH+lqYnbiFCbBglck+d7KV15wFwqcPn6xDRvkRI4/Kw
        HW2Tf+c2KAmRevaVqu87cgaRuWitnCyBPsR2SAE=
X-Google-Smtp-Source: AMrXdXt9GfP8m+N0wj7nwgZMms0umbEcmFGITiZNgso8xLTcglJLZ6yBDDrzpHu3vl+3z4l+N6GeoAEzdTnhfrIymfc=
X-Received: by 2002:a05:6a00:1623:b0:580:1260:4e41 with SMTP id
 e3-20020a056a00162300b0058012604e41mr3754905pfc.72.1672885116452; Wed, 04 Jan
 2023 18:18:36 -0800 (PST)
MIME-Version: 1.0
References: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
In-Reply-To: <Y1vLpaxpc5WBCuGD@francesco-nb.int.toradex.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 4 Jan 2023 23:18:25 -0300
Message-ID: <CAOMZO5DXeL9yFBtK2Tu1Q7Si-UxhRwtxfN5gxr0kTb-AfcUFPA@mail.gmail.com>
Subject: Re: USB runtime PM issues on i.MX6ULL
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        Li Jun <jun.li@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Felipe Balbi <balbi@kernel.org>, philippe.schenker@toradex.com,
        francesco.dolcini@toradex.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 28, 2022 at 9:31 AM Francesco Dolcini <francesco@dolcini.it> wrote:

>  static const struct ci_hdrc_imx_platform_flag imx6ul_usb_data = {
> -       .flags = CI_HDRC_SUPPORTS_RUNTIME_PM |
> +       .flags =

Not sure if this is related to a problem I was having on imx7d.

I was also disabling runtime pm as you showed above to workaround a
USB modem detection problem.

Li Jun suggested I check for the over-current polarity description of
the devicetree.

Passing 'disable-over-current' or ''over-current-active-low' made the
issue go away.
