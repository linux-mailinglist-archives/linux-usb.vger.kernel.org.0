Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDE4411639
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhITOEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhITOEw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Sep 2021 10:04:52 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF90BC061574
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 07:03:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i4so68716241lfv.4
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=792l7i7MCvFeen36Ul574egfBrWbg1murrDWMYOu9iY=;
        b=goDZoBpLi/H3zyaIfHy67972thXG3XlhJQHwIG89EawWuLlQ33ylfj5xUSxwoe1GIs
         FH+R8Ef2Ouru2WhX9hYfz/R4hgaO4WQn0YYdS2f02hLIb5wg3qDB1VrdkPndzaCm+voN
         PweBonKzUwADJV7hwPUTfv4szk6U3EE1IHLwkze3ldaQ4raXpXxjoo7+PuVMjjkTFTHm
         V4bFBubVsEi5bvahEJbMpxSpNhv1nusKoJsb/+QesFuCxpDgug7O0KyBRUrEGzKfT89R
         QFzaQzt//wTvFy06JkbzeqzTsrJc8jqzgkgVnBfx3101p/LfDeZRJTnMGSm4p2pmOO5u
         pdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=792l7i7MCvFeen36Ul574egfBrWbg1murrDWMYOu9iY=;
        b=KQW3lRwNV67cMqYGjwcGS35aEO36z88xGv1QP+HF4iaUd4KDS+UNih7di3+52zx9M3
         flzHpN4AGr1byeixbaep2md9dY8eKDMaISuaddFa7FPfR8f4bZhO8ANo5hUlimfx3cPX
         JX2i5Iub40uyY0S8JBUEbcjLmpY6/SVgUDlYCqc83KtnBUlECB2UqryZwud26wIi4uhg
         IogCtNkgRDM3k3P4J10Nc3LuAA3YBGfaqAcTR9F2pT9Kl+9nbcP3z5n4EVk370Kjo/pJ
         VY+8ckYubOzNMTtlOCB6/nHcFvk9KMyjZMGI508mPk7mIINAlS26Z2qiKwLRH8xyXHdt
         gfpA==
X-Gm-Message-State: AOAM532Q44XGUKQdcdgHvFrwC2nxg5Q7KYB1CTnJ9H4KJiojDwD4V9mC
        lMLB1O0jyK8ot9LkRGdxVCcAA58U6dXTRDztopE=
X-Google-Smtp-Source: ABdhPJxjymaqKuO0NBeC5qDZ8dVqomFC9GmCxiu/wR96v/MMDx8NmI5Ye/6ARciU58usy+KzDsLgD41Pb2ErDYg9yrI=
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr22952282ljc.382.1632146557772;
 Mon, 20 Sep 2021 07:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210920115810.4144231-1-festevam@gmail.com> <bc20f179-6549-c450-07b5-045c112770f3@denx.de>
In-Reply-To: <bc20f179-6549-c450-07b5-045c112770f3@denx.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 20 Sep 2021 11:02:26 -0300
Message-ID: <CAOMZO5AFm7C6mwEmmCJwGb3xFJ73_tLi9V+y2YG2OUNO5dDPWw@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle
To:     Marek Vasut <marex@denx.de>
Cc:     peter.chen@kernel.org, Shawn Guo <shawnguo@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marek,

On Mon, Sep 20, 2021 at 10:38 AM Marek Vasut <marex@denx.de> wrote:

> Shouldn't this really fix some older commit, since this fixes NULL
> pointer dereference in the driver which got exposed by passing in a
> valid DT ?

You are right. The recommendation to use 'phys' is much older and it comes
from 9d062b9b4168 ("dt-bindings: Consolidate ChipIdea USB ci13xxx bindings").

Peter, what commit do you think is appropriate for the Fixes tag in this case?
