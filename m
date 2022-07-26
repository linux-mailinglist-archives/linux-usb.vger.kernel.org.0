Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB7A581059
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 11:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238551AbiGZJvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 05:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238332AbiGZJvn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 05:51:43 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AE62BB18
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 02:51:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id b26so19413708wrc.2
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 02:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CFJh1pB+ymgIq6GeGFOOVA6qv78+UxaRhPhcrZuqOqU=;
        b=JRM7CAtp+UwBv6xirreQyVWPayuxDOFSLKTKVckKbx7Rx+KxLEVNXmSGqMzSdp2Z6q
         YO9iucZWje5pL3fmVS3etsFYmwx5vafZzTlQbsTUcqLXjtwczZXnqZd4s3ywN1iat7lr
         TPAmABLjLhO4r8+l6SJfP08HswQGQZG7rxvXY5I4z88q/Yb2IcYs7FvtugqjoV69AOpt
         69/jEjxh+33gP1xOkzEya0B2Y3nzGyLZrJ8dVBi3xdssaFRfLqslePjsIzVlTQl5Obrb
         Qlc0tVj1ZpCxKoREQqCJ3Cho6klYomRdH4WGGyEyXoDNCpIANTVnP61sCo1bay5i5yxk
         djmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CFJh1pB+ymgIq6GeGFOOVA6qv78+UxaRhPhcrZuqOqU=;
        b=MtMWe4Ud9Pe0HGzksxzLXFcjE9RU1eXAwm/h8mQvGGUMIbYbbZ7cjZeNt5rDSM0MK/
         /UK3E5eSQQ38/+PGQVVmAbYXTEyCO7huqvCYyQRoL4cdO0seJD1Rcuiyqf2+ju+/EJpP
         9UNGGlHka5aDdq1xZI2w0mlLuVHXJcD5GFrgm7COluwFK3w3VM366mlJtbJ7ZxBj/Hnj
         oqJIoEzORxofNUCLaAfGYti90iUBAnaNilEqV7ccPkpdgjdBdEl4uaNpgRDziF+e2wPl
         +z+KOl4660E+79I7du4cIWCDubqa+Nsi2Xj4xgLofUkxlGCptIsVA6hzt03vILMgEx7W
         NIXg==
X-Gm-Message-State: AJIora+zP1etbBL0PIc4YafvwcLUK7zHMV8fXUyoeysTwINf6mLpvydH
        9ZljHOYVGZzzV5Jh8MDgSOAcr9itUWZXWA==
X-Google-Smtp-Source: AGRyM1v0KwOCdsUxtNtLm+e2GHcbmZ0Tq7SMk0xGd3Zx0SWiqHBUMx51jxKV6s76qWXAUaNwb85xEQ==
X-Received: by 2002:a05:6000:1acf:b0:21d:b410:59b2 with SMTP id i15-20020a0560001acf00b0021db41059b2mr10687875wry.31.1658829100544;
        Tue, 26 Jul 2022 02:51:40 -0700 (PDT)
Received: from reki (62-44-238.netrun.cytanet.com.cy. [62.228.44.238])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d448d000000b002167efdd549sm13726616wrq.38.2022.07.26.02.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:51:39 -0700 (PDT)
Date:   Tue, 26 Jul 2022 12:51:37 +0300
From:   Maxim Devaev <mdevaev@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: gadget: f_hid: Add Set-Feature report
Message-ID: <20220726125137.7d3757c7@reki>
In-Reply-To: <20220726005824.2817646-2-vi@endrift.com>
References: <20220726005824.2817646-1-vi@endrift.com>
        <20220726005824.2817646-2-vi@endrift.com>
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

=D0=92 Mon, 25 Jul 2022 17:58:26 -0700
Vicki Pfau <vi@endrift.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> While the HID gadget implementation has been sufficient for devices that =
only
> use INTERRUPT transfers, the USB HID standard includes provisions for Set=
- and
> Get-Feature report CONTROL transfers that go over endpoint 0. These were
> previously impossible with the existing implementation, and would either =
send
> an empty reply, or stall out.
>=20
> As the feature is a standard part of USB HID, it stands to reason that de=
vices
> would use it, and that the HID gadget should support it. This patch adds
> support for host-to-device Set-Feature reports through a new ioctl
> interface to the hidg class dev nodes.
>=20
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Won't it break the logic of the existing software that works with /dev/hidg=
X?
Will it work if I want my gadget to work the old way?
It is important that the old behavior is the default without having to use
the new ioctls. As for these ioctls, since this is an addition to the new A=
PI,
they should be documented. I think it's also worth adding these ioctls
to the userspace example:
  - Documentation/usb/gadget_hid.rst
  - Documentation/usb/gadget-testing.rst

But it seems to me that extending the HID functionality to meet
the specifications is definitely a good idea :)
