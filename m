Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300AD583AD5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 10:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbiG1I76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 04:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbiG1I74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 04:59:56 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED768655AC
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 01:59:54 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l4so1302834wrm.13
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 01:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0iuyBrlr5rV2IIp/qJPIrFbdJQAUmvQxHNRNBBjl8fM=;
        b=pWliU7VUnHnPvM2eNbgznBYRSjQJe1CJ1/TB3a4cmeS/Co2FhfmzWBKnz7a5fUZpr0
         hJddkpGv8F8uDmCFfUHXeElLw9u0d6gFWmElWh7Tuk+IMmlf89kuqlXJ0lPRBuIcTGLE
         25Gfpmh4pukwiax1NUsyB/xlQzFtqsIkdBCFOx5Rqa2wSiYhH6JxVoQLfu+/wMdgMB46
         8F7iaO4PMSUORS0s2rpJCeEX6gITJSn9ub0zFKSkwgoNIFnuA2lKPdmevT/FxytNTr5T
         fIEbuKUkKc9PguX1AkalXcfRXE1DSkh4vaiT0yA5MvWRTcEEHlQ2j4UElMaWXUSk94ST
         eRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0iuyBrlr5rV2IIp/qJPIrFbdJQAUmvQxHNRNBBjl8fM=;
        b=KX0625B7y1rhmCSHCAwYIe6R66sgRx0KL91FgCeZBSRTxvauoVbl3rVdJQnmRypSuh
         7N0euAUypUwuDD1p1FyHo8paWCES2Oo9QIIPnGuydYcl0xqH3m0xc2rxFeE7JyAlPJJE
         zywYnAUc8UkCSL2PODdM7ZeObF9HHhlkGsKh5TcGoXQorTrZBtAVHmUHHL0JhcdlgiMc
         aAZ9ICawnGhjPr6w+LZEl2a/eB+/sj6AEgYARfpoNmIJ43OE/1vy3EO4UjayoY2n6pZF
         JQ0uO8vrmbjIbDHRgFAVq9kjQ0ouv2SXsHf1ypXNItwAYNi+VOygfWVyjNBXzANKFz/r
         1sxQ==
X-Gm-Message-State: AJIora+aWeUwWEuOO972mD5PgEk0C0bEFpiTGhokGqVFRLLUBGF/6RkS
        e6xuvZYnE2kKNwLbNcZBpE4=
X-Google-Smtp-Source: AGRyM1uvJBL7vy/6tP5jfm0l97ed6ggShPC/Gd+FB8QxYuh5+4FKLmv4qUHoJNiHB6re3ebIRnzgaw==
X-Received: by 2002:a05:6000:2aa:b0:21d:ac4f:587c with SMTP id l10-20020a05600002aa00b0021dac4f587cmr17269883wry.675.1658998793374;
        Thu, 28 Jul 2022 01:59:53 -0700 (PDT)
Received: from reki (83-44-165.netrun.cytanet.com.cy. [83.168.44.165])
        by smtp.gmail.com with ESMTPSA id g15-20020a5d46cf000000b0021e47386eb8sm420768wrs.2.2022.07.28.01.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 01:59:52 -0700 (PDT)
Date:   Thu, 28 Jul 2022 11:59:50 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20220728115950.4c1707a9@reki>
In-Reply-To: <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
        <20220726125137.7d3757c7@reki>
        <d19bad31-dc18-a7a7-6084-dfab8aeec498@endrift.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

=D0=92 Tue, 26 Jul 2022 21:26:05 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 7/26/22 02:51, Maxim Devaev wrote:
> > =D0=92 Mon, 25 Jul 2022 17:58:26 -0700
> > Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> While the HID gadget implementation has been sufficient for devices th=
at only
> >> use INTERRUPT transfers, the USB HID standard includes provisions for =
Set- and
> >> Get-Feature report CONTROL transfers that go over endpoint 0. These we=
re
> >> previously impossible with the existing implementation, and would eith=
er send
> >> an empty reply, or stall out.
> >>
> >> As the feature is a standard part of USB HID, it stands to reason that=
 devices
> >> would use it, and that the HID gadget should support it. This patch ad=
ds
> >> support for host-to-device Set-Feature reports through a new ioctl
> >> interface to the hidg class dev nodes.
> >>
> >> Signed-off-by: Vicki Pfau <vi@endrift.com> =20
> >=20
> > Won't it break the logic of the existing software that works with /dev/=
hidgX?
> > Will it work if I want my gadget to work the old way? =20
>=20
> For existing software to use SET_FEATURE at all it has to use an alternat=
ive mode, which seems to have only been added somewhat recently. That mode =
also appears to preclude use of INTERRUPT transfers at all, unless there's =
some way to set up two hidg nodes that map to the same interface, with one =
for INTERRUPT and one for SET_FEATURE. If this breaks that, I suppose that'=
s a regression, but this is meant to augment the original, long-standing mo=
de so you can mix INTERRUPT and SET/GET_FEATURE transfers, as there is no w=
ay to do that yet. Honestly, the alternate mode seems more like a workaroun=
d, as far as I can tell, and not an ideal implementation. I'm not sure when=
 it was added, but as I was originally authoring this against 5.13 and didn=
't see it until I went to rebase onto master, it can't have been that long =
ago. So if it breaks any software (which I don't believe it does), it would=
 only affect very new software.
>=20
> As I alluded to, I'd thought about perhaps adding a second node per inter=
face so one would act as INTERRUPT transfers and the other as SET/GET_FEATU=
RE transfers, but I already had this code half written and wanted to get fe=
edback first, especially since what I have now works (although it's not wel=
l-tested after rebasing).

I'm a little confused here about what you call an alternative mode.
Are we talking about use_out_ep=3D1 (default behavior with INTERRUPT)
or use_out_ep=3D0 (SETUP/SET_REPORT)? The last mode was added by me
to ensure strict compatibility with Apple UEFI and strange BIOS,
and this mode is actually actively used. It is important to me
that it is not broken, but unfortunately I cannot test your patch
on my kernel, as I temporarily do not have access to testing equipment.
