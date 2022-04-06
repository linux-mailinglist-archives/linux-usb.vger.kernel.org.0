Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F19004F5F97
	for <lists+linux-usb@lfdr.de>; Wed,  6 Apr 2022 15:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiDFNHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Apr 2022 09:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiDFNGa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Apr 2022 09:06:30 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D9D5DF587
        for <linux-usb@vger.kernel.org>; Wed,  6 Apr 2022 02:40:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d5so3055635lfj.9
        for <linux-usb@vger.kernel.org>; Wed, 06 Apr 2022 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PR+Km4YLcZXlqmUi9lkzc6K6GOxz4IvMsue7BL5r6fQ=;
        b=OAUNRxqoJWzE9xLjZsSE/gs2Urn5QkXOQWsE2IgwfB7YKsjX2UFvvgc+vgpYxtoS1A
         7uMJtP+CkrLEkDAilH210sCPGkeGADmp1A2Q/WdchVZ3sh56bE7Y0vtfcp1hqNeY/JoX
         VPEOMNsfLBhgTcpCRBbBNttWC0xIp11ZCDBjDyUxJD8DlZbwbcy14bQytzma0hWousjj
         G6qsGL5tvAkTuejfMzJ853TGUN4/2luZvLIVi5ZD/ZsrvKAfg+oanDjsfWCmWwsdRzD7
         gznwK9MPxTDmgbn7YN84FwS3FzcQfqXK3lBtb64z/LwovfdN8dXAgqO4aGpxErWasPBF
         Ktxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PR+Km4YLcZXlqmUi9lkzc6K6GOxz4IvMsue7BL5r6fQ=;
        b=hB+4Ql6i3Smhjf6puQtLTYQkRfiIW9Ps874QUMyw8rQSRg4RyWcqWVqErq0vXBIPEY
         FI2J82ZbngPSp1dfIES2vRuE+eQNfP2HESuuRTRE7vSRy0Ln/Ng5IXsZhT955md9rekX
         QXzOzHy8/DYH83pL76w6fgS4Xvte6xbGwIiPAjjfopA4iGJkWBx8iWJB5nSbCSrGY81R
         Y/gPP2pNjh8sw9oFghRWSe5AlGRTmOambQQ4qFP/nPsZsRfsUsrkzcy1kQl5RqcZv6AV
         GeJQHHAeB1suwcL5E+8vpKUi9/fQxmJMbyGyoFKEEwycTH3BoxEdwjKP01VQ9U6yYoDt
         92Rw==
X-Gm-Message-State: AOAM532o7AQ6NnMfYfD6JCvZQTVjW2PmeqCVhQlRiOG7hWiFKwWJWES1
        aBX1IU0IriNxVPeA6BD0Z/z2YfMvKILqRET1
X-Google-Smtp-Source: ABdhPJxbyYOGB52IQLElvPdwFofRincpwWAGMVhVb0PtHogdrNQyO21d93+VO/a4aLgyMJf/syxvlg==
X-Received: by 2002:a05:6512:a8b:b0:44a:7b68:69d0 with SMTP id m11-20020a0565120a8b00b0044a7b6869d0mr5293864lfu.578.1649237908061;
        Wed, 06 Apr 2022 02:38:28 -0700 (PDT)
Received: from reki (broadband-95-84-198-152.ip.moscow.rt.ru. [95.84.198.152])
        by smtp.gmail.com with ESMTPSA id 11-20020a2e154b000000b0024967cd674esm1556303ljv.35.2022.04.06.02.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 02:38:26 -0700 (PDT)
Date:   Wed, 6 Apr 2022 12:38:26 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: usb: dwc2: Problem with remote wakeup implementation
Message-ID: <20220406123826.3065963c@reki>
In-Reply-To: <04a5b3ac-8d38-d033-89be-371716873b4c@synopsys.com>
References: <20220324012439.65ef4823@reki>
        <04a5b3ac-8d38-d033-89be-371716873b4c@synopsys.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D0=92 Mon, 4 Apr 2022 07:30:25 +0000
Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:

> Hi Maxim,
>=20
> According databook RmtWkUpSig bit description below. You should also=20
> consider LPM state.
>=20
> Remote Wakeup Signaling (RmtWkUpSig)
> When the application sets this bit, the core initiates remote
> signaling to wake up the USB host. The application must Set this bit
> to instruct the core to exit the Suspend state. As specified in the
> USB 2.0 specification, the application must clear this bit 1-15 ms
> after setting it.
> If LPM is enabled and the core is in the L1 (Sleep) state, when the
> application sets this bit, the core initiates L1 remote signaling to
> wake up the USB host. The application must set this bit to instruct
> the core to exit the Sleep state. As specified in the LPM
> specification, the hardware automatically clears this bit 50
> microseconds (TL1DevDrvResume) after being set by the
> application. The application must not set this bit when GLPMCFG
> bRemoteWake from the previous LPM transaction is zero.
>=20
> If it will not help, please check power status of core while resuming:=20
> hibernated, in partial power down, etc.
>=20
> Thanks,
> Minas
>=20

Thank you so much! This is very useful.
I fixed the problem, it was related with the new clock gating code.

I'll try to make a clear patch and submit it to the kernel.
