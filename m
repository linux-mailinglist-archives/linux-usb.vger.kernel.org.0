Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58C0653E9AA
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240800AbiFFPc4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 11:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240874AbiFFPa7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 11:30:59 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB1436325
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 08:30:55 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 94CB75C01F2;
        Mon,  6 Jun 2022 11:30:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 06 Jun 2022 11:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1654529436; x=1654615836; bh=egOSofGKO/
        lFAvwIylp1s1OXwun29h9+WmHE20Wg7AU=; b=oyyV7pmJ/DoEWPmmQAyrFgPLkY
        t4K76a7iTBSz5wqLutwa1FgLj6yxfgtIYql4Af67EpJICLTZQ2ROXpCRtGe23a16
        5EecNT6yiE5E1kYMHADuhFkLOimg7U+gFGRCxgORS+41kYqyXnCUCqu/S5fuG/DN
        vbR0YAFVJ0HpdA2mLIwX/eYaAfg+Cc7GCrggtIcqpiJ1sm6s5HY9txKt6PDIpDaQ
        3+9idrlJdJAEtd/f5zExuSQU52UZMj7MP9zNIbXRKOKiOP5Y5OENS8LPp7IxUWLs
        eq/AY739NOeSOmoxM2oHQDYEdUsCTPUKy0r5QATNUT0dowMP3tsb1ZtEZu0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1654529436; x=1654615836; bh=egOSofGKO/lFAvwIylp1s1OXwun2
        9h9+WmHE20Wg7AU=; b=BZh+ftbg6zYMmeMXgnSm6wHUFL+m3oKbPvl7ZR2CYbpN
        8Kmec+vKpq41AQkhFMu2IGbaSNetIGQhXoAkVjNGNTcXUkVMmKb/orBr3o9MaCrR
        SzSAr/WFeYVbf/I6d55Gcr1/EAzKZ21ddylFOxOXVlil+4tQejZ9BKp8oSOhWhy8
        Qn20z0nTKH8j4LPc+Elc69ALPHAPvEhy/xApX0wk/shEqaWFo7qahuXY3U7wrUPO
        Pf66ERbmUS8wtcxXKeGK3UX6fmqSizDiZk6QtWWKvaF8gCOUAa0F1FDQriF0sdZ8
        8FCDP4pg7KOqOd16yTYl3NvFzncBr5//mhTCY2++Ag==
X-ME-Sender: <xms:nB2eYiNQ2m1o2Ef01VoYTH1LCHEzmc0BM2W5WBh3PyBC13nCiXAj1g>
    <xme:nB2eYg-tLWx0DXDQ1UckcQ2IqEXF-EpKbGRIaiuJx-FSMeAOk3XkJSPqMUR2e09aL
    SlUAZztlg_aFA>
X-ME-Received: <xmr:nB2eYpSBIpzrNXrNf5cH05mElBBpd0jMtwtYo1oeigI4GXN5_IWrk08BMQIcAEaml5Ne6sgvuTkIC_7kFO27g9ic5wkEmlLO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduie
    ffvddufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:nB2eYiuQb4w0To6QbK--cuo903HhycQNXsO98YNsAMUR-eQtEZO8SQ>
    <xmx:nB2eYqfI7nQdA0O-dQWkjIwOdTZ3hZsNFtVzDz5nDExWfrY9P-oFBA>
    <xmx:nB2eYm0VzJ4UYGe0Rj67kT7NhArOatNPL9vzC1Lvq_ODDUV1eQa7hQ>
    <xmx:nB2eYrqjVdc3YeqTsThbG3DrJnUCAgK7ADjZp4bjtbgFEjEk4ubxAQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 11:30:36 -0400 (EDT)
Date:   Mon, 6 Jun 2022 17:30:34 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 216085] New: MCS9990 not maximum speed USB 2.0
Message-ID: <Yp4dmhYXmlag/QuD@kroah.com>
References: <bug-216085-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-216085-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 06, 2022 at 03:20:20PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=216085
> 
>             Bug ID: 216085
>            Summary: MCS9990 not maximum speed USB 2.0
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: All
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: khseal@yandex.ru
>         Regression: No
> 
> Created attachment 301107
>   --> https://bugzilla.kernel.org/attachment.cgi?id=301107&action=edit
> Ubuntu low speed.

Please contact Ubuntu for support with their kernel releases.
