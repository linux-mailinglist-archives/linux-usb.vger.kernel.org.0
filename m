Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAB596AC674
	for <lists+linux-usb@lfdr.de>; Mon,  6 Mar 2023 17:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjCFQBO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 11:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjCFQA4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 11:00:56 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C09322E826
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 08:00:51 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id bm20so7391798oib.7
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678118451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w5BS2JYz2kZQkEeuywTfHp8NdeDU1CPaV3Ohjlv1m8=;
        b=jO/l6gl5WIN4qll5tf9EjB45mGMXbF463tOH89tGjxuVT8rN5LVChRIjnmUBkSumvb
         RrtRzOV6kjh0MXFsdfmH50kurJ2Kcfvf1d3cks8Za+NkHteZ12/b2yR3MKI7CfcrUCl9
         bnwq92HMES5s2kKG8McF6/oLzlevGX92itc6m/D8Xvra2G+xropwYFBKv8mCN1sOb4Sf
         pG/q58DLxiSS2Sa+srZHTss/oXTz/lTXOOk3ND8by2e6or+fU5VysnvlAJNhem4h9VyM
         G0FWxbT6tbW78cV7yRfcn6dpxqNtlqPzzw0Nmh7dIx83u2oB3gbgunF3xtEjMhgZm+cZ
         gCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w5BS2JYz2kZQkEeuywTfHp8NdeDU1CPaV3Ohjlv1m8=;
        b=l/EKOMMOlJkO3sdOKApJVi6uZQiAFSRtpTDsqYtZT5w72r39h8mgfSpFcQ9xZdY7nZ
         fqOjn3dRnXxO5oXNKDA0K1iOn/wFsj7/ix2ot1aBUmPPLCa2WbHcjTtfuoIfbSC5EB+p
         v7thLt6az6IgiYOJjzzGzH6NzHqpceU4DPbfpqAgCdmuFG376Z+bldp8VIcL9dE6sJD2
         BRjGRraJWIo1QECnVqTUlaY5pCLUiz1Tv5k9NZkcmfVSE9tvTnC/EZc1RAuOZVPhCieX
         csNyyaFzaJSsmcZITm0WC3os4P/yyLTgpbFyzRynTLOyvDGxWbOgpS9CXdVpud0oQ65n
         G3Gw==
X-Gm-Message-State: AO0yUKVqeElAn7FU58CljwCdufqs8BZ+Ig3CDxqJb0W66bvDL4zs4QLo
        I/HONYaM4KJhtzKZ3HVc1Ow4ME97Cn/h3ScOpDKyrg==
X-Google-Smtp-Source: AK7set/8Jpy/ZNN0pALMDvlhUPzgIohhx0Xl1N5UUOt7NLlnLvVlmpPrWQ1oiOW7cEbO8NieW/hXh1TkDnHVteaOCRs=
X-Received: by 2002:a54:4612:0:b0:383:fad3:d19 with SMTP id
 p18-20020a544612000000b00383fad30d19mr3566227oip.9.1678118450998; Mon, 06 Mar
 2023 08:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20221124074725.74325-1-haozhe.chang@mediatek.com>
 <CAMZdPi9JOQpmhQepBMeG5jzncP8t5mp68O2nfSOFUUZ9e_fDsQ@mail.gmail.com>
 <54c37c8f8eb7f35e4bb983b9104bd232758bae7b.camel@mediatek.com>
 <CAMZdPi8NOfMn99yy043oYGrO1=UrnhhRvpZq-zWe4BfiU_08NA@mail.gmail.com> <PSAPR03MB5653D7BAA0E5DDB2D03B341BF7B39@PSAPR03MB5653.apcprd03.prod.outlook.com>
In-Reply-To: <PSAPR03MB5653D7BAA0E5DDB2D03B341BF7B39@PSAPR03MB5653.apcprd03.prod.outlook.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 6 Mar 2023 17:00:14 +0100
Message-ID: <CAMZdPi96HtaiPhaCJOpxbMohyGEz4LGPTzv5bvG2iA6QHAFG3Q@mail.gmail.com>
Subject: Re: [PATCH v5] wwan: core: Support slicing in port TX flow of WWAN subsystem
To:     =?UTF-8?B?SGFvemhlIENoYW5nICjluLjmtanlk7Ip?= 
        <Haozhe.Chang@mediatek.com>
Cc:     "stephan@gerhold.net" <stephan@gerhold.net>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linuxwwan@intel.com" <linuxwwan@intel.com>,
        "m.chetan.kumar@intel.com" <m.chetan.kumar@intel.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        =?UTF-8?B?SHVhIFlhbmcgKOadqOWNjik=?= <Hua.Yang@mediatek.com>,
        "chiranjeevi.rapolu@linux.intel.com" 
        <chiranjeevi.rapolu@linux.intel.com>,
        =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= 
        <haijun.liu@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= 
        <Xiayu.Zhang@mediatek.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "edumazet@google.com" <edumazet@google.com>,
        "chandrashekar.devegowda@intel.com" 
        <chandrashekar.devegowda@intel.com>,
        "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shangxiaojing@huawei.com" <shangxiaojing@huawei.com>,
        =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= 
        <Lambert.Wang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "ricardo.martinez@linux.intel.com" <ricardo.martinez@linux.intel.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Haozhe,

On Fri, 3 Mar 2023 at 09:59, Haozhe Chang (=E5=B8=B8=E6=B5=A9=E5=93=B2)
<Haozhe.Chang@mediatek.com> wrote:
> I'm sorry to bother you, but I want to know whether my patch is accepted =
by the community.
> Because it seems to be a merge window, but the patch state still is "Not =
Applicable". Could you
> give me some suggestions about this patch state?

Please rebase your change and resubmit the latest version (can add
RESEND tag to subject). Please, also read my previous reply, I
mentioned your change should target net-next... you should add it in
the subject (look at the documentation or other mailing-list patches).

Regards,
Loic
